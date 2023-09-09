// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Hidden/BOXOPHOBIC/The Vegetation Engine/Helpers/Debug"
{
	Properties
	{
		[StyledBanner(Debug)]_Banner("Banner", Float) = 0
		_IsVertexShader("_IsVertexShader", Float) = 0
		_IsSimpleShader("_IsSimpleShader", Float) = 0
		[HideInInspector]_IsTVEShader("_IsTVEShader", Float) = 0
		_IsStandardShader("_IsStandardShader", Float) = 0
		_IsSubsurfaceShader("_IsSubsurfaceShader", Float) = 0
		_IsPropShader("_IsPropShader", Float) = 0
		_IsBarkShader("_IsBarkShader", Float) = 0
		_IsImpostorShader("_IsImpostorShader", Float) = 0
		_IsVegetationShader("_IsVegetationShader", Float) = 0
		_IsGrassShader("_IsGrassShader", Float) = 0
		_IsLeafShader("_IsLeafShader", Float) = 0
		_IsCrossShader("_IsCrossShader", Float) = 0
		[NoScaleOffset]_MainNormalTex("_MainNormalTex", 2D) = "black" {}
		[NoScaleOffset]_EmissiveTex("_EmissiveTex", 2D) = "black" {}
		[NoScaleOffset]_SecondMaskTex("_SecondMaskTex", 2D) = "black" {}
		[NoScaleOffset]_SecondNormalTex("_SecondNormalTex", 2D) = "black" {}
		[NoScaleOffset]_SecondAlbedoTex("_SecondAlbedoTex", 2D) = "black" {}
		[NoScaleOffset]_MainAlbedoTex("_MainAlbedoTex", 2D) = "black" {}
		[NoScaleOffset]_MainMaskTex("_MainMaskTex", 2D) = "black" {}
		_RenderClip("_RenderClip", Float) = 0
		_IsElementShader("_IsElementShader", Float) = 0
		_IsHelperShader("_IsHelperShader", Float) = 0
		_Cutoff("_Cutoff", Float) = 0
		_DetailMode("_DetailMode", Float) = 0
		[StyledEnum(Default _Layer 1 _Layer 2 _Layer 3 _Layer 4 _Layer 5 _Layer 6 _Layer 7 _Layer 8)]_LayerMotionValue("Layer Motion", Float) = 0
		_EmissiveCat("_EmissiveCat", Float) = 0
		[HDR]_EmissiveColor("_EmissiveColor", Color) = (0,0,0,0)
		[HDR][Space(10)]_MainColor("Main Color", Color) = (1,1,1,1)
		[Space(10)][StyledToggle]_VertexColorMode("Use Vertex Colors as Albedo", Range( 0 , 1)) = 0
		[StyledToggle]_LeavesFilterMode("Use Color Filter for Leaves", Float) = 0
		[Space(10)]_LeavesFilterColor("Leaves Color Filter", Color) = (0,0,0,1)
		_LeavesFilterRange("Leaves Color Range", Range( 0 , 1)) = 0
		_IsPolygonalShader("_IsPolygonalShader", Float) = 0
		[IntRange]_MotionSpeed_10("Primary Speed", Range( 0 , 40)) = 40
		_MotionScale_10("Primary Scale", Range( 0 , 20)) = 0
		[ASEEnd][StyledMessage(Info, Use this shader to debug the original mesh or the converted mesh attributes., 0,0)]_Message("Message", Float) = 0
		[HideInInspector] _texcoord( "", 2D ) = "white" {}

		//_TransmissionShadow( "Transmission Shadow", Range( 0, 1 ) ) = 0.5
		//_TransStrength( "Trans Strength", Range( 0, 50 ) ) = 1
		//_TransNormal( "Trans Normal Distortion", Range( 0, 1 ) ) = 0.5
		//_TransScattering( "Trans Scattering", Range( 1, 50 ) ) = 2
		//_TransDirect( "Trans Direct", Range( 0, 1 ) ) = 0.9
		//_TransAmbient( "Trans Ambient", Range( 0, 1 ) ) = 0.1
		//_TransShadow( "Trans Shadow", Range( 0, 1 ) ) = 0.5
		//_TessPhongStrength( "Tess Phong Strength", Range( 0, 1 ) ) = 0.5
		//_TessValue( "Tess Max Tessellation", Range( 1, 32 ) ) = 16
		//_TessMin( "Tess Min Distance", Float ) = 10
		//_TessMax( "Tess Max Distance", Float ) = 25
		//_TessEdgeLength ( "Tess Edge length", Range( 2, 50 ) ) = 16
		//_TessMaxDisp( "Tess Max Displacement", Float ) = 25
		//[ToggleOff] _SpecularHighlights("Specular Highlights", Float) = 1.0
		//[ToggleOff] _GlossyReflections("Reflections", Float) = 1.0
	}
	
	SubShader
	{
		
		Tags { "RenderType"="Opaque" "Queue"="Geometry" "DisableBatching"="True" }
	LOD 0

		Cull Off
		AlphaToMask Off
		ZWrite On
		ZTest LEqual
		ColorMask RGBA
		
		Blend Off
		

		CGINCLUDE
		#pragma target 5.0

		float4 FixedTess( float tessValue )
		{
			return tessValue;
		}
		
		float CalcDistanceTessFactor (float4 vertex, float minDist, float maxDist, float tess, float4x4 o2w, float3 cameraPos )
		{
			float3 wpos = mul(o2w,vertex).xyz;
			float dist = distance (wpos, cameraPos);
			float f = clamp(1.0 - (dist - minDist) / (maxDist - minDist), 0.01, 1.0) * tess;
			return f;
		}

		float4 CalcTriEdgeTessFactors (float3 triVertexFactors)
		{
			float4 tess;
			tess.x = 0.5 * (triVertexFactors.y + triVertexFactors.z);
			tess.y = 0.5 * (triVertexFactors.x + triVertexFactors.z);
			tess.z = 0.5 * (triVertexFactors.x + triVertexFactors.y);
			tess.w = (triVertexFactors.x + triVertexFactors.y + triVertexFactors.z) / 3.0f;
			return tess;
		}

		float CalcEdgeTessFactor (float3 wpos0, float3 wpos1, float edgeLen, float3 cameraPos, float4 scParams )
		{
			float dist = distance (0.5 * (wpos0+wpos1), cameraPos);
			float len = distance(wpos0, wpos1);
			float f = max(len * scParams.y / (edgeLen * dist), 1.0);
			return f;
		}

		float DistanceFromPlane (float3 pos, float4 plane)
		{
			float d = dot (float4(pos,1.0f), plane);
			return d;
		}

		bool WorldViewFrustumCull (float3 wpos0, float3 wpos1, float3 wpos2, float cullEps, float4 planes[6] )
		{
			float4 planeTest;
			planeTest.x = (( DistanceFromPlane(wpos0, planes[0]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos1, planes[0]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos2, planes[0]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.y = (( DistanceFromPlane(wpos0, planes[1]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos1, planes[1]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos2, planes[1]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.z = (( DistanceFromPlane(wpos0, planes[2]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos1, planes[2]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos2, planes[2]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.w = (( DistanceFromPlane(wpos0, planes[3]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos1, planes[3]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos2, planes[3]) > -cullEps) ? 1.0f : 0.0f );
			return !all (planeTest);
		}

		float4 DistanceBasedTess( float4 v0, float4 v1, float4 v2, float tess, float minDist, float maxDist, float4x4 o2w, float3 cameraPos )
		{
			float3 f;
			f.x = CalcDistanceTessFactor (v0,minDist,maxDist,tess,o2w,cameraPos);
			f.y = CalcDistanceTessFactor (v1,minDist,maxDist,tess,o2w,cameraPos);
			f.z = CalcDistanceTessFactor (v2,minDist,maxDist,tess,o2w,cameraPos);

			return CalcTriEdgeTessFactors (f);
		}

		float4 EdgeLengthBasedTess( float4 v0, float4 v1, float4 v2, float edgeLength, float4x4 o2w, float3 cameraPos, float4 scParams )
		{
			float3 pos0 = mul(o2w,v0).xyz;
			float3 pos1 = mul(o2w,v1).xyz;
			float3 pos2 = mul(o2w,v2).xyz;
			float4 tess;
			tess.x = CalcEdgeTessFactor (pos1, pos2, edgeLength, cameraPos, scParams);
			tess.y = CalcEdgeTessFactor (pos2, pos0, edgeLength, cameraPos, scParams);
			tess.z = CalcEdgeTessFactor (pos0, pos1, edgeLength, cameraPos, scParams);
			tess.w = (tess.x + tess.y + tess.z) / 3.0f;
			return tess;
		}

		float4 EdgeLengthBasedTessCull( float4 v0, float4 v1, float4 v2, float edgeLength, float maxDisplacement, float4x4 o2w, float3 cameraPos, float4 scParams, float4 planes[6] )
		{
			float3 pos0 = mul(o2w,v0).xyz;
			float3 pos1 = mul(o2w,v1).xyz;
			float3 pos2 = mul(o2w,v2).xyz;
			float4 tess;

			if (WorldViewFrustumCull(pos0, pos1, pos2, maxDisplacement, planes))
			{
				tess = 0.0f;
			}
			else
			{
				tess.x = CalcEdgeTessFactor (pos1, pos2, edgeLength, cameraPos, scParams);
				tess.y = CalcEdgeTessFactor (pos2, pos0, edgeLength, cameraPos, scParams);
				tess.z = CalcEdgeTessFactor (pos0, pos1, edgeLength, cameraPos, scParams);
				tess.w = (tess.x + tess.y + tess.z) / 3.0f;
			}
			return tess;
		}
		ENDCG

		
		Pass
		{
			
			Name "ForwardBase"
			Tags { "LightMode"="ForwardBase" }
			
			Blend One Zero

			CGPROGRAM
			#define ASE_NO_AMBIENT 1
			#if defined(SHADER_API_GLCORE) || defined(SHADER_API_GLES) || defined(SHADER_API_GLES3) || defined(SHADER_API_D3D9)
			#define FRONT_FACE_SEMANTIC VFACE
			#define FRONT_FACE_TYPE float
			#else
			#define FRONT_FACE_SEMANTIC SV_IsFrontFace
			#define FRONT_FACE_TYPE bool
			#endif

			#pragma vertex vert
			#pragma fragment frag
			#pragma multi_compile_fwdbase
			#ifndef UNITY_PASS_FORWARDBASE
				#define UNITY_PASS_FORWARDBASE
			#endif
			#include "HLSLSupport.cginc"
			#ifndef UNITY_INSTANCED_LOD_FADE
				#define UNITY_INSTANCED_LOD_FADE
			#endif
			#ifndef UNITY_INSTANCED_SH
				#define UNITY_INSTANCED_SH
			#endif
			#ifndef UNITY_INSTANCED_LIGHTMAPSTS
				#define UNITY_INSTANCED_LIGHTMAPSTS
			#endif
			#include "UnityShaderVariables.cginc"
			#include "UnityCG.cginc"
			#include "Lighting.cginc"
			#include "UnityPBSLighting.cginc"
			#include "AutoLight.cginc"

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_VERT_TANGENT
			#if defined(SHADER_API_D3D11) || defined(SHADER_API_XBOXONE) || defined(UNITY_COMPILER_HLSLCC) || defined(SHADER_API_PSSL) || (defined(SHADER_TARGET_SURFACE_ANALYSIS) && !defined(SHADER_TARGET_SURFACE_ANALYSIS_MOJOSHADER))//ASE Sampler Macros
			#define SAMPLE_TEXTURE2D_ARRAY_GRAD(tex,samplerTex,coord,ddx,ddy) tex.SampleGrad(samplerTex,coord,ddx,ddy)
			#else//ASE Sampling Macros
			#define SAMPLE_TEXTURE2D_ARRAY_GRAD(tex,samplerTex,coord,ddx,ddy) tex2DArray(tex,coord)
			#endif//ASE Sampling Macros
			

			struct appdata {
				float4 vertex : POSITION;
				float4 tangent : TANGENT;
				float3 normal : NORMAL;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_color : COLOR;
				float4 ase_texcoord3 : TEXCOORD3;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};
			
			struct v2f {
				#if UNITY_VERSION >= 201810
					UNITY_POSITION(pos);
				#else
					float4 pos : SV_POSITION;
				#endif
				#if defined(LIGHTMAP_ON) || (!defined(LIGHTMAP_ON) && SHADER_TARGET >= 30)
					float4 lmap : TEXCOORD0;
				#endif
				#if !defined(LIGHTMAP_ON) && UNITY_SHOULD_SAMPLE_SH
					half3 sh : TEXCOORD1;
				#endif
				#if defined(UNITY_HALF_PRECISION_FRAGMENT_SHADER_REGISTERS) && UNITY_VERSION >= 201810 && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					UNITY_LIGHTING_COORDS(2,3)
				#elif defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if UNITY_VERSION >= 201710
						UNITY_SHADOW_COORDS(2)
					#else
						SHADOW_COORDS(2)
					#endif
				#endif
				#ifdef ASE_FOG
					UNITY_FOG_COORDS(4)
				#endif
				float4 tSpace0 : TEXCOORD5;
				float4 tSpace1 : TEXCOORD6;
				float4 tSpace2 : TEXCOORD7;
				#if defined(ASE_NEEDS_FRAG_SCREEN_POSITION)
				float4 screenPos : TEXCOORD8;
				#endif
				float4 ase_texcoord9 : TEXCOORD9;
				float4 ase_texcoord10 : TEXCOORD10;
				float4 ase_texcoord11 : TEXCOORD11;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			#ifdef _TRANSMISSION_ASE
				float _TransmissionShadow;
			#endif
			#ifdef _TRANSLUCENCY_ASE
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			uniform half _Banner;
			uniform half _Message;
			uniform float _IsSimpleShader;
			uniform float _IsVertexShader;
			uniform half _IsTVEShader;
			uniform half TVE_DEBUG_Type;
			uniform float _IsBarkShader;
			uniform float _IsCrossShader;
			uniform float _IsGrassShader;
			uniform float _IsLeafShader;
			uniform float _IsPropShader;
			uniform float _IsImpostorShader;
			uniform float _IsPolygonalShader;
			uniform float _IsStandardShader;
			uniform float _IsSubsurfaceShader;
			uniform half TVE_DEBUG_Index;
			uniform sampler2D _MainAlbedoTex;
			uniform float4 _MainAlbedoTex_ST;
			uniform sampler2D _MainNormalTex;
			uniform float4 _MainNormalTex_ST;
			uniform sampler2D _MainMaskTex;
			uniform float4 _MainMaskTex_ST;
			uniform sampler2D _SecondAlbedoTex;
			uniform float4 _SecondAlbedoTex_ST;
			uniform sampler2D _SecondNormalTex;
			uniform float4 _SecondNormalTex_ST;
			uniform sampler2D _SecondMaskTex;
			uniform float4 _SecondMaskTex_ST;
			uniform float _DetailMode;
			uniform sampler2D _EmissiveTex;
			uniform float4 _EmissiveTex_ST;
			uniform float4 _EmissiveColor;
			uniform float _EmissiveCat;
			uniform half TVE_DEBUG_Min;
			uniform half TVE_DEBUG_Max;
			float4 _MainAlbedoTex_TexelSize;
			float4 _MainNormalTex_TexelSize;
			float4 _MainMaskTex_TexelSize;
			float4 _SecondAlbedoTex_TexelSize;
			float4 _SecondMaskTex_TexelSize;
			float4 _EmissiveTex_TexelSize;
			uniform half _LayerMotionValue;
			uniform float TVE_MotionUsage[10];
			UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_MotionTex);
			uniform half4 TVE_MotionCoords;
			SamplerState samplerTVE_MotionTex;
			uniform half4 TVE_MotionParams;
			uniform float _MotionScale_10;
			uniform half4 TVE_NoiseParams;
			uniform float _MotionSpeed_10;
			uniform half TVE_DEBUG_Layer;
			uniform float TVE_ColorsUsage[10];
			UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_ColorsTex);
			uniform half4 TVE_ColorsCoords;
			SamplerState samplerTVE_ColorsTex;
			uniform half4 TVE_ColorsParams;
			uniform float TVE_ExtrasUsage[10];
			UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_ExtrasTex);
			uniform half4 TVE_ExtrasCoords;
			SamplerState samplerTVE_ExtrasTex;
			uniform half4 TVE_ExtrasParams;
			uniform float TVE_VertexUsage[10];
			UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_VertexTex);
			uniform half4 TVE_VertexCoords;
			SamplerState samplerTVE_VertexTex;
			uniform half4 TVE_VertexParams;
			uniform float _IsVegetationShader;
			uniform half4 _LeavesFilterColor;
			uniform half4 _MainColor;
			uniform half _VertexColorMode;
			uniform float _LeavesFilterRange;
			uniform half _LeavesFilterMode;
			uniform half TVE_DEBUG_Filter;
			uniform half TVE_DEBUG_Clip;
			uniform float _RenderClip;
			uniform float _Cutoff;
			uniform float _IsElementShader;
			uniform float _IsHelperShader;

	
			float3 HSVToRGB( float3 c )
			{
				float4 K = float4( 1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0 );
				float3 p = abs( frac( c.xxx + K.xyz ) * 6.0 - K.www );
				return c.z * lerp( K.xxx, saturate( p - K.xxx ), c.y );
			}
			
			float2 DecodeFloatToVector2( float enc )
			{
				float2 result ;
				result.y = enc % 2048;
				result.x = floor(enc / 2048);
				return result / (2048 - 1);
			}
			

			v2f VertexFunction (appdata v  ) {
				UNITY_SETUP_INSTANCE_ID(v);
				v2f o;
				UNITY_INITIALIZE_OUTPUT(v2f,o);
				UNITY_TRANSFER_INSTANCE_ID(v,o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float3 customSurfaceDepth676_g66395 = v.vertex.xyz;
				float customEye676_g66395 = -UnityObjectToViewPos( customSurfaceDepth676_g66395 ).z;
				o.ase_texcoord9.x = customEye676_g66395;
				float Debug_Index464_g66395 = TVE_DEBUG_Index;
				float3 ifLocalVar40_g66402 = 0;
				if( Debug_Index464_g66395 == 0.0 )
				ifLocalVar40_g66402 = saturate( v.vertex.xyz );
				float3 ifLocalVar40_g66428 = 0;
				if( Debug_Index464_g66395 == 1.0 )
				ifLocalVar40_g66428 = v.normal;
				float3 ifLocalVar40_g66459 = 0;
				if( Debug_Index464_g66395 == 2.0 )
				ifLocalVar40_g66459 = v.tangent.xyz;
				float ifLocalVar40_g66419 = 0;
				if( Debug_Index464_g66395 == 3.0 )
				ifLocalVar40_g66419 = saturate( v.tangent.w );
				float3 temp_cast_0 = (v.ase_color.r).xxx;
				float3 hsvTorgb260_g66395 = HSVToRGB( float3(v.ase_color.r,1.0,1.0) );
				float3 gammaToLinear266_g66395 = GammaToLinearSpace( hsvTorgb260_g66395 );
				float _IsBarkShader347_g66395 = _IsBarkShader;
				float _IsLeafShader360_g66395 = _IsLeafShader;
				float _IsCrossShader342_g66395 = _IsCrossShader;
				float _IsGrassShader341_g66395 = _IsGrassShader;
				float _IsVegetationShader1101_g66395 = _IsVegetationShader;
				float _IsAnyVegetationShader362_g66395 = saturate( ( _IsBarkShader347_g66395 + _IsLeafShader360_g66395 + _IsCrossShader342_g66395 + _IsGrassShader341_g66395 + _IsVegetationShader1101_g66395 ) );
				float3 lerpResult290_g66395 = lerp( temp_cast_0 , gammaToLinear266_g66395 , _IsAnyVegetationShader362_g66395);
				float3 ifLocalVar40_g66449 = 0;
				if( Debug_Index464_g66395 == 5.0 )
				ifLocalVar40_g66449 = lerpResult290_g66395;
				float ifLocalVar40_g66503 = 0;
				if( Debug_Index464_g66395 == 6.0 )
				ifLocalVar40_g66503 = v.ase_color.g;
				float ifLocalVar40_g66413 = 0;
				if( Debug_Index464_g66395 == 7.0 )
				ifLocalVar40_g66413 = v.ase_color.b;
				float ifLocalVar40_g66423 = 0;
				if( Debug_Index464_g66395 == 8.0 )
				ifLocalVar40_g66423 = v.ase_color.a;
				float ifLocalVar40_g66425 = 0;
				if( Debug_Index464_g66395 == 9.0 )
				ifLocalVar40_g66425 = v.ase_color.a;
				float enc1154_g66395 = v.ase_texcoord.z;
				float2 localDecodeFloatToVector21154_g66395 = DecodeFloatToVector2( enc1154_g66395 );
				float2 break1155_g66395 = localDecodeFloatToVector21154_g66395;
				float ifLocalVar40_g66427 = 0;
				if( Debug_Index464_g66395 == 10.0 )
				ifLocalVar40_g66427 = break1155_g66395.x;
				float ifLocalVar40_g66426 = 0;
				if( Debug_Index464_g66395 == 11.0 )
				ifLocalVar40_g66426 = break1155_g66395.y;
				float3 appendResult1147_g66395 = (float3(v.ase_texcoord.x , v.ase_texcoord.y , 0.0));
				float3 ifLocalVar40_g66434 = 0;
				if( Debug_Index464_g66395 == 12.0 )
				ifLocalVar40_g66434 = appendResult1147_g66395;
				float3 appendResult1148_g66395 = (float3(v.texcoord1.xyzw.x , v.texcoord1.xyzw.y , 0.0));
				float3 ifLocalVar40_g66431 = 0;
				if( Debug_Index464_g66395 == 13.0 )
				ifLocalVar40_g66431 = appendResult1148_g66395;
				float3 appendResult1149_g66395 = (float3(v.texcoord1.xyzw.z , v.texcoord1.xyzw.w , 0.0));
				float3 ifLocalVar40_g66433 = 0;
				if( Debug_Index464_g66395 == 14.0 )
				ifLocalVar40_g66433 = appendResult1149_g66395;
				float3 appendResult60_g66454 = (float3(v.ase_texcoord3.x , v.ase_texcoord3.z , v.ase_texcoord3.y));
				float3 ifLocalVar40_g66432 = 0;
				if( Debug_Index464_g66395 == 15.0 )
				ifLocalVar40_g66432 = appendResult60_g66454;
				float3 vertexToFrag328_g66395 = ( ( ifLocalVar40_g66402 + ifLocalVar40_g66428 + ifLocalVar40_g66459 + ifLocalVar40_g66419 ) + ( ifLocalVar40_g66449 + ifLocalVar40_g66503 + ifLocalVar40_g66413 + ifLocalVar40_g66423 ) + ( ifLocalVar40_g66425 + ifLocalVar40_g66427 + ifLocalVar40_g66426 ) + ( ifLocalVar40_g66434 + ifLocalVar40_g66431 + ifLocalVar40_g66433 + ifLocalVar40_g66432 ) );
				o.ase_texcoord9.yzw = vertexToFrag328_g66395;
				float4 color1097_g66395 = IsGammaSpace() ? float4(1,0.2066492,0.0990566,0) : float4(1,0.03521443,0.009877041,0);
				float4 color1096_g66395 = IsGammaSpace() ? float4(0.4431373,0.7921569,0.1764706,0) : float4(0.1651322,0.5906189,0.02624122,0);
				float2 uv_MainMaskTex1077_g66395 = v.ase_texcoord.xy;
				float3 linearToGamma1066_g66395 = LinearToGammaSpace( _LeavesFilterColor.rgb );
				#ifdef UNITY_COLORSPACE_GAMMA
				float3 staticSwitch1060_g66395 = (_LeavesFilterColor).rgb;
				#else
				float3 staticSwitch1060_g66395 = linearToGamma1066_g66395;
				#endif
				float2 uv_MainAlbedoTex1045_g66395 = v.ase_texcoord.xy;
				float4 tex2DNode1045_g66395 = tex2Dlod( _MainAlbedoTex, float4( uv_MainAlbedoTex1045_g66395, 0, 0.0) );
				float3 lerpResult1043_g66395 = lerp( (tex2DNode1045_g66395).rgb , (v.ase_color).rgb , _VertexColorMode);
				half3 Main_Albedo1078_g66395 = ( (_MainColor).rgb * lerpResult1043_g66395 );
				float3 linearToGamma1058_g66395 = LinearToGammaSpace( Main_Albedo1078_g66395 );
				#ifdef UNITY_COLORSPACE_GAMMA
				float3 staticSwitch1068_g66395 = (Main_Albedo1078_g66395).xyz;
				#else
				float3 staticSwitch1068_g66395 = linearToGamma1058_g66395;
				#endif
				float lerpResult1071_g66395 = lerp( 1.0 , saturate( ( 1.0 - ceil( ( distance( staticSwitch1060_g66395 , staticSwitch1068_g66395 ) - _LeavesFilterRange ) ) ) ) , _LeavesFilterMode);
				half Main_ColorFilter1061_g66395 = lerpResult1071_g66395;
				float4 lerpResult1095_g66395 = lerp( color1097_g66395 , color1096_g66395 , ( tex2Dlod( _MainMaskTex, float4( uv_MainMaskTex1077_g66395, 0, 0.0) ).b * Main_ColorFilter1061_g66395 ));
				float4 vertexToFrag11_g66446 = lerpResult1095_g66395;
				o.ase_texcoord11 = vertexToFrag11_g66446;
				
				o.ase_texcoord10 = v.ase_texcoord;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = defaultVertexValue;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif
				v.vertex.w = 1;
				v.normal = v.normal;
				v.tangent = v.tangent;

				o.pos = UnityObjectToClipPos(v.vertex);
				float3 worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
				fixed3 worldNormal = UnityObjectToWorldNormal(v.normal);
				fixed3 worldTangent = UnityObjectToWorldDir(v.tangent.xyz);
				fixed tangentSign = v.tangent.w * unity_WorldTransformParams.w;
				fixed3 worldBinormal = cross(worldNormal, worldTangent) * tangentSign;
				o.tSpace0 = float4(worldTangent.x, worldBinormal.x, worldNormal.x, worldPos.x);
				o.tSpace1 = float4(worldTangent.y, worldBinormal.y, worldNormal.y, worldPos.y);
				o.tSpace2 = float4(worldTangent.z, worldBinormal.z, worldNormal.z, worldPos.z);

				#ifdef DYNAMICLIGHTMAP_ON
				o.lmap.zw = v.texcoord2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
				#endif
				#ifdef LIGHTMAP_ON
				o.lmap.xy = v.texcoord1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
				#endif

				#ifndef LIGHTMAP_ON
					#if UNITY_SHOULD_SAMPLE_SH && !UNITY_SAMPLE_FULL_SH_PER_PIXEL
						o.sh = 0;
						#ifdef VERTEXLIGHT_ON
						o.sh += Shade4PointLights (
							unity_4LightPosX0, unity_4LightPosY0, unity_4LightPosZ0,
							unity_LightColor[0].rgb, unity_LightColor[1].rgb, unity_LightColor[2].rgb, unity_LightColor[3].rgb,
							unity_4LightAtten0, worldPos, worldNormal);
						#endif
						o.sh = ShadeSHPerVertex (worldNormal, o.sh);
					#endif
				#endif

				#if UNITY_VERSION >= 201810 && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					UNITY_TRANSFER_LIGHTING(o, v.texcoord1.xy);
				#elif defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if UNITY_VERSION >= 201710
						UNITY_TRANSFER_SHADOW(o, v.texcoord1.xy);
					#else
						TRANSFER_SHADOW(o);
					#endif
				#endif

				#ifdef ASE_FOG
					UNITY_TRANSFER_FOG(o,o.pos);
				#endif
				#if defined(ASE_NEEDS_FRAG_SCREEN_POSITION)
					o.screenPos = ComputeScreenPos(o.pos);
				#endif
				return o;
			}

			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float4 tangent : TANGENT;
				float3 normal : NORMAL;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_color : COLOR;
				float4 ase_texcoord3 : TEXCOORD3;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( appdata v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.tangent = v.tangent;
				o.normal = v.normal;
				o.texcoord1 = v.texcoord1;
				o.texcoord2 = v.texcoord2;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_color = v.ase_color;
				o.ase_texcoord3 = v.ase_texcoord3;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, UNITY_MATRIX_M, _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, UNITY_MATRIX_M, _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, UNITY_MATRIX_M, _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			v2f DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				appdata o = (appdata) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.tangent = patch[0].tangent * bary.x + patch[1].tangent * bary.y + patch[2].tangent * bary.z;
				o.normal = patch[0].normal * bary.x + patch[1].normal * bary.y + patch[2].normal * bary.z;
				o.texcoord1 = patch[0].texcoord1 * bary.x + patch[1].texcoord1 * bary.y + patch[2].texcoord1 * bary.z;
				o.texcoord2 = patch[0].texcoord2 * bary.x + patch[1].texcoord2 * bary.y + patch[2].texcoord2 * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].normal * (dot(o.vertex.xyz, patch[i].normal) - dot(patch[i].vertex.xyz, patch[i].normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			v2f vert ( appdata v )
			{
				return VertexFunction( v );
			}
			#endif
			
			fixed4 frag (v2f IN , FRONT_FACE_TYPE ase_vface : FRONT_FACE_SEMANTIC
				#ifdef _DEPTHOFFSET_ON
				, out float outputDepth : SV_Depth
				#endif
				) : SV_Target 
			{
				UNITY_SETUP_INSTANCE_ID(IN);

				#ifdef LOD_FADE_CROSSFADE
					UNITY_APPLY_DITHER_CROSSFADE(IN.pos.xy);
				#endif

				#if defined(_SPECULAR_SETUP)
					SurfaceOutputStandardSpecular o = (SurfaceOutputStandardSpecular)0;
				#else
					SurfaceOutputStandard o = (SurfaceOutputStandard)0;
				#endif
				float3 WorldTangent = float3(IN.tSpace0.x,IN.tSpace1.x,IN.tSpace2.x);
				float3 WorldBiTangent = float3(IN.tSpace0.y,IN.tSpace1.y,IN.tSpace2.y);
				float3 WorldNormal = float3(IN.tSpace0.z,IN.tSpace1.z,IN.tSpace2.z);
				float3 worldPos = float3(IN.tSpace0.w,IN.tSpace1.w,IN.tSpace2.w);
				float3 worldViewDir = normalize(UnityWorldSpaceViewDir(worldPos));
				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					UNITY_LIGHT_ATTENUATION(atten, IN, worldPos)
				#else
					half atten = 1;
				#endif
				#if defined(ASE_NEEDS_FRAG_SCREEN_POSITION)
				float4 ScreenPos = IN.screenPos;
				#endif

				float Debug_Type367_g66395 = TVE_DEBUG_Type;
				float4 color646_g66395 = IsGammaSpace() ? float4(0.9245283,0.7969696,0.4142933,1) : float4(0.8368256,0.5987038,0.1431069,1);
				float customEye676_g66395 = IN.ase_texcoord9.x;
				float saferPower688_g66395 = abs( (0.0 + (customEye676_g66395 - 300.0) * (1.0 - 0.0) / (0.0 - 300.0)) );
				float clampResult702_g66395 = clamp( pow( saferPower688_g66395 , 1.25 ) , 0.75 , 1.0 );
				float Shading655_g66395 = clampResult702_g66395;
				float4 Output_Converted717_g66395 = ( color646_g66395 * Shading655_g66395 );
				float4 ifLocalVar40_g66422 = 0;
				if( Debug_Type367_g66395 == 0.0 )
				ifLocalVar40_g66422 = Output_Converted717_g66395;
				float4 color466_g66395 = IsGammaSpace() ? float4(0.8113208,0.4952317,0.264062,0) : float4(0.6231937,0.2096542,0.05668841,0);
				float _IsBarkShader347_g66395 = _IsBarkShader;
				float4 color469_g66395 = IsGammaSpace() ? float4(0.6566009,0.3404236,0.8490566,0) : float4(0.3886527,0.09487338,0.6903409,0);
				float _IsCrossShader342_g66395 = _IsCrossShader;
				float4 color472_g66395 = IsGammaSpace() ? float4(0.7100264,0.8018868,0.2231666,0) : float4(0.4623997,0.6070304,0.0407874,0);
				float _IsGrassShader341_g66395 = _IsGrassShader;
				float4 color475_g66395 = IsGammaSpace() ? float4(0.3267961,0.7264151,0.3118103,0) : float4(0.08721471,0.4865309,0.07922345,0);
				float _IsLeafShader360_g66395 = _IsLeafShader;
				float4 color478_g66395 = IsGammaSpace() ? float4(0.3252937,0.6122813,0.8113208,0) : float4(0.08639329,0.3330702,0.6231937,0);
				float _IsPropShader346_g66395 = _IsPropShader;
				float4 color1114_g66395 = IsGammaSpace() ? float4(0.9716981,0.3162602,0.4816265,0) : float4(0.9368213,0.08154967,0.1974273,0);
				float _IsImpostorShader1110_g66395 = _IsImpostorShader;
				float4 color1117_g66395 = IsGammaSpace() ? float4(0.257921,0.8679245,0.8361252,0) : float4(0.05410501,0.7254258,0.6668791,0);
				float _IsPolygonalShader1112_g66395 = _IsPolygonalShader;
				float4 Output_Shader445_g66395 = ( ( ( color466_g66395 * _IsBarkShader347_g66395 ) + ( color469_g66395 * _IsCrossShader342_g66395 ) + ( color472_g66395 * _IsGrassShader341_g66395 ) + ( color475_g66395 * _IsLeafShader360_g66395 ) + ( color478_g66395 * _IsPropShader346_g66395 ) + ( color1114_g66395 * _IsImpostorShader1110_g66395 ) + ( color1117_g66395 * _IsPolygonalShader1112_g66395 ) ) * Shading655_g66395 );
				float4 ifLocalVar40_g66509 = 0;
				if( Debug_Type367_g66395 == 1.0 )
				ifLocalVar40_g66509 = Output_Shader445_g66395;
				float4 color529_g66395 = IsGammaSpace() ? float4(0.62,0.77,0.15,0) : float4(0.3423916,0.5542217,0.01960665,0);
				float _IsVertexShader1158_g66395 = _IsVertexShader;
				float4 color544_g66395 = IsGammaSpace() ? float4(0.3252937,0.6122813,0.8113208,0) : float4(0.08639329,0.3330702,0.6231937,0);
				float _IsSimpleShader359_g66395 = _IsSimpleShader;
				float4 color521_g66395 = IsGammaSpace() ? float4(0.6566009,0.3404236,0.8490566,0) : float4(0.3886527,0.09487338,0.6903409,0);
				float _IsStandardShader344_g66395 = _IsStandardShader;
				float4 color1121_g66395 = IsGammaSpace() ? float4(0.9245283,0.8421515,0.1788003,0) : float4(0.8368256,0.677754,0.02687956,0);
				float _IsSubsurfaceShader548_g66395 = _IsSubsurfaceShader;
				float4 Output_Lighting525_g66395 = ( ( ( color529_g66395 * _IsVertexShader1158_g66395 ) + ( color544_g66395 * _IsSimpleShader359_g66395 ) + ( color521_g66395 * _IsStandardShader344_g66395 ) + ( color1121_g66395 * _IsSubsurfaceShader548_g66395 ) ) * Shading655_g66395 );
				float4 ifLocalVar40_g66501 = 0;
				if( Debug_Type367_g66395 == 2.0 )
				ifLocalVar40_g66501 = Output_Lighting525_g66395;
				float Debug_Index464_g66395 = TVE_DEBUG_Index;
				float2 uv_MainAlbedoTex = IN.ase_texcoord10.xy * _MainAlbedoTex_ST.xy + _MainAlbedoTex_ST.zw;
				float4 tex2DNode586_g66395 = tex2D( _MainAlbedoTex, uv_MainAlbedoTex );
				float3 appendResult637_g66395 = (float3(tex2DNode586_g66395.r , tex2DNode586_g66395.g , tex2DNode586_g66395.b));
				float3 ifLocalVar40_g66405 = 0;
				if( Debug_Index464_g66395 == 0.0 )
				ifLocalVar40_g66405 = appendResult637_g66395;
				float ifLocalVar40_g66436 = 0;
				if( Debug_Index464_g66395 == 1.0 )
				ifLocalVar40_g66436 = tex2D( _MainAlbedoTex, uv_MainAlbedoTex ).a;
				float2 uv_MainNormalTex = IN.ase_texcoord10.xy * _MainNormalTex_ST.xy + _MainNormalTex_ST.zw;
				float4 tex2DNode604_g66395 = tex2D( _MainNormalTex, uv_MainNormalTex );
				float3 appendResult876_g66395 = (float3(tex2DNode604_g66395.a , tex2DNode604_g66395.g , 1.0));
				float3 gammaToLinear878_g66395 = GammaToLinearSpace( appendResult876_g66395 );
				float3 ifLocalVar40_g66482 = 0;
				if( Debug_Index464_g66395 == 2.0 )
				ifLocalVar40_g66482 = gammaToLinear878_g66395;
				float2 uv_MainMaskTex = IN.ase_texcoord10.xy * _MainMaskTex_ST.xy + _MainMaskTex_ST.zw;
				float ifLocalVar40_g66407 = 0;
				if( Debug_Index464_g66395 == 3.0 )
				ifLocalVar40_g66407 = tex2D( _MainMaskTex, uv_MainMaskTex ).r;
				float ifLocalVar40_g66523 = 0;
				if( Debug_Index464_g66395 == 4.0 )
				ifLocalVar40_g66523 = tex2D( _MainMaskTex, uv_MainMaskTex ).g;
				float ifLocalVar40_g66415 = 0;
				if( Debug_Index464_g66395 == 5.0 )
				ifLocalVar40_g66415 = tex2D( _MainMaskTex, uv_MainMaskTex ).b;
				float ifLocalVar40_g66403 = 0;
				if( Debug_Index464_g66395 == 6.0 )
				ifLocalVar40_g66403 = tex2D( _MainMaskTex, uv_MainMaskTex ).a;
				float2 uv_SecondAlbedoTex = IN.ase_texcoord10.xy * _SecondAlbedoTex_ST.xy + _SecondAlbedoTex_ST.zw;
				float4 tex2DNode854_g66395 = tex2D( _SecondAlbedoTex, uv_SecondAlbedoTex );
				float3 appendResult839_g66395 = (float3(tex2DNode854_g66395.r , tex2DNode854_g66395.g , tex2DNode854_g66395.b));
				float3 ifLocalVar40_g66410 = 0;
				if( Debug_Index464_g66395 == 7.0 )
				ifLocalVar40_g66410 = appendResult839_g66395;
				float ifLocalVar40_g66462 = 0;
				if( Debug_Index464_g66395 == 8.0 )
				ifLocalVar40_g66462 = tex2D( _SecondAlbedoTex, uv_SecondAlbedoTex ).a;
				float2 uv_SecondNormalTex = IN.ase_texcoord10.xy * _SecondNormalTex_ST.xy + _SecondNormalTex_ST.zw;
				float4 tex2DNode841_g66395 = tex2D( _SecondNormalTex, uv_SecondNormalTex );
				float3 appendResult880_g66395 = (float3(tex2DNode841_g66395.a , tex2DNode841_g66395.g , 1.0));
				float3 gammaToLinear879_g66395 = GammaToLinearSpace( appendResult880_g66395 );
				float3 ifLocalVar40_g66512 = 0;
				if( Debug_Index464_g66395 == 8.0 )
				ifLocalVar40_g66512 = gammaToLinear879_g66395;
				float2 uv_SecondMaskTex = IN.ase_texcoord10.xy * _SecondMaskTex_ST.xy + _SecondMaskTex_ST.zw;
				float ifLocalVar40_g66483 = 0;
				if( Debug_Index464_g66395 == 10.0 )
				ifLocalVar40_g66483 = tex2D( _SecondMaskTex, uv_SecondMaskTex ).r;
				float ifLocalVar40_g66456 = 0;
				if( Debug_Index464_g66395 == 11.0 )
				ifLocalVar40_g66456 = tex2D( _SecondMaskTex, uv_SecondMaskTex ).g;
				float ifLocalVar40_g66500 = 0;
				if( Debug_Index464_g66395 == 12.0 )
				ifLocalVar40_g66500 = tex2D( _SecondMaskTex, uv_SecondMaskTex ).b;
				float ifLocalVar40_g66510 = 0;
				if( Debug_Index464_g66395 == 13.0 )
				ifLocalVar40_g66510 = tex2D( _SecondMaskTex, uv_SecondMaskTex ).a;
				float2 uv_EmissiveTex = IN.ase_texcoord10.xy * _EmissiveTex_ST.xy + _EmissiveTex_ST.zw;
				float4 tex2DNode858_g66395 = tex2D( _EmissiveTex, uv_EmissiveTex );
				float3 appendResult867_g66395 = (float3(tex2DNode858_g66395.r , tex2DNode858_g66395.g , tex2DNode858_g66395.b));
				float3 ifLocalVar40_g66455 = 0;
				if( Debug_Index464_g66395 == 14.0 )
				ifLocalVar40_g66455 = appendResult867_g66395;
				float Debug_Min721_g66395 = TVE_DEBUG_Min;
				float temp_output_7_0_g66494 = Debug_Min721_g66395;
				float4 temp_cast_3 = (temp_output_7_0_g66494).xxxx;
				float Debug_Max723_g66395 = TVE_DEBUG_Max;
				float4 Output_Maps561_g66395 = ( ( ( float4( ( ( ifLocalVar40_g66405 + ifLocalVar40_g66436 + ifLocalVar40_g66482 ) + ( ifLocalVar40_g66407 + ifLocalVar40_g66523 + ifLocalVar40_g66415 + ifLocalVar40_g66403 ) ) , 0.0 ) + float4( ( ( ( ifLocalVar40_g66410 + ifLocalVar40_g66462 + ifLocalVar40_g66512 ) + ( ifLocalVar40_g66483 + ifLocalVar40_g66456 + ifLocalVar40_g66500 + ifLocalVar40_g66510 ) ) * _DetailMode ) , 0.0 ) + ( ( float4( ifLocalVar40_g66455 , 0.0 ) * _EmissiveColor ) * _EmissiveCat ) ) - temp_cast_3 ) / ( Debug_Max723_g66395 - temp_output_7_0_g66494 ) );
				float4 ifLocalVar40_g66493 = 0;
				if( Debug_Type367_g66395 == 3.0 )
				ifLocalVar40_g66493 = Output_Maps561_g66395;
				float Resolution44_g66480 = max( _MainAlbedoTex_TexelSize.z , _MainAlbedoTex_TexelSize.w );
				float4 color62_g66480 = IsGammaSpace() ? float4(0.484069,0.862666,0.9245283,0) : float4(0.1995908,0.7155456,0.8368256,0);
				float4 ifLocalVar61_g66480 = 0;
				if( Resolution44_g66480 <= 256.0 )
				ifLocalVar61_g66480 = color62_g66480;
				float4 color55_g66480 = IsGammaSpace() ? float4(0.1933962,0.7383016,1,0) : float4(0.03108436,0.5044825,1,0);
				float4 ifLocalVar56_g66480 = 0;
				if( Resolution44_g66480 == 512.0 )
				ifLocalVar56_g66480 = color55_g66480;
				float4 color42_g66480 = IsGammaSpace() ? float4(0.4431373,0.7921569,0.1764706,0) : float4(0.1651322,0.5906189,0.02624122,0);
				float4 ifLocalVar40_g66480 = 0;
				if( Resolution44_g66480 == 1024.0 )
				ifLocalVar40_g66480 = color42_g66480;
				float4 color48_g66480 = IsGammaSpace() ? float4(1,0.6889491,0.07075471,0) : float4(1,0.4324122,0.006068094,0);
				float4 ifLocalVar47_g66480 = 0;
				if( Resolution44_g66480 == 2048.0 )
				ifLocalVar47_g66480 = color48_g66480;
				float4 color51_g66480 = IsGammaSpace() ? float4(1,0.2066492,0.0990566,0) : float4(1,0.03521443,0.009877041,0);
				float4 ifLocalVar52_g66480 = 0;
				if( Resolution44_g66480 >= 4096.0 )
				ifLocalVar52_g66480 = color51_g66480;
				float4 ifLocalVar40_g66511 = 0;
				if( Debug_Index464_g66395 == 0.0 )
				ifLocalVar40_g66511 = ( ifLocalVar61_g66480 + ifLocalVar56_g66480 + ifLocalVar40_g66480 + ifLocalVar47_g66480 + ifLocalVar52_g66480 );
				float Resolution44_g66412 = max( _MainNormalTex_TexelSize.z , _MainNormalTex_TexelSize.w );
				float4 color62_g66412 = IsGammaSpace() ? float4(0.484069,0.862666,0.9245283,0) : float4(0.1995908,0.7155456,0.8368256,0);
				float4 ifLocalVar61_g66412 = 0;
				if( Resolution44_g66412 <= 256.0 )
				ifLocalVar61_g66412 = color62_g66412;
				float4 color55_g66412 = IsGammaSpace() ? float4(0.1933962,0.7383016,1,0) : float4(0.03108436,0.5044825,1,0);
				float4 ifLocalVar56_g66412 = 0;
				if( Resolution44_g66412 == 512.0 )
				ifLocalVar56_g66412 = color55_g66412;
				float4 color42_g66412 = IsGammaSpace() ? float4(0.4431373,0.7921569,0.1764706,0) : float4(0.1651322,0.5906189,0.02624122,0);
				float4 ifLocalVar40_g66412 = 0;
				if( Resolution44_g66412 == 1024.0 )
				ifLocalVar40_g66412 = color42_g66412;
				float4 color48_g66412 = IsGammaSpace() ? float4(1,0.6889491,0.07075471,0) : float4(1,0.4324122,0.006068094,0);
				float4 ifLocalVar47_g66412 = 0;
				if( Resolution44_g66412 == 2048.0 )
				ifLocalVar47_g66412 = color48_g66412;
				float4 color51_g66412 = IsGammaSpace() ? float4(1,0.2066492,0.0990566,0) : float4(1,0.03521443,0.009877041,0);
				float4 ifLocalVar52_g66412 = 0;
				if( Resolution44_g66412 >= 4096.0 )
				ifLocalVar52_g66412 = color51_g66412;
				float4 ifLocalVar40_g66417 = 0;
				if( Debug_Index464_g66395 == 1.0 )
				ifLocalVar40_g66417 = ( ifLocalVar61_g66412 + ifLocalVar56_g66412 + ifLocalVar40_g66412 + ifLocalVar47_g66412 + ifLocalVar52_g66412 );
				float Resolution44_g66457 = max( _MainMaskTex_TexelSize.z , _MainMaskTex_TexelSize.w );
				float4 color62_g66457 = IsGammaSpace() ? float4(0.484069,0.862666,0.9245283,0) : float4(0.1995908,0.7155456,0.8368256,0);
				float4 ifLocalVar61_g66457 = 0;
				if( Resolution44_g66457 <= 256.0 )
				ifLocalVar61_g66457 = color62_g66457;
				float4 color55_g66457 = IsGammaSpace() ? float4(0.1933962,0.7383016,1,0) : float4(0.03108436,0.5044825,1,0);
				float4 ifLocalVar56_g66457 = 0;
				if( Resolution44_g66457 == 512.0 )
				ifLocalVar56_g66457 = color55_g66457;
				float4 color42_g66457 = IsGammaSpace() ? float4(0.4431373,0.7921569,0.1764706,0) : float4(0.1651322,0.5906189,0.02624122,0);
				float4 ifLocalVar40_g66457 = 0;
				if( Resolution44_g66457 == 1024.0 )
				ifLocalVar40_g66457 = color42_g66457;
				float4 color48_g66457 = IsGammaSpace() ? float4(1,0.6889491,0.07075471,0) : float4(1,0.4324122,0.006068094,0);
				float4 ifLocalVar47_g66457 = 0;
				if( Resolution44_g66457 == 2048.0 )
				ifLocalVar47_g66457 = color48_g66457;
				float4 color51_g66457 = IsGammaSpace() ? float4(1,0.2066492,0.0990566,0) : float4(1,0.03521443,0.009877041,0);
				float4 ifLocalVar52_g66457 = 0;
				if( Resolution44_g66457 >= 4096.0 )
				ifLocalVar52_g66457 = color51_g66457;
				float4 ifLocalVar40_g66421 = 0;
				if( Debug_Index464_g66395 == 2.0 )
				ifLocalVar40_g66421 = ( ifLocalVar61_g66457 + ifLocalVar56_g66457 + ifLocalVar40_g66457 + ifLocalVar47_g66457 + ifLocalVar52_g66457 );
				float Resolution44_g66458 = max( _SecondAlbedoTex_TexelSize.z , _SecondAlbedoTex_TexelSize.w );
				float4 color62_g66458 = IsGammaSpace() ? float4(0.484069,0.862666,0.9245283,0) : float4(0.1995908,0.7155456,0.8368256,0);
				float4 ifLocalVar61_g66458 = 0;
				if( Resolution44_g66458 <= 256.0 )
				ifLocalVar61_g66458 = color62_g66458;
				float4 color55_g66458 = IsGammaSpace() ? float4(0.1933962,0.7383016,1,0) : float4(0.03108436,0.5044825,1,0);
				float4 ifLocalVar56_g66458 = 0;
				if( Resolution44_g66458 == 512.0 )
				ifLocalVar56_g66458 = color55_g66458;
				float4 color42_g66458 = IsGammaSpace() ? float4(0.4431373,0.7921569,0.1764706,0) : float4(0.1651322,0.5906189,0.02624122,0);
				float4 ifLocalVar40_g66458 = 0;
				if( Resolution44_g66458 == 1024.0 )
				ifLocalVar40_g66458 = color42_g66458;
				float4 color48_g66458 = IsGammaSpace() ? float4(1,0.6889491,0.07075471,0) : float4(1,0.4324122,0.006068094,0);
				float4 ifLocalVar47_g66458 = 0;
				if( Resolution44_g66458 == 2048.0 )
				ifLocalVar47_g66458 = color48_g66458;
				float4 color51_g66458 = IsGammaSpace() ? float4(1,0.2066492,0.0990566,0) : float4(1,0.03521443,0.009877041,0);
				float4 ifLocalVar52_g66458 = 0;
				if( Resolution44_g66458 >= 4096.0 )
				ifLocalVar52_g66458 = color51_g66458;
				float4 ifLocalVar40_g66416 = 0;
				if( Debug_Index464_g66395 == 3.0 )
				ifLocalVar40_g66416 = ( ifLocalVar61_g66458 + ifLocalVar56_g66458 + ifLocalVar40_g66458 + ifLocalVar47_g66458 + ifLocalVar52_g66458 );
				float Resolution44_g66447 = max( _SecondMaskTex_TexelSize.z , _SecondMaskTex_TexelSize.w );
				float4 color62_g66447 = IsGammaSpace() ? float4(0.484069,0.862666,0.9245283,0) : float4(0.1995908,0.7155456,0.8368256,0);
				float4 ifLocalVar61_g66447 = 0;
				if( Resolution44_g66447 <= 256.0 )
				ifLocalVar61_g66447 = color62_g66447;
				float4 color55_g66447 = IsGammaSpace() ? float4(0.1933962,0.7383016,1,0) : float4(0.03108436,0.5044825,1,0);
				float4 ifLocalVar56_g66447 = 0;
				if( Resolution44_g66447 == 512.0 )
				ifLocalVar56_g66447 = color55_g66447;
				float4 color42_g66447 = IsGammaSpace() ? float4(0.4431373,0.7921569,0.1764706,0) : float4(0.1651322,0.5906189,0.02624122,0);
				float4 ifLocalVar40_g66447 = 0;
				if( Resolution44_g66447 == 1024.0 )
				ifLocalVar40_g66447 = color42_g66447;
				float4 color48_g66447 = IsGammaSpace() ? float4(1,0.6889491,0.07075471,0) : float4(1,0.4324122,0.006068094,0);
				float4 ifLocalVar47_g66447 = 0;
				if( Resolution44_g66447 == 2048.0 )
				ifLocalVar47_g66447 = color48_g66447;
				float4 color51_g66447 = IsGammaSpace() ? float4(1,0.2066492,0.0990566,0) : float4(1,0.03521443,0.009877041,0);
				float4 ifLocalVar52_g66447 = 0;
				if( Resolution44_g66447 >= 4096.0 )
				ifLocalVar52_g66447 = color51_g66447;
				float4 ifLocalVar40_g66411 = 0;
				if( Debug_Index464_g66395 == 4.0 )
				ifLocalVar40_g66411 = ( ifLocalVar61_g66447 + ifLocalVar56_g66447 + ifLocalVar40_g66447 + ifLocalVar47_g66447 + ifLocalVar52_g66447 );
				float Resolution44_g66460 = max( _SecondAlbedoTex_TexelSize.z , _SecondAlbedoTex_TexelSize.w );
				float4 color62_g66460 = IsGammaSpace() ? float4(0.484069,0.862666,0.9245283,0) : float4(0.1995908,0.7155456,0.8368256,0);
				float4 ifLocalVar61_g66460 = 0;
				if( Resolution44_g66460 <= 256.0 )
				ifLocalVar61_g66460 = color62_g66460;
				float4 color55_g66460 = IsGammaSpace() ? float4(0.1933962,0.7383016,1,0) : float4(0.03108436,0.5044825,1,0);
				float4 ifLocalVar56_g66460 = 0;
				if( Resolution44_g66460 == 512.0 )
				ifLocalVar56_g66460 = color55_g66460;
				float4 color42_g66460 = IsGammaSpace() ? float4(0.4431373,0.7921569,0.1764706,0) : float4(0.1651322,0.5906189,0.02624122,0);
				float4 ifLocalVar40_g66460 = 0;
				if( Resolution44_g66460 == 1024.0 )
				ifLocalVar40_g66460 = color42_g66460;
				float4 color48_g66460 = IsGammaSpace() ? float4(1,0.6889491,0.07075471,0) : float4(1,0.4324122,0.006068094,0);
				float4 ifLocalVar47_g66460 = 0;
				if( Resolution44_g66460 == 2048.0 )
				ifLocalVar47_g66460 = color48_g66460;
				float4 color51_g66460 = IsGammaSpace() ? float4(1,0.2066492,0.0990566,0) : float4(1,0.03521443,0.009877041,0);
				float4 ifLocalVar52_g66460 = 0;
				if( Resolution44_g66460 >= 4096.0 )
				ifLocalVar52_g66460 = color51_g66460;
				float4 ifLocalVar40_g66448 = 0;
				if( Debug_Index464_g66395 == 5.0 )
				ifLocalVar40_g66448 = ( ifLocalVar61_g66460 + ifLocalVar56_g66460 + ifLocalVar40_g66460 + ifLocalVar47_g66460 + ifLocalVar52_g66460 );
				float Resolution44_g66429 = max( _EmissiveTex_TexelSize.z , _EmissiveTex_TexelSize.w );
				float4 color62_g66429 = IsGammaSpace() ? float4(0.484069,0.862666,0.9245283,0) : float4(0.1995908,0.7155456,0.8368256,0);
				float4 ifLocalVar61_g66429 = 0;
				if( Resolution44_g66429 <= 256.0 )
				ifLocalVar61_g66429 = color62_g66429;
				float4 color55_g66429 = IsGammaSpace() ? float4(0.1933962,0.7383016,1,0) : float4(0.03108436,0.5044825,1,0);
				float4 ifLocalVar56_g66429 = 0;
				if( Resolution44_g66429 == 512.0 )
				ifLocalVar56_g66429 = color55_g66429;
				float4 color42_g66429 = IsGammaSpace() ? float4(0.4431373,0.7921569,0.1764706,0) : float4(0.1651322,0.5906189,0.02624122,0);
				float4 ifLocalVar40_g66429 = 0;
				if( Resolution44_g66429 == 1024.0 )
				ifLocalVar40_g66429 = color42_g66429;
				float4 color48_g66429 = IsGammaSpace() ? float4(1,0.6889491,0.07075471,0) : float4(1,0.4324122,0.006068094,0);
				float4 ifLocalVar47_g66429 = 0;
				if( Resolution44_g66429 == 2048.0 )
				ifLocalVar47_g66429 = color48_g66429;
				float4 color51_g66429 = IsGammaSpace() ? float4(1,0.2066492,0.0990566,0) : float4(1,0.03521443,0.009877041,0);
				float4 ifLocalVar52_g66429 = 0;
				if( Resolution44_g66429 >= 4096.0 )
				ifLocalVar52_g66429 = color51_g66429;
				float4 ifLocalVar40_g66461 = 0;
				if( Debug_Index464_g66395 == 6.0 )
				ifLocalVar40_g66461 = ( ifLocalVar61_g66429 + ifLocalVar56_g66429 + ifLocalVar40_g66429 + ifLocalVar47_g66429 + ifLocalVar52_g66429 );
				float4 Output_Resolution737_g66395 = ( ( ifLocalVar40_g66511 + ifLocalVar40_g66417 + ifLocalVar40_g66421 ) + ( ifLocalVar40_g66416 + ifLocalVar40_g66411 + ifLocalVar40_g66448 ) + ifLocalVar40_g66461 );
				float4 ifLocalVar40_g66492 = 0;
				if( Debug_Type367_g66395 == 4.0 )
				ifLocalVar40_g66492 = Output_Resolution737_g66395;
				float3 WorldPosition893_g66395 = worldPos;
				half3 Input_Position419_g66517 = -WorldPosition893_g66395;
				float temp_output_84_0_g66488 = _LayerMotionValue;
				float4 temp_output_91_19_g66488 = TVE_MotionCoords;
				half2 UV94_g66488 = ( (temp_output_91_19_g66488).zw + ( (temp_output_91_19_g66488).xy * (WorldPosition893_g66395).xz ) );
				half2 UX98_g66488 = ddx( UV94_g66488 );
				half2 UY101_g66488 = ddy( UV94_g66488 );
				float4 ifLocalVar93_g66488 = 0;
				UNITY_BRANCH 
				if( TVE_MotionUsage[(int)temp_output_84_0_g66488] > 0.5 )
				ifLocalVar93_g66488 = SAMPLE_TEXTURE2D_ARRAY_GRAD( TVE_MotionTex, samplerTVE_MotionTex, float3(UV94_g66488,temp_output_84_0_g66488), UX98_g66488, UY101_g66488 );
				else if( TVE_MotionUsage[(int)temp_output_84_0_g66488] < 0.5 )
				ifLocalVar93_g66488 = TVE_MotionParams;
				float4 break322_g66495 = ifLocalVar93_g66488;
				float3 appendResult397_g66495 = (float3(break322_g66495.x , 0.0 , break322_g66495.y));
				float3 temp_output_398_0_g66495 = (appendResult397_g66495*2.0 + -1.0);
				half2 Wind_DirectionWS1031_g66395 = (temp_output_398_0_g66495).xz;
				half2 Input_DirectionWS423_g66517 = Wind_DirectionWS1031_g66395;
				float Motion_Scale287_g66517 = ( _MotionScale_10 + 0.2 );
				half Global_Scale448_g66517 = TVE_NoiseParams.y;
				half Input_Speed62_g66517 = _MotionSpeed_10;
				half Global_Speed449_g66517 = TVE_NoiseParams.x;
				float mulTime426_g66517 = _Time.y * ( Input_Speed62_g66517 * Global_Speed449_g66517 );
				half Global_DistortionScale453_g66517 = TVE_NoiseParams.w;
				float3 break461_g66517 = ( Input_Position419_g66517 * Global_DistortionScale453_g66517 );
				half Global_Distortion452_g66517 = TVE_NoiseParams.z;
				float Noise_Distortion469_g66517 = ( sin( ( break461_g66517.x + break461_g66517.z ) ) * Global_Distortion452_g66517 );
				half Motion_Variation284_g66517 = 0.0;
				float2 temp_output_425_0_g66517 = ( ( (Input_Position419_g66517).xz * Input_DirectionWS423_g66517 * Motion_Scale287_g66517 * Global_Scale448_g66517 ) + ( mulTime426_g66517 + Noise_Distortion469_g66517 + Motion_Variation284_g66517 ) );
				float2 break500_g66517 = ( temp_output_425_0_g66517 * 0.1178 );
				float2 break494_g66517 = ( temp_output_425_0_g66517 * 0.1742 );
				half Wind_Power369_g66495 = break322_g66495.z;
				half Wind_Pow1128_g66395 = Wind_Power369_g66495;
				half Input_WindPower327_g66517 = Wind_Pow1128_g66395;
				float lerpResult430_g66517 = lerp( 1.2 , 0.4 , Input_WindPower327_g66517);
				half Motion_Noise915_g66395 = (pow( (( sin( ( break500_g66517.x + break500_g66517.y ) ) * sin( ( break494_g66517.x + break494_g66517.y ) ) )*0.4 + 0.6) , lerpResult430_g66517 )*1.2 + -0.2);
				float ifLocalVar40_g66408 = 0;
				if( Debug_Index464_g66395 == 0.0 )
				ifLocalVar40_g66408 = Motion_Noise915_g66395;
				float Debug_Layer885_g66395 = TVE_DEBUG_Layer;
				float temp_output_82_0_g66463 = Debug_Layer885_g66395;
				float4 temp_output_91_19_g66463 = TVE_ColorsCoords;
				half2 UV94_g66463 = ( (temp_output_91_19_g66463).zw + ( (temp_output_91_19_g66463).xy * (WorldPosition893_g66395).xz ) );
				half2 UX98_g66463 = ddx( UV94_g66463 );
				half2 UY101_g66463 = ddy( UV94_g66463 );
				float4 ifLocalVar93_g66463 = 0;
				UNITY_BRANCH 
				if( TVE_ColorsUsage[(int)temp_output_82_0_g66463] > 0.5 )
				ifLocalVar93_g66463 = SAMPLE_TEXTURE2D_ARRAY_GRAD( TVE_ColorsTex, samplerTVE_ColorsTex, float3(UV94_g66463,temp_output_82_0_g66463), UX98_g66463, UY101_g66463 );
				else if( TVE_ColorsUsage[(int)temp_output_82_0_g66463] < 0.5 )
				ifLocalVar93_g66463 = TVE_ColorsParams;
				float3 ifLocalVar40_g66430 = 0;
				if( Debug_Index464_g66395 == 1.0 )
				ifLocalVar40_g66430 = (ifLocalVar93_g66463).rgb;
				float temp_output_82_0_g66467 = Debug_Layer885_g66395;
				float4 temp_output_91_19_g66467 = TVE_ColorsCoords;
				half2 UV94_g66467 = ( (temp_output_91_19_g66467).zw + ( (temp_output_91_19_g66467).xy * (WorldPosition893_g66395).xz ) );
				half2 UX98_g66467 = ddx( UV94_g66467 );
				half2 UY101_g66467 = ddy( UV94_g66467 );
				float4 ifLocalVar93_g66467 = 0;
				UNITY_BRANCH 
				if( TVE_ColorsUsage[(int)temp_output_82_0_g66467] > 0.5 )
				ifLocalVar93_g66467 = SAMPLE_TEXTURE2D_ARRAY_GRAD( TVE_ColorsTex, samplerTVE_ColorsTex, float3(UV94_g66467,temp_output_82_0_g66467), UX98_g66467, UY101_g66467 );
				else if( TVE_ColorsUsage[(int)temp_output_82_0_g66467] < 0.5 )
				ifLocalVar93_g66467 = TVE_ColorsParams;
				float ifLocalVar40_g66435 = 0;
				if( Debug_Index464_g66395 == 2.0 )
				ifLocalVar40_g66435 = (ifLocalVar93_g66467).a;
				float temp_output_84_0_g66475 = Debug_Layer885_g66395;
				float4 temp_output_93_19_g66475 = TVE_ExtrasCoords;
				half2 UV96_g66475 = ( (temp_output_93_19_g66475).zw + ( (temp_output_93_19_g66475).xy * (WorldPosition893_g66395).xz ) );
				half2 UX100_g66475 = ddx( UV96_g66475 );
				half2 UY103_g66475 = ddy( UV96_g66475 );
				float4 ifLocalVar95_g66475 = 0;
				UNITY_BRANCH 
				if( TVE_ExtrasUsage[(int)temp_output_84_0_g66475] > 0.5 )
				ifLocalVar95_g66475 = SAMPLE_TEXTURE2D_ARRAY_GRAD( TVE_ExtrasTex, samplerTVE_ExtrasTex, float3(UV96_g66475,temp_output_84_0_g66475), UX100_g66475, UY103_g66475 );
				else if( TVE_ExtrasUsage[(int)temp_output_84_0_g66475] < 0.5 )
				ifLocalVar95_g66475 = TVE_ExtrasParams;
				float4 break89_g66475 = ifLocalVar95_g66475;
				float ifLocalVar40_g66414 = 0;
				if( Debug_Index464_g66395 == 3.0 )
				ifLocalVar40_g66414 = break89_g66475.r;
				float temp_output_84_0_g66397 = Debug_Layer885_g66395;
				float4 temp_output_93_19_g66397 = TVE_ExtrasCoords;
				half2 UV96_g66397 = ( (temp_output_93_19_g66397).zw + ( (temp_output_93_19_g66397).xy * (WorldPosition893_g66395).xz ) );
				half2 UX100_g66397 = ddx( UV96_g66397 );
				half2 UY103_g66397 = ddy( UV96_g66397 );
				float4 ifLocalVar95_g66397 = 0;
				UNITY_BRANCH 
				if( TVE_ExtrasUsage[(int)temp_output_84_0_g66397] > 0.5 )
				ifLocalVar95_g66397 = SAMPLE_TEXTURE2D_ARRAY_GRAD( TVE_ExtrasTex, samplerTVE_ExtrasTex, float3(UV96_g66397,temp_output_84_0_g66397), UX100_g66397, UY103_g66397 );
				else if( TVE_ExtrasUsage[(int)temp_output_84_0_g66397] < 0.5 )
				ifLocalVar95_g66397 = TVE_ExtrasParams;
				float4 break89_g66397 = ifLocalVar95_g66397;
				float ifLocalVar40_g66508 = 0;
				if( Debug_Index464_g66395 == 4.0 )
				ifLocalVar40_g66508 = break89_g66397.g;
				float temp_output_84_0_g66484 = Debug_Layer885_g66395;
				float4 temp_output_93_19_g66484 = TVE_ExtrasCoords;
				half2 UV96_g66484 = ( (temp_output_93_19_g66484).zw + ( (temp_output_93_19_g66484).xy * (WorldPosition893_g66395).xz ) );
				half2 UX100_g66484 = ddx( UV96_g66484 );
				half2 UY103_g66484 = ddy( UV96_g66484 );
				float4 ifLocalVar95_g66484 = 0;
				UNITY_BRANCH 
				if( TVE_ExtrasUsage[(int)temp_output_84_0_g66484] > 0.5 )
				ifLocalVar95_g66484 = SAMPLE_TEXTURE2D_ARRAY_GRAD( TVE_ExtrasTex, samplerTVE_ExtrasTex, float3(UV96_g66484,temp_output_84_0_g66484), UX100_g66484, UY103_g66484 );
				else if( TVE_ExtrasUsage[(int)temp_output_84_0_g66484] < 0.5 )
				ifLocalVar95_g66484 = TVE_ExtrasParams;
				float4 break89_g66484 = ifLocalVar95_g66484;
				float ifLocalVar40_g66401 = 0;
				if( Debug_Index464_g66395 == 5.0 )
				ifLocalVar40_g66401 = break89_g66484.b;
				float temp_output_84_0_g66513 = Debug_Layer885_g66395;
				float4 temp_output_93_19_g66513 = TVE_ExtrasCoords;
				half2 UV96_g66513 = ( (temp_output_93_19_g66513).zw + ( (temp_output_93_19_g66513).xy * (WorldPosition893_g66395).xz ) );
				half2 UX100_g66513 = ddx( UV96_g66513 );
				half2 UY103_g66513 = ddy( UV96_g66513 );
				float4 ifLocalVar95_g66513 = 0;
				UNITY_BRANCH 
				if( TVE_ExtrasUsage[(int)temp_output_84_0_g66513] > 0.5 )
				ifLocalVar95_g66513 = SAMPLE_TEXTURE2D_ARRAY_GRAD( TVE_ExtrasTex, samplerTVE_ExtrasTex, float3(UV96_g66513,temp_output_84_0_g66513), UX100_g66513, UY103_g66513 );
				else if( TVE_ExtrasUsage[(int)temp_output_84_0_g66513] < 0.5 )
				ifLocalVar95_g66513 = TVE_ExtrasParams;
				float4 break89_g66513 = ifLocalVar95_g66513;
				float ifLocalVar40_g66424 = 0;
				if( Debug_Index464_g66395 == 6.0 )
				ifLocalVar40_g66424 = break89_g66513.a;
				float temp_output_84_0_g66471 = Debug_Layer885_g66395;
				float4 temp_output_91_19_g66471 = TVE_MotionCoords;
				half2 UV94_g66471 = ( (temp_output_91_19_g66471).zw + ( (temp_output_91_19_g66471).xy * (WorldPosition893_g66395).xz ) );
				half2 UX98_g66471 = ddx( UV94_g66471 );
				half2 UY101_g66471 = ddy( UV94_g66471 );
				float4 ifLocalVar93_g66471 = 0;
				UNITY_BRANCH 
				if( TVE_MotionUsage[(int)temp_output_84_0_g66471] > 0.5 )
				ifLocalVar93_g66471 = SAMPLE_TEXTURE2D_ARRAY_GRAD( TVE_MotionTex, samplerTVE_MotionTex, float3(UV94_g66471,temp_output_84_0_g66471), UX98_g66471, UY101_g66471 );
				else if( TVE_MotionUsage[(int)temp_output_84_0_g66471] < 0.5 )
				ifLocalVar93_g66471 = TVE_MotionParams;
				float3 appendResult1012_g66395 = (float3((ifLocalVar93_g66471).rg , 0.0));
				float3 ifLocalVar40_g66404 = 0;
				if( Debug_Index464_g66395 == 7.0 )
				ifLocalVar40_g66404 = appendResult1012_g66395;
				float temp_output_84_0_g66496 = Debug_Layer885_g66395;
				float4 temp_output_91_19_g66496 = TVE_MotionCoords;
				half2 UV94_g66496 = ( (temp_output_91_19_g66496).zw + ( (temp_output_91_19_g66496).xy * (WorldPosition893_g66395).xz ) );
				half2 UX98_g66496 = ddx( UV94_g66496 );
				half2 UY101_g66496 = ddy( UV94_g66496 );
				float4 ifLocalVar93_g66496 = 0;
				UNITY_BRANCH 
				if( TVE_MotionUsage[(int)temp_output_84_0_g66496] > 0.5 )
				ifLocalVar93_g66496 = SAMPLE_TEXTURE2D_ARRAY_GRAD( TVE_MotionTex, samplerTVE_MotionTex, float3(UV94_g66496,temp_output_84_0_g66496), UX98_g66496, UY101_g66496 );
				else if( TVE_MotionUsage[(int)temp_output_84_0_g66496] < 0.5 )
				ifLocalVar93_g66496 = TVE_MotionParams;
				float ifLocalVar40_g66420 = 0;
				if( Debug_Index464_g66395 == 8.0 )
				ifLocalVar40_g66420 = (ifLocalVar93_g66496).b;
				float temp_output_84_0_g66504 = Debug_Layer885_g66395;
				float4 temp_output_91_19_g66504 = TVE_MotionCoords;
				half2 UV94_g66504 = ( (temp_output_91_19_g66504).zw + ( (temp_output_91_19_g66504).xy * (WorldPosition893_g66395).xz ) );
				half2 UX98_g66504 = ddx( UV94_g66504 );
				half2 UY101_g66504 = ddy( UV94_g66504 );
				float4 ifLocalVar93_g66504 = 0;
				UNITY_BRANCH 
				if( TVE_MotionUsage[(int)temp_output_84_0_g66504] > 0.5 )
				ifLocalVar93_g66504 = SAMPLE_TEXTURE2D_ARRAY_GRAD( TVE_MotionTex, samplerTVE_MotionTex, float3(UV94_g66504,temp_output_84_0_g66504), UX98_g66504, UY101_g66504 );
				else if( TVE_MotionUsage[(int)temp_output_84_0_g66504] < 0.5 )
				ifLocalVar93_g66504 = TVE_MotionParams;
				float ifLocalVar40_g66502 = 0;
				if( Debug_Index464_g66395 == 9.0 )
				ifLocalVar40_g66502 = (ifLocalVar93_g66504).a;
				float temp_output_84_0_g66519 = Debug_Layer885_g66395;
				float4 temp_output_94_19_g66519 = TVE_VertexCoords;
				half2 UV97_g66519 = ( (temp_output_94_19_g66519).zw + ( (temp_output_94_19_g66519).xy * (WorldPosition893_g66395).xz ) );
				half2 UX101_g66519 = ddx( UV97_g66519 );
				half2 UY104_g66519 = ddy( UV97_g66519 );
				float4 ifLocalVar96_g66519 = 0;
				UNITY_BRANCH 
				if( TVE_VertexUsage[(int)temp_output_84_0_g66519] > 0.5 )
				ifLocalVar96_g66519 = SAMPLE_TEXTURE2D_ARRAY_GRAD( TVE_VertexTex, samplerTVE_VertexTex, float3(UV97_g66519,temp_output_84_0_g66519), UX101_g66519, UY104_g66519 );
				else if( TVE_VertexUsage[(int)temp_output_84_0_g66519] < 0.5 )
				ifLocalVar96_g66519 = TVE_VertexParams;
				float ifLocalVar40_g66437 = 0;
				if( Debug_Index464_g66395 == 10.0 )
				ifLocalVar40_g66437 = (ifLocalVar96_g66519).a;
				float3 Output_Globals888_g66395 = ( ifLocalVar40_g66408 + ( ifLocalVar40_g66430 + ifLocalVar40_g66435 ) + ( ifLocalVar40_g66414 + ifLocalVar40_g66508 + ifLocalVar40_g66401 + ifLocalVar40_g66424 ) + ( ifLocalVar40_g66404 + ifLocalVar40_g66420 + ifLocalVar40_g66502 ) + ( ifLocalVar40_g66437 + 0.0 ) );
				float3 ifLocalVar40_g66406 = 0;
				if( Debug_Type367_g66395 == 8.0 )
				ifLocalVar40_g66406 = Output_Globals888_g66395;
				float3 vertexToFrag328_g66395 = IN.ase_texcoord9.yzw;
				float4 color1016_g66395 = IsGammaSpace() ? float4(0.5831653,0.6037736,0.2135992,0) : float4(0.2992498,0.3229691,0.03750122,0);
				float4 color1017_g66395 = IsGammaSpace() ? float4(0.8117647,0.3488252,0.2627451,0) : float4(0.6239604,0.0997834,0.05612849,0);
				float4 switchResult1015_g66395 = (((ase_vface>0)?(color1016_g66395):(color1017_g66395)));
				float3 ifLocalVar40_g66396 = 0;
				if( Debug_Index464_g66395 == 4.0 )
				ifLocalVar40_g66396 = (switchResult1015_g66395).rgb;
				float temp_output_7_0_g66418 = Debug_Min721_g66395;
				float3 temp_cast_28 = (temp_output_7_0_g66418).xxx;
				float3 Output_Mesh316_g66395 = saturate( ( ( ( vertexToFrag328_g66395 + ifLocalVar40_g66396 ) - temp_cast_28 ) / ( Debug_Max723_g66395 - temp_output_7_0_g66418 ) ) );
				float3 ifLocalVar40_g66409 = 0;
				if( Debug_Type367_g66395 == 9.0 )
				ifLocalVar40_g66409 = Output_Mesh316_g66395;
				float4 color1086_g66395 = IsGammaSpace() ? float4(0.1226415,0.1226415,0.1226415,0) : float4(0.01390275,0.01390275,0.01390275,0);
				float4 vertexToFrag11_g66446 = IN.ase_texcoord11;
				float _IsVegetationShader1101_g66395 = _IsVegetationShader;
				float4 lerpResult1089_g66395 = lerp( color1086_g66395 , vertexToFrag11_g66446 , ( _IsPolygonalShader1112_g66395 * _IsVegetationShader1101_g66395 ));
				float3 Output_Misc1080_g66395 = (lerpResult1089_g66395).rgb;
				float3 ifLocalVar40_g66481 = 0;
				if( Debug_Type367_g66395 == 10.0 )
				ifLocalVar40_g66481 = Output_Misc1080_g66395;
				float4 temp_output_459_0_g66395 = ( ifLocalVar40_g66422 + ifLocalVar40_g66509 + ifLocalVar40_g66501 + ifLocalVar40_g66493 + ifLocalVar40_g66492 + float4( ifLocalVar40_g66406 , 0.0 ) + float4( ifLocalVar40_g66409 , 0.0 ) + float4( ifLocalVar40_g66481 , 0.0 ) );
				float4 color690_g66395 = IsGammaSpace() ? float4(0.1226415,0.1226415,0.1226415,0) : float4(0.01390275,0.01390275,0.01390275,0);
				float _IsTVEShader647_g66395 = _IsTVEShader;
				float4 lerpResult689_g66395 = lerp( color690_g66395 , temp_output_459_0_g66395 , _IsTVEShader647_g66395);
				float Debug_Filter322_g66395 = TVE_DEBUG_Filter;
				float4 lerpResult326_g66395 = lerp( temp_output_459_0_g66395 , lerpResult689_g66395 , Debug_Filter322_g66395);
				float Debug_Clip623_g66395 = TVE_DEBUG_Clip;
				float lerpResult622_g66395 = lerp( 1.0 , tex2D( _MainAlbedoTex, uv_MainAlbedoTex ).a , ( Debug_Clip623_g66395 * _RenderClip ));
				clip( lerpResult622_g66395 - _Cutoff);
				clip( ( 1.0 - saturate( ( _IsElementShader + _IsHelperShader ) ) ) - 1.0);
				
				o.Albedo = fixed3( 0.5, 0.5, 0.5 );
				o.Normal = fixed3( 0, 0, 1 );
				o.Emission = lerpResult326_g66395.rgb;
				#if defined(_SPECULAR_SETUP)
					o.Specular = fixed3( 0, 0, 0 );
				#else
					o.Metallic = 0;
				#endif
				o.Smoothness = 0;
				o.Occlusion = 1;
				o.Alpha = 1;
				float AlphaClipThreshold = 0.5;
				float AlphaClipThresholdShadow = 0.5;
				float3 BakedGI = 0;
				float3 RefractionColor = 1;
				float RefractionIndex = 1;
				float3 Transmission = 1;
				float3 Translucency = 1;				

				#ifdef _ALPHATEST_ON
					clip( o.Alpha - AlphaClipThreshold );
				#endif

				#ifdef _DEPTHOFFSET_ON
					outputDepth = IN.pos.z;
				#endif

				#ifndef USING_DIRECTIONAL_LIGHT
					fixed3 lightDir = normalize(UnityWorldSpaceLightDir(worldPos));
				#else
					fixed3 lightDir = _WorldSpaceLightPos0.xyz;
				#endif

				fixed4 c = 0;
				float3 worldN;
				worldN.x = dot(IN.tSpace0.xyz, o.Normal);
				worldN.y = dot(IN.tSpace1.xyz, o.Normal);
				worldN.z = dot(IN.tSpace2.xyz, o.Normal);
				worldN = normalize(worldN);
				o.Normal = worldN;

				UnityGI gi;
				UNITY_INITIALIZE_OUTPUT(UnityGI, gi);
				gi.indirect.diffuse = 0;
				gi.indirect.specular = 0;
				gi.light.color = _LightColor0.rgb;
				gi.light.dir = lightDir;

				UnityGIInput giInput;
				UNITY_INITIALIZE_OUTPUT(UnityGIInput, giInput);
				giInput.light = gi.light;
				giInput.worldPos = worldPos;
				giInput.worldViewDir = worldViewDir;
				giInput.atten = atten;
				#if defined(LIGHTMAP_ON) || defined(DYNAMICLIGHTMAP_ON)
					giInput.lightmapUV = IN.lmap;
				#else
					giInput.lightmapUV = 0.0;
				#endif
				#if UNITY_SHOULD_SAMPLE_SH && !UNITY_SAMPLE_FULL_SH_PER_PIXEL
					giInput.ambient = IN.sh;
				#else
					giInput.ambient.rgb = 0.0;
				#endif
				giInput.probeHDR[0] = unity_SpecCube0_HDR;
				giInput.probeHDR[1] = unity_SpecCube1_HDR;
				#if defined(UNITY_SPECCUBE_BLENDING) || defined(UNITY_SPECCUBE_BOX_PROJECTION)
					giInput.boxMin[0] = unity_SpecCube0_BoxMin;
				#endif
				#ifdef UNITY_SPECCUBE_BOX_PROJECTION
					giInput.boxMax[0] = unity_SpecCube0_BoxMax;
					giInput.probePosition[0] = unity_SpecCube0_ProbePosition;
					giInput.boxMax[1] = unity_SpecCube1_BoxMax;
					giInput.boxMin[1] = unity_SpecCube1_BoxMin;
					giInput.probePosition[1] = unity_SpecCube1_ProbePosition;
				#endif
				
				#if defined(_SPECULAR_SETUP)
					LightingStandardSpecular_GI(o, giInput, gi);
				#else
					LightingStandard_GI( o, giInput, gi );
				#endif

				#ifdef ASE_BAKEDGI
					gi.indirect.diffuse = BakedGI;
				#endif

				#if UNITY_SHOULD_SAMPLE_SH && !defined(LIGHTMAP_ON) && defined(ASE_NO_AMBIENT)
					gi.indirect.diffuse = 0;
				#endif

				#if defined(_SPECULAR_SETUP)
					c += LightingStandardSpecular (o, worldViewDir, gi);
				#else
					c += LightingStandard( o, worldViewDir, gi );
				#endif
				
				#ifdef _TRANSMISSION_ASE
				{
					float shadow = _TransmissionShadow;
					#ifdef DIRECTIONAL
						float3 lightAtten = lerp( _LightColor0.rgb, gi.light.color, shadow );
					#else
						float3 lightAtten = gi.light.color;
					#endif
					half3 transmission = max(0 , -dot(o.Normal, gi.light.dir)) * lightAtten * Transmission;
					c.rgb += o.Albedo * transmission;
				}
				#endif

				#ifdef _TRANSLUCENCY_ASE
				{
					float shadow = _TransShadow;
					float normal = _TransNormal;
					float scattering = _TransScattering;
					float direct = _TransDirect;
					float ambient = _TransAmbient;
					float strength = _TransStrength;

					#ifdef DIRECTIONAL
						float3 lightAtten = lerp( _LightColor0.rgb, gi.light.color, shadow );
					#else
						float3 lightAtten = gi.light.color;
					#endif
					half3 lightDir = gi.light.dir + o.Normal * normal;
					half transVdotL = pow( saturate( dot( worldViewDir, -lightDir ) ), scattering );
					half3 translucency = lightAtten * (transVdotL * direct + gi.indirect.diffuse * ambient) * Translucency;
					c.rgb += o.Albedo * translucency * strength;
				}
				#endif

				//#ifdef _REFRACTION_ASE
				//	float4 projScreenPos = ScreenPos / ScreenPos.w;
				//	float3 refractionOffset = ( RefractionIndex - 1.0 ) * mul( UNITY_MATRIX_V, WorldNormal ).xyz * ( 1.0 - dot( WorldNormal, WorldViewDirection ) );
				//	projScreenPos.xy += refractionOffset.xy;
				//	float3 refraction = UNITY_SAMPLE_SCREENSPACE_TEXTURE( _GrabTexture, projScreenPos ) * RefractionColor;
				//	color.rgb = lerp( refraction, color.rgb, color.a );
				//	color.a = 1;
				//#endif

				c.rgb += o.Emission;

				#ifdef ASE_FOG
					UNITY_APPLY_FOG(IN.fogCoord, c);
				#endif
				return c;
			}
			ENDCG
		}

		
		Pass
		{
			
			Name "Deferred"
			Tags { "LightMode"="Deferred" }

			AlphaToMask Off

			CGPROGRAM
			#define ASE_NO_AMBIENT 1
			#if defined(SHADER_API_GLCORE) || defined(SHADER_API_GLES) || defined(SHADER_API_GLES3) || defined(SHADER_API_D3D9)
			#define FRONT_FACE_SEMANTIC VFACE
			#define FRONT_FACE_TYPE float
			#else
			#define FRONT_FACE_SEMANTIC SV_IsFrontFace
			#define FRONT_FACE_TYPE bool
			#endif

			#pragma vertex vert
			#pragma fragment frag
			#pragma target 3.0
			#pragma exclude_renderers nomrt 
			#pragma skip_variants FOG_LINEAR FOG_EXP FOG_EXP2
			#pragma multi_compile_prepassfinal
			#ifndef UNITY_PASS_DEFERRED
				#define UNITY_PASS_DEFERRED
			#endif
			#include "HLSLSupport.cginc"
			#if !defined( UNITY_INSTANCED_LOD_FADE )
				#define UNITY_INSTANCED_LOD_FADE
			#endif
			#if !defined( UNITY_INSTANCED_SH )
				#define UNITY_INSTANCED_SH
			#endif
			#if !defined( UNITY_INSTANCED_LIGHTMAPSTS )
				#define UNITY_INSTANCED_LIGHTMAPSTS
			#endif
			#include "UnityShaderVariables.cginc"
			#include "UnityCG.cginc"
			#include "Lighting.cginc"
			#include "UnityPBSLighting.cginc"

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_VERT_TANGENT
			#if defined(SHADER_API_D3D11) || defined(SHADER_API_XBOXONE) || defined(UNITY_COMPILER_HLSLCC) || defined(SHADER_API_PSSL) || (defined(SHADER_TARGET_SURFACE_ANALYSIS) && !defined(SHADER_TARGET_SURFACE_ANALYSIS_MOJOSHADER))//ASE Sampler Macros
			#define SAMPLE_TEXTURE2D_ARRAY_GRAD(tex,samplerTex,coord,ddx,ddy) tex.SampleGrad(samplerTex,coord,ddx,ddy)
			#else//ASE Sampling Macros
			#define SAMPLE_TEXTURE2D_ARRAY_GRAD(tex,samplerTex,coord,ddx,ddy) tex2DArray(tex,coord)
			#endif//ASE Sampling Macros
			

			struct appdata {
				float4 vertex : POSITION;
				float4 tangent : TANGENT;
				float3 normal : NORMAL;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_color : COLOR;
				float4 ase_texcoord3 : TEXCOORD3;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct v2f {
				#if UNITY_VERSION >= 201810
					UNITY_POSITION(pos);
				#else
					float4 pos : SV_POSITION;
				#endif
				float4 lmap : TEXCOORD2;
				#ifndef LIGHTMAP_ON
					#if UNITY_SHOULD_SAMPLE_SH && !UNITY_SAMPLE_FULL_SH_PER_PIXEL
						half3 sh : TEXCOORD3;
					#endif
				#else
					#ifdef DIRLIGHTMAP_OFF
						float4 lmapFadePos : TEXCOORD4;
					#endif
				#endif
				float4 tSpace0 : TEXCOORD5;
				float4 tSpace1 : TEXCOORD6;
				float4 tSpace2 : TEXCOORD7;
				float4 ase_texcoord8 : TEXCOORD8;
				float4 ase_texcoord9 : TEXCOORD9;
				float4 ase_texcoord10 : TEXCOORD10;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			#ifdef LIGHTMAP_ON
			float4 unity_LightmapFade;
			#endif
			fixed4 unity_Ambient;
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			uniform half _Banner;
			uniform half _Message;
			uniform float _IsSimpleShader;
			uniform float _IsVertexShader;
			uniform half _IsTVEShader;
			uniform half TVE_DEBUG_Type;
			uniform float _IsBarkShader;
			uniform float _IsCrossShader;
			uniform float _IsGrassShader;
			uniform float _IsLeafShader;
			uniform float _IsPropShader;
			uniform float _IsImpostorShader;
			uniform float _IsPolygonalShader;
			uniform float _IsStandardShader;
			uniform float _IsSubsurfaceShader;
			uniform half TVE_DEBUG_Index;
			uniform sampler2D _MainAlbedoTex;
			uniform float4 _MainAlbedoTex_ST;
			uniform sampler2D _MainNormalTex;
			uniform float4 _MainNormalTex_ST;
			uniform sampler2D _MainMaskTex;
			uniform float4 _MainMaskTex_ST;
			uniform sampler2D _SecondAlbedoTex;
			uniform float4 _SecondAlbedoTex_ST;
			uniform sampler2D _SecondNormalTex;
			uniform float4 _SecondNormalTex_ST;
			uniform sampler2D _SecondMaskTex;
			uniform float4 _SecondMaskTex_ST;
			uniform float _DetailMode;
			uniform sampler2D _EmissiveTex;
			uniform float4 _EmissiveTex_ST;
			uniform float4 _EmissiveColor;
			uniform float _EmissiveCat;
			uniform half TVE_DEBUG_Min;
			uniform half TVE_DEBUG_Max;
			float4 _MainAlbedoTex_TexelSize;
			float4 _MainNormalTex_TexelSize;
			float4 _MainMaskTex_TexelSize;
			float4 _SecondAlbedoTex_TexelSize;
			float4 _SecondMaskTex_TexelSize;
			float4 _EmissiveTex_TexelSize;
			uniform half _LayerMotionValue;
			uniform float TVE_MotionUsage[10];
			UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_MotionTex);
			uniform half4 TVE_MotionCoords;
			SamplerState samplerTVE_MotionTex;
			uniform half4 TVE_MotionParams;
			uniform float _MotionScale_10;
			uniform half4 TVE_NoiseParams;
			uniform float _MotionSpeed_10;
			uniform half TVE_DEBUG_Layer;
			uniform float TVE_ColorsUsage[10];
			UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_ColorsTex);
			uniform half4 TVE_ColorsCoords;
			SamplerState samplerTVE_ColorsTex;
			uniform half4 TVE_ColorsParams;
			uniform float TVE_ExtrasUsage[10];
			UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_ExtrasTex);
			uniform half4 TVE_ExtrasCoords;
			SamplerState samplerTVE_ExtrasTex;
			uniform half4 TVE_ExtrasParams;
			uniform float TVE_VertexUsage[10];
			UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_VertexTex);
			uniform half4 TVE_VertexCoords;
			SamplerState samplerTVE_VertexTex;
			uniform half4 TVE_VertexParams;
			uniform float _IsVegetationShader;
			uniform half4 _LeavesFilterColor;
			uniform half4 _MainColor;
			uniform half _VertexColorMode;
			uniform float _LeavesFilterRange;
			uniform half _LeavesFilterMode;
			uniform half TVE_DEBUG_Filter;
			uniform half TVE_DEBUG_Clip;
			uniform float _RenderClip;
			uniform float _Cutoff;
			uniform float _IsElementShader;
			uniform float _IsHelperShader;

	
			float3 HSVToRGB( float3 c )
			{
				float4 K = float4( 1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0 );
				float3 p = abs( frac( c.xxx + K.xyz ) * 6.0 - K.www );
				return c.z * lerp( K.xxx, saturate( p - K.xxx ), c.y );
			}
			
			float2 DecodeFloatToVector2( float enc )
			{
				float2 result ;
				result.y = enc % 2048;
				result.x = floor(enc / 2048);
				return result / (2048 - 1);
			}
			

			v2f VertexFunction (appdata v  ) {
				UNITY_SETUP_INSTANCE_ID(v);
				v2f o;
				UNITY_INITIALIZE_OUTPUT(v2f,o);
				UNITY_TRANSFER_INSTANCE_ID(v,o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float3 customSurfaceDepth676_g66395 = v.vertex.xyz;
				float customEye676_g66395 = -UnityObjectToViewPos( customSurfaceDepth676_g66395 ).z;
				o.ase_texcoord8.x = customEye676_g66395;
				float Debug_Index464_g66395 = TVE_DEBUG_Index;
				float3 ifLocalVar40_g66402 = 0;
				if( Debug_Index464_g66395 == 0.0 )
				ifLocalVar40_g66402 = saturate( v.vertex.xyz );
				float3 ifLocalVar40_g66428 = 0;
				if( Debug_Index464_g66395 == 1.0 )
				ifLocalVar40_g66428 = v.normal;
				float3 ifLocalVar40_g66459 = 0;
				if( Debug_Index464_g66395 == 2.0 )
				ifLocalVar40_g66459 = v.tangent.xyz;
				float ifLocalVar40_g66419 = 0;
				if( Debug_Index464_g66395 == 3.0 )
				ifLocalVar40_g66419 = saturate( v.tangent.w );
				float3 temp_cast_0 = (v.ase_color.r).xxx;
				float3 hsvTorgb260_g66395 = HSVToRGB( float3(v.ase_color.r,1.0,1.0) );
				float3 gammaToLinear266_g66395 = GammaToLinearSpace( hsvTorgb260_g66395 );
				float _IsBarkShader347_g66395 = _IsBarkShader;
				float _IsLeafShader360_g66395 = _IsLeafShader;
				float _IsCrossShader342_g66395 = _IsCrossShader;
				float _IsGrassShader341_g66395 = _IsGrassShader;
				float _IsVegetationShader1101_g66395 = _IsVegetationShader;
				float _IsAnyVegetationShader362_g66395 = saturate( ( _IsBarkShader347_g66395 + _IsLeafShader360_g66395 + _IsCrossShader342_g66395 + _IsGrassShader341_g66395 + _IsVegetationShader1101_g66395 ) );
				float3 lerpResult290_g66395 = lerp( temp_cast_0 , gammaToLinear266_g66395 , _IsAnyVegetationShader362_g66395);
				float3 ifLocalVar40_g66449 = 0;
				if( Debug_Index464_g66395 == 5.0 )
				ifLocalVar40_g66449 = lerpResult290_g66395;
				float ifLocalVar40_g66503 = 0;
				if( Debug_Index464_g66395 == 6.0 )
				ifLocalVar40_g66503 = v.ase_color.g;
				float ifLocalVar40_g66413 = 0;
				if( Debug_Index464_g66395 == 7.0 )
				ifLocalVar40_g66413 = v.ase_color.b;
				float ifLocalVar40_g66423 = 0;
				if( Debug_Index464_g66395 == 8.0 )
				ifLocalVar40_g66423 = v.ase_color.a;
				float ifLocalVar40_g66425 = 0;
				if( Debug_Index464_g66395 == 9.0 )
				ifLocalVar40_g66425 = v.ase_color.a;
				float enc1154_g66395 = v.ase_texcoord.z;
				float2 localDecodeFloatToVector21154_g66395 = DecodeFloatToVector2( enc1154_g66395 );
				float2 break1155_g66395 = localDecodeFloatToVector21154_g66395;
				float ifLocalVar40_g66427 = 0;
				if( Debug_Index464_g66395 == 10.0 )
				ifLocalVar40_g66427 = break1155_g66395.x;
				float ifLocalVar40_g66426 = 0;
				if( Debug_Index464_g66395 == 11.0 )
				ifLocalVar40_g66426 = break1155_g66395.y;
				float3 appendResult1147_g66395 = (float3(v.ase_texcoord.x , v.ase_texcoord.y , 0.0));
				float3 ifLocalVar40_g66434 = 0;
				if( Debug_Index464_g66395 == 12.0 )
				ifLocalVar40_g66434 = appendResult1147_g66395;
				float3 appendResult1148_g66395 = (float3(v.texcoord1.xyzw.x , v.texcoord1.xyzw.y , 0.0));
				float3 ifLocalVar40_g66431 = 0;
				if( Debug_Index464_g66395 == 13.0 )
				ifLocalVar40_g66431 = appendResult1148_g66395;
				float3 appendResult1149_g66395 = (float3(v.texcoord1.xyzw.z , v.texcoord1.xyzw.w , 0.0));
				float3 ifLocalVar40_g66433 = 0;
				if( Debug_Index464_g66395 == 14.0 )
				ifLocalVar40_g66433 = appendResult1149_g66395;
				float3 appendResult60_g66454 = (float3(v.ase_texcoord3.x , v.ase_texcoord3.z , v.ase_texcoord3.y));
				float3 ifLocalVar40_g66432 = 0;
				if( Debug_Index464_g66395 == 15.0 )
				ifLocalVar40_g66432 = appendResult60_g66454;
				float3 vertexToFrag328_g66395 = ( ( ifLocalVar40_g66402 + ifLocalVar40_g66428 + ifLocalVar40_g66459 + ifLocalVar40_g66419 ) + ( ifLocalVar40_g66449 + ifLocalVar40_g66503 + ifLocalVar40_g66413 + ifLocalVar40_g66423 ) + ( ifLocalVar40_g66425 + ifLocalVar40_g66427 + ifLocalVar40_g66426 ) + ( ifLocalVar40_g66434 + ifLocalVar40_g66431 + ifLocalVar40_g66433 + ifLocalVar40_g66432 ) );
				o.ase_texcoord8.yzw = vertexToFrag328_g66395;
				float4 color1097_g66395 = IsGammaSpace() ? float4(1,0.2066492,0.0990566,0) : float4(1,0.03521443,0.009877041,0);
				float4 color1096_g66395 = IsGammaSpace() ? float4(0.4431373,0.7921569,0.1764706,0) : float4(0.1651322,0.5906189,0.02624122,0);
				float2 uv_MainMaskTex1077_g66395 = v.ase_texcoord.xy;
				float3 linearToGamma1066_g66395 = LinearToGammaSpace( _LeavesFilterColor.rgb );
				#ifdef UNITY_COLORSPACE_GAMMA
				float3 staticSwitch1060_g66395 = (_LeavesFilterColor).rgb;
				#else
				float3 staticSwitch1060_g66395 = linearToGamma1066_g66395;
				#endif
				float2 uv_MainAlbedoTex1045_g66395 = v.ase_texcoord.xy;
				float4 tex2DNode1045_g66395 = tex2Dlod( _MainAlbedoTex, float4( uv_MainAlbedoTex1045_g66395, 0, 0.0) );
				float3 lerpResult1043_g66395 = lerp( (tex2DNode1045_g66395).rgb , (v.ase_color).rgb , _VertexColorMode);
				half3 Main_Albedo1078_g66395 = ( (_MainColor).rgb * lerpResult1043_g66395 );
				float3 linearToGamma1058_g66395 = LinearToGammaSpace( Main_Albedo1078_g66395 );
				#ifdef UNITY_COLORSPACE_GAMMA
				float3 staticSwitch1068_g66395 = (Main_Albedo1078_g66395).xyz;
				#else
				float3 staticSwitch1068_g66395 = linearToGamma1058_g66395;
				#endif
				float lerpResult1071_g66395 = lerp( 1.0 , saturate( ( 1.0 - ceil( ( distance( staticSwitch1060_g66395 , staticSwitch1068_g66395 ) - _LeavesFilterRange ) ) ) ) , _LeavesFilterMode);
				half Main_ColorFilter1061_g66395 = lerpResult1071_g66395;
				float4 lerpResult1095_g66395 = lerp( color1097_g66395 , color1096_g66395 , ( tex2Dlod( _MainMaskTex, float4( uv_MainMaskTex1077_g66395, 0, 0.0) ).b * Main_ColorFilter1061_g66395 ));
				float4 vertexToFrag11_g66446 = lerpResult1095_g66395;
				o.ase_texcoord10 = vertexToFrag11_g66446;
				
				o.ase_texcoord9 = v.ase_texcoord;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = defaultVertexValue;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif
				v.vertex.w = 1;
				v.normal = v.normal;
				v.tangent = v.tangent;

				o.pos = UnityObjectToClipPos(v.vertex);
				float3 worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
				fixed3 worldNormal = UnityObjectToWorldNormal(v.normal);
				fixed3 worldTangent = UnityObjectToWorldDir(v.tangent.xyz);
				fixed tangentSign = v.tangent.w * unity_WorldTransformParams.w;
				fixed3 worldBinormal = cross(worldNormal, worldTangent) * tangentSign;
				o.tSpace0 = float4(worldTangent.x, worldBinormal.x, worldNormal.x, worldPos.x);
				o.tSpace1 = float4(worldTangent.y, worldBinormal.y, worldNormal.y, worldPos.y);
				o.tSpace2 = float4(worldTangent.z, worldBinormal.z, worldNormal.z, worldPos.z);

				#ifdef DYNAMICLIGHTMAP_ON
					o.lmap.zw = v.texcoord2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
				#else
					o.lmap.zw = 0;
				#endif
				#ifdef LIGHTMAP_ON
					o.lmap.xy = v.texcoord1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
					#ifdef DIRLIGHTMAP_OFF
						o.lmapFadePos.xyz = (mul(unity_ObjectToWorld, v.vertex).xyz - unity_ShadowFadeCenterAndType.xyz) * unity_ShadowFadeCenterAndType.w;
						o.lmapFadePos.w = (-UnityObjectToViewPos(v.vertex).z) * (1.0 - unity_ShadowFadeCenterAndType.w);
					#endif
				#else
					o.lmap.xy = 0;
					#if UNITY_SHOULD_SAMPLE_SH && !UNITY_SAMPLE_FULL_SH_PER_PIXEL
						o.sh = 0;
						o.sh = ShadeSHPerVertex (worldNormal, o.sh);
					#endif
				#endif
				return o;
			}

			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float4 tangent : TANGENT;
				float3 normal : NORMAL;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_color : COLOR;
				float4 ase_texcoord3 : TEXCOORD3;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( appdata v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.tangent = v.tangent;
				o.normal = v.normal;
				o.texcoord1 = v.texcoord1;
				o.texcoord2 = v.texcoord2;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_color = v.ase_color;
				o.ase_texcoord3 = v.ase_texcoord3;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, UNITY_MATRIX_M, _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, UNITY_MATRIX_M, _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, UNITY_MATRIX_M, _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			v2f DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				appdata o = (appdata) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.tangent = patch[0].tangent * bary.x + patch[1].tangent * bary.y + patch[2].tangent * bary.z;
				o.normal = patch[0].normal * bary.x + patch[1].normal * bary.y + patch[2].normal * bary.z;
				o.texcoord1 = patch[0].texcoord1 * bary.x + patch[1].texcoord1 * bary.y + patch[2].texcoord1 * bary.z;
				o.texcoord2 = patch[0].texcoord2 * bary.x + patch[1].texcoord2 * bary.y + patch[2].texcoord2 * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].normal * (dot(o.vertex.xyz, patch[i].normal) - dot(patch[i].vertex.xyz, patch[i].normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			v2f vert ( appdata v )
			{
				return VertexFunction( v );
			}
			#endif

			void frag (v2f IN , FRONT_FACE_TYPE ase_vface : FRONT_FACE_SEMANTIC
				, out half4 outGBuffer0 : SV_Target0
				, out half4 outGBuffer1 : SV_Target1
				, out half4 outGBuffer2 : SV_Target2
				, out half4 outEmission : SV_Target3
				#if defined(SHADOWS_SHADOWMASK) && (UNITY_ALLOWED_MRT_COUNT > 4)
				, out half4 outShadowMask : SV_Target4
				#endif
				#ifdef _DEPTHOFFSET_ON
				, out float outputDepth : SV_Depth
				#endif
			) 
			{
				UNITY_SETUP_INSTANCE_ID(IN);

				#ifdef LOD_FADE_CROSSFADE
					UNITY_APPLY_DITHER_CROSSFADE(IN.pos.xy);
				#endif

				#if defined(_SPECULAR_SETUP)
					SurfaceOutputStandardSpecular o = (SurfaceOutputStandardSpecular)0;
				#else
					SurfaceOutputStandard o = (SurfaceOutputStandard)0;
				#endif
				float3 WorldTangent = float3(IN.tSpace0.x,IN.tSpace1.x,IN.tSpace2.x);
				float3 WorldBiTangent = float3(IN.tSpace0.y,IN.tSpace1.y,IN.tSpace2.y);
				float3 WorldNormal = float3(IN.tSpace0.z,IN.tSpace1.z,IN.tSpace2.z);
				float3 worldPos = float3(IN.tSpace0.w,IN.tSpace1.w,IN.tSpace2.w);
				float3 worldViewDir = normalize(UnityWorldSpaceViewDir(worldPos));
				half atten = 1;

				float Debug_Type367_g66395 = TVE_DEBUG_Type;
				float4 color646_g66395 = IsGammaSpace() ? float4(0.9245283,0.7969696,0.4142933,1) : float4(0.8368256,0.5987038,0.1431069,1);
				float customEye676_g66395 = IN.ase_texcoord8.x;
				float saferPower688_g66395 = abs( (0.0 + (customEye676_g66395 - 300.0) * (1.0 - 0.0) / (0.0 - 300.0)) );
				float clampResult702_g66395 = clamp( pow( saferPower688_g66395 , 1.25 ) , 0.75 , 1.0 );
				float Shading655_g66395 = clampResult702_g66395;
				float4 Output_Converted717_g66395 = ( color646_g66395 * Shading655_g66395 );
				float4 ifLocalVar40_g66422 = 0;
				if( Debug_Type367_g66395 == 0.0 )
				ifLocalVar40_g66422 = Output_Converted717_g66395;
				float4 color466_g66395 = IsGammaSpace() ? float4(0.8113208,0.4952317,0.264062,0) : float4(0.6231937,0.2096542,0.05668841,0);
				float _IsBarkShader347_g66395 = _IsBarkShader;
				float4 color469_g66395 = IsGammaSpace() ? float4(0.6566009,0.3404236,0.8490566,0) : float4(0.3886527,0.09487338,0.6903409,0);
				float _IsCrossShader342_g66395 = _IsCrossShader;
				float4 color472_g66395 = IsGammaSpace() ? float4(0.7100264,0.8018868,0.2231666,0) : float4(0.4623997,0.6070304,0.0407874,0);
				float _IsGrassShader341_g66395 = _IsGrassShader;
				float4 color475_g66395 = IsGammaSpace() ? float4(0.3267961,0.7264151,0.3118103,0) : float4(0.08721471,0.4865309,0.07922345,0);
				float _IsLeafShader360_g66395 = _IsLeafShader;
				float4 color478_g66395 = IsGammaSpace() ? float4(0.3252937,0.6122813,0.8113208,0) : float4(0.08639329,0.3330702,0.6231937,0);
				float _IsPropShader346_g66395 = _IsPropShader;
				float4 color1114_g66395 = IsGammaSpace() ? float4(0.9716981,0.3162602,0.4816265,0) : float4(0.9368213,0.08154967,0.1974273,0);
				float _IsImpostorShader1110_g66395 = _IsImpostorShader;
				float4 color1117_g66395 = IsGammaSpace() ? float4(0.257921,0.8679245,0.8361252,0) : float4(0.05410501,0.7254258,0.6668791,0);
				float _IsPolygonalShader1112_g66395 = _IsPolygonalShader;
				float4 Output_Shader445_g66395 = ( ( ( color466_g66395 * _IsBarkShader347_g66395 ) + ( color469_g66395 * _IsCrossShader342_g66395 ) + ( color472_g66395 * _IsGrassShader341_g66395 ) + ( color475_g66395 * _IsLeafShader360_g66395 ) + ( color478_g66395 * _IsPropShader346_g66395 ) + ( color1114_g66395 * _IsImpostorShader1110_g66395 ) + ( color1117_g66395 * _IsPolygonalShader1112_g66395 ) ) * Shading655_g66395 );
				float4 ifLocalVar40_g66509 = 0;
				if( Debug_Type367_g66395 == 1.0 )
				ifLocalVar40_g66509 = Output_Shader445_g66395;
				float4 color529_g66395 = IsGammaSpace() ? float4(0.62,0.77,0.15,0) : float4(0.3423916,0.5542217,0.01960665,0);
				float _IsVertexShader1158_g66395 = _IsVertexShader;
				float4 color544_g66395 = IsGammaSpace() ? float4(0.3252937,0.6122813,0.8113208,0) : float4(0.08639329,0.3330702,0.6231937,0);
				float _IsSimpleShader359_g66395 = _IsSimpleShader;
				float4 color521_g66395 = IsGammaSpace() ? float4(0.6566009,0.3404236,0.8490566,0) : float4(0.3886527,0.09487338,0.6903409,0);
				float _IsStandardShader344_g66395 = _IsStandardShader;
				float4 color1121_g66395 = IsGammaSpace() ? float4(0.9245283,0.8421515,0.1788003,0) : float4(0.8368256,0.677754,0.02687956,0);
				float _IsSubsurfaceShader548_g66395 = _IsSubsurfaceShader;
				float4 Output_Lighting525_g66395 = ( ( ( color529_g66395 * _IsVertexShader1158_g66395 ) + ( color544_g66395 * _IsSimpleShader359_g66395 ) + ( color521_g66395 * _IsStandardShader344_g66395 ) + ( color1121_g66395 * _IsSubsurfaceShader548_g66395 ) ) * Shading655_g66395 );
				float4 ifLocalVar40_g66501 = 0;
				if( Debug_Type367_g66395 == 2.0 )
				ifLocalVar40_g66501 = Output_Lighting525_g66395;
				float Debug_Index464_g66395 = TVE_DEBUG_Index;
				float2 uv_MainAlbedoTex = IN.ase_texcoord9.xy * _MainAlbedoTex_ST.xy + _MainAlbedoTex_ST.zw;
				float4 tex2DNode586_g66395 = tex2D( _MainAlbedoTex, uv_MainAlbedoTex );
				float3 appendResult637_g66395 = (float3(tex2DNode586_g66395.r , tex2DNode586_g66395.g , tex2DNode586_g66395.b));
				float3 ifLocalVar40_g66405 = 0;
				if( Debug_Index464_g66395 == 0.0 )
				ifLocalVar40_g66405 = appendResult637_g66395;
				float ifLocalVar40_g66436 = 0;
				if( Debug_Index464_g66395 == 1.0 )
				ifLocalVar40_g66436 = tex2D( _MainAlbedoTex, uv_MainAlbedoTex ).a;
				float2 uv_MainNormalTex = IN.ase_texcoord9.xy * _MainNormalTex_ST.xy + _MainNormalTex_ST.zw;
				float4 tex2DNode604_g66395 = tex2D( _MainNormalTex, uv_MainNormalTex );
				float3 appendResult876_g66395 = (float3(tex2DNode604_g66395.a , tex2DNode604_g66395.g , 1.0));
				float3 gammaToLinear878_g66395 = GammaToLinearSpace( appendResult876_g66395 );
				float3 ifLocalVar40_g66482 = 0;
				if( Debug_Index464_g66395 == 2.0 )
				ifLocalVar40_g66482 = gammaToLinear878_g66395;
				float2 uv_MainMaskTex = IN.ase_texcoord9.xy * _MainMaskTex_ST.xy + _MainMaskTex_ST.zw;
				float ifLocalVar40_g66407 = 0;
				if( Debug_Index464_g66395 == 3.0 )
				ifLocalVar40_g66407 = tex2D( _MainMaskTex, uv_MainMaskTex ).r;
				float ifLocalVar40_g66523 = 0;
				if( Debug_Index464_g66395 == 4.0 )
				ifLocalVar40_g66523 = tex2D( _MainMaskTex, uv_MainMaskTex ).g;
				float ifLocalVar40_g66415 = 0;
				if( Debug_Index464_g66395 == 5.0 )
				ifLocalVar40_g66415 = tex2D( _MainMaskTex, uv_MainMaskTex ).b;
				float ifLocalVar40_g66403 = 0;
				if( Debug_Index464_g66395 == 6.0 )
				ifLocalVar40_g66403 = tex2D( _MainMaskTex, uv_MainMaskTex ).a;
				float2 uv_SecondAlbedoTex = IN.ase_texcoord9.xy * _SecondAlbedoTex_ST.xy + _SecondAlbedoTex_ST.zw;
				float4 tex2DNode854_g66395 = tex2D( _SecondAlbedoTex, uv_SecondAlbedoTex );
				float3 appendResult839_g66395 = (float3(tex2DNode854_g66395.r , tex2DNode854_g66395.g , tex2DNode854_g66395.b));
				float3 ifLocalVar40_g66410 = 0;
				if( Debug_Index464_g66395 == 7.0 )
				ifLocalVar40_g66410 = appendResult839_g66395;
				float ifLocalVar40_g66462 = 0;
				if( Debug_Index464_g66395 == 8.0 )
				ifLocalVar40_g66462 = tex2D( _SecondAlbedoTex, uv_SecondAlbedoTex ).a;
				float2 uv_SecondNormalTex = IN.ase_texcoord9.xy * _SecondNormalTex_ST.xy + _SecondNormalTex_ST.zw;
				float4 tex2DNode841_g66395 = tex2D( _SecondNormalTex, uv_SecondNormalTex );
				float3 appendResult880_g66395 = (float3(tex2DNode841_g66395.a , tex2DNode841_g66395.g , 1.0));
				float3 gammaToLinear879_g66395 = GammaToLinearSpace( appendResult880_g66395 );
				float3 ifLocalVar40_g66512 = 0;
				if( Debug_Index464_g66395 == 8.0 )
				ifLocalVar40_g66512 = gammaToLinear879_g66395;
				float2 uv_SecondMaskTex = IN.ase_texcoord9.xy * _SecondMaskTex_ST.xy + _SecondMaskTex_ST.zw;
				float ifLocalVar40_g66483 = 0;
				if( Debug_Index464_g66395 == 10.0 )
				ifLocalVar40_g66483 = tex2D( _SecondMaskTex, uv_SecondMaskTex ).r;
				float ifLocalVar40_g66456 = 0;
				if( Debug_Index464_g66395 == 11.0 )
				ifLocalVar40_g66456 = tex2D( _SecondMaskTex, uv_SecondMaskTex ).g;
				float ifLocalVar40_g66500 = 0;
				if( Debug_Index464_g66395 == 12.0 )
				ifLocalVar40_g66500 = tex2D( _SecondMaskTex, uv_SecondMaskTex ).b;
				float ifLocalVar40_g66510 = 0;
				if( Debug_Index464_g66395 == 13.0 )
				ifLocalVar40_g66510 = tex2D( _SecondMaskTex, uv_SecondMaskTex ).a;
				float2 uv_EmissiveTex = IN.ase_texcoord9.xy * _EmissiveTex_ST.xy + _EmissiveTex_ST.zw;
				float4 tex2DNode858_g66395 = tex2D( _EmissiveTex, uv_EmissiveTex );
				float3 appendResult867_g66395 = (float3(tex2DNode858_g66395.r , tex2DNode858_g66395.g , tex2DNode858_g66395.b));
				float3 ifLocalVar40_g66455 = 0;
				if( Debug_Index464_g66395 == 14.0 )
				ifLocalVar40_g66455 = appendResult867_g66395;
				float Debug_Min721_g66395 = TVE_DEBUG_Min;
				float temp_output_7_0_g66494 = Debug_Min721_g66395;
				float4 temp_cast_3 = (temp_output_7_0_g66494).xxxx;
				float Debug_Max723_g66395 = TVE_DEBUG_Max;
				float4 Output_Maps561_g66395 = ( ( ( float4( ( ( ifLocalVar40_g66405 + ifLocalVar40_g66436 + ifLocalVar40_g66482 ) + ( ifLocalVar40_g66407 + ifLocalVar40_g66523 + ifLocalVar40_g66415 + ifLocalVar40_g66403 ) ) , 0.0 ) + float4( ( ( ( ifLocalVar40_g66410 + ifLocalVar40_g66462 + ifLocalVar40_g66512 ) + ( ifLocalVar40_g66483 + ifLocalVar40_g66456 + ifLocalVar40_g66500 + ifLocalVar40_g66510 ) ) * _DetailMode ) , 0.0 ) + ( ( float4( ifLocalVar40_g66455 , 0.0 ) * _EmissiveColor ) * _EmissiveCat ) ) - temp_cast_3 ) / ( Debug_Max723_g66395 - temp_output_7_0_g66494 ) );
				float4 ifLocalVar40_g66493 = 0;
				if( Debug_Type367_g66395 == 3.0 )
				ifLocalVar40_g66493 = Output_Maps561_g66395;
				float Resolution44_g66480 = max( _MainAlbedoTex_TexelSize.z , _MainAlbedoTex_TexelSize.w );
				float4 color62_g66480 = IsGammaSpace() ? float4(0.484069,0.862666,0.9245283,0) : float4(0.1995908,0.7155456,0.8368256,0);
				float4 ifLocalVar61_g66480 = 0;
				if( Resolution44_g66480 <= 256.0 )
				ifLocalVar61_g66480 = color62_g66480;
				float4 color55_g66480 = IsGammaSpace() ? float4(0.1933962,0.7383016,1,0) : float4(0.03108436,0.5044825,1,0);
				float4 ifLocalVar56_g66480 = 0;
				if( Resolution44_g66480 == 512.0 )
				ifLocalVar56_g66480 = color55_g66480;
				float4 color42_g66480 = IsGammaSpace() ? float4(0.4431373,0.7921569,0.1764706,0) : float4(0.1651322,0.5906189,0.02624122,0);
				float4 ifLocalVar40_g66480 = 0;
				if( Resolution44_g66480 == 1024.0 )
				ifLocalVar40_g66480 = color42_g66480;
				float4 color48_g66480 = IsGammaSpace() ? float4(1,0.6889491,0.07075471,0) : float4(1,0.4324122,0.006068094,0);
				float4 ifLocalVar47_g66480 = 0;
				if( Resolution44_g66480 == 2048.0 )
				ifLocalVar47_g66480 = color48_g66480;
				float4 color51_g66480 = IsGammaSpace() ? float4(1,0.2066492,0.0990566,0) : float4(1,0.03521443,0.009877041,0);
				float4 ifLocalVar52_g66480 = 0;
				if( Resolution44_g66480 >= 4096.0 )
				ifLocalVar52_g66480 = color51_g66480;
				float4 ifLocalVar40_g66511 = 0;
				if( Debug_Index464_g66395 == 0.0 )
				ifLocalVar40_g66511 = ( ifLocalVar61_g66480 + ifLocalVar56_g66480 + ifLocalVar40_g66480 + ifLocalVar47_g66480 + ifLocalVar52_g66480 );
				float Resolution44_g66412 = max( _MainNormalTex_TexelSize.z , _MainNormalTex_TexelSize.w );
				float4 color62_g66412 = IsGammaSpace() ? float4(0.484069,0.862666,0.9245283,0) : float4(0.1995908,0.7155456,0.8368256,0);
				float4 ifLocalVar61_g66412 = 0;
				if( Resolution44_g66412 <= 256.0 )
				ifLocalVar61_g66412 = color62_g66412;
				float4 color55_g66412 = IsGammaSpace() ? float4(0.1933962,0.7383016,1,0) : float4(0.03108436,0.5044825,1,0);
				float4 ifLocalVar56_g66412 = 0;
				if( Resolution44_g66412 == 512.0 )
				ifLocalVar56_g66412 = color55_g66412;
				float4 color42_g66412 = IsGammaSpace() ? float4(0.4431373,0.7921569,0.1764706,0) : float4(0.1651322,0.5906189,0.02624122,0);
				float4 ifLocalVar40_g66412 = 0;
				if( Resolution44_g66412 == 1024.0 )
				ifLocalVar40_g66412 = color42_g66412;
				float4 color48_g66412 = IsGammaSpace() ? float4(1,0.6889491,0.07075471,0) : float4(1,0.4324122,0.006068094,0);
				float4 ifLocalVar47_g66412 = 0;
				if( Resolution44_g66412 == 2048.0 )
				ifLocalVar47_g66412 = color48_g66412;
				float4 color51_g66412 = IsGammaSpace() ? float4(1,0.2066492,0.0990566,0) : float4(1,0.03521443,0.009877041,0);
				float4 ifLocalVar52_g66412 = 0;
				if( Resolution44_g66412 >= 4096.0 )
				ifLocalVar52_g66412 = color51_g66412;
				float4 ifLocalVar40_g66417 = 0;
				if( Debug_Index464_g66395 == 1.0 )
				ifLocalVar40_g66417 = ( ifLocalVar61_g66412 + ifLocalVar56_g66412 + ifLocalVar40_g66412 + ifLocalVar47_g66412 + ifLocalVar52_g66412 );
				float Resolution44_g66457 = max( _MainMaskTex_TexelSize.z , _MainMaskTex_TexelSize.w );
				float4 color62_g66457 = IsGammaSpace() ? float4(0.484069,0.862666,0.9245283,0) : float4(0.1995908,0.7155456,0.8368256,0);
				float4 ifLocalVar61_g66457 = 0;
				if( Resolution44_g66457 <= 256.0 )
				ifLocalVar61_g66457 = color62_g66457;
				float4 color55_g66457 = IsGammaSpace() ? float4(0.1933962,0.7383016,1,0) : float4(0.03108436,0.5044825,1,0);
				float4 ifLocalVar56_g66457 = 0;
				if( Resolution44_g66457 == 512.0 )
				ifLocalVar56_g66457 = color55_g66457;
				float4 color42_g66457 = IsGammaSpace() ? float4(0.4431373,0.7921569,0.1764706,0) : float4(0.1651322,0.5906189,0.02624122,0);
				float4 ifLocalVar40_g66457 = 0;
				if( Resolution44_g66457 == 1024.0 )
				ifLocalVar40_g66457 = color42_g66457;
				float4 color48_g66457 = IsGammaSpace() ? float4(1,0.6889491,0.07075471,0) : float4(1,0.4324122,0.006068094,0);
				float4 ifLocalVar47_g66457 = 0;
				if( Resolution44_g66457 == 2048.0 )
				ifLocalVar47_g66457 = color48_g66457;
				float4 color51_g66457 = IsGammaSpace() ? float4(1,0.2066492,0.0990566,0) : float4(1,0.03521443,0.009877041,0);
				float4 ifLocalVar52_g66457 = 0;
				if( Resolution44_g66457 >= 4096.0 )
				ifLocalVar52_g66457 = color51_g66457;
				float4 ifLocalVar40_g66421 = 0;
				if( Debug_Index464_g66395 == 2.0 )
				ifLocalVar40_g66421 = ( ifLocalVar61_g66457 + ifLocalVar56_g66457 + ifLocalVar40_g66457 + ifLocalVar47_g66457 + ifLocalVar52_g66457 );
				float Resolution44_g66458 = max( _SecondAlbedoTex_TexelSize.z , _SecondAlbedoTex_TexelSize.w );
				float4 color62_g66458 = IsGammaSpace() ? float4(0.484069,0.862666,0.9245283,0) : float4(0.1995908,0.7155456,0.8368256,0);
				float4 ifLocalVar61_g66458 = 0;
				if( Resolution44_g66458 <= 256.0 )
				ifLocalVar61_g66458 = color62_g66458;
				float4 color55_g66458 = IsGammaSpace() ? float4(0.1933962,0.7383016,1,0) : float4(0.03108436,0.5044825,1,0);
				float4 ifLocalVar56_g66458 = 0;
				if( Resolution44_g66458 == 512.0 )
				ifLocalVar56_g66458 = color55_g66458;
				float4 color42_g66458 = IsGammaSpace() ? float4(0.4431373,0.7921569,0.1764706,0) : float4(0.1651322,0.5906189,0.02624122,0);
				float4 ifLocalVar40_g66458 = 0;
				if( Resolution44_g66458 == 1024.0 )
				ifLocalVar40_g66458 = color42_g66458;
				float4 color48_g66458 = IsGammaSpace() ? float4(1,0.6889491,0.07075471,0) : float4(1,0.4324122,0.006068094,0);
				float4 ifLocalVar47_g66458 = 0;
				if( Resolution44_g66458 == 2048.0 )
				ifLocalVar47_g66458 = color48_g66458;
				float4 color51_g66458 = IsGammaSpace() ? float4(1,0.2066492,0.0990566,0) : float4(1,0.03521443,0.009877041,0);
				float4 ifLocalVar52_g66458 = 0;
				if( Resolution44_g66458 >= 4096.0 )
				ifLocalVar52_g66458 = color51_g66458;
				float4 ifLocalVar40_g66416 = 0;
				if( Debug_Index464_g66395 == 3.0 )
				ifLocalVar40_g66416 = ( ifLocalVar61_g66458 + ifLocalVar56_g66458 + ifLocalVar40_g66458 + ifLocalVar47_g66458 + ifLocalVar52_g66458 );
				float Resolution44_g66447 = max( _SecondMaskTex_TexelSize.z , _SecondMaskTex_TexelSize.w );
				float4 color62_g66447 = IsGammaSpace() ? float4(0.484069,0.862666,0.9245283,0) : float4(0.1995908,0.7155456,0.8368256,0);
				float4 ifLocalVar61_g66447 = 0;
				if( Resolution44_g66447 <= 256.0 )
				ifLocalVar61_g66447 = color62_g66447;
				float4 color55_g66447 = IsGammaSpace() ? float4(0.1933962,0.7383016,1,0) : float4(0.03108436,0.5044825,1,0);
				float4 ifLocalVar56_g66447 = 0;
				if( Resolution44_g66447 == 512.0 )
				ifLocalVar56_g66447 = color55_g66447;
				float4 color42_g66447 = IsGammaSpace() ? float4(0.4431373,0.7921569,0.1764706,0) : float4(0.1651322,0.5906189,0.02624122,0);
				float4 ifLocalVar40_g66447 = 0;
				if( Resolution44_g66447 == 1024.0 )
				ifLocalVar40_g66447 = color42_g66447;
				float4 color48_g66447 = IsGammaSpace() ? float4(1,0.6889491,0.07075471,0) : float4(1,0.4324122,0.006068094,0);
				float4 ifLocalVar47_g66447 = 0;
				if( Resolution44_g66447 == 2048.0 )
				ifLocalVar47_g66447 = color48_g66447;
				float4 color51_g66447 = IsGammaSpace() ? float4(1,0.2066492,0.0990566,0) : float4(1,0.03521443,0.009877041,0);
				float4 ifLocalVar52_g66447 = 0;
				if( Resolution44_g66447 >= 4096.0 )
				ifLocalVar52_g66447 = color51_g66447;
				float4 ifLocalVar40_g66411 = 0;
				if( Debug_Index464_g66395 == 4.0 )
				ifLocalVar40_g66411 = ( ifLocalVar61_g66447 + ifLocalVar56_g66447 + ifLocalVar40_g66447 + ifLocalVar47_g66447 + ifLocalVar52_g66447 );
				float Resolution44_g66460 = max( _SecondAlbedoTex_TexelSize.z , _SecondAlbedoTex_TexelSize.w );
				float4 color62_g66460 = IsGammaSpace() ? float4(0.484069,0.862666,0.9245283,0) : float4(0.1995908,0.7155456,0.8368256,0);
				float4 ifLocalVar61_g66460 = 0;
				if( Resolution44_g66460 <= 256.0 )
				ifLocalVar61_g66460 = color62_g66460;
				float4 color55_g66460 = IsGammaSpace() ? float4(0.1933962,0.7383016,1,0) : float4(0.03108436,0.5044825,1,0);
				float4 ifLocalVar56_g66460 = 0;
				if( Resolution44_g66460 == 512.0 )
				ifLocalVar56_g66460 = color55_g66460;
				float4 color42_g66460 = IsGammaSpace() ? float4(0.4431373,0.7921569,0.1764706,0) : float4(0.1651322,0.5906189,0.02624122,0);
				float4 ifLocalVar40_g66460 = 0;
				if( Resolution44_g66460 == 1024.0 )
				ifLocalVar40_g66460 = color42_g66460;
				float4 color48_g66460 = IsGammaSpace() ? float4(1,0.6889491,0.07075471,0) : float4(1,0.4324122,0.006068094,0);
				float4 ifLocalVar47_g66460 = 0;
				if( Resolution44_g66460 == 2048.0 )
				ifLocalVar47_g66460 = color48_g66460;
				float4 color51_g66460 = IsGammaSpace() ? float4(1,0.2066492,0.0990566,0) : float4(1,0.03521443,0.009877041,0);
				float4 ifLocalVar52_g66460 = 0;
				if( Resolution44_g66460 >= 4096.0 )
				ifLocalVar52_g66460 = color51_g66460;
				float4 ifLocalVar40_g66448 = 0;
				if( Debug_Index464_g66395 == 5.0 )
				ifLocalVar40_g66448 = ( ifLocalVar61_g66460 + ifLocalVar56_g66460 + ifLocalVar40_g66460 + ifLocalVar47_g66460 + ifLocalVar52_g66460 );
				float Resolution44_g66429 = max( _EmissiveTex_TexelSize.z , _EmissiveTex_TexelSize.w );
				float4 color62_g66429 = IsGammaSpace() ? float4(0.484069,0.862666,0.9245283,0) : float4(0.1995908,0.7155456,0.8368256,0);
				float4 ifLocalVar61_g66429 = 0;
				if( Resolution44_g66429 <= 256.0 )
				ifLocalVar61_g66429 = color62_g66429;
				float4 color55_g66429 = IsGammaSpace() ? float4(0.1933962,0.7383016,1,0) : float4(0.03108436,0.5044825,1,0);
				float4 ifLocalVar56_g66429 = 0;
				if( Resolution44_g66429 == 512.0 )
				ifLocalVar56_g66429 = color55_g66429;
				float4 color42_g66429 = IsGammaSpace() ? float4(0.4431373,0.7921569,0.1764706,0) : float4(0.1651322,0.5906189,0.02624122,0);
				float4 ifLocalVar40_g66429 = 0;
				if( Resolution44_g66429 == 1024.0 )
				ifLocalVar40_g66429 = color42_g66429;
				float4 color48_g66429 = IsGammaSpace() ? float4(1,0.6889491,0.07075471,0) : float4(1,0.4324122,0.006068094,0);
				float4 ifLocalVar47_g66429 = 0;
				if( Resolution44_g66429 == 2048.0 )
				ifLocalVar47_g66429 = color48_g66429;
				float4 color51_g66429 = IsGammaSpace() ? float4(1,0.2066492,0.0990566,0) : float4(1,0.03521443,0.009877041,0);
				float4 ifLocalVar52_g66429 = 0;
				if( Resolution44_g66429 >= 4096.0 )
				ifLocalVar52_g66429 = color51_g66429;
				float4 ifLocalVar40_g66461 = 0;
				if( Debug_Index464_g66395 == 6.0 )
				ifLocalVar40_g66461 = ( ifLocalVar61_g66429 + ifLocalVar56_g66429 + ifLocalVar40_g66429 + ifLocalVar47_g66429 + ifLocalVar52_g66429 );
				float4 Output_Resolution737_g66395 = ( ( ifLocalVar40_g66511 + ifLocalVar40_g66417 + ifLocalVar40_g66421 ) + ( ifLocalVar40_g66416 + ifLocalVar40_g66411 + ifLocalVar40_g66448 ) + ifLocalVar40_g66461 );
				float4 ifLocalVar40_g66492 = 0;
				if( Debug_Type367_g66395 == 4.0 )
				ifLocalVar40_g66492 = Output_Resolution737_g66395;
				float3 WorldPosition893_g66395 = worldPos;
				half3 Input_Position419_g66517 = -WorldPosition893_g66395;
				float temp_output_84_0_g66488 = _LayerMotionValue;
				float4 temp_output_91_19_g66488 = TVE_MotionCoords;
				half2 UV94_g66488 = ( (temp_output_91_19_g66488).zw + ( (temp_output_91_19_g66488).xy * (WorldPosition893_g66395).xz ) );
				half2 UX98_g66488 = ddx( UV94_g66488 );
				half2 UY101_g66488 = ddy( UV94_g66488 );
				float4 ifLocalVar93_g66488 = 0;
				UNITY_BRANCH 
				if( TVE_MotionUsage[(int)temp_output_84_0_g66488] > 0.5 )
				ifLocalVar93_g66488 = SAMPLE_TEXTURE2D_ARRAY_GRAD( TVE_MotionTex, samplerTVE_MotionTex, float3(UV94_g66488,temp_output_84_0_g66488), UX98_g66488, UY101_g66488 );
				else if( TVE_MotionUsage[(int)temp_output_84_0_g66488] < 0.5 )
				ifLocalVar93_g66488 = TVE_MotionParams;
				float4 break322_g66495 = ifLocalVar93_g66488;
				float3 appendResult397_g66495 = (float3(break322_g66495.x , 0.0 , break322_g66495.y));
				float3 temp_output_398_0_g66495 = (appendResult397_g66495*2.0 + -1.0);
				half2 Wind_DirectionWS1031_g66395 = (temp_output_398_0_g66495).xz;
				half2 Input_DirectionWS423_g66517 = Wind_DirectionWS1031_g66395;
				float Motion_Scale287_g66517 = ( _MotionScale_10 + 0.2 );
				half Global_Scale448_g66517 = TVE_NoiseParams.y;
				half Input_Speed62_g66517 = _MotionSpeed_10;
				half Global_Speed449_g66517 = TVE_NoiseParams.x;
				float mulTime426_g66517 = _Time.y * ( Input_Speed62_g66517 * Global_Speed449_g66517 );
				half Global_DistortionScale453_g66517 = TVE_NoiseParams.w;
				float3 break461_g66517 = ( Input_Position419_g66517 * Global_DistortionScale453_g66517 );
				half Global_Distortion452_g66517 = TVE_NoiseParams.z;
				float Noise_Distortion469_g66517 = ( sin( ( break461_g66517.x + break461_g66517.z ) ) * Global_Distortion452_g66517 );
				half Motion_Variation284_g66517 = 0.0;
				float2 temp_output_425_0_g66517 = ( ( (Input_Position419_g66517).xz * Input_DirectionWS423_g66517 * Motion_Scale287_g66517 * Global_Scale448_g66517 ) + ( mulTime426_g66517 + Noise_Distortion469_g66517 + Motion_Variation284_g66517 ) );
				float2 break500_g66517 = ( temp_output_425_0_g66517 * 0.1178 );
				float2 break494_g66517 = ( temp_output_425_0_g66517 * 0.1742 );
				half Wind_Power369_g66495 = break322_g66495.z;
				half Wind_Pow1128_g66395 = Wind_Power369_g66495;
				half Input_WindPower327_g66517 = Wind_Pow1128_g66395;
				float lerpResult430_g66517 = lerp( 1.2 , 0.4 , Input_WindPower327_g66517);
				half Motion_Noise915_g66395 = (pow( (( sin( ( break500_g66517.x + break500_g66517.y ) ) * sin( ( break494_g66517.x + break494_g66517.y ) ) )*0.4 + 0.6) , lerpResult430_g66517 )*1.2 + -0.2);
				float ifLocalVar40_g66408 = 0;
				if( Debug_Index464_g66395 == 0.0 )
				ifLocalVar40_g66408 = Motion_Noise915_g66395;
				float Debug_Layer885_g66395 = TVE_DEBUG_Layer;
				float temp_output_82_0_g66463 = Debug_Layer885_g66395;
				float4 temp_output_91_19_g66463 = TVE_ColorsCoords;
				half2 UV94_g66463 = ( (temp_output_91_19_g66463).zw + ( (temp_output_91_19_g66463).xy * (WorldPosition893_g66395).xz ) );
				half2 UX98_g66463 = ddx( UV94_g66463 );
				half2 UY101_g66463 = ddy( UV94_g66463 );
				float4 ifLocalVar93_g66463 = 0;
				UNITY_BRANCH 
				if( TVE_ColorsUsage[(int)temp_output_82_0_g66463] > 0.5 )
				ifLocalVar93_g66463 = SAMPLE_TEXTURE2D_ARRAY_GRAD( TVE_ColorsTex, samplerTVE_ColorsTex, float3(UV94_g66463,temp_output_82_0_g66463), UX98_g66463, UY101_g66463 );
				else if( TVE_ColorsUsage[(int)temp_output_82_0_g66463] < 0.5 )
				ifLocalVar93_g66463 = TVE_ColorsParams;
				float3 ifLocalVar40_g66430 = 0;
				if( Debug_Index464_g66395 == 1.0 )
				ifLocalVar40_g66430 = (ifLocalVar93_g66463).rgb;
				float temp_output_82_0_g66467 = Debug_Layer885_g66395;
				float4 temp_output_91_19_g66467 = TVE_ColorsCoords;
				half2 UV94_g66467 = ( (temp_output_91_19_g66467).zw + ( (temp_output_91_19_g66467).xy * (WorldPosition893_g66395).xz ) );
				half2 UX98_g66467 = ddx( UV94_g66467 );
				half2 UY101_g66467 = ddy( UV94_g66467 );
				float4 ifLocalVar93_g66467 = 0;
				UNITY_BRANCH 
				if( TVE_ColorsUsage[(int)temp_output_82_0_g66467] > 0.5 )
				ifLocalVar93_g66467 = SAMPLE_TEXTURE2D_ARRAY_GRAD( TVE_ColorsTex, samplerTVE_ColorsTex, float3(UV94_g66467,temp_output_82_0_g66467), UX98_g66467, UY101_g66467 );
				else if( TVE_ColorsUsage[(int)temp_output_82_0_g66467] < 0.5 )
				ifLocalVar93_g66467 = TVE_ColorsParams;
				float ifLocalVar40_g66435 = 0;
				if( Debug_Index464_g66395 == 2.0 )
				ifLocalVar40_g66435 = (ifLocalVar93_g66467).a;
				float temp_output_84_0_g66475 = Debug_Layer885_g66395;
				float4 temp_output_93_19_g66475 = TVE_ExtrasCoords;
				half2 UV96_g66475 = ( (temp_output_93_19_g66475).zw + ( (temp_output_93_19_g66475).xy * (WorldPosition893_g66395).xz ) );
				half2 UX100_g66475 = ddx( UV96_g66475 );
				half2 UY103_g66475 = ddy( UV96_g66475 );
				float4 ifLocalVar95_g66475 = 0;
				UNITY_BRANCH 
				if( TVE_ExtrasUsage[(int)temp_output_84_0_g66475] > 0.5 )
				ifLocalVar95_g66475 = SAMPLE_TEXTURE2D_ARRAY_GRAD( TVE_ExtrasTex, samplerTVE_ExtrasTex, float3(UV96_g66475,temp_output_84_0_g66475), UX100_g66475, UY103_g66475 );
				else if( TVE_ExtrasUsage[(int)temp_output_84_0_g66475] < 0.5 )
				ifLocalVar95_g66475 = TVE_ExtrasParams;
				float4 break89_g66475 = ifLocalVar95_g66475;
				float ifLocalVar40_g66414 = 0;
				if( Debug_Index464_g66395 == 3.0 )
				ifLocalVar40_g66414 = break89_g66475.r;
				float temp_output_84_0_g66397 = Debug_Layer885_g66395;
				float4 temp_output_93_19_g66397 = TVE_ExtrasCoords;
				half2 UV96_g66397 = ( (temp_output_93_19_g66397).zw + ( (temp_output_93_19_g66397).xy * (WorldPosition893_g66395).xz ) );
				half2 UX100_g66397 = ddx( UV96_g66397 );
				half2 UY103_g66397 = ddy( UV96_g66397 );
				float4 ifLocalVar95_g66397 = 0;
				UNITY_BRANCH 
				if( TVE_ExtrasUsage[(int)temp_output_84_0_g66397] > 0.5 )
				ifLocalVar95_g66397 = SAMPLE_TEXTURE2D_ARRAY_GRAD( TVE_ExtrasTex, samplerTVE_ExtrasTex, float3(UV96_g66397,temp_output_84_0_g66397), UX100_g66397, UY103_g66397 );
				else if( TVE_ExtrasUsage[(int)temp_output_84_0_g66397] < 0.5 )
				ifLocalVar95_g66397 = TVE_ExtrasParams;
				float4 break89_g66397 = ifLocalVar95_g66397;
				float ifLocalVar40_g66508 = 0;
				if( Debug_Index464_g66395 == 4.0 )
				ifLocalVar40_g66508 = break89_g66397.g;
				float temp_output_84_0_g66484 = Debug_Layer885_g66395;
				float4 temp_output_93_19_g66484 = TVE_ExtrasCoords;
				half2 UV96_g66484 = ( (temp_output_93_19_g66484).zw + ( (temp_output_93_19_g66484).xy * (WorldPosition893_g66395).xz ) );
				half2 UX100_g66484 = ddx( UV96_g66484 );
				half2 UY103_g66484 = ddy( UV96_g66484 );
				float4 ifLocalVar95_g66484 = 0;
				UNITY_BRANCH 
				if( TVE_ExtrasUsage[(int)temp_output_84_0_g66484] > 0.5 )
				ifLocalVar95_g66484 = SAMPLE_TEXTURE2D_ARRAY_GRAD( TVE_ExtrasTex, samplerTVE_ExtrasTex, float3(UV96_g66484,temp_output_84_0_g66484), UX100_g66484, UY103_g66484 );
				else if( TVE_ExtrasUsage[(int)temp_output_84_0_g66484] < 0.5 )
				ifLocalVar95_g66484 = TVE_ExtrasParams;
				float4 break89_g66484 = ifLocalVar95_g66484;
				float ifLocalVar40_g66401 = 0;
				if( Debug_Index464_g66395 == 5.0 )
				ifLocalVar40_g66401 = break89_g66484.b;
				float temp_output_84_0_g66513 = Debug_Layer885_g66395;
				float4 temp_output_93_19_g66513 = TVE_ExtrasCoords;
				half2 UV96_g66513 = ( (temp_output_93_19_g66513).zw + ( (temp_output_93_19_g66513).xy * (WorldPosition893_g66395).xz ) );
				half2 UX100_g66513 = ddx( UV96_g66513 );
				half2 UY103_g66513 = ddy( UV96_g66513 );
				float4 ifLocalVar95_g66513 = 0;
				UNITY_BRANCH 
				if( TVE_ExtrasUsage[(int)temp_output_84_0_g66513] > 0.5 )
				ifLocalVar95_g66513 = SAMPLE_TEXTURE2D_ARRAY_GRAD( TVE_ExtrasTex, samplerTVE_ExtrasTex, float3(UV96_g66513,temp_output_84_0_g66513), UX100_g66513, UY103_g66513 );
				else if( TVE_ExtrasUsage[(int)temp_output_84_0_g66513] < 0.5 )
				ifLocalVar95_g66513 = TVE_ExtrasParams;
				float4 break89_g66513 = ifLocalVar95_g66513;
				float ifLocalVar40_g66424 = 0;
				if( Debug_Index464_g66395 == 6.0 )
				ifLocalVar40_g66424 = break89_g66513.a;
				float temp_output_84_0_g66471 = Debug_Layer885_g66395;
				float4 temp_output_91_19_g66471 = TVE_MotionCoords;
				half2 UV94_g66471 = ( (temp_output_91_19_g66471).zw + ( (temp_output_91_19_g66471).xy * (WorldPosition893_g66395).xz ) );
				half2 UX98_g66471 = ddx( UV94_g66471 );
				half2 UY101_g66471 = ddy( UV94_g66471 );
				float4 ifLocalVar93_g66471 = 0;
				UNITY_BRANCH 
				if( TVE_MotionUsage[(int)temp_output_84_0_g66471] > 0.5 )
				ifLocalVar93_g66471 = SAMPLE_TEXTURE2D_ARRAY_GRAD( TVE_MotionTex, samplerTVE_MotionTex, float3(UV94_g66471,temp_output_84_0_g66471), UX98_g66471, UY101_g66471 );
				else if( TVE_MotionUsage[(int)temp_output_84_0_g66471] < 0.5 )
				ifLocalVar93_g66471 = TVE_MotionParams;
				float3 appendResult1012_g66395 = (float3((ifLocalVar93_g66471).rg , 0.0));
				float3 ifLocalVar40_g66404 = 0;
				if( Debug_Index464_g66395 == 7.0 )
				ifLocalVar40_g66404 = appendResult1012_g66395;
				float temp_output_84_0_g66496 = Debug_Layer885_g66395;
				float4 temp_output_91_19_g66496 = TVE_MotionCoords;
				half2 UV94_g66496 = ( (temp_output_91_19_g66496).zw + ( (temp_output_91_19_g66496).xy * (WorldPosition893_g66395).xz ) );
				half2 UX98_g66496 = ddx( UV94_g66496 );
				half2 UY101_g66496 = ddy( UV94_g66496 );
				float4 ifLocalVar93_g66496 = 0;
				UNITY_BRANCH 
				if( TVE_MotionUsage[(int)temp_output_84_0_g66496] > 0.5 )
				ifLocalVar93_g66496 = SAMPLE_TEXTURE2D_ARRAY_GRAD( TVE_MotionTex, samplerTVE_MotionTex, float3(UV94_g66496,temp_output_84_0_g66496), UX98_g66496, UY101_g66496 );
				else if( TVE_MotionUsage[(int)temp_output_84_0_g66496] < 0.5 )
				ifLocalVar93_g66496 = TVE_MotionParams;
				float ifLocalVar40_g66420 = 0;
				if( Debug_Index464_g66395 == 8.0 )
				ifLocalVar40_g66420 = (ifLocalVar93_g66496).b;
				float temp_output_84_0_g66504 = Debug_Layer885_g66395;
				float4 temp_output_91_19_g66504 = TVE_MotionCoords;
				half2 UV94_g66504 = ( (temp_output_91_19_g66504).zw + ( (temp_output_91_19_g66504).xy * (WorldPosition893_g66395).xz ) );
				half2 UX98_g66504 = ddx( UV94_g66504 );
				half2 UY101_g66504 = ddy( UV94_g66504 );
				float4 ifLocalVar93_g66504 = 0;
				UNITY_BRANCH 
				if( TVE_MotionUsage[(int)temp_output_84_0_g66504] > 0.5 )
				ifLocalVar93_g66504 = SAMPLE_TEXTURE2D_ARRAY_GRAD( TVE_MotionTex, samplerTVE_MotionTex, float3(UV94_g66504,temp_output_84_0_g66504), UX98_g66504, UY101_g66504 );
				else if( TVE_MotionUsage[(int)temp_output_84_0_g66504] < 0.5 )
				ifLocalVar93_g66504 = TVE_MotionParams;
				float ifLocalVar40_g66502 = 0;
				if( Debug_Index464_g66395 == 9.0 )
				ifLocalVar40_g66502 = (ifLocalVar93_g66504).a;
				float temp_output_84_0_g66519 = Debug_Layer885_g66395;
				float4 temp_output_94_19_g66519 = TVE_VertexCoords;
				half2 UV97_g66519 = ( (temp_output_94_19_g66519).zw + ( (temp_output_94_19_g66519).xy * (WorldPosition893_g66395).xz ) );
				half2 UX101_g66519 = ddx( UV97_g66519 );
				half2 UY104_g66519 = ddy( UV97_g66519 );
				float4 ifLocalVar96_g66519 = 0;
				UNITY_BRANCH 
				if( TVE_VertexUsage[(int)temp_output_84_0_g66519] > 0.5 )
				ifLocalVar96_g66519 = SAMPLE_TEXTURE2D_ARRAY_GRAD( TVE_VertexTex, samplerTVE_VertexTex, float3(UV97_g66519,temp_output_84_0_g66519), UX101_g66519, UY104_g66519 );
				else if( TVE_VertexUsage[(int)temp_output_84_0_g66519] < 0.5 )
				ifLocalVar96_g66519 = TVE_VertexParams;
				float ifLocalVar40_g66437 = 0;
				if( Debug_Index464_g66395 == 10.0 )
				ifLocalVar40_g66437 = (ifLocalVar96_g66519).a;
				float3 Output_Globals888_g66395 = ( ifLocalVar40_g66408 + ( ifLocalVar40_g66430 + ifLocalVar40_g66435 ) + ( ifLocalVar40_g66414 + ifLocalVar40_g66508 + ifLocalVar40_g66401 + ifLocalVar40_g66424 ) + ( ifLocalVar40_g66404 + ifLocalVar40_g66420 + ifLocalVar40_g66502 ) + ( ifLocalVar40_g66437 + 0.0 ) );
				float3 ifLocalVar40_g66406 = 0;
				if( Debug_Type367_g66395 == 8.0 )
				ifLocalVar40_g66406 = Output_Globals888_g66395;
				float3 vertexToFrag328_g66395 = IN.ase_texcoord8.yzw;
				float4 color1016_g66395 = IsGammaSpace() ? float4(0.5831653,0.6037736,0.2135992,0) : float4(0.2992498,0.3229691,0.03750122,0);
				float4 color1017_g66395 = IsGammaSpace() ? float4(0.8117647,0.3488252,0.2627451,0) : float4(0.6239604,0.0997834,0.05612849,0);
				float4 switchResult1015_g66395 = (((ase_vface>0)?(color1016_g66395):(color1017_g66395)));
				float3 ifLocalVar40_g66396 = 0;
				if( Debug_Index464_g66395 == 4.0 )
				ifLocalVar40_g66396 = (switchResult1015_g66395).rgb;
				float temp_output_7_0_g66418 = Debug_Min721_g66395;
				float3 temp_cast_28 = (temp_output_7_0_g66418).xxx;
				float3 Output_Mesh316_g66395 = saturate( ( ( ( vertexToFrag328_g66395 + ifLocalVar40_g66396 ) - temp_cast_28 ) / ( Debug_Max723_g66395 - temp_output_7_0_g66418 ) ) );
				float3 ifLocalVar40_g66409 = 0;
				if( Debug_Type367_g66395 == 9.0 )
				ifLocalVar40_g66409 = Output_Mesh316_g66395;
				float4 color1086_g66395 = IsGammaSpace() ? float4(0.1226415,0.1226415,0.1226415,0) : float4(0.01390275,0.01390275,0.01390275,0);
				float4 vertexToFrag11_g66446 = IN.ase_texcoord10;
				float _IsVegetationShader1101_g66395 = _IsVegetationShader;
				float4 lerpResult1089_g66395 = lerp( color1086_g66395 , vertexToFrag11_g66446 , ( _IsPolygonalShader1112_g66395 * _IsVegetationShader1101_g66395 ));
				float3 Output_Misc1080_g66395 = (lerpResult1089_g66395).rgb;
				float3 ifLocalVar40_g66481 = 0;
				if( Debug_Type367_g66395 == 10.0 )
				ifLocalVar40_g66481 = Output_Misc1080_g66395;
				float4 temp_output_459_0_g66395 = ( ifLocalVar40_g66422 + ifLocalVar40_g66509 + ifLocalVar40_g66501 + ifLocalVar40_g66493 + ifLocalVar40_g66492 + float4( ifLocalVar40_g66406 , 0.0 ) + float4( ifLocalVar40_g66409 , 0.0 ) + float4( ifLocalVar40_g66481 , 0.0 ) );
				float4 color690_g66395 = IsGammaSpace() ? float4(0.1226415,0.1226415,0.1226415,0) : float4(0.01390275,0.01390275,0.01390275,0);
				float _IsTVEShader647_g66395 = _IsTVEShader;
				float4 lerpResult689_g66395 = lerp( color690_g66395 , temp_output_459_0_g66395 , _IsTVEShader647_g66395);
				float Debug_Filter322_g66395 = TVE_DEBUG_Filter;
				float4 lerpResult326_g66395 = lerp( temp_output_459_0_g66395 , lerpResult689_g66395 , Debug_Filter322_g66395);
				float Debug_Clip623_g66395 = TVE_DEBUG_Clip;
				float lerpResult622_g66395 = lerp( 1.0 , tex2D( _MainAlbedoTex, uv_MainAlbedoTex ).a , ( Debug_Clip623_g66395 * _RenderClip ));
				clip( lerpResult622_g66395 - _Cutoff);
				clip( ( 1.0 - saturate( ( _IsElementShader + _IsHelperShader ) ) ) - 1.0);
				
				o.Albedo = fixed3( 0.5, 0.5, 0.5 );
				o.Normal = fixed3( 0, 0, 1 );
				o.Emission = lerpResult326_g66395.rgb;
				#if defined(_SPECULAR_SETUP)
					o.Specular = fixed3( 0, 0, 0 );
				#else
					o.Metallic = 0;
				#endif
				o.Smoothness = 0;
				o.Occlusion = 1;
				o.Alpha = 1;
				float AlphaClipThreshold = 0.5;
				float3 BakedGI = 0;

				#ifdef _ALPHATEST_ON
					clip( o.Alpha - AlphaClipThreshold );
				#endif

				#ifdef _DEPTHOFFSET_ON
					outputDepth = IN.pos.z;
				#endif

				#ifndef USING_DIRECTIONAL_LIGHT
					fixed3 lightDir = normalize(UnityWorldSpaceLightDir(worldPos));
				#else
					fixed3 lightDir = _WorldSpaceLightPos0.xyz;
				#endif

				float3 worldN;
				worldN.x = dot(IN.tSpace0.xyz, o.Normal);
				worldN.y = dot(IN.tSpace1.xyz, o.Normal);
				worldN.z = dot(IN.tSpace2.xyz, o.Normal);
				worldN = normalize(worldN);
				o.Normal = worldN;

				UnityGI gi;
				UNITY_INITIALIZE_OUTPUT(UnityGI, gi);
				gi.indirect.diffuse = 0;
				gi.indirect.specular = 0;
				gi.light.color = 0;
				gi.light.dir = half3(0,1,0);

				UnityGIInput giInput;
				UNITY_INITIALIZE_OUTPUT(UnityGIInput, giInput);
				giInput.light = gi.light;
				giInput.worldPos = worldPos;
				giInput.worldViewDir = worldViewDir;
				giInput.atten = atten;
				#if defined(LIGHTMAP_ON) || defined(DYNAMICLIGHTMAP_ON)
					giInput.lightmapUV = IN.lmap;
				#else
					giInput.lightmapUV = 0.0;
				#endif
				#if UNITY_SHOULD_SAMPLE_SH && !UNITY_SAMPLE_FULL_SH_PER_PIXEL
					giInput.ambient = IN.sh;
				#else
					giInput.ambient.rgb = 0.0;
				#endif
				giInput.probeHDR[0] = unity_SpecCube0_HDR;
				giInput.probeHDR[1] = unity_SpecCube1_HDR;
				#if defined(UNITY_SPECCUBE_BLENDING) || defined(UNITY_SPECCUBE_BOX_PROJECTION)
					giInput.boxMin[0] = unity_SpecCube0_BoxMin;
				#endif
				#ifdef UNITY_SPECCUBE_BOX_PROJECTION
					giInput.boxMax[0] = unity_SpecCube0_BoxMax;
					giInput.probePosition[0] = unity_SpecCube0_ProbePosition;
					giInput.boxMax[1] = unity_SpecCube1_BoxMax;
					giInput.boxMin[1] = unity_SpecCube1_BoxMin;
					giInput.probePosition[1] = unity_SpecCube1_ProbePosition;
				#endif

				#if defined(_SPECULAR_SETUP)
					LightingStandardSpecular_GI( o, giInput, gi );
				#else
					LightingStandard_GI( o, giInput, gi );
				#endif

				#ifdef ASE_BAKEDGI
					gi.indirect.diffuse = BakedGI;
				#endif

				#if UNITY_SHOULD_SAMPLE_SH && !defined(LIGHTMAP_ON) && defined(ASE_NO_AMBIENT)
					gi.indirect.diffuse = 0;
				#endif

				#if defined(_SPECULAR_SETUP)
					outEmission = LightingStandardSpecular_Deferred( o, worldViewDir, gi, outGBuffer0, outGBuffer1, outGBuffer2 );
				#else
					outEmission = LightingStandard_Deferred( o, worldViewDir, gi, outGBuffer0, outGBuffer1, outGBuffer2 );
				#endif

				#if defined(SHADOWS_SHADOWMASK) && (UNITY_ALLOWED_MRT_COUNT > 4)
					outShadowMask = UnityGetRawBakedOcclusions (IN.lmap.xy, float3(0, 0, 0));
				#endif
				#ifndef UNITY_HDR_ON
					outEmission.rgb = exp2(-outEmission.rgb);
				#endif
			}
			ENDCG
		}

	
	}
	
	
	Dependency "LightMode"="ForwardBase"

	
}
/*ASEBEGIN
Version=18935
1920;12;1920;1017;2536.057;5927.257;1.3;True;False
Node;AmplifyShaderEditor.RangedFloatNode;2069;-1792,-4992;Half;False;Global;TVE_DEBUG_Min;TVE_DEBUG_Min;4;0;Create;True;0;5;Vertex Colors;100;Texture Coords;200;Vertex Postion;300;Vertex Normals;301;Vertex Tangents;302;0;True;2;Space(10);StyledEnum (Vertex Position _Vertex Normals _VertexTangents _Vertex Sign _Vertex Red (Variation) _Vertex Green (Occlusion) _Vertex Blue (Blend) _Vertex Alpha (Height) _Motion Bending _Motion Rolling _Motion Flutter);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2155;-1792,-5248;Half;False;Global;TVE_DEBUG_Layer;TVE_DEBUG_Layer;4;0;Create;True;0;5;Vertex Colors;100;Texture Coords;200;Vertex Postion;300;Vertex Normals;301;Vertex Tangents;302;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2013;-1792,-5312;Half;False;Global;TVE_DEBUG_Index;TVE_DEBUG_Index;4;0;Create;True;0;5;Vertex Colors;100;Texture Coords;200;Vertex Postion;300;Vertex Normals;301;Vertex Tangents;302;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1908;-1792,-5376;Half;False;Global;TVE_DEBUG_Type;TVE_DEBUG_Type;4;0;Create;True;0;5;Vertex Colors;100;Texture Coords;200;Vertex Postion;300;Vertex Normals;301;Vertex Tangents;302;0;True;2;Space(10);StyledEnum (Vertex Position _Vertex Normals _VertexTangents _Vertex Sign _Vertex Red (Variation) _Vertex Green (Occlusion) _Vertex Blue (Blend) _Vertex Alpha (Height) _Motion Bending _Motion Rolling _Motion Flutter);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1953;-1792,-5120;Half;False;Global;TVE_DEBUG_Filter;TVE_DEBUG_Filter;4;0;Create;True;0;5;Vertex Colors;100;Texture Coords;200;Vertex Postion;300;Vertex Normals;301;Vertex Tangents;302;0;True;2;Space(10);StyledEnum (Vertex Position _Vertex Normals _VertexTangents _Vertex Sign _Vertex Red (Variation) _Vertex Green (Occlusion) _Vertex Blue (Blend) _Vertex Alpha (Height) _Motion Bending _Motion Rolling _Motion Flutter);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2032;-1792,-5056;Half;False;Global;TVE_DEBUG_Clip;TVE_DEBUG_Clip;4;0;Create;True;0;5;Vertex Colors;100;Texture Coords;200;Vertex Postion;300;Vertex Normals;301;Vertex Tangents;302;0;True;2;Space(10);StyledEnum (Vertex Position _Vertex Normals _VertexTangents _Vertex Sign _Vertex Red (Variation) _Vertex Green (Occlusion) _Vertex Blue (Blend) _Vertex Alpha (Height) _Motion Bending _Motion Rolling _Motion Flutter);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2070;-1792,-4928;Half;False;Global;TVE_DEBUG_Max;TVE_DEBUG_Max;4;0;Create;True;0;5;Vertex Colors;100;Texture Coords;200;Vertex Postion;300;Vertex Normals;301;Vertex Tangents;302;0;True;2;Space(10);StyledEnum (Vertex Position _Vertex Normals _VertexTangents _Vertex Sign _Vertex Red (Variation) _Vertex Green (Occlusion) _Vertex Blue (Blend) _Vertex Alpha (Height) _Motion Bending _Motion Rolling _Motion Flutter);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1881;-1600,-5632;Half;False;Property;_Message;Message;73;0;Create;True;0;0;0;True;1;StyledMessage(Info, Use this shader to debug the original mesh or the converted mesh attributes., 0,0);False;0;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1804;-1792,2944;Inherit;False;Constant;_Float1;Float 1;0;0;Create;True;0;0;0;False;0;False;3;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SinOpNode;1800;-1472,2944;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1771;-1088,2944;Inherit;False;-1;;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;1843;-1632,2944;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1931;-1408,-5632;Half;False;Property;_DebugCategory;[ Debug Category ];72;0;Create;True;0;0;0;False;1;StyledCategory(Debug Settings, 5, 10);False;0;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1772;-1088,3072;Float;False;Constant;_Float3;Float 3;31;0;Create;True;0;0;0;False;0;False;24;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1878;-1792,-5632;Half;False;Property;_Banner;Banner;0;0;Create;True;0;0;0;True;1;StyledBanner(Debug);False;0;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;1803;-1344,2944;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;-1;False;2;FLOAT;1;False;3;FLOAT;0.3;False;4;FLOAT;0.7;False;1;FLOAT;0
Node;AmplifyShaderEditor.ConditionalIfNode;1774;-880,2944;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT;0;False;4;COLOR;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;2195;-1408,-5376;Inherit;False;Tool Debug;1;;66395;d48cde928c5068141abea1713047719b;0;7;336;FLOAT;0;False;465;FLOAT;0;False;884;FLOAT;0;False;337;FLOAT;0;False;624;FLOAT;0;False;720;FLOAT;0;False;722;FLOAT;0;False;1;COLOR;338
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2109;-896,-5376;Float;False;True;-1;2;;0;9;Hidden/BOXOPHOBIC/The Vegetation Engine/Helpers/Debug;ed95fe726fd7b4644bb42f4d1ddd2bcd;True;ForwardBase;0;1;ForwardBase;18;False;True;0;1;False;-1;0;False;-1;0;1;False;-1;0;False;-1;True;0;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;2;False;-1;False;True;True;True;True;True;0;False;-1;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;True;True;1;False;-1;True;3;False;-1;False;True;3;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;DisableBatching=True=DisableBatching;True;7;False;0;False;True;1;1;False;-1;0;False;-1;0;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=ForwardBase;False;False;0;;1;LightMode=ForwardBase;0;Standard;40;Workflow,InvertActionOnDeselection;1;0;Surface;0;0;  Blend;0;0;  Refraction Model;0;0;  Dither Shadows;1;0;Two Sided;0;0;Deferred Pass;1;0;Transmission;0;0;  Transmission Shadow;0.5,False,-1;0;Translucency;0;0;  Translucency Strength;1,False,-1;0;  Normal Distortion;0.5,False,-1;0;  Scattering;2,False,-1;0;  Direct;0.9,False,-1;0;  Ambient;0.1,False,-1;0;  Shadow;0.5,False,-1;0;Cast Shadows;0;0;  Use Shadow Threshold;0;0;Receive Shadows;0;0;GPU Instancing;0;0;LOD CrossFade;0;0;Built-in Fog;0;0;Ambient Light;0;0;Meta Pass;0;0;Add Pass;0;0;Override Baked GI;0;0;Extra Pre Pass;0;0;Tessellation;0;0;  Phong;0;0;  Strength;0.5,False,-1;0;  Type;0;0;  Tess;16,False,-1;0;  Min;10,False,-1;0;  Max;25,False,-1;0;  Edge Length;16,False,-1;0;  Max Displacement;25,False,-1;0;Fwd Specular Highlights Toggle;0;0;Fwd Reflections Toggle;0;0;Disable Batching;1;0;Vertex Position,InvertActionOnDeselection;1;0;0;6;False;True;False;True;False;False;False;;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2112;-896,-5376;Float;False;False;-1;2;ASEMaterialInspector;0;9;New Amplify Shader;ed95fe726fd7b4644bb42f4d1ddd2bcd;True;Meta;0;4;Meta;0;False;True;0;1;False;-1;0;False;-1;0;1;False;-1;0;False;-1;True;0;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;True;True;True;True;True;0;False;-1;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;True;1;False;-1;True;3;False;-1;False;True;3;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;DisableBatching=False=DisableBatching;True;2;False;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;-1;False;False;True;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;False;0;False;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2113;-896,-5376;Float;False;False;-1;2;ASEMaterialInspector;0;9;New Amplify Shader;ed95fe726fd7b4644bb42f4d1ddd2bcd;True;ShadowCaster;0;5;ShadowCaster;0;False;True;0;1;False;-1;0;False;-1;0;1;False;-1;0;False;-1;True;0;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;True;True;True;True;True;0;False;-1;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;True;1;False;-1;True;3;False;-1;False;True;3;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;DisableBatching=False=DisableBatching;True;2;False;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;False;True;False;False;False;False;False;False;False;False;False;False;True;1;False;-1;True;3;False;-1;False;True;1;LightMode=ShadowCaster;False;False;0;True;1;=;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2110;-896,-5376;Float;False;False;-1;2;ASEMaterialInspector;0;9;New Amplify Shader;ed95fe726fd7b4644bb42f4d1ddd2bcd;True;ForwardAdd;0;2;ForwardAdd;0;False;True;0;1;False;-1;0;False;-1;0;1;False;-1;0;False;-1;True;0;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;True;True;True;True;True;0;False;-1;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;True;1;False;-1;True;3;False;-1;False;True;3;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;DisableBatching=False=DisableBatching;True;2;False;0;False;True;4;1;False;-1;1;False;-1;0;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;-1;False;False;True;1;LightMode=ForwardAdd;False;False;0;True;1;LightMode=ForwardAdd;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2108;-896,-5376;Float;False;False;-1;2;ASEMaterialInspector;0;9;New Amplify Shader;ed95fe726fd7b4644bb42f4d1ddd2bcd;True;ExtraPrePass;0;0;ExtraPrePass;6;False;True;0;1;False;-1;0;False;-1;0;1;False;-1;0;False;-1;True;0;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;True;True;True;True;True;0;False;-1;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;True;1;False;-1;True;3;False;-1;False;True;3;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;DisableBatching=False=DisableBatching;True;2;False;0;False;True;1;1;False;-1;0;False;-1;0;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;True;True;True;True;0;False;-1;True;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;True;1;False;-1;True;3;False;-1;True;True;0;False;-1;0;False;-1;True;1;LightMode=ForwardBase;False;False;0;-1;59;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;LightMode=ForwardBase;=;=;=;=;=;=;=;=;=;=;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2111;-896,-5376;Float;False;False;-1;2;ASEMaterialInspector;0;9;New Amplify Shader;ed95fe726fd7b4644bb42f4d1ddd2bcd;True;Deferred;0;3;Deferred;0;False;True;0;1;False;-1;0;False;-1;0;1;False;-1;0;False;-1;True;0;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;True;True;True;True;True;0;False;-1;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;True;1;False;-1;True;3;False;-1;False;True;3;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;DisableBatching=False=DisableBatching;True;2;False;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;False;True;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Deferred;True;2;True;17;d3d9;d3d11_9x;d3d11;glcore;gles;gles3;metal;vulkan;xbox360;xboxone;xboxseries;ps4;playstation;psp2;n3ds;wiiu;switch;0;False;0;0;Standard;0;False;0
WireConnection;1800;0;1843;0
WireConnection;1843;0;1804;0
WireConnection;1803;0;1800;0
WireConnection;1774;0;1771;0
WireConnection;1774;1;1772;0
WireConnection;1774;3;1803;0
WireConnection;2195;336;1908;0
WireConnection;2195;465;2013;0
WireConnection;2195;884;2155;0
WireConnection;2195;337;1953;0
WireConnection;2195;624;2032;0
WireConnection;2195;720;2069;0
WireConnection;2195;722;2070;0
WireConnection;2109;2;2195;338
ASEEND*/
//CHKSM=0DCA6FCBE2F0760DD4F65CE88FE57AAE607335DC