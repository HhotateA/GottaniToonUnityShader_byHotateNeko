Shader "HOTATE/CustomNoise"
{
	Properties
	{
		[Toggle] _FBM ("FBM",float) = 0
		[Enum(Random,0,CurlNoise,1,PerlinNoise,2,SimplexNoise,3,SimplexGrad,4)] _NoiseMode ("Perlin", int) = 0
		_Noise_ST ("Noise_ST",vector) = (1,1,0,0)
		_NoiseScroll ("Noise Scroll",vector) = (0,0,0,0)
		_RandSeed ("Rand Seed",vector) = (134.5,510.91,566.7,7000)
		_Clamp ("Clamp",vector) = (-1,1,0,1)
	}
	CGINCLUDE

	#include "UnityCustomRenderTexture.cginc"
	#define LIMIT_ZERO 0.0001
	
	float4 _RandSeed;
	inline float random(float2 uv)
	{
		return frac(sin(dot(uv, float2(_RandSeed.xy))) * _RandSeed.w);
	}
	inline float random(float3 uv)
	{
		return frac(sin(dot(uv, float3(_RandSeed.xyz))) * _RandSeed.w);
	}

	float _FBM;
	int _NoiseMode;
	float4 _Noise_ST;
	float4 _NoiseScroll;
	float4 _Clamp;

	//
	// Noise Shader Library for Unity - https://github.com/keijiro/NoiseShader
	//
	// Original work (webgl-noise) Copyright (C) 2011 Stefan Gustavson
	// Translation and modification was made by Keijiro Takahashi.
	//
	// This shader is based on the webgl-noise GLSL shader. For further details
	// of the original shader, please see the following description from the
	// original source code.
	//

	//
	// GLSL textureless classic 3D noise "cnoise",
	// with an RSL-style periodic variant "pnoise".
	// Author:  Stefan Gustavson (stefan.gustavson@liu.se)
	// Version: 2011-10-11
	//
	// Many thanks to Ian McEwan of Ashima Arts for the
	// ideas for permutation and gradient selection.
	//
	// Copyright (c) 2011 Stefan Gustavson. All rights reserved.
	// Distributed under the MIT license. See LICENSE file.
	// https://github.com/ashima/webgl-noise
	//

	float3 mod(float3 x, float3 y){
		return x - y * floor(x / y);
	}

	float3 mod289(float3 x){
		return x - floor(x / 289.0) * 289.0;
	}

	float4 mod289(float4 x){
		return x - floor(x / 289.0) * 289.0;
	}

	float4 permute(float4 x){
		return mod289(((x*34.0)+1.0)*x);
	}

	float4 taylorInvSqrt(float4 r){
		return (float4)1.79284291400159 - r * 0.85373472095314;
	}

	float3 fade(float3 t) {
		return t*t*t*(t*(t*6.0-15.0)+10.0);
	}

	// Classic Perlin noise
	float cnoise(float3 P){
		float3 Pi0 = floor(P); // Integer part for indexing
		float3 Pi1 = Pi0 + (float3)1.0; // Integer part + 1
		Pi0 = mod289(Pi0);
		Pi1 = mod289(Pi1);
		float3 Pf0 = frac(P); // Fractional part for interpolation
		float3 Pf1 = Pf0 - (float3)1.0; // Fractional part - 1.0
		float4 ix = float4(Pi0.x, Pi1.x, Pi0.x, Pi1.x);
		float4 iy = float4(Pi0.y, Pi0.y, Pi1.y, Pi1.y);
		float4 iz0 = (float4)Pi0.z;
		float4 iz1 = (float4)Pi1.z;

		float4 ixy = permute(permute(ix) + iy);
		float4 ixy0 = permute(ixy + iz0);
		float4 ixy1 = permute(ixy + iz1);

		float4 gx0 = ixy0 / 7.0;
		float4 gy0 = frac(floor(gx0) / 7.0) - 0.5;
		gx0 = frac(gx0);
		float4 gz0 = (float4)0.5 - abs(gx0) - abs(gy0);
		float4 sz0 = step(gz0, (float4)0.0);
		gx0 -= sz0 * (step((float4)0.0, gx0) - 0.5);
		gy0 -= sz0 * (step((float4)0.0, gy0) - 0.5);

		float4 gx1 = ixy1 / 7.0;
		float4 gy1 = frac(floor(gx1) / 7.0) - 0.5;
		gx1 = frac(gx1);
		float4 gz1 = (float4)0.5 - abs(gx1) - abs(gy1);
		float4 sz1 = step(gz1, (float4)0.0);
		gx1 -= sz1 * (step((float4)0.0, gx1) - 0.5);
		gy1 -= sz1 * (step((float4)0.0, gy1) - 0.5);

		float3 g000 = float3(gx0.x,gy0.x,gz0.x);
		float3 g100 = float3(gx0.y,gy0.y,gz0.y);
		float3 g010 = float3(gx0.z,gy0.z,gz0.z);
		float3 g110 = float3(gx0.w,gy0.w,gz0.w);
		float3 g001 = float3(gx1.x,gy1.x,gz1.x);
		float3 g101 = float3(gx1.y,gy1.y,gz1.y);
		float3 g011 = float3(gx1.z,gy1.z,gz1.z);
		float3 g111 = float3(gx1.w,gy1.w,gz1.w);

		float4 norm0 = taylorInvSqrt(float4(dot(g000, g000), dot(g010, g010), dot(g100, g100), dot(g110, g110)));
		g000 *= norm0.x;
		g010 *= norm0.y;
		g100 *= norm0.z;
		g110 *= norm0.w;

		float4 norm1 = taylorInvSqrt(float4(dot(g001, g001), dot(g011, g011), dot(g101, g101), dot(g111, g111)));
		g001 *= norm1.x;
		g011 *= norm1.y;
		g101 *= norm1.z;
		g111 *= norm1.w;

		float n000 = dot(g000, Pf0);
		float n100 = dot(g100, float3(Pf1.x, Pf0.y, Pf0.z));
		float n010 = dot(g010, float3(Pf0.x, Pf1.y, Pf0.z));
		float n110 = dot(g110, float3(Pf1.x, Pf1.y, Pf0.z));
		float n001 = dot(g001, float3(Pf0.x, Pf0.y, Pf1.z));
		float n101 = dot(g101, float3(Pf1.x, Pf0.y, Pf1.z));
		float n011 = dot(g011, float3(Pf0.x, Pf1.y, Pf1.z));
		float n111 = dot(g111, Pf1);

		float3 fade_xyz = fade(Pf0);
		float4 n_z = lerp(float4(n000, n100, n010, n110), float4(n001, n101, n011, n111), fade_xyz.z);
		float2 n_yz = lerp(n_z.xy, n_z.zw, fade_xyz.y);
		float n_xyz = lerp(n_yz.x, n_yz.y, fade_xyz.x);
		return 2.2 * n_xyz;
	}

	// Classic Perlin noise, periodic variant
	float pnoise(float3 P, float3 rep){
		float3 Pi0 = mod(floor(P), rep); // Integer part, modulo period
		float3 Pi1 = mod(Pi0 + (float3)1.0, rep); // Integer part + 1, mod period
		Pi0 = mod289(Pi0);
		Pi1 = mod289(Pi1);
		float3 Pf0 = frac(P); // Fractional part for interpolation
		float3 Pf1 = Pf0 - (float3)1.0; // Fractional part - 1.0
		float4 ix = float4(Pi0.x, Pi1.x, Pi0.x, Pi1.x);
		float4 iy = float4(Pi0.y, Pi0.y, Pi1.y, Pi1.y);
		float4 iz0 = (float4)Pi0.z;
		float4 iz1 = (float4)Pi1.z;

		float4 ixy = permute(permute(ix) + iy);
		float4 ixy0 = permute(ixy + iz0);
		float4 ixy1 = permute(ixy + iz1);

		float4 gx0 = ixy0 / 7.0;
		float4 gy0 = frac(floor(gx0) / 7.0) - 0.5;
		gx0 = frac(gx0);
		float4 gz0 = (float4)0.5 - abs(gx0) - abs(gy0);
		float4 sz0 = step(gz0, (float4)0.0);
		gx0 -= sz0 * (step((float4)0.0, gx0) - 0.5);
		gy0 -= sz0 * (step((float4)0.0, gy0) - 0.5);

		float4 gx1 = ixy1 / 7.0;
		float4 gy1 = frac(floor(gx1) / 7.0) - 0.5;
		gx1 = frac(gx1);
		float4 gz1 = (float4)0.5 - abs(gx1) - abs(gy1);
		float4 sz1 = step(gz1, (float4)0.0);
		gx1 -= sz1 * (step((float4)0.0, gx1) - 0.5);
		gy1 -= sz1 * (step((float4)0.0, gy1) - 0.5);

		float3 g000 = float3(gx0.x,gy0.x,gz0.x);
		float3 g100 = float3(gx0.y,gy0.y,gz0.y);
		float3 g010 = float3(gx0.z,gy0.z,gz0.z);
		float3 g110 = float3(gx0.w,gy0.w,gz0.w);
		float3 g001 = float3(gx1.x,gy1.x,gz1.x);
		float3 g101 = float3(gx1.y,gy1.y,gz1.y);
		float3 g011 = float3(gx1.z,gy1.z,gz1.z);
		float3 g111 = float3(gx1.w,gy1.w,gz1.w);

		float4 norm0 = taylorInvSqrt(float4(dot(g000, g000), dot(g010, g010), dot(g100, g100), dot(g110, g110)));
		g000 *= norm0.x;
		g010 *= norm0.y;
		g100 *= norm0.z;
		g110 *= norm0.w;
		float4 norm1 = taylorInvSqrt(float4(dot(g001, g001), dot(g011, g011), dot(g101, g101), dot(g111, g111)));
		g001 *= norm1.x;
		g011 *= norm1.y;
		g101 *= norm1.z;
		g111 *= norm1.w;

		float n000 = dot(g000, Pf0);
		float n100 = dot(g100, float3(Pf1.x, Pf0.y, Pf0.z));
		float n010 = dot(g010, float3(Pf0.x, Pf1.y, Pf0.z));
		float n110 = dot(g110, float3(Pf1.x, Pf1.y, Pf0.z));
		float n001 = dot(g001, float3(Pf0.x, Pf0.y, Pf1.z));
		float n101 = dot(g101, float3(Pf1.x, Pf0.y, Pf1.z));
		float n011 = dot(g011, float3(Pf0.x, Pf1.y, Pf1.z));
		float n111 = dot(g111, Pf1);

		float3 fade_xyz = fade(Pf0);
		float4 n_z = lerp(float4(n000, n100, n010, n110), float4(n001, n101, n011, n111), fade_xyz.z);
		float2 n_yz = lerp(n_z.xy, n_z.zw, fade_xyz.y);
		float n_xyz = lerp(n_yz.x, n_yz.y, fade_xyz.x);
		return 2.2 * n_xyz;
	}
	float pnoise(float3 uv){
		return pnoise(uv,float3(12.9898, 78.233, 56.787));
	}

	float snoise(float3 v){
		const float2 C = float2(1.0 / 6.0, 1.0 / 3.0);

		// First corner
		float3 i  = floor(v + dot(v, C.yyy));
		float3 x0 = v   - i + dot(i, C.xxx);

		// Other corners
		float3 g = step(x0.yzx, x0.xyz);
		float3 l = 1.0 - g;
		float3 i1 = min(g.xyz, l.zxy);
		float3 i2 = max(g.xyz, l.zxy);

		// x1 = x0 - i1  + 1.0 * C.xxx;
		// x2 = x0 - i2  + 2.0 * C.xxx;
		// x3 = x0 - 1.0 + 3.0 * C.xxx;
		float3 x1 = x0 - i1 + C.xxx;
		float3 x2 = x0 - i2 + C.yyy;
		float3 x3 = x0 - 0.5;

		// Permutations
		i = mod289(i); // Avoid truncation effects in permutation
		float4 p =
		permute(permute(permute(i.z + float4(0.0, i1.z, i2.z, 1.0))
								+ i.y + float4(0.0, i1.y, i2.y, 1.0))
								+ i.x + float4(0.0, i1.x, i2.x, 1.0));

		// Gradients: 7x7 points over a square, mapped onto an octahedron.
		// The ring size 17*17 = 289 is close to a multiple of 49 (49*6 = 294)
		float4 j = p - 49.0 * floor(p / 49.0);  // mod(p,7*7)

		float4 x_ = floor(j / 7.0);
		float4 y_ = floor(j - 7.0 * x_);  // mod(j,N)

		float4 x = (x_ * 2.0 + 0.5) / 7.0 - 1.0;
		float4 y = (y_ * 2.0 + 0.5) / 7.0 - 1.0;

		float4 h = 1.0 - abs(x) - abs(y);

		float4 b0 = float4(x.xy, y.xy);
		float4 b1 = float4(x.zw, y.zw);

		//float4 s0 = float4(lessThan(b0, 0.0)) * 2.0 - 1.0;
		//float4 s1 = float4(lessThan(b1, 0.0)) * 2.0 - 1.0;
		float4 s0 = floor(b0) * 2.0 + 1.0;
		float4 s1 = floor(b1) * 2.0 + 1.0;
		float4 sh = -step(h, 0.0);

		float4 a0 = b0.xzyw + s0.xzyw * sh.xxyy;
		float4 a1 = b1.xzyw + s1.xzyw * sh.zzww;

		float3 g0 = float3(a0.xy, h.x);
		float3 g1 = float3(a0.zw, h.y);
		float3 g2 = float3(a1.xy, h.z);
		float3 g3 = float3(a1.zw, h.w);

		// Normalise gradients
		float4 norm = taylorInvSqrt(float4(dot(g0, g0), dot(g1, g1), dot(g2, g2), dot(g3, g3)));
		g0 *= norm.x;
		g1 *= norm.y;
		g2 *= norm.z;
		g3 *= norm.w;

		// Mix final noise value
		float4 m = max(0.6 - float4(dot(x0, x0), dot(x1, x1), dot(x2, x2), dot(x3, x3)), 0.0);
		m = m * m;
		m = m * m;

		float4 px = float4(dot(x0, g0), dot(x1, g1), dot(x2, g2), dot(x3, g3));
		return 42.0 * dot(m, px);
	}

	float4 snoise_grad(float3 v){
		const float2 C = float2(1.0 / 6.0, 1.0 / 3.0);

		// First corner
		float3 i  = floor(v + dot(v, C.yyy));
		float3 x0 = v   - i + dot(i, C.xxx);

		// Other corners
		float3 g = step(x0.yzx, x0.xyz);
		float3 l = 1.0 - g;
		float3 i1 = min(g.xyz, l.zxy);
		float3 i2 = max(g.xyz, l.zxy);

		// x1 = x0 - i1  + 1.0 * C.xxx;
		// x2 = x0 - i2  + 2.0 * C.xxx;
		// x3 = x0 - 1.0 + 3.0 * C.xxx;
		float3 x1 = x0 - i1 + C.xxx;
		float3 x2 = x0 - i2 + C.yyy;
		float3 x3 = x0 - 0.5;

		// Permutations
		i = mod289(i); // Avoid truncation effects in permutation
		float4 p =
		permute(permute(permute(i.z + float4(0.0, i1.z, i2.z, 1.0))
								+ i.y + float4(0.0, i1.y, i2.y, 1.0))
								+ i.x + float4(0.0, i1.x, i2.x, 1.0));

		// Gradients: 7x7 points over a square, mapped onto an octahedron.
		// The ring size 17*17 = 289 is close to a multiple of 49 (49*6 = 294)
		float4 j = p - 49.0 * floor(p / 49.0);  // mod(p,7*7)

		float4 x_ = floor(j / 7.0);
		float4 y_ = floor(j - 7.0 * x_);  // mod(j,N)

		float4 x = (x_ * 2.0 + 0.5) / 7.0 - 1.0;
		float4 y = (y_ * 2.0 + 0.5) / 7.0 - 1.0;

		float4 h = 1.0 - abs(x) - abs(y);

		float4 b0 = float4(x.xy, y.xy);
		float4 b1 = float4(x.zw, y.zw);

		//float4 s0 = float4(lessThan(b0, 0.0)) * 2.0 - 1.0;
		//float4 s1 = float4(lessThan(b1, 0.0)) * 2.0 - 1.0;
		float4 s0 = floor(b0) * 2.0 + 1.0;
		float4 s1 = floor(b1) * 2.0 + 1.0;
		float4 sh = -step(h, 0.0);

		float4 a0 = b0.xzyw + s0.xzyw * sh.xxyy;
		float4 a1 = b1.xzyw + s1.xzyw * sh.zzww;

		float3 g0 = float3(a0.xy, h.x);
		float3 g1 = float3(a0.zw, h.y);
		float3 g2 = float3(a1.xy, h.z);
		float3 g3 = float3(a1.zw, h.w);

		// Normalise gradients
		float4 norm = taylorInvSqrt(float4(dot(g0, g0), dot(g1, g1), dot(g2, g2), dot(g3, g3)));
		g0 *= norm.x;
		g1 *= norm.y;
		g2 *= norm.z;
		g3 *= norm.w;

		// Compute noise and gradient at P
		float4 m = max(0.6 - float4(dot(x0, x0), dot(x1, x1), dot(x2, x2), dot(x3, x3)), 0.0);
		float4 m2 = m * m;
		float4 m3 = m2 * m;
		float4 m4 = m2 * m2;
		float3 grad =
			-6.0 * m3.x * x0 * dot(x0, g0) + m4.x * g0 +
			-6.0 * m3.y * x1 * dot(x1, g1) + m4.y * g1 +
			-6.0 * m3.z * x2 * dot(x2, g2) + m4.z * g2 +
			-6.0 * m3.w * x3 * dot(x3, g3) + m4.w * g3;
		float4 px = float4(dot(x0, g0), dot(x1, g1), dot(x2, g2), dot(x3, g3));
		return 42.0 * float4(grad, dot(m4, px));
	}

	float4 outputnoise (float3 uv) {
		float4 output = 0;
		float3 uv1 = uv+float3(131.15,521.79,987.13);
		float3 uv2 = uv+float3(378.83,057.41,456.53);
		float3 uv3 = uv+float3(728.74,587.42,315.88);
		float3 uv4 = uv+float3(278.24,142.75,254.24);
		switch (_NoiseMode)
		{
			case 0 : output = float4( random(uv1), random(uv2), random(uv3), random(uv4)); break;
			case 1 : output = float4( cnoise(uv1), cnoise(uv2), cnoise(uv3), cnoise(uv4)); break;
			case 2 : output = float4( pnoise(uv1), pnoise(uv2), pnoise(uv3), pnoise(uv4)); break;
			case 3 : output = float4( snoise(uv1), snoise(uv2), snoise(uv3), snoise(uv4)); break;
			case 4 : output = snoise_grad(uv); break;
		}
		return output;
	}

	float4 fbm (float3 uv) {
		float4 output = (float4)0.0;
		output += 0.5000*outputnoise(uv); uv = uv*2.01;
		output += 0.2500*outputnoise(uv); uv = uv*2.02;
		output += 0.1250*outputnoise(uv); uv = uv*2.03;
		output += 0.0625*outputnoise(uv); uv = uv*2.01;
		return output;
	}

	float4 noise_tex(float2 globalTexcoord){
		float3 uv = float3(globalTexcoord * _Noise_ST.xy + _Noise_ST.zw, 0.0) + _NoiseScroll.xyz *floor(_Time.y/max(LIMIT_ZERO,_NoiseScroll.w))*max(LIMIT_ZERO,_NoiseScroll.w);
		float4 output = _FBM ? fbm(uv) : outputnoise(uv);
		return clamp(lerp(_Clamp.z,_Clamp.w,output),_Clamp.x,_Clamp.y);
	}

	float4 frag(v2f_customrendertexture i) : SV_Target{
		return noise_tex(i.globalTexcoord);
	}

	ENDCG

	SubShader
	{
		Cull Off ZWrite Off ZTest Always
		Pass
		{
			Name "Update"
			CGPROGRAM
			#pragma vertex CustomRenderTextureVertexShader
			#pragma fragment frag
            #pragma multi_compile _ Perlin
            #pragma multi_compile _ SimpleNoise
            #pragma multi_compile _ Noisetype
            #pragma multi_compile _ FBM
			ENDCG
		}
	}
}
