Shader "Hidden/HOTATE/GottaniToon_Transparent"
{
	Properties
	{
		[Header(TAG)] [HiddenInspector] _Dummy ("Dummy",int) = 0
		[HideInInspector] _BlendMode("BlendMode", Float) = 1  // ブレンドモードキャッシュ
		[Enum(UnityEngine.Rendering.BlendMode)] _SrcBlend ("SrcBlend", float) = 5
		[Enum(UnityEngine.Rendering.BlendMode)] _DstBlend ("DstBlend", float) = 10
		[Enum(OFF,0,ON,1)] _ZWrite ("ZWrite", float) = 1.0
		[Enum(UnityEngine.Rendering.CompareFunction)]	_ZTest ("ZTest",float) = 2
		[Enum(UnityEngine.Rendering.CullMode)] _CullMode("Cull Mode", int) = 2
		_AlphaCut ("Alpha Cutout",Range(0,1)) = 0
		[Space(10)]
		[Header(Stencil)] [HiddenInspector] _Dummy ("Dummy",int) = 0
		[HideInInspector] _StencilMode("StencilMode", Float) = 0.0  // ステンシルキャッシュ
		_Stencil ("Stencil", Float) = 0
		_ReadMask ("ReadMask", Int) = 255
		_WriteMask ("WriteMask", Int) = 255
		[Enum(UnityEngine.Rendering.CompareFunction)] _StencilComp ("Stencil Comp", Int) = 0
		[Enum(UnityEngine.Rendering.StencilOp)] _StencilPass ("Stencil Pass", Int) = 0
		[Enum(UnityEngine.Rendering.StencilOp)] _StencilFail ("Stencil Fail", Int) = 0
		[Enum(UnityEngine.Rendering.StencilOp)] _StencilZFail ("Stencil ZFail", Int) = 0

		[Header(Culling)] [HiddenInspector] _Dummy ("Dummy",int) = 0
		[Enum(Always,0,MirrorOnly,1,MirrorCulling,2,Never,3)] _MirrorCulling ("MirrorCulling", float) = 0
		[Enum(Always,0,CameraOnly,1,CameraCulling,2,Never,3)] _CameraCulling ("CameraCulling", float) = 0
		[Enum(Always,0,MirrorOnly,1,MirrorCulling,2,Never,3)] _BaseMirrorCulling ("BaseMirrorCulling", float) = 0
		[Enum(Always,0,CameraOnly,1,CameraCulling,2,Never,3)] _BaseCameraCulling ("BaseCameraCulling", float) = 0
		[Enum(Always,0,MirrorOnly,1,MirrorCulling,2,Never,3)] _AddMirrorCulling ("AddMirrorCulling", float) = 0
		[Enum(Always,0,CameraOnly,1,CameraCulling,2,Never,3)] _AddCameraCulling ("AddCameraCulling", float) = 0
		[Enum(Always,0,MirrorOnly,1,MirrorCulling,2,Never,3)] _ShadowMirrorCulling ("ShadowMirrorCulling", float) = 0
		[Enum(Always,0,CameraOnly,1,CameraCulling,2,Never,3)] _ShadowCameraCulling ("ShadowCameraCulling", float) = 0
		[Enum(Always,0,MirrorOnly,1,MirrorCulling,2,Never,3)] _BloomMirrorCulling ("BloomMirrorCulling", float) = 0
		[Enum(Always,0,CameraOnly,1,CameraCulling,2,Never,3)] _BloomCameraCulling ("BloomCameraCulling", float) = 0
		_CameraResolution ("Camera Resolution",vector) = (1280,720,1920,1080)

		[Header(Main Texture)] [HiddenInspector] _Dummy ("Dummy",int) = 0
		_MainTex ("Base Texture", 2D) = "white" {}
		_UVScroll ("UV Scroll", vector) = (0,0,0,0)
        _Color ("Base Color", Color) = (1,1,1,1)
		_VertexColorMultiple ("Vertex Color Multiple", range(0,1)) = 0

		[Header(Stereo Eye)] [HiddenInspector] _Dummy ("Dummy",int) = 0
		[Toggle] _MirrorMode ("MirrorMode",float) = 0
        [NoScaleOffset] _ReflectionTex0("Left Eye Texture", 2D) = "white" {}
        [NoScaleOffset] _ReflectionTex1("Right Eye Texture", 2D) = "white" {}

		[Header(HSV)] [HiddenInspector] _Dummy ("Dummy",int) = 0
		_HSVMask ("HSV Mask", 2D) = "white" {}
		[Enum(Both,0,Right,1,Left,2)] _HSVPosMask ("PosMask",int) = 0
		_ExchangeColor ("ExchangeColor",color) = (1,0,0,1)
		_ExchangeThreshold ("ExchangeThreshold",range(0,2)) = 2
		_H ("H",range(-0.5,0.5)) = 0.0
		_S ("S",range(0,1)) = 0.5
		_V ("V",range(0,1)) = 0.5
		[IntRange]_ColorStepFactor ("ColorStep", Range(2,256)) = 256

		[Header(WireFrame)] [HiddenInspector] _Dummy ("Dummy",int) = 0
        _WireframeWidth ("Wireframe width", Range(0 , 0.5)) = 0
        _WireframeColor ("Wireframe color", color) = (1, 1, 1, 1)
        _WireframeBlend ("Wireframe Color Blend", Range(0 , 1)) = 0

        [Header(OverrideTexture)] [HiddenInspector] _Dummy ("Dummy",int) = 0
		_OverrideTexture ("Override Texture", 2D) = "black" {}
		[Enum(Both,0,Right,1,Left,2)] _OverridePosMask ("PosMask",int) = 0
		_OverrideColor ("ExchangeColor",color) = (1,0,0,1)
		_OverrideH ("H",range(-0.5,0.5)) = 0.0
		_OverrideS ("S",range(0,1)) = 0.5
		_OverrideV ("V",range(0,1)) = 0.5

		[Header(Distance Fade)] [HiddenInspector] _Dummy ("Dummy",int) = 0
		_NearClip ("Near Clip", float) = -1
		_FarClip ("Far Clip", float) = -1
        _ClipThreshold ("Clip Threshold", Range(0, 1)) = 0.3

		[Header(Grab Tex)] [HiddenInspector] _Dummy ("Dummy",int) = 0
		[Toggle] _Alpha2Grab ("Alpha to Grab", int) = 0
        _GrabBlend ("Grab Blend", Range(0, 1)) = 0
        _GrabMul ("Grab Multipl", Range(0, 1)) = 0
        _GrabAdd ("Grab Add", Range(0, 1)) = 0
        _RelativeRefractionIndex ("Relative Refraction Index", Range(0.0, 1.0)) = 0.9
        _RefractDistance ("Refract Distance", Range(0.0, 100.0)) = 1.0
		_ChromaticAberrationR ("_ChromaticAberrationR", vector) = (0,0,0,0)
		_ChromaticAberrationG ("_ChromaticAberrationG", vector) = (0,0,0,0)
		_ChromaticAberrationB ("_ChromaticAberrationB", vector) = (0,0,0,0)
		_GrabMosicFactor ("Mosic", Range(0,0.3)) = 0
		[IntRange]_GrabColorStepFactor ("ColorStep", Range(2,256)) = 256
		_GrabH ("GrabH",range(-0.5,0.5)) = 0.0
		_GrabS ("GrabS",range(0,1)) = 0.5
		_GrabV ("GrabV",range(0,1)) = 0.5

		[Header(BackTexture)] [HiddenInspector] _Dummy ("Dummy",int) = 0
        [NoScaleOffset] _SubTex ("Sub Texture", 2D) = "white" {}
		_SubColor ("Sub Color", color) = (1,1,1,1)
        [NoScaleOffset] _BackTex ("Back Tex", 2D) = "white" {}
        _Tex2BackTextureLevel ("Back Texture Level", Range(0, 1)) = 1

        [NoScaleOffset] _ToonMask ("Toon Mask", 2D) = "white" {}
        _Toon ("Toon", range(0,1)) = 1

		[Header(Disolve)] [HiddenInspector] _Dummy ("Dummy",int) = 0
		_DisolveSpeed ("DisolveSpeed",range(0,10)) = 0
        [NoScaleOffset] _DisolveMask ("Disolve Mask", 2D) = "white" {}
		_Tex2AlphaMask ("SubGTexture2AlphaMask", range(0,1)) = 0
        [NoScaleOffset] _AlphaMask ("Alpha Mask", 2D) = "white" {}

		[Header(BumpMap)] [HiddenInspector] _Dummy ("Dummy",int) = 0
		[NoScaleOffset] _BumpMap ("Normal", 2D) = "bump" {}
        _BumpScale ("Normal Scale", Float) = 1.0

		[Header(Virtual Light)] [HiddenInspector] _Dummy ("Dummy",int) = 0
        _VirtualLight ("VirtualLight", Range(-1, 1)) = 0.1
        _VirtualGI ("VirtualGI", Range(-1, 1)) = 0.3
		_FlatShading ("Flat Shading",range(0,1)) = 0
        _Lambert ("Lambert", range(0,1)) = 1.0
        _LightColorAttenuation ("Light Color Attenuation", Range(-1, 1)) = 0
        _ReceiveShadowRate ("Receive Shadow", Range(0, 1)) = 0.1
        _IndirectLightIntensity ("Indirect Light Intensity", Range(0, 1)) = 0.8
		_MaxPointLightEfect ("Max PointLight Efect", range(0,1)) = 0.3

        [Header(Toon)] [HiddenInspector] _Dummy ("Dummy",int) = 0
		[NoScaleOffset]_ShadeColor ("Custom Shade Color", 2D) = "white" {}
        _ShadeColor0 ("1st Shade Color", Color) = (0.97, 0.81, 0.86, 1)
        _ShadeShift0 ("1st Shade Shift", Range(-1, 1)) = 0.173
        _ShadeToony0 ("1st Shade Toony", Range(0, 1)) = 0.383
		_Shade1Power0 ("ShadowPower 0",float) = 2
        _ShadeColor1 ("2nd Shade Color", Color) = (0.9, 0.61, 0.68, 1)
        _ShadeShift1 ("2nd Shade Shift", Range(-1, 1)) = 0.288
        _ShadeToony1 ("2nd Shade Toony", Range(0, 1)) = 0.829
		_Shade1Power1 ("ShadowPower 1",float) = 1
        [NoScaleOffset] _ShadowTex ("Shadow Texture", 2D) = "white" {}
        _Tex2ShadowTextureLevel ("Shadow Texture Level", Range(0, 1)) = 0

        [Header(Rim,Matcap)] [HiddenInspector] _Dummy ("Dummy",int) = 0
        _FresnelMask ("Mask", 2D) = "white" {}

        [HDR] _RimColor ("Rim Color", Color) = (0,0,0,1)
        _RimFresnelPower ("Rim Fresnel Power", Range(1, 5)) = 4.89
        _RimLift ("Rim Lift", Range(0, 1)) = 0.38
        _RimPower ("Rim Power", Range(0, 1)) = 0.008
        _RimFresnel ("Rim Frenel", Range(0, 1)) = 0

        [NoScaleOffset] _MatCap ("MatCap", 2D) = "black" {}
        [HDR] _MatCapColor ("MatCap Color", Color) = (1,1,1,1)
		[Enum(AddMode,0,MulMode,1,RimMulti,2)] _MatcapMode ("Matcap Mode", float) = 0

        [Header(Outline)] [HiddenInspector] _Dummy ("Dummy",int) = 0
		[Enum(UnityEngine.Rendering.CullMode)] _OutlineCullMode("Cull Mode", int) = 2
		[Enum(ScaleMode,0,NormalMode,1)] _OutlineBase("BaseMode", int) = 1
		_OutlineMask ("OutlineMask", 2D) = "white" {}
		_OutlineTex ("Outline Texture", 2D) = "white" {}
        _OutlineColor ("Outline Color", Color) = (0.48,0.46,0.45,1)
		_OutlineWidth ("Outline Width",float) = 0.0
		_OutlineMainTexBlend ("MaintexBlend",range(0,1)) = 1
		_OutlineWidthDist ("OutlineWidthDist",float) = 3

        [Header(PBR)] [HiddenInspector] _Dummy ("Dummy",int) = 0
		[Header(Metalic)] [HiddenInspector] _Dummy ("Dummy",int) = 0
		_RoughnessMetallicMap ("Roughness Metaric Map", 2D) = "white" {}
        _Metalic ("Metalic", range(0,1)) = 1.0
		_Roughness ("Roughness", range(0,1)) = 0.0

        [Header(Emission)] [HiddenInspector] _Dummy ("Dummy",int) = 0
        _EmissionTex ("Emission texture", 2D) = "white" {}
        _EmissionMask ("Emission Mask", 2D) = "white" {}
        [HDR] _EmissionColor ("Color", color) = (0,0,0,0)
		_EmissionVelocity ("Emission Velocity", vector) = (0,2,0,1)
		_EmissionScroll ("Emission Scroll", vector) = (0,0,0,0)
		_EmissionWidth ("Emission Width", range(0,20)) = 2.7

		[Header(ParallaxMapping)] [HiddenInspector] _Dummy ("Dummy",int) = 0
		[Toggle] _Alpha2Parallax ("Alpha to Parallax", int) = 0
		_ParallaxTexture ("Parallax Texture",2D) = "white" {}
		[NoScaleOffset] _ParallaxMask ("Parallax Mask",2D) = "black" {}
        _ParallaxColor ("Parallax Color", Color) = (1,1,1,1)
		_ParallaxDepth ("Parallax Depth",float) = 1
        _ParallaxBlend ("Parallax Blend", Range(0, 1)) = 0
        _ParallaxMul ("Parallax Multipl", Range(0, 1)) = 0
        _ParallaxAdd ("Parallax Add", Range(0, 1)) = 0
		_ParallaxScroll ("Parallax Scroll", vector) = (0,0,0,0)

		[Header(Geometry)] [HiddenInspector] _Dummy ("Dummy",int) = 0
		_PositionMemory ("Position Memory", 2D) = "black" {}
		_PositionPower ("Position Power", float) = 0
		_PositionFactor ("Position Factor", Range(0, 1)) = 0
		_ObjPosFactor ("ObjPos Factor", Range(0, 1)) = 1
		_ObjPosNoise ("ObjPos Noise", Range(0, 10)) = 0
		_MemoryScroll ("MemoryScroll",vector) = (0,0,0,0)
		_Grabity ("Grabity",vector) = (0,0,0,0)
		_ExtrusionFactor ("Extrusion Factor", Range(0, 1)) = 0
		_ExtrusionNoise ("Extrusion Noise", Range(0, 10)) = 0
		_RotationFactor ("Rotation Factor",range(0,1)) = 0
		_RotationNoise ("Rotation Noise",range(0,10)) = 0
		_ScaleFactor ("Scale Factor",range(0,1)) = 1
		_ScaleNoise ("Scale Noise",range(0,10)) = 0

		[Header(GPUParticle)] [HiddenInspector] _Dummy ("Dummy",int) = 0
		_ParticleFactor ("Particle Factor", range(0,1)) = 0
		_PositionNoise ("Position Noise",range(0,1)) = 0
		_ParticleColorFactor ("Particle Color Factor", range(0,1)) = 0
		[HDR] _ParticleColor ("Particle Color", color) = (1,1,1,1)
		_ParticleSize ("Particle Size", range(0,1)) = 0.3

        [Header(Tesslation)] [HiddenInspector] _Dummy ("Dummy",int) = 0
        [NoScaleOffset] _TessMap ("TessMap", 2D) = "white" {}
		_TessFactor ("Tess Factor",Vector) = (1,1,1,1)

		[Enum(OFF,0,ON,1)] _BloomZWrite ("BloomZWrite", float) = 0.0
		[HideInInspector] _BloomBlendMode("BloomBlendMode", Float) = 0.0  // Bloomブレンドモードキャッシュ
		[Enum(UnityEngine.Rendering.BlendMode)] _BloomSrcBlend ("BloomSrcBlend", float) = 5.0
		[Enum(UnityEngine.Rendering.BlendMode)] _BloomDstBlend ("BloomDstBlend", float) = 1.0
		[Enum(UnityEngine.Rendering.CullMode)] _BloomCullMode ("Cull Mode", int) = 2
		[Enum(ScaleMode,0,NormalMode,1)] _BloomBase ("BaseMode", int) = 1
		[NoScaleOffset]_BloomMask ("Bloom Mask", 2D) = "white" {}
		[Toggle] _FurNoise ("Fur Noise",float) = 0
		[Toggle] _FurSaturate ("Fur Saturate",float) = 1
		_BloomTex ("Bloom Texture", 2D) = "white" {}
		[HDR]_BloomCol ("Bloom Color",color) = (1.0,1.0,1.0,1.0)
		_BloomRange ("Range",range(0.0,5.0)) = 0
		_BloomBrightness ("Brightness",range(0.0,10.0)) = 0.2
		_BloomKnee ("Knee",range(0.0,10.0)) = 2.0
		_BloomSoftknee ("SoftKnee",range(0.0,3.0)) = 0.6
		_BloomThreshold ("Threshold",range(0.0,2.0)) = 1.2
		_FurWindPower ("Fur Wind Power",range(0,3)) = 0
		_FurWindSpeed ("Fur Wind Speed",range(0,5)) = 0
		_FurWindType ("Fur Wind Type",range(0,1)) = 1
		_FurGravity ("Fur Gravity",vector) = (0,0,0,0)
		_BloomLightEffect ("Bloom Light Effect",range(0,1)) = 0
		_BloomMainTexBlend ("MainTexBlend",range(0,1)) = 0.5

		[Header(MatrixGeom)] [HiddenInspector] _Dummy ("Dummy",int) = 0
		[Toggle] _Model2World ("Model2World",float) = 0
		_ModelRot ("Model Rot",vector) = (1,0,0,0)
		_ModelScale ("Model Scale",vector) = (1,1,1,0)
		_ModelPos ("Model Pos",vector) = (0,0,0,0)
		[Toggle] _World2View ("World2View",float) = 0
		_CameraRot ("Camera Rot",vector) = (1,0,0,0)
		_CameraScale ("Camera Scale",vector) = (1,1,1,0)
		_CameraPos ("Camera Pos",vector) = (0,0,0,0)
		[Toggle] _BillBoard ("BillBoard",float) = 0
		_BillBoardRot ("Camera Rot",vector) = (1,0,0,0)
		_BillBoardScale ("Camera Scale",vector) = (1,1,1,0)
		_BillBoardPos ("Camera Pos",vector) = (0,0,0,0)

		[Header(Doppelganger)] [HiddenInspector] _Dummy ("Dummy",int) = 0
		[Toggle(IS_DOPPELGENGER)] _IS_DOPPELGENGER ("DOPPELGENGER",float) = 0
		[IntRange] _Doppelganger ("Doppelganger", range(1,7)) = 1
		_DoppelgangerPos ("Doppelganger Pos",vector) = (0,0,0,0)

		[Header(RandFactor)] [HiddenInspector] _Dummy ("Dummy",int) = 0
		_RandSeed ("Rand Seed",vector) = (134.5,510.91,566.7,7000)
		[Toggle(NOISE_GENERATE)] _NOISE_GENERATE ("Noise", float) = 0
		[Toggle] _FBM ("FBM",float) = 0
		[Enum(Random,0,CurlNoise,1,PerlinNoise,2,SimplexNoise,3,SimplexGrad,4)] _NoiseMode ("Perlin", int) = 0
		_Noise_ST ("Noise_ST",vector) = (1,1,0,0)
		_NoiseScroll ("Noise Scroll",vector) = (0,0,0,0)
	}
	
SubShader
	{
		Tags {"Queue"="Transparent"}
		GrabPass{"_GrabPassTexture_Transparent"}
		Stencil
		{
			Ref [_Stencil]
			ReadMask [_ReadMask]
			WriteMask [_WriteMask]
			Comp [_StencilComp]
			Pass [_StencilPass]
			Fail [_StencilFail]
			ZFail [_StencilZFail]
		}
		Pass
		{
			Name "OUTLINE"
			Tags { "LightMode"="ForwardBase"}
			Blend [_SrcBlend] [_DstBlend]
			ZWrite [_ZWrite]
			ZTest [_ZTest]
			Cull [_OutlineCullMode]
			BlendOp Add, Max
			CGPROGRAM
			#pragma target 5.0
			#pragma shader_feature IS_DOPPELGENGER
			#pragma vertex vert
			#pragma hull HS
			#pragma domain DS
			#pragma geometry geom
			#pragma fragment frag
            #pragma multi_compile_fwdbase
            #pragma multi_compile_fog

			struct g2f
			{
				float2 uv : TEXCOORD0;
				fixed4 color : COLOR;
				float2 centerUV : CENTER_UV;
				UNITY_FOG_COORDS(1)
				SHADOW_COORDS(2)
				float4 pos : SV_POSITION;
				float3 modelPos : MODEL_POS;
				float3 worldPos : WORLD_POS;
				float3 modelNormal : MODEL_NORMAL;
				float3 worldNormal : WORLD_NORMAL;
				float3 worldTangent : WORLD_TANGENT;
				float3 bitTangent : BIT_TANGENT;
				float3 bary : TRIANGLE_BARY;
                float4 refl : REFL_UV;
			};

			struct f_out{
				fixed4 col : SV_TARGET;
			};

			[maxvertexcount(21)]
			void geom(triangle d2g input[3], inout TriangleStream<g2f> outStream)
			{
				cameraClip(_MirrorCulling);
				mirrorClip(_CameraCulling);
				cameraClip(_BaseMirrorCulling);
				mirrorClip(_BaseCameraCulling);
				g2f output;
				if(_OutlineWidth<=0) return;
				output.centerUV = (input[0].uv+input[1].uv+input[2].uv)/3;
				float3 mPos = (input[0].pos+input[1].pos+input[2].pos)/3;
				float3 polyNormal = normalize(cross( input[1].pos-input[0].pos, input[2].pos-input[0].pos)); //ポリゴンから計算した法線
				float3 viewVec = (normalize(mul(UNITY_MATRIX_M,mPos) - _ObjectSpaceStereoCameraPos));
				float3 rotAxi = normalize(cross(viewVec,polyNormal));
				float extrusionFactor = saturate(_ExtrusionFactor*(1+_ExtrusionNoise) - random(output.centerUV)*_ExtrusionNoise);
				float3 extrusionVec = (polyNormal+_Grabity) * extrusionFactor;
				
				float2 particleUV = output.centerUV + _MemoryScroll.xy *floor(_Time.y/max(LIMIT_ZERO,_MemoryScroll.w))*max(LIMIT_ZERO,_MemoryScroll.w);
				particleUV = TRANSFORM_TEX(particleUV,_PositionMemory);
				float3 particlePos = (tex2Dlod(_PositionMemory,float4(particleUV,0,0)).xyz + noise_tex(particleUV)*_PositionNoise) * _PositionPower;
				float4 wPos = mul(UNITY_MATRIX_M,float4(mPos*_ObjPosFactor+extrusionVec+particlePos,1));
				float4 vPos = mul(UNITY_MATRIX_V,wPos);

				float3 localScale = float3(length(mul(UNITY_MATRIX_M,float4(1,0,0,0))),length(mul(UNITY_MATRIX_M,float4(0,1,0,0))),length(mul(UNITY_MATRIX_M,float4(0,0,1,0))));
				float3 localPos = mul(UNITY_MATRIX_M,float4(0,0,0,1)).xyz;
				float4 localViewPos = mul(UNITY_MATRIX_V,float4(localPos,1));
				float3 cameraSpaceCameraPos = float3(-_WorldSpaceCameraPos.x,-_WorldSpaceCameraPos.y,_WorldSpaceCameraPos.z);

				int dop=0;
				#ifdef IS_DOPPELGENGER
				for(;dop<_Doppelganger;dop++){
				#else
				{
				#endif
					[unroll] for(int i=2;i>=0;i--)
					{
						output.uv = input[i].uv;
						output.color = input[i].color;
						float2 memoryUV = lerp(output.centerUV, output.uv, _PositionFactor) + _MemoryScroll.xy *floor(_Time.y/max(LIMIT_ZERO,_MemoryScroll.w))*max(LIMIT_ZERO,_MemoryScroll.w); //メモリの解釈(ポリゴン単位か頂点単位か)
						memoryUV = TRANSFORM_TEX(memoryUV,_PositionMemory);
						float noise = random(memoryUV);
						float distDepth = distance(mul(UNITY_MATRIX_M,input[i].pos),_WorldSpaceStereoCameraPos);
						float3 outlineWidth = lerp(input[i].pos,input[i].normal,_OutlineBase)* tex2Dlod(_OutlineMask,float4(input[i].uv,0,0)).b * min(_OutlineWidthDist,distDepth) * _OutlineWidth * 0.001;
						float4 extrusionPos = float4(input[i].pos.xyz,1);
						extrusionPos.xyz -= mPos;
						float rotationFactor = saturate(_RotationFactor*(1+_RotationNoise) - noise*_RotationNoise);
						extrusionPos = rotation(rotAxi, rotationFactor*180, extrusionPos); // 視線と法線に垂直な軸で回転
						float scaleFactor = saturate(_ScaleFactor*(1+_ScaleNoise) - noise*_ScaleNoise);
						extrusionPos.xyz = lerp(float3(0,0,0), extrusionPos.xyz, scaleFactor); //ポリゴンベースのスケールファクタ
						extrusionPos.xyz += mPos;
						extrusionPos.xyz += extrusionVec + outlineWidth;
						extrusionPos += _DoppelgangerPos * dop;
						float objPosFactor = saturate(_ObjPosFactor*(1+_ObjPosNoise) - noise*_ObjPosNoise);
						extrusionPos.xyz = extrusionPos.xyz * objPosFactor + tex2Dlod(_PositionMemory,float4(memoryUV,0,0)).xyz * _PositionPower;
						output.modelPos = extrusionPos.xyz;
						output.worldPos = _Model2World ? forceRotMove(output.modelPos,_ModelRot,_ModelScale.xyz+localScale*_ModelScale.w,_ModelPos.xyz+localPos*_ModelPos.w)
													: mul( UNITY_MATRIX_M, float4(forceRotMove(output.modelPos,_ModelRot,_ModelScale.xyz,float3(0,0,0)),1)).xyz + _ModelPos.xyz;
						float3 viewPos = _World2View ? forceRotMove(output.worldPos,_CameraRot,_CameraScale,_CameraPos.xyz+cameraSpaceCameraPos*_CameraPos.w)
													: mul(UNITY_MATRIX_V,float4(output.worldPos,1)).xyz;
						float4 clipPos = mul(UNITY_MATRIX_P,float4(viewPos,1)); //通常のポジション
						float4 partPos = mul(UNITY_MATRIX_P,vPos+float4(particles[i]*_ParticleSize,0,0)); //パーティクル化したポジション
						float4 billbordPos = float4(localViewPos + forceRotMove(output.modelPos,_BillBoardPos,_BillBoardScale.xyz,_BillBoardPos.xyz),1); //ビルボード化したポジション
						output.pos = _BillBoard ? mul(UNITY_MATRIX_P,billbordPos) : lerp(clipPos,partPos,_ParticleFactor);
						output.modelNormal = lerp(input[i].normal,polyNormal,_FlatShading);
						output.worldNormal = normalize(UnityObjectToWorldNormal(output.modelNormal));
						output.worldTangent = normalize(UnityObjectToWorldDir(input[i].tangent));
						output.bitTangent = normalize(cross(output.worldNormal, output.worldTangent) * input[i].tangent.w);
						appdata_base v; v.vertex = float4(output.modelPos,1);
                		output.refl = ComputeNonStereoScreenPos(output.pos);
						UNITY_TRANSFER_FOG(output, output.pos);
						TRANSFER_SHADOW(output);
						output.bary = params[i];
						outStream.Append(output);
					}
					outStream.RestartStrip();
				}
			}
			
			f_out frag (g2f input, fixed facing : VFACE)
			{
				f_out output;
				float2 mainUV = TRANSFORM_TEX(input.uv,_MainTex) + _UVScroll.xy*floor(_Time.y/max(LIMIT_ZERO,_UVScroll.w))*max(LIMIT_ZERO,_UVScroll.w); + _UVScroll.xy*floor(_Time.y/max(LIMIT_ZERO,_UVScroll.w))*max(LIMIT_ZERO,_UVScroll.w);
				
				// Sample Texture
				fixed4 mainTex = tex2D(_MainTex, mainUV) * lerp(1,input.color,_VertexColorMultiple);

				fixed4 texSample = maintexFactor(mainTex,mainUV,input.bary,facing,input.modelPos,input.worldPos,input.refl);
				fixed3 mainCol = texSample.rgb;
				float mainAlpha = texSample.a;

				// Calc Normal
				float3x3 tangentTransform = float3x3( input.worldTangent, input.bitTangent, input.worldNormal);
				float3 viewDir = normalize(_WorldSpaceStereoCameraPos.xyz - input.worldPos.xyz);
				float3 bump = UnpackScaleNormal(tex2D(_BumpMap, mainUV), _BumpScale); //sample Bumpmap
				float3 normalDir = normalize(mul( bump, tangentTransform ));

				// CameraVector
				float3 worldCameraUp = normalize(UNITY_MATRIX_V[1].xyz);
				float3 worldViewUp = normalize(worldCameraUp - viewDir * dot(viewDir, worldCameraUp));
				float3 worldViewRight = normalize(cross(viewDir, worldViewUp));

				// Shadow
				UNITY_LIGHT_ATTENUATION(shadowAttenuation, input, input.worldPos.xyz); //sample shadow
				float lightAttenuation = lerp(1, shadowAttenuation * shadowAttenuation, _ReceiveShadowRate);

				// Vector and scalar
				float3 lightDir = length(_WorldSpaceLightPos0)<LIMIT_ZERO ? 0.8*normalize(normalDir) : normalize(_WorldSpaceLightPos0.xyz);
				float dotNL = max(0,dot(normalDir,lightDir));
				float dotNV = max(0,dot(normalDir,viewDir));
				// float3 HalfVector = normalize(lightDir + viewDir);
				// float dotNH = max(0,dot(normalDir, HalfVector));
				// float dotVH = max(0,dot(viewDir, HalfVector));
				
				float3 roughnessMetallicMap = UNITY_SAMPLE_TEX2D_SAMPLER(_RoughnessMetallicMap,_SubTex,mainUV).rgb;

				float lightIntensity = dotNL;
				lightIntensity = lightIntensity * 0.5 + 0.5; 
				lightIntensity *= lightAttenuation;
				float lambert = lerp(lightIntensity,lightIntensity * 2.0 - 1.0, 1-_Lambert);
				lambert = lerp(1,lambert,roughnessMetallicMap.b);

				// Light
				fixed3 lightColor = _VirtualLight<0 ? max( -_VirtualLight.xxx, _LightColor0.rgb) : lerp( _VirtualLight.xxx, _LightColor0.rgb, _LightColor0.rgb); // VirtualLight
				lightColor = lerp( abs(_VirtualLight).xxx, lightColor, step(0.9, length(lightDir))); //directional light nothing
				lightColor = lerp( lightColor, max(lightColor.x,max(lightColor.y,lightColor.z)).xxx, saturate(_LightColorAttenuation)); //ColorAttenuation
				lightColor *= min(0, lambert) + 1;
				lightColor *= lightAttenuation;

				// GI
				fixed3 toonedGI = (ShadeSH9(half4(1, 0, 0, 1)) + ShadeSH9(half4(-1, 0, 0, 1)) + ShadeSH9(half4(0, 1, 0, 1)) + ShadeSH9(half4(0, -1, 0, 1)) + ShadeSH9(half4(0, 0, 1, 1)) + ShadeSH9(half4(0, 0, -1, 1)))/6;
				fixed3 indirectLighting = lerp( ShadeSH9(half4(normalDir, 1)), toonedGI, _IndirectLightIntensity);
				indirectLighting = _VirtualGI<0 ? max( -_VirtualGI.xxx, indirectLighting) : lerp( _VirtualGI.xxx, indirectLighting, indirectLighting); // GIの最低値
				indirectLighting = lerp( indirectLighting, max(indirectLighting.x, max(indirectLighting.y, indirectLighting.z)).xxx, saturate(_LightColorAttenuation)); // ColorAttenuation

				fixed3 toonCol = calcToonCol( mainCol, mainUV, 1-_Tex2ShadowTextureLevel,
											  _ShadeShift0, _ShadeToony0, _ShadeColor0,
											  _ShadeShift1, _ShadeToony1, _ShadeColor1,
											  lambert, lightColor, indirectLighting);

				fixed3 pbrCol = calcPBRCol(mainCol,
										   roughnessMetallicMap.r * _Metalic,
										   roughnessMetallicMap.g * _Roughness * 0.75,
										   dotNV, viewDir, normalDir, lightDir,
										   lambert, lightColor);
				
				fixed3 emissionCol;
				{
					float phase = dot(input.modelPos,_EmissionVelocity.xyz).xxxx;
					phase -= _Time.y *  _EmissionVelocity.w;
					phase = frac(phase);
					phase = (pow(abs(phase-0.45), 20/_EmissionWidth));
					float2 emiUV = TRANSFORM_TEX(mainUV, _EmissionTex);
					emiUV += _EmissionScroll.xy *floor(_Time.y/max(LIMIT_ZERO,_EmissionScroll.w))*max(LIMIT_ZERO,_EmissionScroll.w);
					emissionCol = tex2D(_EmissionTex, emiUV) * phase * _EmissionColor *50;
					emissionCol *= UNITY_SAMPLE_TEX2D_SAMPLER(_EmissionMask,_SubTex,mainUV);
				}

				// Base + Light
				float toonMask = UNITY_SAMPLE_TEX2D_SAMPLER(_ToonMask,_SubTex,mainUV).r;
				mainCol = lerp(pbrCol,toonCol,_Toon*toonMask)+ emissionCol;
				mainAlpha = lerp(0,mainAlpha,step(_AlphaCut,mainAlpha));
				
				output.col.rgb = mainCol;
				output.col.a = mainAlpha;

				fixed4 outlineCol;
				//* アウトライン専用処理
					outlineCol = tex2D(_OutlineTex,mainUV);
					output.col = lerp(outlineCol,output.col,_OutlineMainTexBlend);
					output.col *= _OutlineColor;
					output.col.a *=  (1-_ParticleFactor);
					fixed3 outlineMask = tex2D(_OutlineMask,mainUV).b;
					clip(min(outlineMask.r,min(outlineMask.g,outlineMask.b))-0.1);

				// Alpha Cutout
				clip(output.col.a-_AlphaCut);

				// apply fog
				UNITY_APPLY_FOG(input.fogCoord, output);

				fixed4 particleCol;
				float particleClip;
				{
					float2 particleUV = float2(0,2)*input.bary.x + float2(1.732,-1)*input.bary.y + float2(-1.732,-1)*input.bary.z;
					float dist = length(particleUV);
					particleCol = tex2Dlod(_MainTex,float4(input.centerUV,0,0)) * _ParticleColor;
					particleCol = lerp( saturate(0.5-dist) * clamp(particleCol / pow(dist, 2), 0, 2), particleCol, _ParticleColorFactor);
					clip( max( 0.5-dist, (0.9-_ParticleFactor)));
					particleCol *= lerp(1,input.color,_VertexColorMultiple);
					particleCol.rgb +=  emissionCol.rgb;
				}

				output.col = lerp(output.col,particleCol,_ParticleFactor);
				output.col *= UNITY_SAMPLE_TEX2D(_SubTex, input.uv) * _SubColor;
				
				return output;
			}
			ENDCG
		}
		Pass
		{
			Name "FowardBase"
			Tags { "LightMode"="ForwardBase"}
			Blend [_SrcBlend] [_DstBlend]
			ZWrite [_ZWrite]
			ZTest [_ZTest]
			Cull [_CullMode]
			BlendOp Add, Max
			CGPROGRAM
			#pragma target 5.0
			#pragma shader_feature IS_DOPPELGENGER
			#pragma vertex vert
			#pragma hull HS
			#pragma domain DS
			#pragma geometry geom
			#pragma fragment frag
			// make fog work
            #pragma multi_compile_fwdbase
            #pragma multi_compile_fog

			struct g2f
			{
				float2 uv : TEXCOORD0;
				fixed4 color : COLOR;
				float2 centerUV : CENTER_UV;
				UNITY_FOG_COORDS(1)
				SHADOW_COORDS(2)
				float4 pos : SV_POSITION;
				float3 modelPos : MODEL_POS;
				float3 worldPos : WORLD_POS;
				float3 modelNormal : MODEL_NORMAL;
				float3 worldNormal : WORLD_NORMAL;
				float3 worldTangent : WORLD_TANGENT;
				float3 bitTangent : BIT_TANGENT;
				float4 grabPos : GrabPos;
				float3 bary : TRIANGLE_BARY;
                float4 refl : REFL_UV;
			};

			struct f_out{
				fixed4 col : SV_TARGET;
			};

			[maxvertexcount(21)]
			void geom(triangle d2g input[3], inout TriangleStream<g2f> outStream)
			{
				cameraClip(_MirrorCulling);
				mirrorClip(_CameraCulling);
				cameraClip(_BaseMirrorCulling);
				mirrorClip(_BaseCameraCulling);
				g2f output;
				output.centerUV = (input[0].uv+input[1].uv+input[2].uv)/3;
				float3 mPos = (input[0].pos+input[1].pos+input[2].pos)/3;
				float3 polyNormal = normalize(cross( input[1].pos-input[0].pos, input[2].pos-input[0].pos)); //ポリゴンから計算した法線
				float3 viewVec = (normalize(mul(UNITY_MATRIX_M,mPos) - _ObjectSpaceStereoCameraPos));
				float3 rotAxi = normalize(cross(viewVec,polyNormal));
				float extrusionFactor = saturate(_ExtrusionFactor*(1+_ExtrusionNoise) - random(output.centerUV)*_ExtrusionNoise);
				float3 extrusionVec = (polyNormal+_Grabity) * extrusionFactor;
				
				float2 particleUV = output.centerUV + _MemoryScroll.xy *floor(_Time.y/max(LIMIT_ZERO,_MemoryScroll.w))*max(LIMIT_ZERO,_MemoryScroll.w);
				particleUV = TRANSFORM_TEX(particleUV,_PositionMemory);
				float3 particlePos = (tex2Dlod(_PositionMemory,float4(particleUV,0,0)).xyz + noise_tex(particleUV)*_PositionNoise) * _PositionPower;
				float4 wPos = mul(UNITY_MATRIX_M,float4(mPos*_ObjPosFactor+extrusionVec+particlePos,1));
				float4 vPos = mul(UNITY_MATRIX_V,wPos);

				float3 localScale = float3(length(mul(UNITY_MATRIX_M,float4(1,0,0,0))),length(mul(UNITY_MATRIX_M,float4(0,1,0,0))),length(mul(UNITY_MATRIX_M,float4(0,0,1,0))));
				float3 localPos = mul(UNITY_MATRIX_M,float4(0,0,0,1)).xyz;
				float4 localViewPos = mul(UNITY_MATRIX_V,float4(localPos,1));
				float3 cameraSpaceCameraPos = float3(-_WorldSpaceCameraPos.x,-_WorldSpaceCameraPos.y,_WorldSpaceCameraPos.z);

				int dop=0;
				#ifdef IS_DOPPELGENGER
				for(;dop<_Doppelganger;dop++){
				#else
				{
				#endif
					[unroll] for(int i=0;i<3;i++)
					{
						output.uv = input[i].uv;
						output.color = input[i].color;
						float2 memoryUV = lerp(output.centerUV, output.uv, _PositionFactor) + _MemoryScroll.xy *floor(_Time.y/max(LIMIT_ZERO,_MemoryScroll.w))*max(LIMIT_ZERO,_MemoryScroll.w); //メモリの解釈(ポリゴン単位か頂点単位か)
						memoryUV = TRANSFORM_TEX(memoryUV,_PositionMemory);
						float noise = random(memoryUV);
						float distDepth = distance(mul(UNITY_MATRIX_M,input[i].pos),_WorldSpaceStereoCameraPos);
						float4 extrusionPos = float4(input[i].pos.xyz,1);
						extrusionPos.xyz -= mPos;
						float rotationFactor = saturate(_RotationFactor*(1+_RotationNoise) - noise*_RotationNoise);
						extrusionPos = rotation(rotAxi, rotationFactor*180, extrusionPos); // 視線と法線に垂直な軸で回転
						float scaleFactor = saturate(_ScaleFactor*(1+_ScaleNoise) - noise*_ScaleNoise);
						extrusionPos.xyz = lerp(float3(0,0,0), extrusionPos.xyz, scaleFactor); //ポリゴンベースのスケールファクタ
						extrusionPos.xyz += mPos;
						extrusionPos.xyz += extrusionVec;
						extrusionPos += _DoppelgangerPos * dop;
						float objPosFactor = saturate(_ObjPosFactor*(1+_ObjPosNoise) - noise*_ObjPosNoise);
						extrusionPos.xyz = extrusionPos.xyz * objPosFactor + tex2Dlod(_PositionMemory,float4(memoryUV,0,0)).xyz * _PositionPower;
						output.modelPos = extrusionPos.xyz;
						output.worldPos = _Model2World ? forceRotMove(output.modelPos,_ModelRot,_ModelScale.xyz+localScale*_ModelScale.w,_ModelPos.xyz+localPos*_ModelPos.w)
													: mul( UNITY_MATRIX_M, float4(forceRotMove(output.modelPos,_ModelRot,_ModelScale.xyz,float3(0,0,0)),1)).xyz + _ModelPos.xyz;
						float3 viewPos = _World2View ? forceRotMove(output.worldPos,_CameraRot,_CameraScale,_CameraPos.xyz+cameraSpaceCameraPos*_CameraPos.w)
													: mul(UNITY_MATRIX_V,float4(output.worldPos,1)).xyz;
						float4 clipPos = mul(UNITY_MATRIX_P,float4(viewPos,1)); //通常のポジション
						float4 partPos = mul(UNITY_MATRIX_P,vPos+float4(particles[i]*_ParticleSize,0,0)); //パーティクル化したポジション
						float4 billbordPos = float4(localViewPos + forceRotMove(output.modelPos,_BillBoardPos,_BillBoardScale.xyz,_BillBoardPos.xyz),1); //ビルボード化したポジション
						output.pos = _BillBoard ? mul(UNITY_MATRIX_P,billbordPos) : lerp(clipPos,partPos,_ParticleFactor);
						output.modelNormal = lerp(input[i].normal,polyNormal,_FlatShading);
						output.worldNormal = normalize(UnityObjectToWorldNormal(output.modelNormal));
						output.worldTangent = normalize(UnityObjectToWorldDir(input[i].tangent));
						output.bitTangent = normalize(cross(output.worldNormal, output.worldTangent) * input[i].tangent.w);
						appdata_base v; v.vertex = float4(output.modelPos,1);
                		output.refl = ComputeNonStereoScreenPos(output.pos);
						UNITY_TRANSFER_FOG(output, output.pos);
						TRANSFER_SHADOW(output);
						float3 viewDir = normalize(output.worldPos - _WorldSpaceCameraPos.xyz);
						float3 refractDir = refract(viewDir, output.worldNormal, _RelativeRefractionIndex);
						float3 samplingPos = output.worldPos + refractDir * _RefractDistance;
						half4 samplingScreenPos = mul(UNITY_MATRIX_VP, half4(samplingPos, 1.0));
						output.bary = params[i];
						output.grabPos = ComputeGrabScreenPos( samplingScreenPos);
						outStream.Append(output);
					}
					outStream.RestartStrip();
				}
			}
			
			f_out frag (g2f input, fixed facing : VFACE)
			{
				f_out output;
				float2 mainUV = TRANSFORM_TEX(input.uv,_MainTex) + _UVScroll.xy*floor(_Time.y/max(LIMIT_ZERO,_UVScroll.w))*max(LIMIT_ZERO,_UVScroll.w); + _UVScroll.xy*floor(_Time.y/max(LIMIT_ZERO,_UVScroll.w))*max(LIMIT_ZERO,_UVScroll.w);
				
				// Sample Texture
				fixed4 mainTex = tex2D(_MainTex, mainUV) * lerp(1,input.color,_VertexColorMultiple);

				fixed4 texSample = maintexFactor(mainTex,mainUV,input.bary,facing,input.modelPos,input.worldPos,input.refl);
				fixed3 mainCol = texSample.rgb;
				float mainAlpha = texSample.a;

				// Calc Normal
				float3x3 tangentTransform = float3x3( input.worldTangent, input.bitTangent, input.worldNormal);
				float3 viewDir = normalize(_WorldSpaceStereoCameraPos.xyz - input.worldPos.xyz);
				float3 bump = UnpackScaleNormal(tex2D(_BumpMap, mainUV), _BumpScale); //sample Bumpmap
				float3 normalDir = normalize(mul( bump, tangentTransform ));

				// CameraVector
				float3 worldCameraUp = normalize(UNITY_MATRIX_V[1].xyz);
				float3 worldViewUp = normalize(worldCameraUp - viewDir * dot(viewDir, worldCameraUp));
				float3 worldViewRight = normalize(cross(viewDir, worldViewUp));

				// Vector and scalar
				float3 lightDir = length(_WorldSpaceLightPos0)<LIMIT_ZERO ? 0.8*normalize(normalDir) : normalize(_WorldSpaceLightPos0.xyz);
				float dotNL = dot(normalDir,lightDir);
				float dotNV = max(0,dot(normalDir,viewDir));
				// float3 HalfVector = normalize(lightDir + viewDir);
				// float dotNH = max(0,dot(normalDir, HalfVector));
				// float dotVH = max(0,dot(viewDir, HalfVector));

				float3 roughnessMetallicMap = UNITY_SAMPLE_TEX2D_SAMPLER(_RoughnessMetallicMap,_SubTex,mainUV).rgb;
				// Shadow
				#ifdef IS_GRAB_PASS
				float shadowAttenuation = 1.0;
				#else
				UNITY_LIGHT_ATTENUATION(shadowAttenuation, input, input.worldPos.xyz); //sample shadow
				#endif
				float lightAttenuation = lerp(1, shadowAttenuation * shadowAttenuation, _ReceiveShadowRate);
				
				float lightIntensity = dotNL;
				lightIntensity = lightIntensity * 0.5 + 0.5; 
				float lambert = lerp(lightIntensity,lightIntensity * 2.0 - 1.0, 1-_Lambert);
				lambert = lerp(1,lambert,roughnessMetallicMap.b);

				// Light
				fixed3 lightColor = _VirtualLight<0 ? max( -_VirtualLight.xxx, _LightColor0.rgb) : lerp( _VirtualLight.xxx, _LightColor0.rgb, _LightColor0.rgb); // VirtualLight
				lightColor = lerp( abs(_VirtualLight).xxx, lightColor, step(0.9, length(lightDir))); //directional light nothing
				lightColor = lerp( lightColor, max(lightColor.x,max(lightColor.y,lightColor.z)).xxx, saturate(_LightColorAttenuation)); //ColorAttenuation
				lightColor *= min(0, lambert) + 1;
				lightColor *= lightAttenuation;

				// GI
				fixed3 toonedGI = (ShadeSH9(half4(1, 0, 0, 1)) + ShadeSH9(half4(-1, 0, 0, 1)) + ShadeSH9(half4(0, 1, 0, 1)) + ShadeSH9(half4(0, -1, 0, 1)) + ShadeSH9(half4(0, 0, 1, 1)) + ShadeSH9(half4(0, 0, -1, 1)))/6;
				fixed3 indirectLighting = lerp( ShadeSH9(half4(normalDir, 1)), toonedGI, _IndirectLightIntensity);
				indirectLighting = _VirtualGI<0 ? max( -_VirtualGI.xxx, indirectLighting) : lerp( _VirtualGI.xxx, indirectLighting, indirectLighting); // GIの最低値
				indirectLighting = lerp( indirectLighting, max(indirectLighting.x, max(indirectLighting.y, indirectLighting.z)).xxx, saturate(_LightColorAttenuation)); // ColorAttenuation

				fixed3 toonCol = calcToonCol(mainCol, mainUV, 1-_Tex2ShadowTextureLevel,
											 _ShadeShift0, _ShadeToony0, _ShadeColor0,
											 _ShadeShift1, _ShadeToony1, _ShadeColor1,
											 lambert, lightColor, indirectLighting);

				fixed3 pbrCol = calcPBRCol(mainCol,
										   roughnessMetallicMap.r * _Metalic,
										   roughnessMetallicMap.g * _Roughness * 0.75,
										   dotNV, viewDir, normalDir, lightDir,
										   lambert, lightColor);
				
				fixed3 matcapCol;
				{
					float2 matcapUV = float2(dot(worldViewRight, normalDir), dot(worldViewUp, normalDir)) * 0.5 + 0.5;
					float matcapMask = UNITY_SAMPLE_TEX2D_SAMPLER(_FresnelMask,_SubTex,mainUV).g;
					matcapCol = tex2D(_MatCap, matcapUV) * _MatCapColor * matcapMask;
				}

				fixed3 rimCol;
				{
					float rim = 1 - saturate(dotNV + _RimLift) * (1-_RimPower);
					float rimMask = UNITY_SAMPLE_TEX2D_SAMPLER(_FresnelMask,_SubTex,mainUV),r;
					float3 reflDir = reflect(-viewDir, normalDir);
					fixed4 fresnel = lerp(1,UNITY_SAMPLE_TEXCUBE_LOD(unity_SpecCube0, reflDir, 0),_RimFresnel);
					rimCol = pow(rim,_RimFresnelPower) * rimMask * _RimColor * fresnel;
				}

				fixed3 emissionCol;
				{
					float phase = dot(input.modelPos,_EmissionVelocity.xyz).xxxx;
					phase -= _Time.y *  _EmissionVelocity.w;
					phase = frac(phase);
					phase = (pow(abs(phase-0.45), 20/_EmissionWidth));
					float2 emiUV = TRANSFORM_TEX(mainUV, _EmissionTex);
					emiUV += _EmissionScroll.xy *floor(_Time.y/max(LIMIT_ZERO,_EmissionScroll.w))*max(LIMIT_ZERO,_EmissionScroll.w);
					emissionCol = tex2D(_EmissionTex, emiUV) * phase * _EmissionColor *50;
					emissionCol *= UNITY_SAMPLE_TEX2D_SAMPLER(_EmissionMask,_SubTex,mainUV);
				}

				// Base + Light
				float toonMask = UNITY_SAMPLE_TEX2D_SAMPLER(_ToonMask,_SubTex,mainUV).r;
				mainCol = lerp(pbrCol,toonCol,_Toon*toonMask) + emissionCol;
				if(_MatcapMode<2) mainCol = lerp(mainCol+matcapCol,mainCol*matcapCol,_MatcapMode) + rimCol;
				else mainCol =  mainCol + rimCol*matcapCol;
				mainAlpha = lerp(0,mainAlpha,step(_AlphaCut,mainAlpha));

				//* ベースカラー専用処理
					fixed4 parallaxCol;
					float parallaxMask;
					{
						fixed4 mask = UNITY_SAMPLE_TEX2D_SAMPLER(_ParallaxMask,_SubTex,mainUV);
						float layDepth = (1.0-mask.r) * _ParallaxDepth;
						float3 rayPos = input.modelPos;
						float3 rayDir =  rayPos.xyz - _ObjectSpaceStereoCameraPos;
						float3 planeNormal = input.modelNormal;
						float3 planePos = rayPos - planeNormal*layDepth;
						float intersect = 999;
						{
							float i = dot(planePos - rayPos, planeNormal) / dot(rayDir, planeNormal);
							if (i < intersect)
							{
								intersect = i;
							}
						float3 pos = rayPos + rayDir * intersect;
						float3 cc = normalize(float3(0,1,0));
						float3 uvx = length(cross(planeNormal,cc))<0.00001 ? float3(1,0,0) : normalize(cross(planeNormal,cc));
						float3 uvy = normalize(cross(planeNormal,uvx));
						float2 parauv = float2( dot(uvx,pos), -dot(uvy,pos));
						parauv = TRANSFORM_TEX(parauv,_ParallaxTexture);
						parauv += _ParallaxScroll.xy *floor(_Time.y/max(LIMIT_ZERO,_ParallaxScroll.w))*max(LIMIT_ZERO,_ParallaxScroll.w);
						parauv.x += feel_good_func(feel_good_func(_Time.y*_ParallaxScroll.z));
						parauv.y += feel_good_func(feel_good_func(_Time.y*_ParallaxScroll.w));
						parallaxCol = tex2D( _ParallaxTexture, parauv) * _ParallaxColor;
						parallaxCol.a = lerp(0,parallaxCol.a,step(_AlphaCut,parallaxCol.a));
						}
						parallaxMask = (1.0-mask.a) * step( LIMIT_ZERO, _ParallaxDepth);
					}

					if(parallaxMask>0.5)
					{
						if(_Alpha2Parallax)
						{
							mainCol = lerp( mainCol, parallaxCol.rgb, saturate(_ParallaxBlend+(1-mainAlpha))) * lerp( 1, parallaxCol.rgb, _ParallaxMul) + parallaxCol.rgb*_ParallaxAdd;
							mainAlpha = lerp( mainAlpha, parallaxCol.a, saturate(_ParallaxBlend*+(1-mainAlpha)));
						}else{
							mainCol = lerp( mainCol, parallaxCol.rgb, _ParallaxBlend) * lerp( 1, parallaxCol.rgb, _ParallaxMul) + parallaxCol.rgb*_ParallaxAdd;
							mainAlpha = lerp( mainAlpha, parallaxCol.a, _ParallaxBlend);
						}
					}

					output.col.rgb = mainCol;
					output.col.a = mainAlpha;

				fixed3 grabCol;
				float grabAlpha;
				{
					float4 grabUV = input.grabPos / input.grabPos.w;
					float grabMosicFactor = max(LIMIT_ZERO,_GrabMosicFactor); //0除算の対策
					grabUV = lerp( input.grabPos, float4( floor(grabUV.xy/grabMosicFactor)*grabMosicFactor + (grabMosicFactor/2).xx, grabUV.zw), step(LIMIT_ZERO,_GrabMosicFactor));
					grabCol.r = tex2Dproj(_GrabPassTexture_Transparent, grabUV + _ChromaticAberrationR).r;
					grabCol.g = tex2Dproj(_GrabPassTexture_Transparent, grabUV + _ChromaticAberrationG).g;
					grabCol.b = tex2Dproj(_GrabPassTexture_Transparent, grabUV + _ChromaticAberrationB).b;
					float grabGray = (grabCol.r+grabCol.g+grabCol.b)/3;
					grabCol = lerp( grabCol, floor(grabCol*_GrabColorStepFactor)/_GrabColorStepFactor , step(_GrabColorStepFactor,255));
					float3 grabHSV = rgb2hsv(grabCol);
					grabHSV.x += _GrabH;
					grabHSV.y = lerp( lerp(0,grabHSV.y,saturate(_GrabS*2)), lerp(grabHSV.y,1,saturate(_GrabS*2-1)), step(0.5,_GrabS));
					grabHSV.z = lerp( lerp(0,grabHSV.z,saturate(_GrabV*2)), lerp(grabHSV.z,1,saturate(_GrabV*2-1)), step(0.5,_GrabV));
					grabCol = hsv2rgb(grabHSV);
				}
				if(_Alpha2Grab) output.col = float4( lerp(output.col,grabCol,saturate(_GrabBlend+(1-output.col.a))) * lerp(1,grabCol,_GrabMul) + grabCol*_GrabAdd, 1);
				else output.col = float4( lerp(output.col,grabCol,_GrabBlend) * lerp(1,grabCol,_GrabMul) + grabCol*_GrabAdd, output.col.a);

				// Alpha Cutout
				clip(output.col.a-_AlphaCut);

				// apply fog
				UNITY_APPLY_FOG(input.fogCoord, output);

				fixed4 particleCol;
				float particleClip;
				{
					float2 particleUV = float2(0,2)*input.bary.x + float2(1.732,-1)*input.bary.y + float2(-1.732,-1)*input.bary.z;
					float dist = length(particleUV);
					particleCol = tex2Dlod(_MainTex,float4(input.centerUV,0,0)) * _ParticleColor;
					particleCol = lerp( saturate(0.5-dist) * clamp(particleCol / pow(dist, 2), 0, 2), particleCol, _ParticleColorFactor);
					clip( max( 0.5-dist, (0.9-_ParticleFactor)));
					particleCol *= lerp(1,input.color,_VertexColorMultiple);
					particleCol.rgb +=  emissionCol.rgb;
				}

				output.col = lerp(output.col,particleCol,_ParticleFactor);

				output.col *= UNITY_SAMPLE_TEX2D(_SubTex, input.uv) * _SubColor;
				
				return output;
			}
			ENDCG
		}

		Pass
		{
			Name "FowardAdd"
			Tags {"LightMode"="ForwardAdd"}
			Blend [_SrcBlend] One
            ZWrite Off
            ZTest LEqual
            BlendOp Add, Max

			CGPROGRAM
			#pragma target 5.0
			#pragma shader_feature IS_DOPPELGENGER
			
			#pragma vertex vert
			#pragma hull HS
			#pragma domain DS
			#pragma geometry geom
			#pragma fragment frag
			// make fog work
            #pragma multi_compile_fwdadd_fullshadows
            #pragma multi_compile_fog

			struct g2f
			{
				float2 uv : TEXCOORD0;
				fixed4 color : COLOR;
				float2 centerUV : CENTER_UV;
				UNITY_FOG_COORDS(1)
				SHADOW_COORDS(2)
				float4 pos : SV_POSITION;
				float3 modelPos : MODEL_POS;
				float3 worldPos : WORLD_POS;
				float3 modelNormal : MODEL_NORMAL;
				float3 worldNormal : WORLD_NORMAL;
				float3 worldTangent : WORLD_TANGENT;
				float3 bitTangent : BIT_TANGENT;
				float3 bary : TRIANGLE_BARY;
                float4 refl : REFL_UV;
			};

			struct f_out{
				fixed4 col : SV_TARGET;
			};

			[maxvertexcount(3)]
			void geom(triangle d2g input[3], inout TriangleStream<g2f> outStream)
			{
				cameraClip(_MirrorCulling);
				mirrorClip(_CameraCulling);
				cameraClip(_AddMirrorCulling);
				mirrorClip(_AddCameraCulling);
				g2f output;
				output.centerUV = (input[0].uv+input[1].uv+input[2].uv)/3;
				float3 mPos = (input[0].pos+input[1].pos+input[2].pos)/3;
				float3 polyNormal = normalize(cross( input[1].pos-input[0].pos, input[2].pos-input[0].pos)); //ポリゴンから計算した法線
				float3 viewVec = (normalize(mul(UNITY_MATRIX_M,mPos) - _ObjectSpaceStereoCameraPos));
				float3 rotAxi = normalize(cross(viewVec,polyNormal));
				float extrusionFactor = saturate(_ExtrusionFactor*(1+_ExtrusionNoise) - random(output.centerUV)*_ExtrusionNoise);
				float3 extrusionVec = (polyNormal+_Grabity) * extrusionFactor;
				
				float2 particleUV = output.centerUV + _MemoryScroll.xy *floor(_Time.y/max(LIMIT_ZERO,_MemoryScroll.w))*max(LIMIT_ZERO,_MemoryScroll.w);
				particleUV = TRANSFORM_TEX(particleUV,_PositionMemory);
				float3 particlePos = (tex2Dlod(_PositionMemory,float4(particleUV,0,0)).xyz + noise_tex(particleUV)*_PositionNoise) * _PositionPower;
				float4 wPos = mul(UNITY_MATRIX_M,float4(mPos*_ObjPosFactor+extrusionVec+particlePos,1));
				float4 vPos = mul(UNITY_MATRIX_V,wPos);

				float3 localScale = float3(length(mul(UNITY_MATRIX_M,float4(1,0,0,0))),length(mul(UNITY_MATRIX_M,float4(0,1,0,0))),length(mul(UNITY_MATRIX_M,float4(0,0,1,0))));
				float3 localPos = mul(UNITY_MATRIX_M,float4(0,0,0,1)).xyz;
				float4 localViewPos = mul(UNITY_MATRIX_V,float4(localPos,1));
				float3 cameraSpaceCameraPos = float3(-_WorldSpaceCameraPos.x,-_WorldSpaceCameraPos.y,_WorldSpaceCameraPos.z);

				int dop=0;
				#ifdef IS_DOPPELGENGER
				for(;dop<_Doppelganger;dop++){
				#else
				{
				#endif
					[unroll] for(int i=0;i<3;i++)
					{
						output.uv = input[i].uv;
						output.color = input[i].color;
						float2 memoryUV = lerp(output.centerUV, output.uv, _PositionFactor) + _MemoryScroll.xy *floor(_Time.y/max(LIMIT_ZERO,_MemoryScroll.w))*max(LIMIT_ZERO,_MemoryScroll.w); //メモリの解釈(ポリゴン単位か頂点単位か)
						memoryUV = TRANSFORM_TEX(memoryUV,_PositionMemory);
						float noise = random(memoryUV);
						float distDepth = distance(mul(UNITY_MATRIX_M,input[i].pos),_WorldSpaceStereoCameraPos);
						float4 extrusionPos = float4(input[i].pos.xyz,1);
						extrusionPos.xyz -= mPos;
						float rotationFactor = saturate(_RotationFactor*(1+_RotationNoise) - noise*_RotationNoise);
						extrusionPos = rotation(rotAxi, rotationFactor*180, extrusionPos); // 視線と法線に垂直な軸で回転
						float scaleFactor = saturate(_ScaleFactor*(1+_ScaleNoise) - noise*_ScaleNoise);
						extrusionPos.xyz = lerp(float3(0,0,0), extrusionPos.xyz, scaleFactor); //ポリゴンベースのスケールファクタ
						extrusionPos.xyz += mPos;
						extrusionPos.xyz += extrusionVec;
						extrusionPos += _DoppelgangerPos * dop;
						float objPosFactor = saturate(_ObjPosFactor*(1+_ObjPosNoise) - noise*_ObjPosNoise);
						extrusionPos.xyz = extrusionPos.xyz * objPosFactor + tex2Dlod(_PositionMemory,float4(memoryUV,0,0)).xyz * _PositionPower;
						output.modelPos = extrusionPos.xyz;
						output.worldPos = _Model2World ? forceRotMove(output.modelPos,_ModelRot,_ModelScale.xyz+localScale*_ModelScale.w,_ModelPos.xyz+localPos*_ModelPos.w)
													: mul( UNITY_MATRIX_M, float4(forceRotMove(output.modelPos,_ModelRot,_ModelScale.xyz,float3(0,0,0)),1)).xyz + _ModelPos.xyz;
						float3 viewPos = _World2View ? forceRotMove(output.worldPos,_CameraRot,_CameraScale,_CameraPos.xyz+cameraSpaceCameraPos*_CameraPos.w)
													: mul(UNITY_MATRIX_V,float4(output.worldPos,1)).xyz;
						float4 clipPos = mul(UNITY_MATRIX_P,float4(viewPos,1)); //通常のポジション
						float4 partPos = mul(UNITY_MATRIX_P,vPos+float4(particles[i]*_ParticleSize,0,0)); //パーティクル化したポジション
						float4 billbordPos = float4(localViewPos + forceRotMove(output.modelPos,_BillBoardPos,_BillBoardScale.xyz,_BillBoardPos.xyz),1); //ビルボード化したポジション
						output.pos = _BillBoard ? mul(UNITY_MATRIX_P,billbordPos) : lerp(clipPos,partPos,_ParticleFactor);
						output.modelNormal = lerp(input[i].normal,polyNormal,_FlatShading);
						output.worldNormal = normalize(UnityObjectToWorldNormal(output.modelNormal));
						output.worldTangent = normalize(UnityObjectToWorldDir(input[i].tangent));
						output.bitTangent = normalize(cross(output.worldNormal, output.worldTangent) * input[i].tangent.w);
						appdata_base v; v.vertex = float4(output.modelPos,1);
                		output.refl = ComputeNonStereoScreenPos(output.pos);
						UNITY_TRANSFER_FOG(output, output.pos);
						TRANSFER_SHADOW(output);
						output.bary = params[i];
						outStream.Append(output);
					}
					outStream.RestartStrip();
				}
			}
			
			f_out frag (g2f input, fixed facing : VFACE)
			{
				f_out output;
				float2 mainUV = TRANSFORM_TEX(input.uv,_MainTex) + _UVScroll.xy*floor(_Time.y/max(LIMIT_ZERO,_UVScroll.w))*max(LIMIT_ZERO,_UVScroll.w); + _UVScroll.xy*floor(_Time.y/max(LIMIT_ZERO,_UVScroll.w))*max(LIMIT_ZERO,_UVScroll.w);
				
				// Sample Texture
				fixed4 mainTex = tex2D(_MainTex, mainUV) * lerp(1,input.color,_VertexColorMultiple);

				fixed4 texSample = maintexFactor(mainTex,mainUV,input.bary,facing,input.modelPos,input.worldPos,input.refl);
				fixed3 mainCol = texSample.rgb;
				float mainAlpha = texSample.a;

				// Calc Normal
				float3x3 tangentTransform = float3x3( input.worldTangent, input.bitTangent, input.worldNormal);
				float3 viewDir = normalize(_WorldSpaceStereoCameraPos.xyz - input.worldPos.xyz);
				float3 bump = UnpackScaleNormal(tex2D(_BumpMap, mainUV), _BumpScale); //sample Bumpmap
				float3 normalDir = normalize(mul( bump, tangentTransform ));

				// CameraVector
				float3 worldCameraUp = normalize(UNITY_MATRIX_V[1].xyz);
				float3 worldViewUp = normalize(worldCameraUp - viewDir * dot(viewDir, worldCameraUp));
				float3 worldViewRight = normalize(cross(viewDir, worldViewUp));

				// Vector and scalar
				float3 lightDir = _WorldSpaceLightPos0.xyz - input.worldPos.xyz;
				float dotNL = max(0,dot(normalDir,lightDir));
				float dotNV = max(0,dot(normalDir,viewDir));
				// float3 HalfVector = normalize(lightDir + viewDir);
				// float dotNH = max(0,dot(normalDir, HalfVector));
				// float dotVH = max(0,dot(viewDir, HalfVector));

				float3 roughnessMetallicMap = UNITY_SAMPLE_TEX2D_SAMPLER(_RoughnessMetallicMap,_SubTex,mainUV).rgb;
				
				float lightIntensity = dotNL;
				//lightIntensity = lightIntensity * 0.5 + 0.5;
				float lambert = lerp(lightIntensity,lightIntensity * 2.0 - 1.0, 0);

				// Light
				UNITY_LIGHT_ATTENUATION(shadowAttenuation, input, input.worldPos.xyz);
				fixed3 lightColor = _LightColor0.rgb * shadowAttenuation*shadowAttenuation;
				//float3 lightPos = mul(unity_WorldToLight,input.worldPos);
				//lightColor *= length(lightPos)*length(lightPos);

				// GI
				fixed3 toonedGI = (ShadeSH9(half4(1, 0, 0, 1)) + ShadeSH9(half4(-1, 0, 0, 1)) + ShadeSH9(half4(0, 1, 0, 1)) + ShadeSH9(half4(0, -1, 0, 1)) + ShadeSH9(half4(0, 0, 1, 1)) + ShadeSH9(half4(0, 0, -1, 1)))/6;
				fixed3 indirectLighting = lerp( ShadeSH9(half4(normalDir, 1)), toonedGI, _IndirectLightIntensity);
				indirectLighting = _VirtualGI<0 ? max( -_VirtualGI.xxx, indirectLighting) : lerp( _VirtualGI.xxx, indirectLighting, indirectLighting); // GIの最低値
				indirectLighting = lerp( indirectLighting, max(indirectLighting.x, max(indirectLighting.y, indirectLighting.z)).xxx, saturate(_LightColorAttenuation)); // ColorAttenuation

				fixed3 toonCol = calcToonCol( mainCol, mainUV, 1-_Tex2ShadowTextureLevel,
											  _ShadeShift0, _ShadeToony0, _ShadeColor0,
											  _ShadeShift1, _ShadeToony1, _ShadeColor1,
											  lambert, lightColor);

				fixed3 pbrCol;
				{
					fixed3 col = mainCol;

					float roughness = roughnessMetallicMap.g * _Roughness * 0.75;

					fixed3 light = pow( dotNL, pow(1000,roughness*roughness)) * fixed4(lightColor,1);

					col =  light;

					pbrCol = col;
				}

				// Base + Light
				float toonMask = UNITY_SAMPLE_TEX2D_SAMPLER(_ToonMask,_SubTex,mainUV).r;
				mainCol = lerp(pbrCol,toonCol,_Toon*toonMask);
				mainAlpha = lerp(0,mainAlpha,step(_AlphaCut,mainAlpha));

				output.col.rgb = mainCol * _MaxPointLightEfect;
				output.col.a = mainAlpha;
				output.col.a *=  (1-_ParticleFactor);

				// Alpha Cutout
				clip(output.col.a-_AlphaCut);

				// apply fog
				UNITY_APPLY_FOG(input.fogCoord, output);

				output.col *= UNITY_SAMPLE_TEX2D(_SubTex, input.uv) * _SubColor;
				
				return output;
			}
			ENDCG
		}
		
		Pass{
			Name "Bloom"
			Tags { "LightMode"="ForwardBase"}
			Blend [_BloomSrcBlend] [_BloomDstBlend]
			ZTest LEqual
			ZWrite [_BloomZWrite]
			Cull [_BloomCullMode]
			CGPROGRAM
			#pragma target 5.0
			#pragma shader_feature IS_DOPPELGENGER
			
			#pragma vertex vert
			#pragma hull HS
			#pragma domain DS
			#pragma geometry geom
			#pragma fragment frag

			#define roop 48

			struct g2f{
				float2 uv : TEXCOORD0;
				float4 pos : SV_POSITION;
				float alpha : TEXCOORD1;
			};

			[maxvertexcount(roop*3)]
			void geom(triangle d2g input[3], inout TriangleStream<g2f> outStream){
				cameraClip(_MirrorCulling);
				mirrorClip(_CameraCulling);
				cameraClip(_BloomMirrorCulling);
				mirrorClip(_BloomCameraCulling);
				if(_BloomRange<=0)return;
				// Wind
				float3 wind[3];
				float3 uOffset[3];
				[unroll]for(int index=0;index<3;index++){
					float4 windUV = float4(input[index].pos.xyz,_Time.y*_FurWindSpeed);
					wind[index] = lerp(wind_base(windUV),noise_wind(windUV),_FurWindType);
					uOffset[index] = lerp(input[index].pos,input[index].normal,_BloomBase);
					uOffset[index] *= tex2Dlod(_BloomMask,float4(TRANSFORM_TEX(input[index].uv,_MainTex),0,0));
				}
				g2f output;
				[unroll]for(int scale=1;scale<roop+1;scale++){
					[unroll]for(int index=0;index<3;index++){
						float3 offset = uOffset[index] + (wind[index]*_FurWindPower + _FurGravity) * pow(scale,3) *(1e-5);
						offset *= scale*_BloomRange/float(roop);
						output.pos = UnityObjectToClipPos(input[index].pos+offset); //ループごとにスケールを大きくしていく(ノーマル方向に広げるとポリゴンがうくョ)
						
						output.uv = input[index].uv;
						output.alpha = float(roop-scale)/float(roop);
						outStream.Append(output);
					}
					outStream.RestartStrip();
				}
			}
			
			fixed4 frag (g2f i) : SV_Target{
				float2 mainUV = TRANSFORM_TEX(i.uv,_MainTex) + _UVScroll.xy*floor(_Time.y/max(LIMIT_ZERO,_UVScroll.w))*max(LIMIT_ZERO,_UVScroll.w);
				// Vector and scalar
				float3 lightDir = length(_WorldSpaceLightPos0)<LIMIT_ZERO ? float3(0,1,0) : normalize(_WorldSpaceLightPos0.xyz);
				fixed3 lightColor = _VirtualLight<0 ? max( -_VirtualLight.xxx, _LightColor0.rgb) : lerp( _VirtualLight.xxx, _LightColor0.rgb, _LightColor0.rgb); // VirtualLight
				lightColor = lerp( abs(_VirtualLight).xxx, lightColor, step(0.9, length(lightDir))); //directional light nothing
				lightColor = lerp( lightColor, max(lightColor.x,max(lightColor.y,lightColor.z)).xxx, saturate(_LightColorAttenuation)); //ColorAttenuation
				// GI
				fixed3 toonedGI = 0.5 * (ShadeSH9(half4(0, 1, 0, 1)) + ShadeSH9(half4(0, -1, 0, 1)));
				fixed3 indirectLighting = toonedGI;
				indirectLighting = _VirtualGI<0 ? max( -_VirtualGI.xxx, indirectLighting) : lerp( _VirtualGI.xxx, indirectLighting, indirectLighting); // GIの最低値
				indirectLighting = lerp( indirectLighting, max(indirectLighting.x, max(indirectLighting.y, indirectLighting.z)).xxx, saturate(_LightColorAttenuation)); // ColorAttenuation

				float2 uv = TRANSFORM_TEX(i.uv,_BloomTex);
				fixed4 col = tex2Dlod(_BloomTex, float4(uv,0,0));
				col.rgb = lerp(col.rgb,fur_noise(uv)*col.rgb,_FurNoise);
				col *= lerp(0.0,_BloomBrightness,saturate((length(col.rgb)-_BloomThreshold)/_BloomSoftknee)); //しきい値以下の色なら光らせない(干渉区間あり)
				col *= gammacorrect( _BloomKnee, i.alpha); //なんかいい感じに(悲しいことに_kee=0はバグる)
				col *= _BloomCol;
				col.rgb *= lerp(normalize(float3(1,1,1)),normalize(tex2D(_MainTex,mainUV).rgb),_BloomMainTexBlend);
				// Alpha Cutout
				clip(col.a-_AlphaCut);
				float4 mask = tex2D(_BloomMask,mainUV);
				clip(min(min(min(mask.r,mask.g),mask.b),mask.a) - LIMIT_ZERO);
				col = lerp(col,saturate(col),_FurSaturate);
				col.rgb *= lerp(1,saturate(lightColor+indirectLighting),_BloomLightEffect);
				col *= UNITY_SAMPLE_TEX2D(_SubTex, i.uv) * _SubColor;
				return col;
			}
			ENDCG
		}
		
		Pass
		{
            Name "ShadowCaster"
            Tags { "LightMode" = "ShadowCaster" }
            ZWrite On
			ZTest LEqual
			Cull [_CullMode]
			CGPROGRAM
			#pragma target 5.0
			#pragma shader_feature IS_DOPPELGENGER
			#pragma vertex vert
			#pragma geometry geom
			#pragma fragment frag
			// make fog work
            #pragma multi_compile_fwdbase
            #pragma multi_compile_fog

			struct g2f
			{
				float2 uv : TEXCOORD0;
				fixed4 color : COLOR;
				float2 centerUV : CENTER_UV;
				float4 pos : SV_POSITION;
				float3 modelPos : MODEL_POS;
				float3 worldPos : WORLD_POS;
				float3 bary : TRIANGLE_BARY;
                float4 refl : REFL_UV;
			};

			struct f_out{
				fixed4 col : SV_TARGET;
			};

			[maxvertexcount(21)]
			void geom(triangle d2g input[3], inout TriangleStream<g2f> outStream)
			{
				cameraClip(_MirrorCulling);
				mirrorClip(_CameraCulling);
				cameraClip(_ShadowMirrorCulling);
				mirrorClip(_ShadowCameraCulling);
				g2f output;
				output.centerUV = (input[0].uv+input[1].uv+input[2].uv)/3;
				float3 mPos = (input[0].pos+input[1].pos+input[2].pos)/3;
				float3 polyNormal = normalize(cross( input[1].pos-input[0].pos, input[2].pos-input[0].pos)); //ポリゴンから計算した法線
				float3 viewVec = (normalize(mul(UNITY_MATRIX_M,mPos) - _ObjectSpaceStereoCameraPos));
				float3 rotAxi = normalize(cross(viewVec,polyNormal));
				float extrusionFactor = saturate(_ExtrusionFactor*(1+_ExtrusionNoise) - random(output.centerUV)*_ExtrusionNoise);
				float3 extrusionVec = (polyNormal+_Grabity) * extrusionFactor;
				
				float2 particleUV = output.centerUV + _MemoryScroll.xy *floor(_Time.y/max(LIMIT_ZERO,_MemoryScroll.w))*max(LIMIT_ZERO,_MemoryScroll.w);
				particleUV = TRANSFORM_TEX(particleUV,_PositionMemory);
				float3 particlePos = (tex2Dlod(_PositionMemory,float4(particleUV,0,0)).xyz + noise_tex(particleUV)*_PositionNoise) * _PositionPower;
				float4 wPos = mul(UNITY_MATRIX_M,float4(mPos*_ObjPosFactor+extrusionVec+particlePos,1));
				float4 vPos = mul(UNITY_MATRIX_V,wPos);

				float3 localScale = float3(length(mul(UNITY_MATRIX_M,float4(1,0,0,0))),length(mul(UNITY_MATRIX_M,float4(0,1,0,0))),length(mul(UNITY_MATRIX_M,float4(0,0,1,0))));
				float3 localPos = mul(UNITY_MATRIX_M,float4(0,0,0,1)).xyz;
				float4 localViewPos = mul(UNITY_MATRIX_V,float4(localPos,1));
				float3 cameraSpaceCameraPos = float3(-_WorldSpaceCameraPos.x,-_WorldSpaceCameraPos.y,_WorldSpaceCameraPos.z);
				

				int dop=0;
				#ifdef IS_DOPPELGENGER
				for(;dop<_Doppelganger;dop++){
				#else
				{
				#endif
					[unroll] for(int i=0;i<3;i++)
					{
						output.uv = input[i].uv;
						output.color = input[i].color;
						float2 memoryUV = lerp(output.centerUV, output.uv, _PositionFactor) + _MemoryScroll.xy *floor(_Time.y/max(LIMIT_ZERO,_MemoryScroll.w))*max(LIMIT_ZERO,_MemoryScroll.w); //メモリの解釈(ポリゴン単位か頂点単位か)
						memoryUV = TRANSFORM_TEX(memoryUV,_PositionMemory);
						float noise = random(memoryUV);
						float distDepth = distance(mul(UNITY_MATRIX_M,input[i].pos),_WorldSpaceStereoCameraPos);
						float4 extrusionPos = float4(input[i].pos.xyz,1);
						extrusionPos.xyz -= mPos;
						float rotationFactor = saturate(_RotationFactor*(1+_RotationNoise) - noise*_RotationNoise);
						extrusionPos = rotation(rotAxi, rotationFactor*180, extrusionPos); // 視線と法線に垂直な軸で回転
						float scaleFactor = saturate(_ScaleFactor*(1+_ScaleNoise) - noise*_ScaleNoise);
						extrusionPos.xyz = lerp(float3(0,0,0), extrusionPos.xyz, scaleFactor); //ポリゴンベースのスケールファクタ
						extrusionPos.xyz += mPos;
						extrusionPos.xyz += extrusionVec;
						extrusionPos += _DoppelgangerPos * dop;
						float objPosFactor = saturate(_ObjPosFactor*(1+_ObjPosNoise) - noise*_ObjPosNoise);
						extrusionPos.xyz = extrusionPos.xyz * objPosFactor + tex2Dlod(_PositionMemory,float4(memoryUV,0,0)).xyz * _PositionPower;
						output.modelPos = extrusionPos.xyz;
						output.worldPos = _Model2World ? forceRotMove(output.modelPos,_ModelRot,_ModelScale.xyz+localScale*_ModelScale.w,_ModelPos.xyz+localPos*_ModelPos.w)
													: mul( UNITY_MATRIX_M, float4(forceRotMove(output.modelPos,_ModelRot,_ModelScale.xyz,float3(0,0,0)),1)).xyz + _ModelPos.xyz;
						float3 viewPos = _World2View ? forceRotMove(output.worldPos,_CameraRot,_CameraScale,_CameraPos.xyz+cameraSpaceCameraPos*_CameraPos.w)
													: mul(UNITY_MATRIX_V,float4(output.worldPos,1)).xyz;
						float4 clipPos = mul(UNITY_MATRIX_P,float4(viewPos,1)); //通常のポジション
						float4 partPos = mul(UNITY_MATRIX_P,vPos+float4(particles[i]*_ParticleSize,0,0)); //パーティクル化したポジション
						float4 billbordPos = float4(localViewPos + forceRotMove(output.modelPos,_BillBoardPos,_BillBoardScale.xyz,_BillBoardPos.xyz),1); //ビルボード化したポジション
						output.pos = _BillBoard ? mul(UNITY_MATRIX_P,billbordPos) : lerp(clipPos,partPos,_ParticleFactor);
						output.pos = UnityApplyLinearShadowBias(output.pos);
						output.bary = params[i];
						output.refl = ComputeNonStereoScreenPos(output.pos);
						outStream.Append(output);
					}
					outStream.RestartStrip();
				}
			}
			
			f_out frag (g2f input, fixed facing : VFACE)
			{
				f_out output;
				float2 mainUV = TRANSFORM_TEX(input.uv,_MainTex) + _UVScroll.xy*floor(_Time.y/max(LIMIT_ZERO,_UVScroll.w))*max(LIMIT_ZERO,_UVScroll.w);
				float shadowMask = UNITY_SAMPLE_TEX2D_SAMPLER(_RoughnessMetallicMap,_SubTex,mainUV).b;
				clip(shadowMask-_AlphaCut);

				// Sample Texture
				fixed4 mainTex = tex2D(_MainTex, mainUV) * lerp(1,input.color,_VertexColorMultiple);

				output.col = maintexFactor(mainTex,mainUV,input.bary,facing,input.modelPos,input.worldPos,input.refl);

				output.col.a *=  (1-_ParticleFactor);
				clip(output.col.a-_AlphaCut);

				output.col *= UNITY_SAMPLE_TEX2D(_SubTex, mainUV) * _SubColor;
				
				return output;
			}
			ENDCG
		}
		
		CGINCLUDE
		#include "UnityCG.cginc"
		#include "Lighting.cginc"
		#include "AutoLight.cginc"
		
			float _DstBlend;
			float _Toon;
			float _AlphaCut;
			float _Tex2AlphaMask;

			float _MirrorCulling;
			float _CameraCulling;
			float _BaseMirrorCulling;
			float _BaseCameraCulling;
			float _AddMirrorCulling;
			float _AddCameraCulling;
			float _BloomMirrorCulling;
			float _BloomCameraCulling;
			float _ShadowMirrorCulling;
			float _ShadowCameraCulling;

			sampler2D _MainTex; float4 _MainTex_ST;
			fixed4 _Color;
			int _MirrorMode;
			UNITY_DECLARE_TEX2D(_ReflectionTex0);
			UNITY_DECLARE_TEX2D_NOSAMPLER(_ReflectionTex1);

			float _VertexColorMultiple;
			float4 _UVScroll;

			UNITY_DECLARE_TEX2D(_SubTex);
			UNITY_DECLARE_TEX2D_NOSAMPLER(_BackTex);
			UNITY_DECLARE_TEX2D_NOSAMPLER(_AlphaMask);
			UNITY_DECLARE_TEX2D_NOSAMPLER(_DisolveMask);
			UNITY_DECLARE_TEX2D_NOSAMPLER(_ShadowTex);
			UNITY_DECLARE_TEX2D_NOSAMPLER(_ToonMask);
			fixed4 _SubColor;
			float _Tex2BackTextureLevel;

			float _DisolveSpeed;

			sampler2D _ShadeColor;

			fixed4 _ShadeColor0;
			fixed4 _ShadeColor1;
			float _Tex2ShadowTextureLevel;

			fixed4 _ExchangeColor;
			float _ExchangeThreshold;
			UNITY_DECLARE_TEX2D_NOSAMPLER(_HSVMask);
			int _HSVPosMask;
			float _H, _S, _V;
			float _ColorStepFactor;

			// OverrideTexture
			sampler2D _OverrideTexture; float4 _OverrideTexture_ST;
			fixed4 _OverrideColor;
			int _OverridePosMask;
			float _OverrideH;
			float _OverrideS;
			float _OverrideV;

			// Distance Fade
			float _NearClip;
			float _FarClip;
			float _ClipThreshold;

			// WireFrame
			float _WireframeWidth;
			fixed4 _WireframeColor;
			float _WireframeBlend;

			sampler2D _BumpMap;
			float _BumpScale;
			
			//VirtualLight 
			float _VirtualLight;
			float _VirtualGI;
			float _ReceiveShadowRate;
			float _OcclusionStrength;
			float _LightColorAttenuation;
			float _IndirectLightIntensity;
			float _FlatShading;
			float _Lambert;

			float _ShadeShift0;
			float _ShadeToony0;
			float _ShadeShift1;
			float _ShadeToony1;
			float _Shade1Power0,_Shade1Power1;

			//Mask
			UNITY_DECLARE_TEX2D_NOSAMPLER(_FresnelMask);
			// Rim
			float4 _RimColor;
			float _RimPower;
			float _RimFresnelPower;
			float _RimLift;
			float _RimFresnel;
			//MatCap
			sampler2D _MatCap;
			fixed4 _MatCapColor;
			int _MatcapMode;
			
			// Diffuse
			UNITY_DECLARE_TEX2D_NOSAMPLER(_RoughnessMetallicMap);
			float _Metalic;
			float _Roughness;

			// Emission
			sampler2D _EmissionTex; float4 _EmissionTex_ST;
			UNITY_DECLARE_TEX2D_NOSAMPLER(_EmissionMask);
			fixed4 _EmissionColor;
			float4 _EmissionScroll;
			float4 _EmissionVelocity;
			float _EmissionWidth;

			//* アウトライン専用処理
				// Outline
				float4 _OutlineColor;
				float _OutlineBase;
				float _OutlineWidth;
				sampler2D _OutlineMask;
				sampler2D _OutlineTex;
				float _OutlineMainTexBlend;
				float _OutlineWidthDist;
			// */
			
			//* ベースカラー専用処理
			//ParallaxMapping
			int _Alpha2Parallax;
			sampler2D _ParallaxTexture; float4 _ParallaxTexture_ST;
			UNITY_DECLARE_TEX2D_NOSAMPLER(_ParallaxMask);
			float4 _ParallaxColor;
			float _ParallaxDepth;
			float _ParallaxBlend;
			float _ParallaxMul;
			float _ParallaxAdd;
			float4 _ParallaxScroll;

				//GrabPass
				sampler2D_float _GrabPassTexture_Transparent;

				int _Alpha2Grab;
				float _GrabBlend;
				float _GrabMul;
				float _GrabAdd;
				float _RelativeRefractionIndex;
				float _RefractDistance;
				float4 _ChromaticAberrationR;
				float4 _ChromaticAberrationG;
				float4 _ChromaticAberrationB;
				float _GrabMosicFactor;
				float _GrabH, _GrabS, _GrabV;
				float _GrabColorStepFactor;

			// Geometry
			sampler2D_float _PositionMemory;
			float4 _PositionMemory_ST;
			float _PositionNoise;
			float _PositionFactor;
			float _PositionPower;
			float _ObjPosFactor;
			float _ObjPosNoise;
			float4 _MemoryScroll;
			float4 _Grabity;
			float _ExtrusionFactor;
			float _ExtrusionNoise;
			float _RotationFactor;
			float _RotationNoise;
			float _ScaleFactor;
			float _ScaleNoise;

			// MatrixGeom
			float _Model2World;
			float4 _ModelRot;
			float4 _ModelScale;
			float4 _ModelPos;
			float _World2View;
			float4 _CameraRot;
			float4 _CameraScale;
			float4 _CameraPos;
			float _BillBoard;
			float4 _BillBoardRot;
			float4 _BillBoardScale;
			float4 _BillBoardPos;

			sampler2D _BloomMask;
			sampler2D _BloomTex; float4 _BloomTex_ST;
			float4 _FurGravity;
			float _FurNoise;
			float _FurWindPower;
			float _FurWindSpeed;
			float _FurWindType;
			float _BloomBase;
			float4 _BloomCol;
			float _BloomRange;
			float _BloomKnee;
			float _BloomSoftknee;
			float _BloomBrightness;
			float _BloomThreshold;
			float _BloomMainTexBlend;
			float _BloomLightEffect;
			float _FurSaturate;

			// Doppelganger
			float4 _DoppelgangerPos;
			int _Doppelganger;

			// GPUParticle
			float _ParticleFactor;
			float _ParticleColorFactor;
			float _ParticleSize;
			fixed4 _ParticleColor;

			float _MaxPointLightEfect;

		#define _WorldSpaceStereoCameraPos stereocamerapos().xyz
		#define _ObjectSpaceStereoCameraPos mul(unity_WorldToObject,float4(_WorldSpaceStereoCameraPos.xyz, 1)).xyz
		#define LIMIT_ZERO 0.0001

		float4 _CameraResolution;
		#define cameraClip(a) if(a==1 || a==3) if((abs(_ScreenParams.x-_CameraResolution.x)+abs(_ScreenParams.y-_CameraResolution.y))<0.1 || (abs(_ScreenParams.x-_CameraResolution.z)+abs(_ScreenParams.y-_CameraResolution.w))<0.1) return; \
							  if(a==2 || a==3) if((abs(_ScreenParams.x-_CameraResolution.x)+abs(_ScreenParams.y-_CameraResolution.y))>0.1 || (abs(_ScreenParams.x-_CameraResolution.z)+abs(_ScreenParams.y-_CameraResolution.w))>0.1) return;
		#define mirrorClip(a) if(a==1 || a==3) if(UNITY_MATRIX_P[2][2]<0) return; \
							  if(a==2 || a==3) if(UNITY_MATRIX_P[2][2]>0) return;

		#define autoFrag(a) float3x3 tangentTransform = float3x3( a.worldTangent, a.bitTangent, a.worldNormal);\
							float3 viewDir = normalize(_WorldSpaceStereoCameraPos.xyz - a.worldPos.xyz);\
							float3 bump = UnpackScaleNormal(tex2D(_BumpMap, mainUV), _BumpScale);\
							float3 normalDir = normalize(mul( bump, tangentTransform ));\
							float3 worldCameraUp = normalize(UNITY_MATRIX_V[1].xyz);\
							float3 worldViewUp = normalize(worldCameraUp - viewDir * dot(viewDir, worldCameraUp));\
							float3 worldViewRight = normalize(cross(viewDir, worldViewUp));\
							float3 lightDir = _WorldSpaceLightPos0.xyz - a.worldPos.xyz;\
							float dotNL = max(0,dot(normalDir,lightDir));\
							float dotNV = max(0,dot(normalDir,viewDir));\
							float3 roughnessMetallicMap = UNITY_SAMPLE_TEX2D_SAMPLER(_RoughnessMetallicMap,_SubTex,mainUV).rgb;\
							float lightIntensity = dotNL;\
							float lambert = lerp(lightIntensity,lightIntensity * 2.0 - 1.0, 0);\
							UNITY_LIGHT_ATTENUATION(shadowAttenuation, a, a.worldPos.xyz);\
							fixed3 lightColor = _LightColor0.rgb * shadowAttenuation*shadowAttenuation;\
							fixed3 toonedGI = 0.5 * (ShadeSH9(half4(0, 1, 0, 1)) + ShadeSH9(half4(0, -1, 0, 1)));\
							fixed3 indirectLighting = lerp(toonedGI, ShadeSH9(half4(normalDir, 1)), _IndirectLightIntensity);\
							indirectLighting = _VirtualGI<0 ? max( -_VirtualGI.xxx, indirectLighting) : lerp( _VirtualGI.xxx, indirectLighting, indirectLighting);\
							indirectLighting = lerp( indirectLighting, max(indirectLighting.x, max(indirectLighting.y, indirectLighting.z)).xxx, saturate(_LightColorAttenuation));

		// rand
		float4 _RandSeed;

		static float3 params[3] = {float3(1,0,0),float3(0,0,1),float3(0,1,0)};
		static float2 particles[3] =  {float2(0.0,0.1),float2(0.1,-0.0577),float2(-0.1,-0.0577)};

		inline float3 stereocamerapos(){
			float3 cameraPos = _WorldSpaceCameraPos;
			#if defined(USING_STEREO_MATRICES)
			cameraPos = (unity_StereoWorldSpaceCameraPos[0] + unity_StereoWorldSpaceCameraPos[1]) * 0.5;
			#endif
			return cameraPos;
		}

		inline float3 rgb2hsv(float3 c) {
			float4 K = float4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
			float4 p = lerp(float4(c.bg, K.wz), float4(c.gb, K.xy), step(c.b, c.g));
			float4 q = lerp(float4(p.xyw, c.r), float4(c.r, p.yzx), step(p.x, c.r));

			float d = q.x - min(q.w, q.y);
			float e = 1.0e-10;
			return float3(abs(q.z + (q.w - q.y) / (6.0 * d + e)), d / (q.x + e), q.x);
		}
		
		inline fixed3 hsv2rgb(float3 hsv){
			fixed4 t = fixed4(1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0);
			fixed3 p = abs(frac(hsv.xxx + t.xyz) * 6.0 - t.www);
			return hsv.z * lerp(t.xxx, clamp(p - t.xxx, 0.0, 1.0), hsv.y);
		}
		
		inline float returnDepth(float4 clipPos)
		{
			#ifdef SHADER_TARGET_GLSL
				return (clipPos.z / clipPos.w) * 0.5 + 0.5;
			#endif
			return clipPos.z / clipPos.w;
		}

		inline float feel_good_func (float x){
			return (x+cos(x))+cos(x+cos(x));
		}

		inline float random(float2 uv)
		{
			return frac(sin(dot(uv, float2(_RandSeed.xy))) * _RandSeed.w);
		}
		inline float random(float3 uv)
		{
			return frac(sin(dot(uv, float3(_RandSeed.xyz))) * _RandSeed.w);
		}

		inline float3 safe_normalize (float3 vec)
		{
			return vec==float3(0,0,0) ? float3(0,0,0) : normalize(vec);
		}

		inline float4 qfunc(float4 q1, float4 q2)
		{
			return float4( cross(q1.xyz,q2.xyz) + q2.w*q1.xyz + q1.w*q2.xyz, q1.w*q2.w - dot(q1.xyz, q2.xyz));
		}
		inline float4 qrot(float4 qut, float4 pos)
		{
			return float4(qfunc(qfunc(qut, pos), float4(-qut.xyz, qut.w)));
		}
		inline float4 rotation(float3 axi, float rot, float4 pos) {
			float4 qut = float4( normalize(axi)*sin(radians(rot)), cos(radians(rot)));
			return qrot(qut, pos);
		}

		inline float3 mat2scale (float3x3 mat)
		{
			return float3(	length(mul(mat,float3(1,0,0))),
							length(mul(mat,float3(0,1,0))),
							length(mul(mat,float3(0,0,1))));
		}

		inline float3 forceRotMove(float3 pos, float4 rot, float3 scale, float3 move)
		{
			pos *= scale;
			pos = rotation(rot.xyz,rot.w,float4(pos,1));
			pos += move;
			return pos;
		}
			
		float gammacorrect(float gamma, float input) {
			float output = saturate(pow( input, 1.0/gamma));
			output = lerp(output,1.0,step(9.9,gamma));
			return output;
		}
			
		#define INPUT_PATCH_SIZE 3
		#define OUTPUT_PATCH_SIZE 3
		
		//Tessalation
		sampler2D _TessMap;
		float4 _TessFactor;
			
		struct v2h
		{
			float2 uv : TEXCOORD0;
			fixed4 color : COLOR;
			float4 pos : SV_POSITION;
			float3 normal : NORMAL;
			float4 tangent : TANGENT;
		};

		struct h2d_main
		{
			float2 uv : TEXCOORD0;
			fixed4 color : COLOR;
			float4 pos : SV_POSITION;
			float3 normal : NORMAL;
			float4 tangent : TANGENT;
		};

		struct h2d_const
		{
			float tess_factor[3] : SV_TessFactor;
			float InsideTessFactor : SV_InsideTessFactor;
		};

		struct d2g
		{
			float2 uv : TEXCOORD0;
			fixed4 color : COLOR;
			float4 pos : SV_POSITION;
			float3 normal : NORMAL;
			float4 tangent : TANGENT;
		};

		struct v2f
		{
			float2 uv : TEXCOORD0;
			fixed4 color : COLOR;
			UNITY_FOG_COORDS(1)
			SHADOW_COORDS(2)
			float4 pos : SV_POSITION;
			float3 modelPos : MODEL_POS;
			float3 worldPos : WORLD_POS;
			float3 modelNormal : MODEL_NORMAL;
			float3 worldNormal : WORLD_NORMAL;
			float3 worldTangent : WORLD_TANGENT;
			float3 bitTangent : BIT_TANGENT;
		};
		
		v2h vert (appdata_full v)
		{
			v2h output;
			output.uv = v.texcoord;
			output.color = v.color;
			output.pos= v.vertex;
			output.normal = v.normal;
			output.tangent = v.tangent;

			return output;
		}

		v2f vert_light (appdata_full v)
		{
			v2f output;
			output.uv = v.texcoord;
			output.color = v.color;
			output.modelNormal = v.normal;
			output.worldNormal = normalize(UnityObjectToWorldNormal(output.modelNormal));
			output.worldTangent = normalize(UnityObjectToWorldDir(v.tangent));
			output.bitTangent = normalize(cross(output.worldNormal, output.worldTangent) * v.tangent.w);
			output.modelPos = v.vertex + output.modelNormal*0.001;
			output.pos = UnityObjectToClipPos(output.modelPos);
			UNITY_TRANSFER_FOG(output, output.pos);
			TRANSFER_SHADOW(output);
			return output;
		}

		fixed4 frag_light (v2f input) : SV_Target
		{
			return 1;
		}

		h2d_const HSConst(InputPatch<v2h,INPUT_PATCH_SIZE> input)
		{
			h2d_const output;
			
			float4 uv = float4((input[0].uv+ input[1].uv + input[2].uv) / 3., 0, 0);
			float4 tessWeight = tex2Dlod(_TessMap,uv);
			output.tess_factor[0] = lerp( 1, _TessFactor.x, tessWeight.r);
			output.tess_factor[1] = lerp( 1, _TessFactor.y, tessWeight.g);
			output.tess_factor[2] = lerp( 1, _TessFactor.z, tessWeight.b);
			output.InsideTessFactor = lerp( 1, _TessFactor.w, tessWeight.a);
			
			// output.tess_factor[0] = _TessFactor.x;
			// output.tess_factor[1] = _TessFactor.y;
			// output.tess_factor[2] = _TessFactor.z;
			// output.InsideTessFactor = _TessFactor.w;
			return output;
		}

		[domain("tri")]
		[partitioning("integer")]
		[outputtopology("triangle_cw")]
		[outputcontrolpoints(OUTPUT_PATCH_SIZE)]
		[patchconstantfunc("HSConst")]
		h2d_main HS(InputPatch<v2h, INPUT_PATCH_SIZE> input, uint id:SV_OutputControlPointID)
		{
			h2d_main output;
			output.uv = input[id].uv;
			output.color = input[id].color;
			output.pos = input[id].pos;
			output.normal = input[id].normal;
			output.tangent = input[id].tangent;
			return output;
		}

		[domain("tri")]
		d2g DS(h2d_const hs_const_data, const OutputPatch<h2d_main, OUTPUT_PATCH_SIZE> input, float3 bary:SV_DomainLocation)
		{
			d2g output;
			output.uv  = input[0].uv * bary.x + input[1].uv * bary.y + input[2].uv * bary.z;
			output.color  = input[0].color * bary.x + input[1].color * bary.y + input[2].color * bary.z;
			output.pos  = input[0].pos * bary.x + input[1].pos * bary.y + input[2].pos * bary.z;
			output.normal  = input[0].normal * bary.x + input[1].normal * bary.y + input[2].normal * bary.z;
			output.tangent  = input[0].tangent * bary.x + input[1].tangent * bary.y + input[2].tangent * bary.z;
			return output;
		}

		inline fixed4 maintexFactor(fixed4 mainTex, float2 uv, float3 bary, fixed facing, float3 modelPos, float3 worldPos, float4 mirrorUV)
		{
			// facing
			fixed4 backTex = UNITY_SAMPLE_TEX2D_SAMPLER(_BackTex,_SubTex,uv);
			mainTex = facing>0 ? mainTex : lerp(mainTex,backTex,_Tex2BackTextureLevel);

			// Stereo TExture
			float2 stereoUV = lerp(uv,mirrorUV,_MirrorMode);
			mainTex *= unity_StereoEyeIndex == 0 ? UNITY_SAMPLE_TEX2D_SAMPLER(_ReflectionTex0, _ReflectionTex0, stereoUV) : UNITY_SAMPLE_TEX2D_SAMPLER(_ReflectionTex1, _ReflectionTex0, stereoUV);

			fixed3 mainCol = mainTex.rgb;
			float mainAlpha = mainTex.a;

			//MaintexFactor
			float exchangeMask = UNITY_SAMPLE_TEX2D_SAMPLER(_HSVMask,_SubTex,uv);
			exchangeMask = (_HSVPosMask == 1 && modelPos.x<0) ? 0 : exchangeMask;
			exchangeMask = (_HSVPosMask == 2 && modelPos.x>0) ? 0 : exchangeMask;
			float3 hsv = rgb2hsv(mainCol);
			hsv.x += _H;
			hsv.y = lerp( lerp(0,hsv.y,saturate(_S*2)), lerp(hsv.y,1,saturate(_S*2-1)), step(0.5,_S));
			hsv.z = lerp( lerp(0,hsv.z,saturate(_V*2)), lerp(hsv.z,1,saturate(_V*2-1)), step(0.5,_V));
			fixed3 exchangeColor = hsv2rgb(hsv);
			mainCol = lerp( mainCol, exchangeColor, exchangeMask*step(distance(mainTex,_ExchangeColor),_ExchangeThreshold));
			mainCol = lerp( mainCol, floor(mainCol*_ColorStepFactor)/_ColorStepFactor , exchangeMask*step(_ColorStepFactor,255));

			// Multipul Color
			mainCol *= _Color.rgb;
			mainAlpha *= _Color.a;

			float alphaMask = UNITY_SAMPLE_TEX2D_SAMPLER(_AlphaMask,_SubTex,uv).r;	
			mainAlpha = lerp(mainAlpha,alphaMask,_Tex2AlphaMask);
			float disolve = UNITY_SAMPLE_TEX2D_SAMPLER(_DisolveMask,_SubTex,uv).r;
			float disolveAlpha = saturate(frac(_Time.y*_DisolveSpeed/2)*2);
			mainAlpha = lerp( mainAlpha, (saturate(frac(_Time.y*_DisolveSpeed/2)*2-1)), step(disolveAlpha,disolve)*step(LIMIT_ZERO,_DisolveSpeed));

			// Wireframe
			float wireframeWidth = (_WireframeWidth+1) * step(LIMIT_ZERO,_WireframeWidth);
			float wireframe = any(bool3(bary.x < wireframeWidth-1, bary.y < wireframeWidth-1, bary.z < wireframeWidth-1));
			mainCol = lerp( mainCol, _WireframeColor.rgb, wireframe*(1-_WireframeBlend)*step(LIMIT_ZERO,wireframeWidth));
			//mainAlpha = lerp( mainAlpha, _WireframeColor.rgb, wireframe*_WireframeColor.a);
			mainAlpha = lerp( mainAlpha, _WireframeColor.a, wireframe*step(LIMIT_ZERO,wireframeWidth));

			// Override Texture
			float2 overrideUV = saturate(TRANSFORM_TEX(uv,_OverrideTexture));
			fixed4 overrideTexture = tex2D(_OverrideTexture,overrideUV);
			overrideTexture = (_OverridePosMask == 1 && modelPos.x<0) ? 0 : overrideTexture;
			overrideTexture = (_OverridePosMask == 2 && modelPos.x>0) ? 0 : overrideTexture;
			float3 overrideHSV = rgb2hsv(overrideTexture.rgb);
			overrideHSV.x += _OverrideH;
			overrideHSV.y += lerp( lerp(0,overrideHSV.y,saturate(_OverrideS*2)), lerp(overrideHSV.y,1,saturate(_OverrideS*2-1)), step(0.5,_OverrideS));
			overrideHSV.z += lerp( lerp(0,overrideHSV.z,saturate(_OverrideV*2)), lerp(overrideHSV.z,1,saturate(_OverrideV*2-1)), step(0.5,_OverrideV));
			overrideTexture.rgb = hsv2rgb(overrideHSV);
			mainCol = lerp( mainCol, overrideTexture.rgb * _OverrideColor.rgb, overrideTexture.a);
			mainAlpha = lerp( mainAlpha, overrideTexture.a * _OverrideColor.a, overrideTexture.a);

			// Distance Clip
			float rand = random(uv);
			float viewDistance = distance( worldPos, _WorldSpaceStereoCameraPos) + rand*_ClipThreshold;
			float nearFade = saturate(viewDistance-_NearClip) + step(_NearClip,0);
			float farFade = saturate(_FarClip-viewDistance) + step(_FarClip,0);
			clip(min(nearFade,farFade)-LIMIT_ZERO);

			return fixed4(mainCol,mainAlpha);
		}

		inline fixed3 calcToonCol(fixed3 mainCol, float2 uv, float shadowTextureLevel,
								  float shadeShift0, float shadeToony0, fixed4 shadeColor0,
								  float shadeShift1, float shadeToony1, fixed4 shadeColor1,
								  float lambert, fixed3 lightColor, fixed3 indirectLighting)
		{
			// Threshold
			float maxIntensityThreshold0 = lerp(1, shadeShift0, shadeToony0);
			float minIntensityThreshold0 = shadeShift0;
			float lightIntensity0 = pow(saturate((lambert - minIntensityThreshold0) / max(LIMIT_ZERO, (maxIntensityThreshold0 - minIntensityThreshold0))),_Shade1Power0);
			float maxIntensityThreshold1 = shadeShift1;
			float minIntensityThreshold1 = lerp(shadeShift1, -1, 1-shadeToony1);
			float lightIntensity1 = pow(saturate((lambert - minIntensityThreshold1) / max(LIMIT_ZERO, (maxIntensityThreshold1 - minIntensityThreshold1))),_Shade1Power1);

			// Albedo color
			fixed3 lit =  mainCol;
			fixed4 shadowTex = UNITY_SAMPLE_TEX2D_SAMPLER(_ShadowTex,_SubTex,uv).r;
			fixed3 shadow = lerp( shadowTex, mainCol, shadowTextureLevel);
			fixed3 shade0 = shadow * shadeColor0;
			fixed3 shade1 = shadow * shadeColor1;
			fixed3 col = lerp(lerp(shade1, shade0, lightIntensity1), lit, lightIntensity0);
			col *= tex2D(_ShadeColor,float2(lambert,0.5));

			//lighting
			col.rgb *= lightColor;

			// GI
			col.rgb += indirectLighting * lit;
			
			col = min(col,lit); //白飛び防止
			
			return col;
		}
		inline fixed3 calcToonCol(fixed3 mainCol, float2 uv, float shadowTextureLevel,
								  float shadeShift0, float shadeToony0, fixed4 shadeColor0,
								  float shadeShift1, float shadeToony1, fixed4 shadeColor1,
								  float lambert, fixed3 lightColor)
		{
			return calcToonCol(mainCol,uv,shadowTextureLevel,shadeShift0,shadeToony0,shadeColor0,shadeShift1,shadeToony1,shadeColor1,lambert,lightColor,fixed3(0,0,0));
		}

		inline fixed3 calcPBRCol(fixed3 mainCol,
								 float metalic,
								 float roughness,
								 float dotNV, float3 viewDir, float3 normalDir, float3 lightDir,
								 float lambert, fixed3 lightColor)
		{
			fixed3 col = mainCol;

			//GI
			float3 reflDir = reflect(-viewDir, normalDir);
			float fresnel = roughness + (1.0h - roughness) * pow(1.0 - dotNV, 5);

			fixed3 refColor = UNITY_SAMPLE_TEXCUBE_LOD(unity_SpecCube0, reflDir, 5*(1-roughness)) * fresnel; //sample refrection
			fixed3 specular = pow( max(0,dot(reflect(-lightDir,normalDir),viewDir)), pow(1000,roughness*roughness)) * fixed4(lightColor,1) * roughness;
			fixed3 light = specular + refColor;
			light = lerp(light,light*col,length(col.rgb));

			fixed3 enviroment = saturate(fixed4(ShadeSH9(half4(normalDir,1)),1)) * col; //sample emviroment color

			fixed3 diffuse = lambert * fixed4(lightColor,1) * col;

			fixed3 base = diffuse + enviroment * metalic;

			col =  lerp(base, light, 0.5);

			return col;
		}

		#pragma shader_feature NOISE_GENERATE
		float _FBM;
		int _NoiseMode;
		float4 _Noise_ST;
		float4 _NoiseScroll;

		#ifdef NOISE_GENERATE
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
		#endif

		float4 noise_tex(float2 globalTexcoord){
			float3 uv = float3(globalTexcoord * _Noise_ST.xy + _Noise_ST.zw, 0.0) + _NoiseScroll.xyz *floor(_Time.y/max(LIMIT_ZERO,_NoiseScroll.w))*max(LIMIT_ZERO,_NoiseScroll.w);
			float4 output;
			#ifdef NOISE_GENERATE
				output = _FBM ? fbm(uv) : outputnoise(uv);
			#else
				output = random(uv);
			#endif
			return output;
		}
		
		inline float3 wind_base(float4 uv){
			return float3(	sin(uv.w * 1.0 + uv.x * 0.05) * 0.2,
							cos(uv.w * 0.7 + uv.y * 0.04) * 0.2,
							sin(uv.w * 1.0 + uv.z * 0.03) * 0.2);
		}
		inline float3 noise_wind(float4 uv)
		{
			#ifdef NOISE_GENERATE
				return float3(pnoise(uv.yzw),pnoise(uv.zxw),pnoise(uv.xyw));
			#endif
				return wind_base(uv);
		}

		inline float fur_noise(float2 uv)
		{
			float3 noiseUV = float3(uv,0.0) + float3(38.83,507.41,566.53);
			#ifdef NOISE_GENERATE
				return cnoise(noiseUV);
			#endif
				return random(uv);			
		}
		ENDCG
	}
	CustomEditor "GottaniEditor"
	fallback "Standard"
}