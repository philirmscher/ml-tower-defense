// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "BOXOPHOBIC/The Vegetation Engine/Impostors/Vegetation Subsurface Lit (Spherical)"
{
    Properties
    {
		[HideInInspector] _EmissionColor("Emission Color", Color) = (1,1,1,1)
		[HideInInspector] _AlphaCutoff("Alpha Cutoff ", Range(0, 1)) = 0.5
		[StyledCategory(Impostor Settings, 5, 10)]_ImpostorCat("[ Impostor Cat ]", Float) = 0
		_Albedo("Impostor Albedo & Alpha", 2D) = "white" {}
		_Normals("Impostor Normal & Depth", 2D) = "white" {}
		[NoScaleOffset]_Mask("Impostor Baked Masks", 2D) = "white" {}
		[NoScaleOffset]_Emissive("Impostor Emissive Map", 2D) = "white" {}
		_AI_Parallax("Impostor Parallax", Range( 0 , 1)) = 1
		_AI_ShadowView("Impostor Shadow View", Range( 0 , 1)) = 1
		_AI_ShadowBias("Impostor Shadow Bias", Range( 0 , 2)) = 0.25
		_AI_TextureBias("Impostor Texture Bias", Float) = -1
		[HideInInspector]_AI_DepthSize("Impostor Depth Size", Float) = 0
		[HideInInspector]_AI_SizeOffset("Impostor Size Offset", Vector) = (0,0,0,0)
		[HideInInspector]_AI_Offset("Impostor Offset", Vector) = (0,0,0,0)
		[HideInInspector]_AI_ImpostorSize("Impostor Size", Float) = 0
		[HideInInspector]_AI_Frames("Impostor Frames", Float) = 0
		[HideInInspector]_AI_FramesY("Impostor Frames Y", Float) = 0
		[HideInInspector]_AI_FramesX("Impostor Frames X", Float) = 0
		[Enum(Off,0,On,1)]_RenderSpecular("Impostor Render Specular", Float) = 1
		[Enum(Off,0,On,1)]_RenderCoverage("Impostor Alpha To Mask", Float) = 0
		_AI_Clip("Impostor Clip", Range( 0 , 1)) = 0.5
		[HideInInspector]_RenderQueue("Render Queue", Float) = 0
		[HideInInspector]_RenderPriority("Render Priority", Float) = 0
		[Enum(Grass,0,Vegetation,1)][Space(10)]_VegetationMode("Impostor Mode", Float) = 1
		[HDR][Space(10)]_ImpostorBarkColor("Impostor Bark Color", Color) = (1,1,1,1)
		[HDR]_ImpostorLeafColor("Impostor Leaf Color", Color) = (1,1,1,1)
		_ImpostorBarkSaturationValue("Impostor Bark Saturation", Range( 0 , 1)) = 1
		_ImpostorLeafSaturationValue("Impostor Leaf Saturation", Range( 0 , 1)) = 1
		[HDR][Space(10)]_ImpostorGrassColor("Impostor Grass Color", Color) = (1,1,1,1)
		_ImpostorGrassSaturationValue("Impostor Grass Saturation", Range( 0 , 1)) = 1
		_ImpostorSmoothnessValue("Impostor Smoothness", Range( 0 , 1)) = 1
		[StyledCategory(Global Settings)]_CategoryGlobal("[ Category Global ]", Float) = 0
		[StyledEnum(TVELayers, Default 0 Layer_1 1 Layer_2 2 Layer_3 3 Layer_4 4 Layer_5 5 Layer_6 6 Layer_7 7 Layer_8 8, 0, 0)]_LayerColorsValue("Layer Colors", Float) = 0
		[StyledEnum(TVELayers, Default 0 Layer_1 1 Layer_2 2 Layer_3 3 Layer_4 4 Layer_5 5 Layer_6 6 Layer_7 7 Layer_8 8, 0, 0)]_LayerExtrasValue("Layer Extras", Float) = 0
		[StyledEnum(TVELayers, Default 0 Layer_1 1 Layer_2 2 Layer_3 3 Layer_4 4 Layer_5 5 Layer_6 6 Layer_7 7 Layer_8 8, 0, 0)]_LayerMotionValue("Layer Motion", Float) = 0
		[StyledEnum(TVELayers, Default 0 Layer_1 1 Layer_2 2 Layer_3 3 Layer_4 4 Layer_5 5 Layer_6 6 Layer_7 7 Layer_8 8, 0, 0)]_LayerVertexValue("Layer Vertex", Float) = 0
		[StyledSpace(10)]_SpaceGlobalLayers("# Space Global Layers", Float) = 0
		_GlobalColors("Global Color", Range( 0 , 1)) = 0
		_GlobalAlpha("Global Alpha", Range( 0 , 1)) = 1
		_GlobalOverlay("Global Overlay", Range( 0 , 1)) = 1
		_GlobalWetness("Global Wetness", Range( 0 , 1)) = 1
		_GlobalEmissive("Global Emissive", Range( 0 , 1)) = 1
		_GlobalSize("Global Size Fade", Range( 0 , 1)) = 1
		[StyledSpace(10)]_SpaceGlobalLocals("# Space Global Locals", Float) = 0
		[StyledRemapSlider(_ColorsMaskMinValue, _ColorsMaskMaxValue, 0, 1)]_ColorsMaskRemap("Color Mask", Vector) = (0,0,0,0)
		[HideInInspector]_ColorsMaskMinValue("Color Mask Min Value", Range( 0 , 1)) = 0
		[HideInInspector]_ColorsMaskMaxValue("Color Mask Max Value", Range( 0 , 1)) = 1
		_ColorsVariationValue("Color Variation", Range( 0 , 1)) = 0
		_AlphaVariationValue("Alpha Variation", Range( 0 , 1)) = 0
		[StyledRemapSlider(_OverlayMaskMinValue, _OverlayMaskMaxValue, 0, 1)]_OverlayMaskRemap("Overlay Mask", Vector) = (0,0,0,0)
		[HideInInspector]_OverlayMaskMinValue("Overlay Mask Min Value", Range( 0 , 1)) = 0.45
		[HideInInspector]_OverlayMaskMaxValue("Overlay Mask Max Value", Range( 0 , 1)) = 0.55
		_OverlayVariationValue("Overlay Variation", Range( 0 , 1)) = 0
		[StyledSpace(10)]_SpaceGlobalPosition("# Space Global Position", Float) = 0
		[StyledToggle]_ColorsPositionMode("Use Pivot Position for Colors", Float) = 0
		[StyledToggle]_ExtrasPositionMode("Use Pivot Position for Extras", Float) = 0
		[StyledCategory(Detail Settings)]_CategoryDetail("[ Category Detail ]", Float) = 0
		[Enum(Baked,0,Projection,1)]_DetailMode("Detail Mode", Float) = 0
		[Enum(Overlay,0,Replace,1)]_DetailBlendMode("Detail Blend", Float) = 1
		[StyledRemapSlider(_DetailBlendMinValue, _DetailBlendMaxValue,0,1)]_DetailBlendRemap("Detail Blending", Vector) = (0,0,0,0)
		[StyledCategory(Subsurface Settings)]_CategorySubsurface("[ Category Subsurface ]", Float) = 0
		_SubsurfaceValue("Subsurface Intensity", Range( 0 , 1)) = 1
		[HDR]_SubsurfaceColor("Subsurface Color", Color) = (0.4,0.4,0.1,1)
		[StyledRemapSlider(_SubsurfaceMaskMinValue, _SubsurfaceMaskMaxValue,0,1)]_SubsurfaceMaskRemap("Subsurface Mask", Vector) = (0,0,0,0)
		[HideInInspector]_SubsurfaceMaskMinValue("Subsurface Mask Min Value", Range( 0 , 1)) = 0
		[HideInInspector]_SubsurfaceMaskMaxValue("Subsurface Mask Max Value", Range( 0 , 1)) = 1
		[Space(10)][DiffusionProfile]_SubsurfaceDiffusion("Subsurface Diffusion", Float) = 0
		[HideInInspector][Space(10)][ASEDiffusionProfile(_SubsurfaceDiffusion)]_SubsurfaceDiffusion_asset("Subsurface Diffusion", Vector) = (0,0,0,0)
		[HideInInspector]_SubsurfaceDiffusion_Asset("Subsurface Diffusion", Vector) = (0,0,0,0)
		[Space(10)]_SubsurfaceScatteringValue("Subsurface Scattering", Range( 0 , 16)) = 2
		_SubsurfaceAngleValue("Subsurface Angle", Range( 1 , 16)) = 8
		_SubsurfaceNormalValue("Subsurface Normal", Range( 0 , 1)) = 0
		_SubsurfaceDirectValue("Subsurface Direct", Range( 0 , 1)) = 1
		_SubsurfaceAmbientValue("Subsurface Ambient", Range( 0 , 1)) = 0.2
		_SubsurfaceShadowValue("Subsurface Shadow", Range( 0 , 1)) = 1
		[StyledRemapSlider(_GradientMinValue, _GradientMaxValue, 0, 1)]_GradientMaskRemap("Gradient Mask", Vector) = (0,0,0,0)
		[StyledCategory(Noise Settings)]_CategoryNoise("[ Category Noise ]", Float) = 0
		[StyledRemapSlider(_NoiseMinValue, _NoiseMaxValue, 0, 1)]_NoiseMaskRemap("Noise Mask", Vector) = (0,0,0,0)
		[StyledCategory(Emissive Settings)]_CategoryEmissive("[ Category Emissive]", Float) = 0
		[Enum(None,0,Any,10,Baked,20,Realtime,30)]_EmissiveFlagMode("Emissive Baking", Float) = 0
		[HDR]_EmissiveColor("Emissive Color", Color) = (0,0,0,0)
		[StyledEmissiveIntensity]_EmissiveIntensityParams("Emissive Intensity", Vector) = (1,1,1,0)
		_EmissiveExposureValue("Emissive Weight", Range( 0 , 1)) = 1
		[StyledCategory(Fade Settings)]_CategorySizeFade("[ Category Size Fade ]", Float) = 0
		[StyledMessage(Info, The Size Fade feature is recommended to be used to fade out vegetation at a distance in combination with the LOD Groups or with a 3rd party culling system., _SizeFadeMode, 1, 0, 10)]_MessageSizeFade("# Message Size Fade", Float) = 0
		[StyledCategory(Motion Settings)]_CategoryMotion("[ Category Motion ]", Float) = 0
		_MotionAmplitude_10("Bending Amplitude", Range( 0 , 2)) = 0.2
		[IntRange]_MotionSpeed_10("Bending Speed", Range( 0 , 40)) = 2
		_MotionScale_10("Bending Scale", Range( 0 , 20)) = 0
		[Space(10)]_InteractionAmplitude("Interaction Amplitude", Range( 0 , 2)) = 1
		_InteractionMaskValue("Interaction Use Mask", Range( 0 , 1)) = 1
		[ASEEnd][StyledSpace(10)]_SpaceMotionLocals("# Space Motion Locals", Float) = 0
		[HideInInspector]_LayerReactValue("Legacy Layer React", Float) = 0
		[HideInInspector]_VertexPivotMode("Enable Pre Baked Pivots", Float) = 0
		[HideInInspector][StyledToggle]_VertexDynamicMode("Enable Dynamic Support", Float) = 0
		[HideInInspector]_IsTVEShader("_IsTVEShader", Float) = 1
		[HideInInspector]_IsImpostorShader("_IsImpostorShader", Float) = 1
		[HideInInspector]_IsInitialized("_IsInitialized", Float) = 0
		[HideInInspector]_IsVersion("_IsVersion", Float) = 650
		[HideInInspector]_IsSubsurfaceShader("_IsSubsurfaceShader", Float) = 1
		[HideInInspector]_IsVegetationShader("_IsVegetationShader", Float) = 1

    }

    SubShader
    {
		LOD 0

		
        Tags { "RenderPipeline"="HDRenderPipeline" "RenderType"="Opaque" "Queue"="Geometry" "ImpostorType"="Spherical" }
        
		Cull Back
		Blend One Zero
		ZTest LEqual
		ZWrite On
		ZClip [_ZClip]

		HLSLINCLUDE
		#pragma target 4.5
		#pragma only_renderers d3d11 metal vulkan xboxone xboxseries ps4 playstation switch 
		#pragma multi_compile_instancing
		#pragma instancing_options renderinglayer
		#pragma multi_compile _ LOD_FADE_CROSSFADE
		#define AI_RENDERPIPELINE

		struct GlobalSurfaceDescription
		{
			float3 Albedo;
			float3 Normal;
			float3 BentNormal;
			float3 Specular;
			float CoatMask;
			float Metallic;
			float3 Emission;
			float Smoothness;
			float Occlusion;
			float Alpha;
			float AlphaClipThreshold;
			float SpecularAAScreenSpaceVariance;
			float SpecularAAThreshold;
			float SpecularOcclusion;
			//Refraction
			float RefractionIndex;
			float3 RefractionColor;
			float RefractionDistance;
			//SSS/Translucent
			float Thickness;
			float SubsurfaceMask;
			float DiffusionProfile;
			//Anisotropy
			float Anisotropy;
			float3 Tangent;
			//Iridescent
			float IridescenceMask;
			float IridescenceThickness;
		};

		struct SurfaceOutput
		{
			half3 Albedo;
			half3 Specular;
			half Metallic;
			float3 Normal;
			half3 Emission;
			half Smoothness;
			half Occlusion;
			half Alpha;
		};

		struct AlphaSurfaceDescription
		{
			float Alpha;
			float AlphaClipThreshold;
		};

		struct SmoothSurfaceDescription
		{
			float Smoothness;
			float Alpha;
			float AlphaClipThreshold;
		};

		struct DistortionSurfaceDescription
		{
			float Alpha;
			float2 Distortion;
			float DistortionBlur;
			float AlphaClipThreshold;
		};
		ENDHLSL
		
		Pass
        {
			
            Name "GBuffer"
            Tags { "LightMode"="GBuffer" }
           
			Stencil
			{
				Ref 10
				WriteMask 14
				Comp Always
				Pass Replace
				Fail Keep
				ZFail Keep
			}

        
            HLSLPROGRAM

			#define _MATERIAL_FEATURE_TRANSMISSION 1
			#define _DISABLE_SSR 1
			#define ASE_SRP_VERSION 120100
			#ifdef UNITY_COLORSPACE_GAMMA//AI_SRP
			#define unity_ColorSpaceDielectricSpec half4(0.220916301, 0.220916301, 0.220916301, 1.0 - 0.220916301)//AI_SRP
			#else//AI_SRP
			#define unity_ColorSpaceDielectricSpec half4(0.04, 0.04, 0.04, 1.0 - 0.04) //AI_SRP
			#endif//AI_SRP


			#pragma vertex Vert
			#pragma fragment Frag 

			#if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define OUTPUT_SPLIT_LIGHTING
			#endif
        
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#if defined( ASE_SRP_VERSION ) && ASE_SRP_VERSION < 60900              
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Wind.hlsl"
			#endif
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
        
            #define SHADERPASS SHADERPASS_GBUFFER
            #pragma multi_compile _ LIGHTMAP_ON
            #pragma multi_compile _ DIRLIGHTMAP_COMBINED
            #pragma multi_compile _ DYNAMICLIGHTMAP_ON
            #pragma multi_compile _ SHADOWS_SHADOWMASK
            #pragma multi_compile DECALS_OFF DECALS_3RT DECALS_4RT
            #pragma multi_compile _ LIGHT_LAYERS
        
            #define VARYINGS_NEED_POSITION_WS
            #define VARYINGS_NEED_TANGENT_TO_WORLD
            #define VARYINGS_NEED_TEXCOORD1
            #define VARYINGS_NEED_TEXCOORD2
        
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"       
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"
            
			#if defined( ASE_SRP_VERSION ) && ASE_SRP_VERSION < 60900
			#define T2W(var, index) var.worldToTangent[index]
			#else
			#define T2W(var, index) var.tangentToWorld[index]
			#endif

			// BOXOPHOBIC: Moved Pragmas below the built-in ones to enable support for instanced indirect renderers
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/CommonLighting.hlsl"
			#define ai_ObjectToWorld GetObjectToWorldMatrix()
			#define ai_WorldToObject GetWorldToObjectMatrix()
			#define AI_INV_TWO_PI  INV_TWO_PI
			#define AI_PI          PI
			#define AI_INV_PI      INV_PI
			//TVE Pipeline Defines
			#define THE_VEGETATION_ENGINE
			#define TVE_IS_HD_PIPELINE
			//TVE Injection Defines
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END


			struct AttributesMesh 
			{
				float4 vertex : POSITION;
				float3 normal : NORMAL;
				float4 tangent : TANGENT;
				float4 texcoord : TEXCOORD0;
				float4 uv1 : TEXCOORD1;
				float4 uv2 : TEXCOORD2;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID

			};
        
			struct PackedVaryingsMeshToPS 
			{
				float4 positionCS : SV_Position;
				float3 interp00 : TEXCOORD0;
				float3 interp01 : TEXCOORD1;
				float4 interp02 : TEXCOORD2;
				float4 interp03 : TEXCOORD3;
				float4 interp04 : TEXCOORD4;
				float4 frameUVs99 : TEXCOORD5;
				float4 viewPos99 : TEXCOORD6;
				float4 ase_texcoord7 : TEXCOORD7;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			float4x4 unity_CameraProjection;
			float4x4 unity_CameraInvProjection;
			float4x4 unity_WorldToCamera;
			float4x4 unity_CameraToWorld;
			sampler2D _Albedo;
			sampler2D _Normals;
			half4 TVE_MotionParams;
			TEXTURE2D_ARRAY(TVE_MotionTex);
			half4 TVE_MotionCoords;
			SAMPLER(sampler_linear_repeat);
			float TVE_MotionUsage[10];
			half4 TVE_NoiseParams;
			half4 TVE_VertexParams;
			TEXTURE2D_ARRAY(TVE_VertexTex);
			half4 TVE_VertexCoords;
			float TVE_VertexUsage[10];
			half _DisableSRPBatcher;
			sampler2D _Mask;
			sampler2D _Emissive;
			half4 TVE_ColorsParams;
			TEXTURE2D_ARRAY(TVE_ColorsTex);
			half4 TVE_ColorsCoords;
			float TVE_ColorsUsage[10];
			half TVE_SubsurfaceValue;
			half3 TVE_MainLightDirection;
			half4 TVE_OverlayColor;
			half4 TVE_ExtrasParams;
			TEXTURE2D_ARRAY(TVE_ExtrasTex);
			half4 TVE_ExtrasCoords;
			float TVE_ExtrasUsage[10];
			CBUFFER_START( UnityPerMaterial )
			float4 _ImpostorGrassColor;
			half4 _SubsurfaceColor;
			float4 _ImpostorLeafColor;
			half4 _SubsurfaceMaskRemap;
			half4 _ColorsMaskRemap;
			float4 _ImpostorBarkColor;
			half4 _OverlayMaskRemap;
			half4 _EmissiveColor;
			half4 _DetailBlendRemap;
			float4 _AI_SizeOffset;
			float4 _NoiseMaskRemap;
			float4 _SubsurfaceDiffusion_Asset;
			float4 _SubsurfaceDiffusion_asset;
			float4 _GradientMaskRemap;
			float4 _EmissiveIntensityParams;
			float3 _AI_Offset;
			half _ImpostorLeafSaturationValue;
			half _ImpostorBarkSaturationValue;
			half _GlobalSize;
			half _MotionSpeed_10;
			half _InteractionMaskValue;
			half _InteractionAmplitude;
			half _MotionScale_10;
			half _MotionAmplitude_10;
			half _LayerMotionValue;
			float _AI_Clip;
			float _AI_ShadowView;
			float _AI_ShadowBias;
			half _LayerVertexValue;
			half _IsVegetationShader;
			half _VertexDynamicMode;
			half _ColorsPositionMode;
			half _GlobalWetness;
			half _ImpostorSmoothnessValue;
			half _GlobalEmissive;
			half _EmissiveExposureValue;
			half _OverlayMaskMaxValue;
			half _OverlayMaskMinValue;
			half _OverlayVariationValue;
			half _LayerExtrasValue;
			half _ImpostorGrassSaturationValue;
			half _ExtrasPositionMode;
			half _SubsurfaceMaskMaxValue;
			half _SubsurfaceMaskMinValue;
			half _SubsurfaceValue;
			half _ColorsMaskMaxValue;
			half _ColorsMaskMinValue;
			half _ColorsVariationValue;
			half _GlobalColors;
			half _LayerColorsValue;
			half _GlobalOverlay;
			float _AI_DepthSize;
			float _AI_ImpostorSize;
			float _AI_Parallax;
			half _SpaceGlobalLocals;
			half _SpaceGlobalPosition;
			half _SpaceGlobalLayers;
			half _SpaceMotionLocals;
			half _SubsurfaceAngleValue;
			half _DetailBlendMode;
			half _CategorySizeFade;
			half _IsImpostorShader;
			half _SubsurfaceScatteringValue;
			half _SubsurfaceAmbientValue;
			half _DetailMode;
			half _CategoryNoise;
			half _CategoryMotion;
			half _LayerReactValue;
			half _RenderQueue;
			half _IsTVEShader;
			half _CategoryGlobal;
			half _MessageSizeFade;
			half _SubsurfaceNormalValue;
			half _RenderPriority;
			half _SubsurfaceDirectValue;
			half _AlphaVariationValue;
			float _AI_FramesY;
			float _AI_FramesX;
			float _AI_Frames;
			half _RenderCoverage;
			float _RenderSpecular;
			half _IsSubsurfaceShader;
			half _ImpostorCat;
			float _AI_TextureBias;
			half _VertexPivotMode;
			half _SubsurfaceShadowValue;
			half _EmissiveFlagMode;
			float _IsVersion;
			half _CategorySubsurface;
			float _VegetationMode;
			half _CategoryEmissive;
			float _SubsurfaceDiffusion;
			half _CategoryDetail;
			half _IsInitialized;
			half _GlobalAlpha;
			CBUFFER_END


			inline void SphereImpostorVertex( inout float4 vertex, inout float3 normal, inout float4 frameUVs, inout float4 viewPos )
			{
				float2 uvOffset = _AI_SizeOffset.zw;
				float sizeX = _AI_FramesX;
				float sizeY = _AI_FramesY - 1; 
				float UVscale = _AI_ImpostorSize;
				float4 fractions = 1 / float4( sizeX, _AI_FramesY, sizeY, UVscale );
				float2 sizeFraction = fractions.xy;
				float axisSizeFraction = fractions.z;
				float fractionsUVscale = fractions.w;
				float3 worldOrigin = 0;
				float4 perspective = float4( 0, 0, 0, 1 );
				if( UNITY_MATRIX_P[ 3 ][ 3 ] == 1 )
				{
				perspective = float4( 0, 0, 5000, 0 );
				worldOrigin = ai_ObjectToWorld._m03_m13_m23;
				}
				float3 worldCameraPos = worldOrigin + mul( UNITY_MATRIX_I_V, perspective ).xyz;
				float3 objectCameraPosition = mul( ai_WorldToObject, float4( worldCameraPos, 1 ) ).xyz - _AI_Offset.xyz; 
				float3 objectCameraDirection = normalize( objectCameraPosition );
				float3 upVector = float3( 0,1,0 );
				float3 objectHorizontalVector = normalize( cross( objectCameraDirection, upVector ) );
				float3 objectVerticalVector = cross( objectHorizontalVector, objectCameraDirection );
				float verticalAngle = frac( atan2( -objectCameraDirection.z, -objectCameraDirection.x ) * AI_INV_TWO_PI ) * sizeX + 0.5;
				float verticalDot = dot( objectCameraDirection, upVector );
				float upAngle = ( acos( -verticalDot ) * AI_INV_PI ) + axisSizeFraction * 0.5f;
				float yRot = sizeFraction.x * AI_PI * verticalDot * ( 2 * frac( verticalAngle ) - 1 );
				float2 uvExpansion = vertex.xy;
				float cosY = cos( yRot );
				float sinY = sin( yRot );
				float2 uvRotator = mul( uvExpansion, float2x2( cosY, -sinY, sinY, cosY ) );
				float3 billboard = objectHorizontalVector * uvRotator.x + objectVerticalVector * uvRotator.y + _AI_Offset.xyz;
				float2 relativeCoords = float2( floor( verticalAngle ), min( floor( upAngle * sizeY ), sizeY ) );
				float2 frameUV = ( ( uvExpansion * fractionsUVscale + 0.5 ) + relativeCoords ) * sizeFraction;
				frameUVs.xy = frameUV - uvOffset;
				frameUVs.zw = 0;
				viewPos.w = 0;
				viewPos.xyz = TransformWorldToView( TransformObjectToWorld( billboard ) );
				vertex.xyz = billboard;
				normal.xyz = objectCameraDirection;
			}
			
			float3 ObjectPosition_UNITY_MATRIX_M(  )
			{
				return float3(UNITY_MATRIX_M[0].w, UNITY_MATRIX_M[1].w, UNITY_MATRIX_M[2].w );
			}
			
			inline void SphereImpostorFragment( inout SurfaceOutput o, out float4 clipPos, out float3 worldPos, float4 frameUV, float4 viewPos, out float4 output0, out float4 output1 )
			{
				#if _USE_PARALLAX_ON
				float4 parallaxSample = tex2Dbias( _Normals, float4(frameUV.xy, 0, -1) );
				frameUV.xy = ( ( 0.5 - parallaxSample.a ) * frameUV.zw ) + frameUV.xy;
				#endif
				float4 albedoSample = tex2Dbias( _Albedo, float4(frameUV.xy, 0, _AI_TextureBias) );
				o.Alpha = ( albedoSample.a - _AI_Clip );
				clip( o.Alpha );
				o.Albedo = albedoSample.rgb;
				#if defined(AI_HD_RENDERPIPELINE) && ( AI_HDRP_VERSION >= 50702 )
				float4 feat1 = _Features.SampleLevel( SamplerState_Point_Repeat, frameUV.xy, 0);
				o.Diffusion = feat1.rgb;
				o.Features = feat1.a;
				float4 test1 = _Specular.SampleLevel( SamplerState_Point_Repeat, frameUV.xy, 0);
				o.MetalTangent = test1.b;
				#endif
				output0 = tex2Dbias( _Mask, float4(frameUV.xy, 0, _AI_TextureBias) );
				output1 = tex2Dbias( _Emissive, float4(frameUV.xy, 0, _AI_TextureBias) );
				float4 normalSample = tex2Dbias( _Normals, float4(frameUV.xy, 0, _AI_TextureBias) );
				float4 remapNormal = normalSample * 2 - 1; 
				float3 worldNormal = normalize( mul( (float3x3)ai_ObjectToWorld, remapNormal.xyz ) );
				o.Normal = worldNormal;
				#if defined(UNITY_PASS_SHADOWCASTER) // Standard RP fix for deferred path
				float depth = remapNormal.a * _AI_DepthSize * 0.4999 * length( ai_ObjectToWorld[ 2 ].xyz );
				#else
				float depth = remapNormal.a * _AI_DepthSize * 0.5 * length( ai_ObjectToWorld[ 2 ].xyz );
				#endif
				#if ( defined(SHADERPASS) && (SHADERPASS == SHADERPASS_SHADOWS) ) || defined(UNITY_PASS_SHADOWCASTER)
				viewPos.z += depth * _AI_ShadowView;
				viewPos.z += -_AI_ShadowBias;
				#else 
				viewPos.z += depth;
				#endif
				worldPos = GetAbsolutePositionWS( mul( UNITY_MATRIX_I_V, float4( viewPos.xyz, 1 ) )).xyz;
				clipPos = mul( UNITY_MATRIX_P, float4( viewPos.xyz, 1 ) );
				#if defined(UNITY_PASS_SHADOWCASTER) && !defined(SHADERPASS)
				#if UNITY_REVERSED_Z
				clipPos.z = min( clipPos.z, clipPos.w * UNITY_NEAR_CLIP_VALUE );
				#else
				clipPos.z = max( clipPos.z, clipPos.w * UNITY_NEAR_CLIP_VALUE );
				#endif
				#endif
				clipPos.xyz /= clipPos.w;
				if( UNITY_NEAR_CLIP_VALUE < 0 )
				clipPos = clipPos * 0.5 + 0.5;
			}
			
			float3 ASEGetEmissionHDRColor(float3 ldrColor, float luminanceIntensity, float exposureWeight, float inverseCurrentExposureMultiplier)
			{
				float3 hdrColor = ldrColor * luminanceIntensity;
				hdrColor = lerp( hdrColor* inverseCurrentExposureMultiplier, hdrColor, exposureWeight);
				return hdrColor;
			}
			
    
			void BuildSurfaceData(FragInputs fragInputs, inout GlobalSurfaceDescription surfaceDescription, float3 V, out SurfaceData surfaceData, out float3 bentNormalWS)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);
        
				surfaceData.baseColor =                 surfaceDescription.Albedo;
				surfaceData.perceptualSmoothness =      surfaceDescription.Smoothness;
				#ifdef _SPECULAR_OCCLUSION_CUSTOM
					surfaceData.specularOcclusion =         surfaceDescription.SpecularOcclusion;
				#endif
				surfaceData.ambientOcclusion =          surfaceDescription.Occlusion;
				surfaceData.metallic =                  surfaceDescription.Metallic;
				surfaceData.coatMask =                  surfaceDescription.CoatMask;
			
				// BOXOPHOBIC: Added support for Diffusion
				#if defined( _MATERIAL_FEATURE_SUBSURFACE_SCATTERING ) || defined( _MATERIAL_FEATURE_TRANSMISSION )
					surfaceData.diffusionProfileHash = asuint(surfaceDescription.DiffusionProfile);
				#endif

				#ifdef _MATERIAL_FEATURE_IRIDESCENCE		
					surfaceData.iridescenceMask =           surfaceDescription.IridescenceMask;
					surfaceData.iridescenceThickness =      surfaceDescription.IridescenceThickness;
				#endif

					surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;
				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
					surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
				#endif
				#ifdef _MATERIAL_FEATURE_TRANSMISSION
					surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
				#endif
				#ifdef _MATERIAL_FEATURE_ANISOTROPY
					surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;
				#endif

				#ifdef ASE_LIT_CLEAR_COAT
					surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
				#endif

				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
					surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
				#endif
				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
					surfaceData.specularColor = surfaceDescription.Specular;
					surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
				#endif
        
				#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
					surfaceData.baseColor *= (1.0 - Max3(surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b));
				#endif
        
					GetNormalWS( fragInputs, float3( 0.0, 0.0, 1.0 ), surfaceData.normalWS, float3( 1.0, 1.0, 1.0 ) );
        
					bentNormalWS = surfaceData.normalWS;
			
				#ifdef ASE_BENT_NORMAL
					GetNormalWS(fragInputs, surfaceDescription.BentNormal, bentNormalWS, float3( 1, 1, 1 ) );
				#endif
			
				surfaceData.geomNormalWS = T2W(fragInputs, 2);

				#if defined(_HAS_REFRACTION) || defined(_MATERIAL_FEATURE_TRANSMISSION)
					surfaceData.thickness =	                 surfaceDescription.Thickness;
				#endif

				#ifdef _HAS_REFRACTION
					if (_EnableSSRefraction)
					{
						surfaceData.ior =                       surfaceDescription.RefractionIndex;
						surfaceData.transmittanceColor =        surfaceDescription.RefractionColor;
						surfaceData.atDistance =                surfaceDescription.RefractionDistance;
        
						surfaceData.transmittanceMask = (1.0 - surfaceDescription.Alpha);
						surfaceDescription.Alpha = 1.0;
					}
					else
					{
						surfaceData.ior = 1.0;
						surfaceData.transmittanceColor = float3(1.0, 1.0, 1.0);
						surfaceData.atDistance = 1.0;
						surfaceData.transmittanceMask = 0.0;
						surfaceDescription.Alpha = 1.0;
					}
				#else
					surfaceData.ior = 1.0;
					surfaceData.transmittanceColor = float3(1.0, 1.0, 1.0);
					surfaceData.atDistance = 1.0;
					surfaceData.transmittanceMask = 0.0;
				#endif

				#if defined(_HAS_REFRACTION) || defined(_MATERIAL_FEATURE_TRANSMISSION)
					surfaceData.thickness =	                 surfaceDescription.Thickness;
				#endif

				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
					surfaceData.subsurfaceMask =            surfaceDescription.SubsurfaceMask;
					surfaceData.diffusionProfile =          surfaceDescription.DiffusionProfile;
				#endif

					surfaceData.tangentWS = normalize(T2W(fragInputs, 0).xyz);    // The tangent is not normalize in worldToTangent for mikkt. TODO: Check if it expected that we normalize with Morten. Tag: SURFACE_GRADIENT
				#ifdef _MATERIAL_FEATURE_ANISOTROPY	
					surfaceData.anisotropy = surfaceDescription.Anisotropy;
					surfaceData.tangentWS = TransformTangentToWorld(surfaceDescription.Tangent, fragInputs.worldToTangent);
				#endif
					surfaceData.tangentWS = Orthonormalize(surfaceData.tangentWS, surfaceData.normalWS);
			
				#if defined(_SPECULAR_OCCLUSION_CUSTOM)
				#elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
					surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO(V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness(surfaceData.perceptualSmoothness));
				#elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
					surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion(ClampNdotV(dot(surfaceData.normalWS, V)), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness(surfaceData.perceptualSmoothness));
				#else
					surfaceData.specularOcclusion = 1.0;
				#endif
				#ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
					surfaceData.perceptualSmoothness = GeometricNormalFiltering(surfaceData.perceptualSmoothness, T2W(fragInputs, 2), surfaceDescription.SpecularAAScreenSpaceVariance, surfaceDescription.SpecularAAThreshold);
				#endif
			}
        
			void GetSurfaceAndBuiltinData(GlobalSurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				//#ifdef LOD_FADE_CROSSFADE
				//	uint3 fadeMaskSeed = asuint((int3)(V * _ScreenSize.xyx));
				//	LODDitheringTransition(fadeMaskSeed, unity_LODFade.x);
				//#endif

				#ifdef _ALPHATEST_ON
					DoAlphaTest(surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold);
				#endif

				float3 bentNormalWS;
				BuildSurfaceData(fragInputs, surfaceDescription, V, surfaceData, bentNormalWS);
        
				#if HAVE_DECALS
				if( _EnableDecals )
				{
					DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, surfaceDescription.Alpha);
					ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData);
				}
				#endif

				#if defined( ASE_SRP_VERSION ) && ASE_SRP_VERSION <= 50702
					InitBuiltinData( surfaceDescription.Alpha, bentNormalWS, -T2W(fragInputs, 2), fragInputs.positionRWS, fragInputs.texCoord1, fragInputs.texCoord2, builtinData );
				#else
					InitBuiltinData( posInput, surfaceDescription.Alpha, bentNormalWS, -T2W(fragInputs, 2), fragInputs.texCoord1, fragInputs.texCoord2, builtinData );
				#endif
        
				builtinData.emissiveColor = surfaceDescription.Emission;
        
				builtinData.depthOffset = 0.0;
        
				#if (SHADERPASS == SHADERPASS_DISTORTION)
					builtinData.distortion = surfaceDescription.Distortion;
					builtinData.distortionBlur = surfaceDescription.DistortionBlur;
				#else
					builtinData.distortion = float2(0.0, 0.0);
					builtinData.distortionBlur = 0.0;
				#endif
        
				PostInitBuiltinData(V, posInput, surfaceData, builtinData);
			}
        
			PackedVaryingsMeshToPS Vert(AttributesMesh inputMesh )
			{
				PackedVaryingsMeshToPS outputPackedVaryingsMeshToPS;

				UNITY_SETUP_INSTANCE_ID( inputMesh );
				UNITY_TRANSFER_INSTANCE_ID( inputMesh, outputPackedVaryingsMeshToPS );
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( outputPackedVaryingsMeshToPS );

				SphereImpostorVertex( inputMesh.vertex, inputMesh.normal, outputPackedVaryingsMeshToPS.frameUVs99, outputPackedVaryingsMeshToPS.viewPos99 );
				float3 viewToObj3965_g69600 = mul( GetWorldToObjectMatrix(), mul( UNITY_MATRIX_I_V , float4( outputPackedVaryingsMeshToPS.viewPos99.xyz, 1 ) ) ).xyz;
				float3 VertexPosition3564_g69600 = viewToObj3965_g69600;
				half3 VertexPos40_g69645 = VertexPosition3564_g69600;
				float3 appendResult74_g69645 = (float3(VertexPos40_g69645.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g69645 = appendResult74_g69645;
				float3 break84_g69645 = VertexPos40_g69645;
				float3 appendResult81_g69645 = (float3(0.0 , break84_g69645.y , break84_g69645.z));
				half3 VertexPosOtherAxis82_g69645 = appendResult81_g69645;
				float4 temp_output_91_19_g69623 = TVE_MotionCoords;
				float3 localObjectPosition_UNITY_MATRIX_M14_g69635 = ObjectPosition_UNITY_MATRIX_M();
				#ifdef SHADEROPTIONS_CAMERA_RELATIVE_RENDERING
				float3 staticSwitch13_g69635 = ( localObjectPosition_UNITY_MATRIX_M14_g69635 + _WorldSpaceCameraPos );
				#else
				float3 staticSwitch13_g69635 = localObjectPosition_UNITY_MATRIX_M14_g69635;
				#endif
				half3 ObjectData20_g69636 = staticSwitch13_g69635;
				float3 ase_worldPos = GetAbsolutePositionWS( TransformObjectToWorld( (inputMesh.vertex).xyz ) );
				half3 WorldData19_g69636 = ase_worldPos;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g69636 = WorldData19_g69636;
				#else
				float3 staticSwitch14_g69636 = ObjectData20_g69636;
				#endif
				float3 temp_output_114_0_g69635 = staticSwitch14_g69636;
				float3 vertexToFrag4543_g69600 = temp_output_114_0_g69635;
				float3 ObjectPosition4422_g69600 = vertexToFrag4543_g69600;
				half2 UV94_g69623 = ( (temp_output_91_19_g69623).zw + ( (temp_output_91_19_g69623).xy * (ObjectPosition4422_g69600).xz ) );
				float temp_output_84_0_g69623 = _LayerMotionValue;
				float4 lerpResult107_g69623 = lerp( TVE_MotionParams , saturate( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_MotionTex, sampler_linear_repeat, UV94_g69623,temp_output_84_0_g69623, 0.0 ) ) , TVE_MotionUsage[(int)temp_output_84_0_g69623]);
				half4 Global_Motion_Params4344_g69600 = lerpResult107_g69623;
				float4 break322_g69639 = Global_Motion_Params4344_g69600;
				float3 appendResult397_g69639 = (float3(break322_g69639.x , 0.0 , break322_g69639.y));
				float3 temp_output_398_0_g69639 = (appendResult397_g69639*2.0 + -1.0);
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				half2 Motion_DirectionOS39_g69600 = (( mul( GetWorldToObjectMatrix(), float4( temp_output_398_0_g69639 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_DirectionOS358_g69627 = Motion_DirectionOS39_g69600;
				float temp_output_3572_0_g69600 = saturate( VertexPosition3564_g69600.y );
				half Mesh_Motion_1082_g69600 = ( temp_output_3572_0_g69600 * 2.0 );
				half Wind_Power369_g69639 = break322_g69639.z;
				half Motion_WindPower2223_g69600 = Wind_Power369_g69639;
				half3 Input_Position419_g69643 = -ObjectPosition4422_g69600;
				half2 Motion_DirectionWS4464_g69600 = (temp_output_398_0_g69639).xz;
				half2 Input_DirectionWS423_g69643 = Motion_DirectionWS4464_g69600;
				float Motion_Scale287_g69643 = ( _MotionScale_10 + 0.2 );
				half Global_Scale448_g69643 = TVE_NoiseParams.x;
				half Input_Speed62_g69643 = _MotionSpeed_10;
				half Global_Speed449_g69643 = TVE_NoiseParams.y;
				float mulTime426_g69643 = _TimeParameters.x * ( Input_Speed62_g69643 * Global_Speed449_g69643 );
				half Global_DistScale561_g69643 = TVE_NoiseParams.w;
				float3 break461_g69643 = ( Input_Position419_g69643 * Global_DistScale561_g69643 );
				half Global_DistAmplitude559_g69643 = TVE_NoiseParams.z;
				float Noise_Distortion469_g69643 = ( sin( ( break461_g69643.x + break461_g69643.z ) ) * Global_DistAmplitude559_g69643 );
				half Motion_Variation284_g69643 = 0.0;
				float2 temp_output_425_0_g69643 = ( ( (Input_Position419_g69643).xz * Input_DirectionWS423_g69643 * Motion_Scale287_g69643 * Global_Scale448_g69643 ) + ( mulTime426_g69643 + Noise_Distortion469_g69643 + Motion_Variation284_g69643 ) );
				float2 break500_g69643 = ( temp_output_425_0_g69643 * 0.1178 );
				float2 break494_g69643 = ( temp_output_425_0_g69643 * 0.1742 );
				half Input_WindPower327_g69643 = Motion_WindPower2223_g69600;
				float lerpResult430_g69643 = lerp( 1.4 , 0.4 , Input_WindPower327_g69643);
				half Global_MotionNoise34_g69600 = (pow( (( sin( ( break500_g69643.x + break500_g69643.y ) ) * sin( ( break494_g69643.x + break494_g69643.y ) ) )*0.4 + 0.6) , lerpResult430_g69643 )*1.2 + -0.2);
				half Motion_10_Amplitude2258_g69600 = ( _MotionAmplitude_10 * Mesh_Motion_1082_g69600 * Motion_WindPower2223_g69600 * Global_MotionNoise34_g69600 );
				half Input_BendingAmplitude376_g69627 = Motion_10_Amplitude2258_g69600;
				half Input_InteractionAmplitude58_g69627 = _InteractionAmplitude;
				half Input_MeshMotion_10321_g69627 = Mesh_Motion_1082_g69600;
				half Input_InteractionUseMask62_g69627 = _InteractionMaskValue;
				float lerpResult371_g69627 = lerp( 2.0 , Input_MeshMotion_10321_g69627 , Input_InteractionUseMask62_g69627);
				half ObjectData20_g69628 = lerpResult371_g69627;
				half WorldData19_g69628 = Input_MeshMotion_10321_g69627;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g69628 = WorldData19_g69628;
				#else
				float staticSwitch14_g69628 = ObjectData20_g69628;
				#endif
				half Motion_10_Interaction373_g69627 = ( Input_InteractionAmplitude58_g69627 * staticSwitch14_g69628 );
				half Interaction_Mask66_g69600 = ( break322_g69639.w * break322_g69639.w );
				float Input_InteractionMask330_g69627 = Interaction_Mask66_g69600;
				float lerpResult360_g69627 = lerp( Input_BendingAmplitude376_g69627 , Motion_10_Interaction373_g69627 , saturate( ( Input_InteractionAmplitude58_g69627 * Input_InteractionMask330_g69627 ) ));
				float2 break364_g69627 = ( Input_DirectionOS358_g69627 * lerpResult360_g69627 );
				half Motion_10_BendingZ190_g69600 = break364_g69627.y;
				half Angle44_g69645 = Motion_10_BendingZ190_g69600;
				half3 VertexPos40_g69642 = ( VertexPosRotationAxis50_g69645 + ( VertexPosOtherAxis82_g69645 * cos( Angle44_g69645 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g69645 ) * sin( Angle44_g69645 ) ) );
				float3 appendResult74_g69642 = (float3(0.0 , 0.0 , VertexPos40_g69642.z));
				half3 VertexPosRotationAxis50_g69642 = appendResult74_g69642;
				float3 break84_g69642 = VertexPos40_g69642;
				float3 appendResult81_g69642 = (float3(break84_g69642.x , break84_g69642.y , 0.0));
				half3 VertexPosOtherAxis82_g69642 = appendResult81_g69642;
				half Motion_10_BendingX216_g69600 = break364_g69627.x;
				half Angle44_g69642 = -Motion_10_BendingX216_g69600;
				float3 Vertex_Motion_Object833_g69600 = ( VertexPosRotationAxis50_g69642 + ( VertexPosOtherAxis82_g69642 * cos( Angle44_g69642 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g69642 ) * sin( Angle44_g69642 ) ) );
				float4 temp_output_94_19_g69606 = TVE_VertexCoords;
				half2 UV97_g69606 = ( (temp_output_94_19_g69606).zw + ( (temp_output_94_19_g69606).xy * (ObjectPosition4422_g69600).xz ) );
				float temp_output_84_0_g69606 = _LayerVertexValue;
				float4 lerpResult109_g69606 = lerp( TVE_VertexParams , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_VertexTex, sampler_linear_repeat, UV97_g69606,temp_output_84_0_g69606, 0.0 ) , TVE_VertexUsage[(int)temp_output_84_0_g69606]);
				half4 Global_Vertex_Params4413_g69600 = lerpResult109_g69606;
				half Global_VertexTex_Size174_g69600 = saturate( Global_Vertex_Params4413_g69600.w );
				float lerpResult346_g69600 = lerp( 1.0 , Global_VertexTex_Size174_g69600 , _GlobalSize);
				float3 appendResult3480_g69600 = (float3(lerpResult346_g69600 , lerpResult346_g69600 , lerpResult346_g69600));
				half3 Vertex_Size1741_g69600 = appendResult3480_g69600;
				half3 _Vector5 = half3(1,1,1);
				float3 Vertex_SizeFade1740_g69600 = _Vector5;
				half IsInitialized3811_g69600 = _IsInitialized;
				float3 Final_VertexPosition890_g69600 = ( ( ( ( Vertex_Motion_Object833_g69600 * Vertex_Size1741_g69600 * Vertex_SizeFade1740_g69600 ) - VertexPosition3564_g69600 ) * IsInitialized3811_g69600 ) + _DisableSRPBatcher );
				
				outputPackedVaryingsMeshToPS.ase_texcoord7.xyz = vertexToFrag4543_g69600;
				
				
				//setting value to unused interpolator channels and avoid initialization warnings
				outputPackedVaryingsMeshToPS.ase_texcoord7.w = 0;
				inputMesh.vertex.xyz += Final_VertexPosition890_g69600;

				float3 positionRWS = TransformObjectToWorld(inputMesh.vertex.xyz );
				float3 normalWS = TransformObjectToWorldNormal(inputMesh.normal );
				float4 tangentWS = float4(TransformObjectToWorldDir(inputMesh.tangent.xyz), inputMesh.tangent.w);

				outputPackedVaryingsMeshToPS.positionCS = TransformWorldToHClip(positionRWS);
				outputPackedVaryingsMeshToPS.interp00.xyz =	positionRWS;
				outputPackedVaryingsMeshToPS.interp01.xyz =	normalWS;
				outputPackedVaryingsMeshToPS.interp02.xyzw = tangentWS;
				outputPackedVaryingsMeshToPS.interp03.xyzw = inputMesh.uv1;
				outputPackedVaryingsMeshToPS.interp04.xyzw = inputMesh.uv2;
			
				return outputPackedVaryingsMeshToPS;
			}

			void Frag(  PackedVaryingsMeshToPS packedInput,	OUTPUT_GBUFFER(outGBuffer), out float outputDepth : SV_Depth  )
			{
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( packedInput );
				UNITY_SETUP_INSTANCE_ID( packedInput );
				
				#ifdef LOD_FADE_CROSSFADE
				float3 VC = GetWorldSpaceNormalizeViewDir(packedInput.interp00.xyz);
				LODDitheringTransition(ComputeFadeMaskSeed(VC, packedInput.positionCS.xy), unity_LODFade.x);
				#endif

				FragInputs input;

				ZERO_INITIALIZE( FragInputs, input );
				GlobalSurfaceDescription surfaceDescription = (GlobalSurfaceDescription)0;
				SurfaceOutput o = (SurfaceOutput)0;

				o.Normal = float3( 0, 0, 1 );
				float4 clipPos = 0;
				float3 worldPos = 0;

				half Vegetation_Type4515_g69600 = _VegetationMode;
				float4 output0 = 0;
				float4 output1 = 0;
				SphereImpostorFragment( o, clipPos, worldPos, packedInput.frameUVs99, packedInput.viewPos99, output0, output1 );
				half3 Main_Albedo_Raw4295_g69600 = o.Albedo;
				float dotResult4302_g69600 = dot( float3(0.2126,0.7152,0.0722) , Main_Albedo_Raw4295_g69600 );
				float3 temp_cast_0 = (dotResult4302_g69600).xxx;
				float4 break3589_g69600 = output0;
				half Main_Mask_Leaves3712_g69600 = break3589_g69600.g;
				float lerpResult4305_g69600 = lerp( _ImpostorBarkSaturationValue , _ImpostorLeafSaturationValue , Main_Mask_Leaves3712_g69600);
				float3 lerpResult4303_g69600 = lerp( temp_cast_0 , Main_Albedo_Raw4295_g69600 , lerpResult4305_g69600);
				float4 lerpResult4310_g69600 = lerp( _ImpostorBarkColor , _ImpostorLeafColor , Main_Mask_Leaves3712_g69600);
				float dotResult4323_g69600 = dot( float3(0.2126,0.7152,0.0722) , Main_Albedo_Raw4295_g69600 );
				float3 temp_cast_2 = (dotResult4323_g69600).xxx;
				float3 lerpResult4317_g69600 = lerp( temp_cast_2 , Main_Albedo_Raw4295_g69600 , _ImpostorGrassSaturationValue);
				float3 ifLocalVar18_g69633 = 0;
				UNITY_BRANCH 
				if( Vegetation_Type4515_g69600 > 0.5 )
				ifLocalVar18_g69633 = ( lerpResult4303_g69600 * (lerpResult4310_g69600).rgb );
				else if( Vegetation_Type4515_g69600 < 0.5 )
				ifLocalVar18_g69633 = ( lerpResult4317_g69600 * (_ImpostorGrassColor).rgb );
				half3 Main_Albedo3817_g69600 = ifLocalVar18_g69633;
				half3 Blend_Albedo4137_g69600 = Main_Albedo3817_g69600;
				half3 Blend_AlbedoTinted3958_g69600 = ( Blend_Albedo4137_g69600 * float3(1,1,1) );
				float dotResult4002_g69600 = dot( Blend_AlbedoTinted3958_g69600 , float3(0.2126,0.7152,0.0722) );
				float3 temp_cast_3 = (dotResult4002_g69600).xxx;
				float4 temp_output_91_19_g69619 = TVE_ColorsCoords;
				float3 temp_output_3563_0_g69600 = worldPos;
				float3 WorldPosition4027_g69600 = temp_output_3563_0_g69600;
				float3 vertexToFrag4543_g69600 = packedInput.ase_texcoord7.xyz;
				float3 ObjectPosition4422_g69600 = vertexToFrag4543_g69600;
				float3 lerpResult4478_g69600 = lerp( WorldPosition4027_g69600 , ObjectPosition4422_g69600 , _ColorsPositionMode);
				half2 UV94_g69619 = ( (temp_output_91_19_g69619).zw + ( (temp_output_91_19_g69619).xy * (lerpResult4478_g69600).xz ) );
				float temp_output_82_0_g69619 = _LayerColorsValue;
				float4 lerpResult108_g69619 = lerp( TVE_ColorsParams , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_ColorsTex, sampler_linear_repeat, UV94_g69619,temp_output_82_0_g69619, 0.0 ) , TVE_ColorsUsage[(int)temp_output_82_0_g69619]);
				half Global_ColorsTex_A1701_g69600 = saturate( (lerpResult108_g69619).a );
				half Global_Colors_Influence3998_g69600 = Global_ColorsTex_A1701_g69600;
				float3 lerpResult4004_g69600 = lerp( Blend_AlbedoTinted3958_g69600 , temp_cast_3 , Global_Colors_Influence3998_g69600);
				half3 Global_ColorsTex_RGB1700_g69600 = (lerpResult108_g69619).rgb;
				half3 Global_Colors3856_g69600 = ( Global_ColorsTex_RGB1700_g69600 * 4.594794 );
				float3 break111_g69647 = ObjectPosition4422_g69600;
				half Global_DynamicMode4535_g69600 = _VertexDynamicMode;
				half Input_DynamicMode120_g69647 = Global_DynamicMode4535_g69600;
				half Main_Variation_Or_Metallic3607_g69600 = break3589_g69600.r;
				half Input_Variation124_g69647 = Main_Variation_Or_Metallic3607_g69600;
				half ObjectData20_g69648 = frac( ( ( ( break111_g69647.x + break111_g69647.y + break111_g69647.z ) * ( 1.0 - Input_DynamicMode120_g69647 ) ) + Input_Variation124_g69647 ) );
				half WorldData19_g69648 = Input_Variation124_g69647;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g69648 = WorldData19_g69648;
				#else
				float staticSwitch14_g69648 = ObjectData20_g69648;
				#endif
				float clampResult129_g69647 = clamp( staticSwitch14_g69648 , 0.01 , 0.99 );
				half Global_MeshVariation4531_g69600 = clampResult129_g69647;
				float lerpResult4092_g69600 = lerp( 1.0 , ( Global_MeshVariation4531_g69600 * Global_MeshVariation4531_g69600 ) , _ColorsVariationValue);
				half Global_Colors_Value3999_g69600 = ( _GlobalColors * lerpResult4092_g69600 );
				half Main_Height_Or_Blend3609_g69600 = break3589_g69600.b;
				float temp_output_7_0_g69641 = _ColorsMaskMinValue;
				half Global_Colors_Mask4022_g69600 = ( saturate( ( ( Main_Height_Or_Blend3609_g69600 - temp_output_7_0_g69641 ) / ( _ColorsMaskMaxValue - temp_output_7_0_g69641 ) ) ) * Main_Mask_Leaves3712_g69600 );
				float3 lerpResult4007_g69600 = lerp( Blend_AlbedoTinted3958_g69600 , ( lerpResult4004_g69600 * Global_Colors3856_g69600 ) , ( Global_Colors_Value3999_g69600 * Global_Colors_Mask4022_g69600 ));
				float3 lerpResult4086_g69600 = lerp( Blend_Albedo4137_g69600 , lerpResult4007_g69600 , Main_Mask_Leaves3712_g69600);
				half3 Blend_AlbedoColored3711_g69600 = lerpResult4086_g69600;
				float3 temp_output_3681_0_g69600 = (_SubsurfaceColor).rgb;
				float dotResult4019_g69600 = dot( temp_output_3681_0_g69600 , float3(0.2126,0.7152,0.0722) );
				float3 temp_cast_6 = (dotResult4019_g69600).xxx;
				float3 lerpResult4018_g69600 = lerp( temp_output_3681_0_g69600 , temp_cast_6 , Global_Colors_Influence3998_g69600);
				float3 lerpResult4017_g69600 = lerp( temp_output_3681_0_g69600 , ( lerpResult4018_g69600 * Global_Colors3856_g69600 ) , ( Global_Colors_Value3999_g69600 * Global_Colors_Mask4022_g69600 ));
				half3 Subsurface_Color3656_g69600 = lerpResult4017_g69600;
				half Global_Subsurface4111_g69600 = TVE_SubsurfaceValue;
				half Subsurface_Intensity3684_g69600 = ( _SubsurfaceValue * Global_Subsurface4111_g69600 );
				float temp_output_7_0_g69618 = _SubsurfaceMaskMinValue;
				half Subsurface_Mask3666_g69600 = ( saturate( ( ( Main_Height_Or_Blend3609_g69600 - temp_output_7_0_g69618 ) / ( _SubsurfaceMaskMaxValue - temp_output_7_0_g69618 ) ) ) * Main_Mask_Leaves3712_g69600 );
				half3 Subsurface_Transmission3659_g69600 = ( Subsurface_Color3656_g69600 * Subsurface_Intensity3684_g69600 * Subsurface_Mask3666_g69600 );
				half3 MainLight_Direction4110_g69600 = TVE_MainLightDirection;
				float3 ase_worldPos = GetAbsolutePositionWS( packedInput.interp00 );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 normalizeResult3635_g69600 = normalize( ase_worldViewDir );
				float dotResult3631_g69600 = dot( -MainLight_Direction4110_g69600 , normalizeResult3635_g69600 );
				float saferPower3620_g69600 = abs( saturate( dotResult3631_g69600 ) );
				#ifdef UNITY_PASS_FORWARDADD
				float staticSwitch3636_g69600 = 0.0;
				#else
				float staticSwitch3636_g69600 = ( pow( saferPower3620_g69600 , _SubsurfaceAngleValue ) * _SubsurfaceScatteringValue );
				#endif
				half Mask_Subsurface_View3614_g69600 = staticSwitch3636_g69600;
				half3 Subsurface_Approximation3702_g69600 = ( Subsurface_Transmission3659_g69600 * Blend_AlbedoColored3711_g69600 * Mask_Subsurface_View3614_g69600 );
				half3 Albedo_Subsurface3874_g69600 = ( Blend_AlbedoColored3711_g69600 + Subsurface_Approximation3702_g69600 );
				half3 Global_OverlayColor1758_g69600 = (TVE_OverlayColor).rgb;
				half3 World_Normal3638_g69600 = o.Normal;
				float lerpResult4521_g69600 = lerp( Main_Height_Or_Blend3609_g69600 , World_Normal3638_g69600.y , Vegetation_Type4515_g69600);
				half Main_AlbedoTex_G3807_g69600 = Main_Albedo_Raw4295_g69600.y;
				float4 temp_output_93_19_g69601 = TVE_ExtrasCoords;
				float3 lerpResult4483_g69600 = lerp( WorldPosition4027_g69600 , ObjectPosition4422_g69600 , _ExtrasPositionMode);
				half2 UV96_g69601 = ( (temp_output_93_19_g69601).zw + ( (temp_output_93_19_g69601).xy * (lerpResult4483_g69600).xz ) );
				float temp_output_84_0_g69601 = _LayerExtrasValue;
				float4 lerpResult109_g69601 = lerp( TVE_ExtrasParams , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_ExtrasTex, sampler_linear_repeat, UV96_g69601,temp_output_84_0_g69601, 0.0 ) , TVE_ExtrasUsage[(int)temp_output_84_0_g69601]);
				float4 break89_g69601 = lerpResult109_g69601;
				half Global_ExtrasTex_Overlay156_g69600 = break89_g69601.b;
				float temp_output_3774_0_g69600 = ( _GlobalOverlay * Global_ExtrasTex_Overlay156_g69600 );
				float lerpResult3746_g69600 = lerp( 1.0 , Global_MeshVariation4531_g69600 , _OverlayVariationValue);
				half Overlay_Commons3739_g69600 = ( temp_output_3774_0_g69600 * lerpResult3746_g69600 );
				float temp_output_7_0_g69632 = _OverlayMaskMinValue;
				half Overlay_Mask3762_g69600 = saturate( ( ( ( ( ( lerpResult4521_g69600 * 0.5 ) + Main_AlbedoTex_G3807_g69600 ) * Overlay_Commons3739_g69600 ) - temp_output_7_0_g69632 ) / ( _OverlayMaskMaxValue - temp_output_7_0_g69632 ) ) );
				float3 lerpResult3875_g69600 = lerp( Albedo_Subsurface3874_g69600 , Global_OverlayColor1758_g69600 , Overlay_Mask3762_g69600);
				half3 Final_Albedo4100_g69600 = lerpResult3875_g69600;
				half IsInitialized3811_g69600 = _IsInitialized;
				float3 lerpResult3815_g69600 = lerp( float3( 1,0,0 ) , Final_Albedo4100_g69600 , IsInitialized3811_g69600);
				
				float3 hdEmission4376_g69600 = ASEGetEmissionHDRColor(_EmissiveColor.rgb,_EmissiveIntensityParams.x,_EmissiveExposureValue,GetInverseCurrentExposureMultiplier());
				half Global_ExtrasTex_Emissive4408_g69600 = break89_g69601.r;
				float lerpResult4417_g69600 = lerp( 1.0 , Global_ExtrasTex_Emissive4408_g69600 , _GlobalEmissive);
				half3 Final_Emissive4365_g69600 = ( (( hdEmission4376_g69600 * output1 )).rgb * lerpResult4417_g69600 );
				
				half Main_Mask_Smoothness3820_g69600 = break3589_g69600.a;
				half Main_Smoothness3838_g69600 = ( Main_Mask_Smoothness3820_g69600 * _ImpostorSmoothnessValue );
				half Global_ExtrasTex_Wetness305_g69600 = break89_g69601.g;
				float lerpResult3892_g69600 = lerp( Main_Smoothness3838_g69600 , saturate( ( Main_Smoothness3838_g69600 + Global_ExtrasTex_Wetness305_g69600 ) ) , _GlobalWetness);
				half Final_Smoothness3898_g69600 = lerpResult3892_g69600;
				
				float temp_output_3577_0_g69600 = o.Alpha;
				float localCustomAlphaClipAlways4430_g69600 = ( temp_output_3577_0_g69600 );
				half Global_ExtrasTex_Alpha1033_g69600 = saturate( break89_g69601.a );
				float lerpResult4544_g69600 = lerp( 0.0 , Global_MeshVariation4531_g69600 , _AlphaVariationValue);
				half Global_Alpha_Variation4546_g69600 = lerpResult4544_g69600;
				float lerpResult4053_g69600 = lerp( 1.0 , ( ( Global_ExtrasTex_Alpha1033_g69600 - Global_Alpha_Variation4546_g69600 ) + 0.09 ) , _GlobalAlpha);
				float lerpResult4075_g69600 = lerp( 1.0 , lerpResult4053_g69600 , Main_Mask_Leaves3712_g69600);
				half Final_Alpha4102_g69600 = lerpResult4075_g69600;
				float Alpha4430_g69600 = Final_Alpha4102_g69600;
				{
				clip(Alpha4430_g69600 - 0.1);
				}
				float temp_output_3_0_g69644 = localCustomAlphaClipAlways4430_g69600;
				half Offest27_g69644 = 0.0;
				half Feather30_g69644 = 0.2;
				
				half Subsurface_HD3650_g69600 = ( 1.0 - ( Subsurface_Intensity3684_g69600 * Subsurface_Mask3666_g69600 ) );
				

                surfaceDescription.Albedo = lerpResult3815_g69600;
                o.Normal = World_Normal3638_g69600;
                surfaceDescription.BentNormal = float3( 0, 0, 1 );
                surfaceDescription.CoatMask = 0;
                surfaceDescription.Metallic = 0;
				
				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceDescription.Specular = 0;
				#endif
                
				surfaceDescription.Emission = Final_Emissive4365_g69600;
                surfaceDescription.Smoothness = Final_Smoothness3898_g69600;
                surfaceDescription.Occlusion = 1;
				surfaceDescription.Alpha = ( ( ( temp_output_3_0_g69644 - Offest27_g69644 ) / ( max( fwidth( temp_output_3_0_g69644 ) , 0.001 ) + Feather30_g69644 ) ) + Offest27_g69644 );
				
				#ifdef _ALPHATEST_ON
				surfaceDescription.AlphaClipThreshold = 0;
				#endif

				#ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
				surfaceDescription.SpecularAAScreenSpaceVariance = 0;
				surfaceDescription.SpecularAAThreshold = 0;
				#endif

				#ifdef _SPECULAR_OCCLUSION_CUSTOM
				surfaceDescription.SpecularOcclusion = 0;
				#endif

				#if defined(_HAS_REFRACTION) || defined(_MATERIAL_FEATURE_TRANSMISSION)
				surfaceDescription.Thickness = Subsurface_HD3650_g69600;
				#endif

				#ifdef _HAS_REFRACTION
				surfaceDescription.RefractionIndex = 1;
                surfaceDescription.RefractionColor = float3(1,1,1);
                surfaceDescription.RefractionDistance = 0;
				#endif

				// BOXOPHOBIC: Removed support for Diffusion with Subsurface Scattering
				#if defined _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceDescription.SubsurfaceMask = 1;
				#endif

				// BOXOPHOBIC: Added support for Diffusion with both Subsurface Scattering and Transmission
				#if defined( _MATERIAL_FEATURE_SUBSURFACE_SCATTERING ) || defined( _MATERIAL_FEATURE_TRANSMISSION )
				surfaceDescription.DiffusionProfile = _SubsurfaceDiffusion;
				#endif

				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceDescription.Anisotropy = 1;
				surfaceDescription.Tangent = float3(1,0,0);
				#endif

				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceDescription.IridescenceMask = 0;
				surfaceDescription.IridescenceThickness = 0;
				#endif

				float4 bakedGI = float4( 0, 0, 0, 0 );

				packedInput.positionCS.zw = clipPos.zw;
				float3 positionRWS = worldPos;
				float3 normalWS = o.Normal;
				float4 tangentWS = packedInput.interp02.xyzw;

				input.positionSS = packedInput.positionCS;
				input.positionRWS = positionRWS;
				#if defined( ASE_SRP_VERSION ) && ASE_SRP_VERSION < 60900
				input.worldToTangent = BuildWorldToTangent( tangentWS, normalWS );
				#else
				input.tangentToWorld = BuildTangentToWorld( tangentWS, normalWS );
				#endif
				input.texCoord1 = packedInput.interp03.xyzw;
				input.texCoord2 = packedInput.interp04.xyzw;

				PositionInputs posInput = GetPositionInput( input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS );
				SurfaceData surfaceData;
				BuiltinData builtinData;

				float3 normalizedWorldViewDir = GetWorldSpaceNormalizeViewDir( input.positionRWS );

				GetSurfaceAndBuiltinData(surfaceDescription,input, normalizedWorldViewDir, posInput, surfaceData, builtinData);

				#ifdef CUSTOM_BAKED_GI
					BSDFData bsdfData = ConvertSurfaceDataToBSDFData( posInput.positionSS, surfaceData );
					half4 decodeInstructions = half4( LIGHTMAP_HDR_MULTIPLIER, LIGHTMAP_HDR_EXPONENT, 0.0h, 0.0h );
					builtinData.bakeDiffuseLighting = UnpackLightmapRGBM( bakedGI, decodeInstructions ) * EMISSIVE_RGBM_SCALE * bsdfData.diffuseColor;
				#endif

				ENCODE_INTO_GBUFFER(surfaceData, builtinData, posInput.positionSS, outGBuffer);
				
				outputDepth = posInput.deviceDepth;
			}
     
            ENDHLSL
        }

		
		Pass
        {
			
            Name "SceneSelectionPass"
            Tags { "LightMode"="SceneSelectionPass" }
            ColorMask 0
        	
            HLSLPROGRAM
			#define _MATERIAL_FEATURE_TRANSMISSION 1
			#define _DISABLE_SSR 1
			#define ASE_SRP_VERSION 120100
			#ifdef UNITY_COLORSPACE_GAMMA//AI_SRP
			#define unity_ColorSpaceDielectricSpec half4(0.220916301, 0.220916301, 0.220916301, 1.0 - 0.220916301)//AI_SRP
			#else//AI_SRP
			#define unity_ColorSpaceDielectricSpec half4(0.04, 0.04, 0.04, 1.0 - 0.04) //AI_SRP
			#endif//AI_SRP

			#pragma vertex Vert
			#pragma fragment Frag

			#if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define OUTPUT_SPLIT_LIGHTING
			#endif
        
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#if defined( ASE_SRP_VERSION ) && ASE_SRP_VERSION < 60900              
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Wind.hlsl"
			#endif
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
        
            
            #define SHADERPASS SHADERPASS_DEPTH_ONLY
            #define SCENESELECTIONPASS
        
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"
        
			#if defined( ASE_SRP_VERSION ) && ASE_SRP_VERSION < 60900
			#define T2W(var, index) var.worldToTangent[index]
			#else
			#define T2W(var, index) var.tangentToWorld[index]
			#endif

			int _ObjectId;
			int _PassValue;
        
			#define ai_ObjectToWorld GetObjectToWorldMatrix()
			#define ai_WorldToObject GetWorldToObjectMatrix()
			#define AI_INV_TWO_PI  INV_TWO_PI
			#define AI_PI          PI
			#define AI_INV_PI      INV_PI
			//TVE Pipeline Defines
			#define THE_VEGETATION_ENGINE
			#define TVE_IS_HD_PIPELINE
			//TVE Injection Defines
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END


			struct AttributesMesh 
			{
				float4 vertex : POSITION;
				float3 normal : NORMAL;
				float4 texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				
			};
        
			struct PackedVaryingsMeshToPS 
			{
				float4 positionCS : SV_Position;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				float4 frameUVs99 : TEXCOORD0;
				float4 viewPos99 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
			};

			float4x4 unity_CameraProjection;
			float4x4 unity_CameraInvProjection;
			float4x4 unity_WorldToCamera;
			float4x4 unity_CameraToWorld;
			sampler2D _Albedo;
			sampler2D _Normals;
			half4 TVE_MotionParams;
			TEXTURE2D_ARRAY(TVE_MotionTex);
			half4 TVE_MotionCoords;
			SAMPLER(sampler_linear_repeat);
			float TVE_MotionUsage[10];
			half4 TVE_NoiseParams;
			half4 TVE_VertexParams;
			TEXTURE2D_ARRAY(TVE_VertexTex);
			half4 TVE_VertexCoords;
			float TVE_VertexUsage[10];
			half _DisableSRPBatcher;
			sampler2D _Mask;
			sampler2D _Emissive;
			half4 TVE_ExtrasParams;
			TEXTURE2D_ARRAY(TVE_ExtrasTex);
			half4 TVE_ExtrasCoords;
			float TVE_ExtrasUsage[10];
			CBUFFER_START( UnityPerMaterial )
			float4 _ImpostorGrassColor;
			half4 _SubsurfaceColor;
			float4 _ImpostorLeafColor;
			half4 _SubsurfaceMaskRemap;
			half4 _ColorsMaskRemap;
			float4 _ImpostorBarkColor;
			half4 _OverlayMaskRemap;
			half4 _EmissiveColor;
			half4 _DetailBlendRemap;
			float4 _AI_SizeOffset;
			float4 _NoiseMaskRemap;
			float4 _SubsurfaceDiffusion_Asset;
			float4 _SubsurfaceDiffusion_asset;
			float4 _GradientMaskRemap;
			float4 _EmissiveIntensityParams;
			float3 _AI_Offset;
			half _ImpostorLeafSaturationValue;
			half _ImpostorBarkSaturationValue;
			half _GlobalSize;
			half _MotionSpeed_10;
			half _InteractionMaskValue;
			half _InteractionAmplitude;
			half _MotionScale_10;
			half _MotionAmplitude_10;
			half _LayerMotionValue;
			float _AI_Clip;
			float _AI_ShadowView;
			float _AI_ShadowBias;
			half _LayerVertexValue;
			half _IsVegetationShader;
			half _VertexDynamicMode;
			half _ColorsPositionMode;
			half _GlobalWetness;
			half _ImpostorSmoothnessValue;
			half _GlobalEmissive;
			half _EmissiveExposureValue;
			half _OverlayMaskMaxValue;
			half _OverlayMaskMinValue;
			half _OverlayVariationValue;
			half _LayerExtrasValue;
			half _ImpostorGrassSaturationValue;
			half _ExtrasPositionMode;
			half _SubsurfaceMaskMaxValue;
			half _SubsurfaceMaskMinValue;
			half _SubsurfaceValue;
			half _ColorsMaskMaxValue;
			half _ColorsMaskMinValue;
			half _ColorsVariationValue;
			half _GlobalColors;
			half _LayerColorsValue;
			half _GlobalOverlay;
			float _AI_DepthSize;
			float _AI_ImpostorSize;
			float _AI_Parallax;
			half _SpaceGlobalLocals;
			half _SpaceGlobalPosition;
			half _SpaceGlobalLayers;
			half _SpaceMotionLocals;
			half _SubsurfaceAngleValue;
			half _DetailBlendMode;
			half _CategorySizeFade;
			half _IsImpostorShader;
			half _SubsurfaceScatteringValue;
			half _SubsurfaceAmbientValue;
			half _DetailMode;
			half _CategoryNoise;
			half _CategoryMotion;
			half _LayerReactValue;
			half _RenderQueue;
			half _IsTVEShader;
			half _CategoryGlobal;
			half _MessageSizeFade;
			half _SubsurfaceNormalValue;
			half _RenderPriority;
			half _SubsurfaceDirectValue;
			half _AlphaVariationValue;
			float _AI_FramesY;
			float _AI_FramesX;
			float _AI_Frames;
			half _RenderCoverage;
			float _RenderSpecular;
			half _IsSubsurfaceShader;
			half _ImpostorCat;
			float _AI_TextureBias;
			half _VertexPivotMode;
			half _SubsurfaceShadowValue;
			half _EmissiveFlagMode;
			float _IsVersion;
			half _CategorySubsurface;
			float _VegetationMode;
			half _CategoryEmissive;
			float _SubsurfaceDiffusion;
			half _CategoryDetail;
			half _IsInitialized;
			half _GlobalAlpha;
			CBUFFER_END


			inline void SphereImpostorVertex( inout float4 vertex, inout float3 normal, inout float4 frameUVs, inout float4 viewPos )
			{
				float2 uvOffset = _AI_SizeOffset.zw;
				float sizeX = _AI_FramesX;
				float sizeY = _AI_FramesY - 1; 
				float UVscale = _AI_ImpostorSize;
				float4 fractions = 1 / float4( sizeX, _AI_FramesY, sizeY, UVscale );
				float2 sizeFraction = fractions.xy;
				float axisSizeFraction = fractions.z;
				float fractionsUVscale = fractions.w;
				float3 worldOrigin = 0;
				float4 perspective = float4( 0, 0, 0, 1 );
				if( UNITY_MATRIX_P[ 3 ][ 3 ] == 1 )
				{
				perspective = float4( 0, 0, 5000, 0 );
				worldOrigin = ai_ObjectToWorld._m03_m13_m23;
				}
				float3 worldCameraPos = worldOrigin + mul( UNITY_MATRIX_I_V, perspective ).xyz;
				float3 objectCameraPosition = mul( ai_WorldToObject, float4( worldCameraPos, 1 ) ).xyz - _AI_Offset.xyz; 
				float3 objectCameraDirection = normalize( objectCameraPosition );
				float3 upVector = float3( 0,1,0 );
				float3 objectHorizontalVector = normalize( cross( objectCameraDirection, upVector ) );
				float3 objectVerticalVector = cross( objectHorizontalVector, objectCameraDirection );
				float verticalAngle = frac( atan2( -objectCameraDirection.z, -objectCameraDirection.x ) * AI_INV_TWO_PI ) * sizeX + 0.5;
				float verticalDot = dot( objectCameraDirection, upVector );
				float upAngle = ( acos( -verticalDot ) * AI_INV_PI ) + axisSizeFraction * 0.5f;
				float yRot = sizeFraction.x * AI_PI * verticalDot * ( 2 * frac( verticalAngle ) - 1 );
				float2 uvExpansion = vertex.xy;
				float cosY = cos( yRot );
				float sinY = sin( yRot );
				float2 uvRotator = mul( uvExpansion, float2x2( cosY, -sinY, sinY, cosY ) );
				float3 billboard = objectHorizontalVector * uvRotator.x + objectVerticalVector * uvRotator.y + _AI_Offset.xyz;
				float2 relativeCoords = float2( floor( verticalAngle ), min( floor( upAngle * sizeY ), sizeY ) );
				float2 frameUV = ( ( uvExpansion * fractionsUVscale + 0.5 ) + relativeCoords ) * sizeFraction;
				frameUVs.xy = frameUV - uvOffset;
				frameUVs.zw = 0;
				viewPos.w = 0;
				viewPos.xyz = TransformWorldToView( TransformObjectToWorld( billboard ) );
				vertex.xyz = billboard;
				normal.xyz = objectCameraDirection;
			}
			
			float3 ObjectPosition_UNITY_MATRIX_M(  )
			{
				return float3(UNITY_MATRIX_M[0].w, UNITY_MATRIX_M[1].w, UNITY_MATRIX_M[2].w );
			}
			
			inline void SphereImpostorFragment( inout SurfaceOutput o, out float4 clipPos, out float3 worldPos, float4 frameUV, float4 viewPos, out float4 output0, out float4 output1 )
			{
				#if _USE_PARALLAX_ON
				float4 parallaxSample = tex2Dbias( _Normals, float4(frameUV.xy, 0, -1) );
				frameUV.xy = ( ( 0.5 - parallaxSample.a ) * frameUV.zw ) + frameUV.xy;
				#endif
				float4 albedoSample = tex2Dbias( _Albedo, float4(frameUV.xy, 0, _AI_TextureBias) );
				o.Alpha = ( albedoSample.a - _AI_Clip );
				clip( o.Alpha );
				o.Albedo = albedoSample.rgb;
				#if defined(AI_HD_RENDERPIPELINE) && ( AI_HDRP_VERSION >= 50702 )
				float4 feat1 = _Features.SampleLevel( SamplerState_Point_Repeat, frameUV.xy, 0);
				o.Diffusion = feat1.rgb;
				o.Features = feat1.a;
				float4 test1 = _Specular.SampleLevel( SamplerState_Point_Repeat, frameUV.xy, 0);
				o.MetalTangent = test1.b;
				#endif
				output0 = tex2Dbias( _Mask, float4(frameUV.xy, 0, _AI_TextureBias) );
				output1 = tex2Dbias( _Emissive, float4(frameUV.xy, 0, _AI_TextureBias) );
				float4 normalSample = tex2Dbias( _Normals, float4(frameUV.xy, 0, _AI_TextureBias) );
				float4 remapNormal = normalSample * 2 - 1; 
				float3 worldNormal = normalize( mul( (float3x3)ai_ObjectToWorld, remapNormal.xyz ) );
				o.Normal = worldNormal;
				#if defined(UNITY_PASS_SHADOWCASTER) // Standard RP fix for deferred path
				float depth = remapNormal.a * _AI_DepthSize * 0.4999 * length( ai_ObjectToWorld[ 2 ].xyz );
				#else
				float depth = remapNormal.a * _AI_DepthSize * 0.5 * length( ai_ObjectToWorld[ 2 ].xyz );
				#endif
				#if ( defined(SHADERPASS) && (SHADERPASS == SHADERPASS_SHADOWS) ) || defined(UNITY_PASS_SHADOWCASTER)
				viewPos.z += depth * _AI_ShadowView;
				viewPos.z += -_AI_ShadowBias;
				#else 
				viewPos.z += depth;
				#endif
				worldPos = GetAbsolutePositionWS( mul( UNITY_MATRIX_I_V, float4( viewPos.xyz, 1 ) )).xyz;
				clipPos = mul( UNITY_MATRIX_P, float4( viewPos.xyz, 1 ) );
				#if defined(UNITY_PASS_SHADOWCASTER) && !defined(SHADERPASS)
				#if UNITY_REVERSED_Z
				clipPos.z = min( clipPos.z, clipPos.w * UNITY_NEAR_CLIP_VALUE );
				#else
				clipPos.z = max( clipPos.z, clipPos.w * UNITY_NEAR_CLIP_VALUE );
				#endif
				#endif
				clipPos.xyz /= clipPos.w;
				if( UNITY_NEAR_CLIP_VALUE < 0 )
				clipPos = clipPos * 0.5 + 0.5;
			}
			
        
			void BuildSurfaceData(FragInputs fragInputs, inout AlphaSurfaceDescription surfaceDescription, float3 V, out SurfaceData surfaceData, out float3 bentNormalWS)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);

				surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;
				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
					surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
				#endif
				#ifdef _MATERIAL_FEATURE_TRANSMISSION
					surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
				#endif
				#ifdef _MATERIAL_FEATURE_ANISOTROPY
					surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;
				#endif
        
				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
					surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
				#endif
				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
					surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
				#endif
        
				#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
					surfaceData.baseColor *= (1.0 - Max3(surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b));
				#endif
        
				GetNormalWS( fragInputs, float3( 0.0f, 0.0f, 1.0f ), surfaceData.normalWS, float3( 1.0, 1.0, 1.0 ) );
        
				bentNormalWS = surfaceData.normalWS;
        
				#ifdef _HAS_REFRACTION
					if (_EnableSSRefraction)
					{
        
						surfaceData.transmittanceMask = (1.0 - surfaceDescription.Alpha);
						surfaceDescription.Alpha = 1.0;
					}
					else
					{
						surfaceData.ior = 1.0;
						surfaceData.transmittanceColor = float3(1.0, 1.0, 1.0);
						surfaceData.atDistance = 1.0;
						surfaceData.transmittanceMask = 0.0;
						surfaceDescription.Alpha = 1.0;
					}
				#else
					surfaceData.ior = 1.0;
					surfaceData.transmittanceColor = float3(1.0, 1.0, 1.0);
					surfaceData.atDistance = 1.0;
					surfaceData.transmittanceMask = 0.0;
				#endif
        
				surfaceData.tangentWS = normalize(T2W(fragInputs, 0).xyz);    // The tangent is not normalize in worldToTangent for mikkt. TODO: Check if it expected that we normalize with Morten. Tag: SURFACE_GRADIENT
				surfaceData.tangentWS = Orthonormalize(surfaceData.tangentWS, surfaceData.normalWS);
        
				#if defined(_SPECULAR_OCCLUSION_CUSTOM)
				#elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
					surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO(V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness(surfaceData.perceptualSmoothness));
				#elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
					surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion(ClampNdotV(dot(surfaceData.normalWS, V)), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness(surfaceData.perceptualSmoothness));
				#else
					surfaceData.specularOcclusion = 1.0;
				#endif
				#ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
					surfaceData.perceptualSmoothness = GeometricNormalFiltering(surfaceData.perceptualSmoothness, T2W(fragInputs, 2), surfaceDescription.SpecularAAScreenSpaceVariance, surfaceDescription.SpecularAAThreshold);
				#endif
			}
        
            void GetSurfaceAndBuiltinData(AlphaSurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
            {
				//#ifdef LOD_FADE_CROSSFADE 
				//	uint3 fadeMaskSeed = asuint((int3)(V * _ScreenSize.xyx));
				//	LODDitheringTransition(fadeMaskSeed, unity_LODFade.x);
				//#endif
        
				#ifdef _ALPHATEST_ON
					DoAlphaTest ( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif

                float3 bentNormalWS;
                BuildSurfaceData(fragInputs, surfaceDescription, V, surfaceData, bentNormalWS);
        
				#if HAVE_DECALS
				if( _EnableDecals )
				{
					DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, surfaceDescription.Alpha);
					ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData);
				}
				#endif

				#if defined( ASE_SRP_VERSION ) && ASE_SRP_VERSION <= 50702
					InitBuiltinData( surfaceDescription.Alpha, bentNormalWS, -T2W(fragInputs, 2), fragInputs.positionRWS, fragInputs.texCoord1, fragInputs.texCoord2, builtinData );
				#else
					InitBuiltinData( posInput, surfaceDescription.Alpha, bentNormalWS, -T2W(fragInputs, 2), fragInputs.texCoord1, fragInputs.texCoord2, builtinData );
				#endif
        
                builtinData.depthOffset = 0.0;
        
				#if (SHADERPASS == SHADERPASS_DISTORTION)
					builtinData.distortion = surfaceDescription.Distortion;
					builtinData.distortionBlur = surfaceDescription.DistortionBlur;
				#else
					builtinData.distortion = float2(0.0, 0.0);
					builtinData.distortionBlur = 0.0;
				#endif
        
                PostInitBuiltinData(V, posInput, surfaceData, builtinData);
            }
        
			PackedVaryingsMeshToPS Vert(AttributesMesh inputMesh  )
			{
				UNITY_SETUP_INSTANCE_ID( inputMesh );
				PackedVaryingsMeshToPS outputPackedVaryingsMeshToPS;
				UNITY_TRANSFER_INSTANCE_ID( inputMesh, outputPackedVaryingsMeshToPS );

				SphereImpostorVertex( inputMesh.vertex, inputMesh.normal, outputPackedVaryingsMeshToPS.frameUVs99, outputPackedVaryingsMeshToPS.viewPos99 );
				float3 viewToObj3965_g69600 = mul( GetWorldToObjectMatrix(), mul( UNITY_MATRIX_I_V , float4( outputPackedVaryingsMeshToPS.viewPos99.xyz, 1 ) ) ).xyz;
				float3 VertexPosition3564_g69600 = viewToObj3965_g69600;
				half3 VertexPos40_g69645 = VertexPosition3564_g69600;
				float3 appendResult74_g69645 = (float3(VertexPos40_g69645.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g69645 = appendResult74_g69645;
				float3 break84_g69645 = VertexPos40_g69645;
				float3 appendResult81_g69645 = (float3(0.0 , break84_g69645.y , break84_g69645.z));
				half3 VertexPosOtherAxis82_g69645 = appendResult81_g69645;
				float4 temp_output_91_19_g69623 = TVE_MotionCoords;
				float3 localObjectPosition_UNITY_MATRIX_M14_g69635 = ObjectPosition_UNITY_MATRIX_M();
				#ifdef SHADEROPTIONS_CAMERA_RELATIVE_RENDERING
				float3 staticSwitch13_g69635 = ( localObjectPosition_UNITY_MATRIX_M14_g69635 + _WorldSpaceCameraPos );
				#else
				float3 staticSwitch13_g69635 = localObjectPosition_UNITY_MATRIX_M14_g69635;
				#endif
				half3 ObjectData20_g69636 = staticSwitch13_g69635;
				float3 ase_worldPos = GetAbsolutePositionWS( TransformObjectToWorld( (inputMesh.vertex).xyz ) );
				half3 WorldData19_g69636 = ase_worldPos;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g69636 = WorldData19_g69636;
				#else
				float3 staticSwitch14_g69636 = ObjectData20_g69636;
				#endif
				float3 temp_output_114_0_g69635 = staticSwitch14_g69636;
				float3 vertexToFrag4543_g69600 = temp_output_114_0_g69635;
				float3 ObjectPosition4422_g69600 = vertexToFrag4543_g69600;
				half2 UV94_g69623 = ( (temp_output_91_19_g69623).zw + ( (temp_output_91_19_g69623).xy * (ObjectPosition4422_g69600).xz ) );
				float temp_output_84_0_g69623 = _LayerMotionValue;
				float4 lerpResult107_g69623 = lerp( TVE_MotionParams , saturate( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_MotionTex, sampler_linear_repeat, UV94_g69623,temp_output_84_0_g69623, 0.0 ) ) , TVE_MotionUsage[(int)temp_output_84_0_g69623]);
				half4 Global_Motion_Params4344_g69600 = lerpResult107_g69623;
				float4 break322_g69639 = Global_Motion_Params4344_g69600;
				float3 appendResult397_g69639 = (float3(break322_g69639.x , 0.0 , break322_g69639.y));
				float3 temp_output_398_0_g69639 = (appendResult397_g69639*2.0 + -1.0);
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				half2 Motion_DirectionOS39_g69600 = (( mul( GetWorldToObjectMatrix(), float4( temp_output_398_0_g69639 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_DirectionOS358_g69627 = Motion_DirectionOS39_g69600;
				float temp_output_3572_0_g69600 = saturate( VertexPosition3564_g69600.y );
				half Mesh_Motion_1082_g69600 = ( temp_output_3572_0_g69600 * 2.0 );
				half Wind_Power369_g69639 = break322_g69639.z;
				half Motion_WindPower2223_g69600 = Wind_Power369_g69639;
				half3 Input_Position419_g69643 = -ObjectPosition4422_g69600;
				half2 Motion_DirectionWS4464_g69600 = (temp_output_398_0_g69639).xz;
				half2 Input_DirectionWS423_g69643 = Motion_DirectionWS4464_g69600;
				float Motion_Scale287_g69643 = ( _MotionScale_10 + 0.2 );
				half Global_Scale448_g69643 = TVE_NoiseParams.x;
				half Input_Speed62_g69643 = _MotionSpeed_10;
				half Global_Speed449_g69643 = TVE_NoiseParams.y;
				float mulTime426_g69643 = _TimeParameters.x * ( Input_Speed62_g69643 * Global_Speed449_g69643 );
				half Global_DistScale561_g69643 = TVE_NoiseParams.w;
				float3 break461_g69643 = ( Input_Position419_g69643 * Global_DistScale561_g69643 );
				half Global_DistAmplitude559_g69643 = TVE_NoiseParams.z;
				float Noise_Distortion469_g69643 = ( sin( ( break461_g69643.x + break461_g69643.z ) ) * Global_DistAmplitude559_g69643 );
				half Motion_Variation284_g69643 = 0.0;
				float2 temp_output_425_0_g69643 = ( ( (Input_Position419_g69643).xz * Input_DirectionWS423_g69643 * Motion_Scale287_g69643 * Global_Scale448_g69643 ) + ( mulTime426_g69643 + Noise_Distortion469_g69643 + Motion_Variation284_g69643 ) );
				float2 break500_g69643 = ( temp_output_425_0_g69643 * 0.1178 );
				float2 break494_g69643 = ( temp_output_425_0_g69643 * 0.1742 );
				half Input_WindPower327_g69643 = Motion_WindPower2223_g69600;
				float lerpResult430_g69643 = lerp( 1.4 , 0.4 , Input_WindPower327_g69643);
				half Global_MotionNoise34_g69600 = (pow( (( sin( ( break500_g69643.x + break500_g69643.y ) ) * sin( ( break494_g69643.x + break494_g69643.y ) ) )*0.4 + 0.6) , lerpResult430_g69643 )*1.2 + -0.2);
				half Motion_10_Amplitude2258_g69600 = ( _MotionAmplitude_10 * Mesh_Motion_1082_g69600 * Motion_WindPower2223_g69600 * Global_MotionNoise34_g69600 );
				half Input_BendingAmplitude376_g69627 = Motion_10_Amplitude2258_g69600;
				half Input_InteractionAmplitude58_g69627 = _InteractionAmplitude;
				half Input_MeshMotion_10321_g69627 = Mesh_Motion_1082_g69600;
				half Input_InteractionUseMask62_g69627 = _InteractionMaskValue;
				float lerpResult371_g69627 = lerp( 2.0 , Input_MeshMotion_10321_g69627 , Input_InteractionUseMask62_g69627);
				half ObjectData20_g69628 = lerpResult371_g69627;
				half WorldData19_g69628 = Input_MeshMotion_10321_g69627;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g69628 = WorldData19_g69628;
				#else
				float staticSwitch14_g69628 = ObjectData20_g69628;
				#endif
				half Motion_10_Interaction373_g69627 = ( Input_InteractionAmplitude58_g69627 * staticSwitch14_g69628 );
				half Interaction_Mask66_g69600 = ( break322_g69639.w * break322_g69639.w );
				float Input_InteractionMask330_g69627 = Interaction_Mask66_g69600;
				float lerpResult360_g69627 = lerp( Input_BendingAmplitude376_g69627 , Motion_10_Interaction373_g69627 , saturate( ( Input_InteractionAmplitude58_g69627 * Input_InteractionMask330_g69627 ) ));
				float2 break364_g69627 = ( Input_DirectionOS358_g69627 * lerpResult360_g69627 );
				half Motion_10_BendingZ190_g69600 = break364_g69627.y;
				half Angle44_g69645 = Motion_10_BendingZ190_g69600;
				half3 VertexPos40_g69642 = ( VertexPosRotationAxis50_g69645 + ( VertexPosOtherAxis82_g69645 * cos( Angle44_g69645 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g69645 ) * sin( Angle44_g69645 ) ) );
				float3 appendResult74_g69642 = (float3(0.0 , 0.0 , VertexPos40_g69642.z));
				half3 VertexPosRotationAxis50_g69642 = appendResult74_g69642;
				float3 break84_g69642 = VertexPos40_g69642;
				float3 appendResult81_g69642 = (float3(break84_g69642.x , break84_g69642.y , 0.0));
				half3 VertexPosOtherAxis82_g69642 = appendResult81_g69642;
				half Motion_10_BendingX216_g69600 = break364_g69627.x;
				half Angle44_g69642 = -Motion_10_BendingX216_g69600;
				float3 Vertex_Motion_Object833_g69600 = ( VertexPosRotationAxis50_g69642 + ( VertexPosOtherAxis82_g69642 * cos( Angle44_g69642 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g69642 ) * sin( Angle44_g69642 ) ) );
				float4 temp_output_94_19_g69606 = TVE_VertexCoords;
				half2 UV97_g69606 = ( (temp_output_94_19_g69606).zw + ( (temp_output_94_19_g69606).xy * (ObjectPosition4422_g69600).xz ) );
				float temp_output_84_0_g69606 = _LayerVertexValue;
				float4 lerpResult109_g69606 = lerp( TVE_VertexParams , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_VertexTex, sampler_linear_repeat, UV97_g69606,temp_output_84_0_g69606, 0.0 ) , TVE_VertexUsage[(int)temp_output_84_0_g69606]);
				half4 Global_Vertex_Params4413_g69600 = lerpResult109_g69606;
				half Global_VertexTex_Size174_g69600 = saturate( Global_Vertex_Params4413_g69600.w );
				float lerpResult346_g69600 = lerp( 1.0 , Global_VertexTex_Size174_g69600 , _GlobalSize);
				float3 appendResult3480_g69600 = (float3(lerpResult346_g69600 , lerpResult346_g69600 , lerpResult346_g69600));
				half3 Vertex_Size1741_g69600 = appendResult3480_g69600;
				half3 _Vector5 = half3(1,1,1);
				float3 Vertex_SizeFade1740_g69600 = _Vector5;
				half IsInitialized3811_g69600 = _IsInitialized;
				float3 Final_VertexPosition890_g69600 = ( ( ( ( Vertex_Motion_Object833_g69600 * Vertex_Size1741_g69600 * Vertex_SizeFade1740_g69600 ) - VertexPosition3564_g69600 ) * IsInitialized3811_g69600 ) + _DisableSRPBatcher );
				
				outputPackedVaryingsMeshToPS.ase_texcoord2.xyz = vertexToFrag4543_g69600;
				
				
				//setting value to unused interpolator channels and avoid initialization warnings
				outputPackedVaryingsMeshToPS.ase_texcoord2.w = 0;
				inputMesh.vertex.xyz += Final_VertexPosition890_g69600;

				float3 positionRWS = TransformObjectToWorld(inputMesh.vertex.xyz );
				outputPackedVaryingsMeshToPS.positionCS = TransformWorldToHClip(positionRWS);
				return outputPackedVaryingsMeshToPS;
			}

			void Frag(  PackedVaryingsMeshToPS packedInput
				#ifdef WRITE_NORMAL_BUFFER
				, out float4 outNormalBuffer : SV_Target0
					#ifdef WRITE_MSAA_DEPTH
				, out float1 depthColor : SV_Target1
					#endif
				#elif defined(SCENESELECTIONPASS)
				, out float4 outColor : SV_Target0
				#endif
				, out float outputDepth : SV_Depth
				
			)
			{
				UNITY_SETUP_INSTANCE_ID( packedInput );
				
				#ifdef LOD_FADE_CROSSFADE
				float3 VC = GetWorldSpaceNormalizeViewDir(packedInput.interp00.xyz);
				LODDitheringTransition(ComputeFadeMaskSeed(VC, packedInput.positionCS.xy), unity_LODFade.x);
				#endif

				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);
				AlphaSurfaceDescription surfaceDescription = (AlphaSurfaceDescription)0;
				SurfaceOutput o = (SurfaceOutput)0;

				o.Normal = float3( 0, 0, 1 );
				float4 clipPos = 0;
				float3 worldPos = 0;
				float4 output0 = 0;
				float4 output1 = 0;
				SphereImpostorFragment( o, clipPos, worldPos, packedInput.frameUVs99, packedInput.viewPos99, output0, output1 );
				float temp_output_3577_0_g69600 = o.Alpha;
				float localCustomAlphaClipAlways4430_g69600 = ( temp_output_3577_0_g69600 );
				float4 temp_output_93_19_g69601 = TVE_ExtrasCoords;
				float3 temp_output_3563_0_g69600 = worldPos;
				float3 WorldPosition4027_g69600 = temp_output_3563_0_g69600;
				float3 vertexToFrag4543_g69600 = packedInput.ase_texcoord2.xyz;
				float3 ObjectPosition4422_g69600 = vertexToFrag4543_g69600;
				float3 lerpResult4483_g69600 = lerp( WorldPosition4027_g69600 , ObjectPosition4422_g69600 , _ExtrasPositionMode);
				half2 UV96_g69601 = ( (temp_output_93_19_g69601).zw + ( (temp_output_93_19_g69601).xy * (lerpResult4483_g69600).xz ) );
				float temp_output_84_0_g69601 = _LayerExtrasValue;
				float4 lerpResult109_g69601 = lerp( TVE_ExtrasParams , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_ExtrasTex, sampler_linear_repeat, UV96_g69601,temp_output_84_0_g69601, 0.0 ) , TVE_ExtrasUsage[(int)temp_output_84_0_g69601]);
				float4 break89_g69601 = lerpResult109_g69601;
				half Global_ExtrasTex_Alpha1033_g69600 = saturate( break89_g69601.a );
				float3 break111_g69647 = ObjectPosition4422_g69600;
				half Global_DynamicMode4535_g69600 = _VertexDynamicMode;
				half Input_DynamicMode120_g69647 = Global_DynamicMode4535_g69600;
				float4 break3589_g69600 = output0;
				half Main_Variation_Or_Metallic3607_g69600 = break3589_g69600.r;
				half Input_Variation124_g69647 = Main_Variation_Or_Metallic3607_g69600;
				half ObjectData20_g69648 = frac( ( ( ( break111_g69647.x + break111_g69647.y + break111_g69647.z ) * ( 1.0 - Input_DynamicMode120_g69647 ) ) + Input_Variation124_g69647 ) );
				half WorldData19_g69648 = Input_Variation124_g69647;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g69648 = WorldData19_g69648;
				#else
				float staticSwitch14_g69648 = ObjectData20_g69648;
				#endif
				float clampResult129_g69647 = clamp( staticSwitch14_g69648 , 0.01 , 0.99 );
				half Global_MeshVariation4531_g69600 = clampResult129_g69647;
				float lerpResult4544_g69600 = lerp( 0.0 , Global_MeshVariation4531_g69600 , _AlphaVariationValue);
				half Global_Alpha_Variation4546_g69600 = lerpResult4544_g69600;
				float lerpResult4053_g69600 = lerp( 1.0 , ( ( Global_ExtrasTex_Alpha1033_g69600 - Global_Alpha_Variation4546_g69600 ) + 0.09 ) , _GlobalAlpha);
				half Main_Mask_Leaves3712_g69600 = break3589_g69600.g;
				float lerpResult4075_g69600 = lerp( 1.0 , lerpResult4053_g69600 , Main_Mask_Leaves3712_g69600);
				half Final_Alpha4102_g69600 = lerpResult4075_g69600;
				float Alpha4430_g69600 = Final_Alpha4102_g69600;
				{
				clip(Alpha4430_g69600 - 0.1);
				}
				float temp_output_3_0_g69644 = localCustomAlphaClipAlways4430_g69600;
				half Offest27_g69644 = 0.0;
				half Feather30_g69644 = 0.2;
				
				surfaceDescription.Alpha = ( ( ( temp_output_3_0_g69644 - Offest27_g69644 ) / ( max( fwidth( temp_output_3_0_g69644 ) , 0.001 ) + Feather30_g69644 ) ) + Offest27_g69644 );
				
				#ifdef _ALPHATEST_ON
				surfaceDescription.AlphaClipThreshold = 0;
				#endif
				
				packedInput.positionCS.zw = clipPos.zw;
				float3 positionRWS = worldPos;

#if defined( ASE_SRP_VERSION ) && ASE_SRP_VERSION < 60900
				input.worldToTangent = k_identity3x3;
#else
				input.tangentToWorld = k_identity3x3;
#endif

				input.positionSS = packedInput.positionCS;
				input.positionRWS = positionRWS;
				PositionInputs posInput = GetPositionInput( input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS );

				float3 normalizedWorldViewDir = GetWorldSpaceNormalizeViewDir( input.positionRWS );

				SurfaceData surfaceData;
				BuiltinData builtinData;

				GetSurfaceAndBuiltinData(surfaceDescription,input, normalizedWorldViewDir, posInput, surfaceData, builtinData);

				outputDepth = posInput.deviceDepth;

				#ifdef WRITE_NORMAL_BUFFER
					EncodeIntoNormalBuffer(ConvertSurfaceDataToNormalData(surfaceData), posInput.positionSS, outNormalBuffer);
					#ifdef WRITE_MSAA_DEPTH
					depthColor = packedInput.positionCS.z;
					#endif
				#elif defined(SCENESELECTIONPASS)
					outColor = float4(_ObjectId, _PassValue, 1.0, 1.0);
				#endif
			}

            ENDHLSL
        } 

		
		Pass
		{
			
			Name "META"
			Tags { "LightMode"="Meta" }
			Cull Off

			HLSLPROGRAM

			#define _MATERIAL_FEATURE_TRANSMISSION 1
			#define _DISABLE_SSR 1
			#define ASE_SRP_VERSION 120100
			#ifdef UNITY_COLORSPACE_GAMMA//AI_SRP
			#define unity_ColorSpaceDielectricSpec half4(0.220916301, 0.220916301, 0.220916301, 1.0 - 0.220916301)//AI_SRP
			#else//AI_SRP
			#define unity_ColorSpaceDielectricSpec half4(0.04, 0.04, 0.04, 1.0 - 0.04) //AI_SRP
			#endif//AI_SRP


			#pragma vertex Vert
			#pragma fragment Frag

			#if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define OUTPUT_SPLIT_LIGHTING
			#endif

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#if defined( ASE_SRP_VERSION ) && ASE_SRP_VERSION < 60900              
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Wind.hlsl"
			#endif
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"

			#define SHADERPASS SHADERPASS_LIGHT_TRANSPORT

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

			#if defined( ASE_SRP_VERSION ) && ASE_SRP_VERSION < 60900
			#define T2W(var, index) var.worldToTangent[index]
			#else
			#define T2W(var, index) var.tangentToWorld[index]
			#endif

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/CommonLighting.hlsl"
			#define ai_ObjectToWorld GetObjectToWorldMatrix()
			#define ai_WorldToObject GetWorldToObjectMatrix()
			#define AI_INV_TWO_PI  INV_TWO_PI
			#define AI_PI          PI
			#define AI_INV_PI      INV_PI
			//TVE Pipeline Defines
			#define THE_VEGETATION_ENGINE
			#define TVE_IS_HD_PIPELINE
			//TVE Injection Defines
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END


			struct AttributesMesh
			{
				float4 vertex : POSITION;
				float3 normal : NORMAL;
				float4 tangent : TANGENT;
				float4 texcoord : TEXCOORD0;
				float4 uv1 : TEXCOORD1;
				float4 uv2 : TEXCOORD2;
				float4 color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				
			};

			struct PackedVaryingsMeshToPS
			{
				float4 positionCS : SV_Position;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				float4 frameUVs99 : TEXCOORD0;
				float4 viewPos99 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
			};

			float4x4 unity_CameraProjection;
			float4x4 unity_CameraInvProjection;
			float4x4 unity_WorldToCamera;
			float4x4 unity_CameraToWorld;
			sampler2D _Albedo;
			sampler2D _Normals;
			half4 TVE_MotionParams;
			TEXTURE2D_ARRAY(TVE_MotionTex);
			half4 TVE_MotionCoords;
			SAMPLER(sampler_linear_repeat);
			float TVE_MotionUsage[10];
			half4 TVE_NoiseParams;
			half4 TVE_VertexParams;
			TEXTURE2D_ARRAY(TVE_VertexTex);
			half4 TVE_VertexCoords;
			float TVE_VertexUsage[10];
			half _DisableSRPBatcher;
			sampler2D _Mask;
			sampler2D _Emissive;
			half4 TVE_ColorsParams;
			TEXTURE2D_ARRAY(TVE_ColorsTex);
			half4 TVE_ColorsCoords;
			float TVE_ColorsUsage[10];
			half TVE_SubsurfaceValue;
			half3 TVE_MainLightDirection;
			half4 TVE_OverlayColor;
			half4 TVE_ExtrasParams;
			TEXTURE2D_ARRAY(TVE_ExtrasTex);
			half4 TVE_ExtrasCoords;
			float TVE_ExtrasUsage[10];
			CBUFFER_START( UnityPerMaterial )
			float4 _ImpostorGrassColor;
			half4 _SubsurfaceColor;
			float4 _ImpostorLeafColor;
			half4 _SubsurfaceMaskRemap;
			half4 _ColorsMaskRemap;
			float4 _ImpostorBarkColor;
			half4 _OverlayMaskRemap;
			half4 _EmissiveColor;
			half4 _DetailBlendRemap;
			float4 _AI_SizeOffset;
			float4 _NoiseMaskRemap;
			float4 _SubsurfaceDiffusion_Asset;
			float4 _SubsurfaceDiffusion_asset;
			float4 _GradientMaskRemap;
			float4 _EmissiveIntensityParams;
			float3 _AI_Offset;
			half _ImpostorLeafSaturationValue;
			half _ImpostorBarkSaturationValue;
			half _GlobalSize;
			half _MotionSpeed_10;
			half _InteractionMaskValue;
			half _InteractionAmplitude;
			half _MotionScale_10;
			half _MotionAmplitude_10;
			half _LayerMotionValue;
			float _AI_Clip;
			float _AI_ShadowView;
			float _AI_ShadowBias;
			half _LayerVertexValue;
			half _IsVegetationShader;
			half _VertexDynamicMode;
			half _ColorsPositionMode;
			half _GlobalWetness;
			half _ImpostorSmoothnessValue;
			half _GlobalEmissive;
			half _EmissiveExposureValue;
			half _OverlayMaskMaxValue;
			half _OverlayMaskMinValue;
			half _OverlayVariationValue;
			half _LayerExtrasValue;
			half _ImpostorGrassSaturationValue;
			half _ExtrasPositionMode;
			half _SubsurfaceMaskMaxValue;
			half _SubsurfaceMaskMinValue;
			half _SubsurfaceValue;
			half _ColorsMaskMaxValue;
			half _ColorsMaskMinValue;
			half _ColorsVariationValue;
			half _GlobalColors;
			half _LayerColorsValue;
			half _GlobalOverlay;
			float _AI_DepthSize;
			float _AI_ImpostorSize;
			float _AI_Parallax;
			half _SpaceGlobalLocals;
			half _SpaceGlobalPosition;
			half _SpaceGlobalLayers;
			half _SpaceMotionLocals;
			half _SubsurfaceAngleValue;
			half _DetailBlendMode;
			half _CategorySizeFade;
			half _IsImpostorShader;
			half _SubsurfaceScatteringValue;
			half _SubsurfaceAmbientValue;
			half _DetailMode;
			half _CategoryNoise;
			half _CategoryMotion;
			half _LayerReactValue;
			half _RenderQueue;
			half _IsTVEShader;
			half _CategoryGlobal;
			half _MessageSizeFade;
			half _SubsurfaceNormalValue;
			half _RenderPriority;
			half _SubsurfaceDirectValue;
			half _AlphaVariationValue;
			float _AI_FramesY;
			float _AI_FramesX;
			float _AI_Frames;
			half _RenderCoverage;
			float _RenderSpecular;
			half _IsSubsurfaceShader;
			half _ImpostorCat;
			float _AI_TextureBias;
			half _VertexPivotMode;
			half _SubsurfaceShadowValue;
			half _EmissiveFlagMode;
			float _IsVersion;
			half _CategorySubsurface;
			float _VegetationMode;
			half _CategoryEmissive;
			float _SubsurfaceDiffusion;
			half _CategoryDetail;
			half _IsInitialized;
			half _GlobalAlpha;
			CBUFFER_END


			inline void SphereImpostorVertex( inout float4 vertex, inout float3 normal, inout float4 frameUVs, inout float4 viewPos )
			{
				float2 uvOffset = _AI_SizeOffset.zw;
				float sizeX = _AI_FramesX;
				float sizeY = _AI_FramesY - 1; 
				float UVscale = _AI_ImpostorSize;
				float4 fractions = 1 / float4( sizeX, _AI_FramesY, sizeY, UVscale );
				float2 sizeFraction = fractions.xy;
				float axisSizeFraction = fractions.z;
				float fractionsUVscale = fractions.w;
				float3 worldOrigin = 0;
				float4 perspective = float4( 0, 0, 0, 1 );
				if( UNITY_MATRIX_P[ 3 ][ 3 ] == 1 )
				{
				perspective = float4( 0, 0, 5000, 0 );
				worldOrigin = ai_ObjectToWorld._m03_m13_m23;
				}
				float3 worldCameraPos = worldOrigin + mul( UNITY_MATRIX_I_V, perspective ).xyz;
				float3 objectCameraPosition = mul( ai_WorldToObject, float4( worldCameraPos, 1 ) ).xyz - _AI_Offset.xyz; 
				float3 objectCameraDirection = normalize( objectCameraPosition );
				float3 upVector = float3( 0,1,0 );
				float3 objectHorizontalVector = normalize( cross( objectCameraDirection, upVector ) );
				float3 objectVerticalVector = cross( objectHorizontalVector, objectCameraDirection );
				float verticalAngle = frac( atan2( -objectCameraDirection.z, -objectCameraDirection.x ) * AI_INV_TWO_PI ) * sizeX + 0.5;
				float verticalDot = dot( objectCameraDirection, upVector );
				float upAngle = ( acos( -verticalDot ) * AI_INV_PI ) + axisSizeFraction * 0.5f;
				float yRot = sizeFraction.x * AI_PI * verticalDot * ( 2 * frac( verticalAngle ) - 1 );
				float2 uvExpansion = vertex.xy;
				float cosY = cos( yRot );
				float sinY = sin( yRot );
				float2 uvRotator = mul( uvExpansion, float2x2( cosY, -sinY, sinY, cosY ) );
				float3 billboard = objectHorizontalVector * uvRotator.x + objectVerticalVector * uvRotator.y + _AI_Offset.xyz;
				float2 relativeCoords = float2( floor( verticalAngle ), min( floor( upAngle * sizeY ), sizeY ) );
				float2 frameUV = ( ( uvExpansion * fractionsUVscale + 0.5 ) + relativeCoords ) * sizeFraction;
				frameUVs.xy = frameUV - uvOffset;
				frameUVs.zw = 0;
				viewPos.w = 0;
				viewPos.xyz = TransformWorldToView( TransformObjectToWorld( billboard ) );
				vertex.xyz = billboard;
				normal.xyz = objectCameraDirection;
			}
			
			float3 ObjectPosition_UNITY_MATRIX_M(  )
			{
				return float3(UNITY_MATRIX_M[0].w, UNITY_MATRIX_M[1].w, UNITY_MATRIX_M[2].w );
			}
			
			inline void SphereImpostorFragment( inout SurfaceOutput o, out float4 clipPos, out float3 worldPos, float4 frameUV, float4 viewPos, out float4 output0, out float4 output1 )
			{
				#if _USE_PARALLAX_ON
				float4 parallaxSample = tex2Dbias( _Normals, float4(frameUV.xy, 0, -1) );
				frameUV.xy = ( ( 0.5 - parallaxSample.a ) * frameUV.zw ) + frameUV.xy;
				#endif
				float4 albedoSample = tex2Dbias( _Albedo, float4(frameUV.xy, 0, _AI_TextureBias) );
				o.Alpha = ( albedoSample.a - _AI_Clip );
				clip( o.Alpha );
				o.Albedo = albedoSample.rgb;
				#if defined(AI_HD_RENDERPIPELINE) && ( AI_HDRP_VERSION >= 50702 )
				float4 feat1 = _Features.SampleLevel( SamplerState_Point_Repeat, frameUV.xy, 0);
				o.Diffusion = feat1.rgb;
				o.Features = feat1.a;
				float4 test1 = _Specular.SampleLevel( SamplerState_Point_Repeat, frameUV.xy, 0);
				o.MetalTangent = test1.b;
				#endif
				output0 = tex2Dbias( _Mask, float4(frameUV.xy, 0, _AI_TextureBias) );
				output1 = tex2Dbias( _Emissive, float4(frameUV.xy, 0, _AI_TextureBias) );
				float4 normalSample = tex2Dbias( _Normals, float4(frameUV.xy, 0, _AI_TextureBias) );
				float4 remapNormal = normalSample * 2 - 1; 
				float3 worldNormal = normalize( mul( (float3x3)ai_ObjectToWorld, remapNormal.xyz ) );
				o.Normal = worldNormal;
				#if defined(UNITY_PASS_SHADOWCASTER) // Standard RP fix for deferred path
				float depth = remapNormal.a * _AI_DepthSize * 0.4999 * length( ai_ObjectToWorld[ 2 ].xyz );
				#else
				float depth = remapNormal.a * _AI_DepthSize * 0.5 * length( ai_ObjectToWorld[ 2 ].xyz );
				#endif
				#if ( defined(SHADERPASS) && (SHADERPASS == SHADERPASS_SHADOWS) ) || defined(UNITY_PASS_SHADOWCASTER)
				viewPos.z += depth * _AI_ShadowView;
				viewPos.z += -_AI_ShadowBias;
				#else 
				viewPos.z += depth;
				#endif
				worldPos = GetAbsolutePositionWS( mul( UNITY_MATRIX_I_V, float4( viewPos.xyz, 1 ) )).xyz;
				clipPos = mul( UNITY_MATRIX_P, float4( viewPos.xyz, 1 ) );
				#if defined(UNITY_PASS_SHADOWCASTER) && !defined(SHADERPASS)
				#if UNITY_REVERSED_Z
				clipPos.z = min( clipPos.z, clipPos.w * UNITY_NEAR_CLIP_VALUE );
				#else
				clipPos.z = max( clipPos.z, clipPos.w * UNITY_NEAR_CLIP_VALUE );
				#endif
				#endif
				clipPos.xyz /= clipPos.w;
				if( UNITY_NEAR_CLIP_VALUE < 0 )
				clipPos = clipPos * 0.5 + 0.5;
			}
			
			float3 ASEGetEmissionHDRColor(float3 ldrColor, float luminanceIntensity, float exposureWeight, float inverseCurrentExposureMultiplier)
			{
				float3 hdrColor = ldrColor * luminanceIntensity;
				hdrColor = lerp( hdrColor* inverseCurrentExposureMultiplier, hdrColor, exposureWeight);
				return hdrColor;
			}
			

			void BuildSurfaceData( FragInputs fragInputs, inout GlobalSurfaceDescription surfaceDescription, float3 V, out SurfaceData surfaceData, out float3 bentNormalWS )
			{
				ZERO_INITIALIZE( SurfaceData, surfaceData );
				surfaceData.baseColor = surfaceDescription.Albedo;
				surfaceData.perceptualSmoothness = surfaceDescription.Smoothness;
				#ifdef _SPECULAR_OCCLUSION_CUSTOM
					surfaceData.specularOcclusion = surfaceDescription.SpecularOcclusion;
				#endif
					surfaceData.ambientOcclusion = surfaceDescription.Occlusion;
					surfaceData.metallic = surfaceDescription.Metallic;
					surfaceData.coatMask = surfaceDescription.CoatMask;

				#ifdef _MATERIAL_FEATURE_IRIDESCENCE		
					surfaceData.iridescenceMask = surfaceDescription.IridescenceMask;
					surfaceData.iridescenceThickness = surfaceDescription.IridescenceThickness;
				#endif
					surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;
				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
					surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
				#endif
				#ifdef _MATERIAL_FEATURE_TRANSMISSION
					surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
				#endif
				#ifdef _MATERIAL_FEATURE_ANISOTROPY
					surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;
				#endif

				#ifdef ASE_LIT_CLEAR_COAT
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
				#endif

				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
					surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
				#endif
				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
					surfaceData.specularColor = surfaceDescription.Specular;
					surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
				#endif

				#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
					surfaceData.baseColor *= ( 1.0 - Max3( surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b ) );
				#endif
					//float3 normalTS = float3( 0.0f, 0.0f, 1.0f );
					//normalTS = surfaceDescription.Normal;
					GetNormalWS( fragInputs, float3( 0.0, 0.0, 1.0 ), surfaceData.normalWS, float3( 1.0, 1.0, 1.0 ) );
					bentNormalWS = surfaceData.normalWS;

				#ifdef ASE_BENT_NORMAL
					GetNormalWS( fragInputs, surfaceDescription.BentNormal, bentNormalWS, float4( 1, 1, -1, 0 ) );
				#endif
				
				surfaceData.geomNormalWS = T2W(fragInputs, 2);
				
				#ifdef _HAS_REFRACTION
					if( _EnableSSRefraction )
					{
						surfaceData.ior = surfaceDescription.RefractionIndex;
						surfaceData.transmittanceColor = surfaceDescription.RefractionColor;
						surfaceData.atDistance = surfaceDescription.RefractionDistance;

						surfaceData.transmittanceMask = ( 1.0 - surfaceDescription.Alpha );
						surfaceDescription.Alpha = 1.0;
					}
					else
					{
						surfaceData.ior = 1.0;
						surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
						surfaceData.atDistance = 1.0;
						surfaceData.transmittanceMask = 0.0;
						surfaceDescription.Alpha = 1.0;
					}
				#else
					surfaceData.ior = 1.0;
					surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
					surfaceData.atDistance = 1.0;
					surfaceData.transmittanceMask = 0.0;
				#endif

				#if defined(_HAS_REFRACTION) || defined(_MATERIAL_FEATURE_TRANSMISSION)
					surfaceData.thickness = surfaceDescription.Thickness;
				#endif

				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
					surfaceData.subsurfaceMask = surfaceDescription.SubsurfaceMask;
					surfaceData.diffusionProfile = surfaceDescription.DiffusionProfile;
				#endif

					surfaceData.tangentWS = normalize( T2W(fragInputs, 0).xyz );    // The tangent is not normalize in worldToTangent for mikkt. TODO: Check if it expected that we normalize with Morten. Tag: SURFACE_GRADIENT
				#ifdef _MATERIAL_FEATURE_ANISOTROPY	
					surfaceData.anisotropy = surfaceDescription.Anisotropy;
					surfaceData.tangentWS = TransformTangentToWorld( surfaceDescription.Tangent, fragInputs.worldToTangent );
				#endif
					surfaceData.tangentWS = Orthonormalize( surfaceData.tangentWS, surfaceData.normalWS );
				#if defined(_SPECULAR_OCCLUSION_CUSTOM)
				#elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
					surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO( V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness( surfaceData.perceptualSmoothness ) );
				#elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
					surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion( ClampNdotV( dot( surfaceData.normalWS, V ) ), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness( surfaceData.perceptualSmoothness ) );
				#else
					surfaceData.specularOcclusion = 1.0;
				#endif
				#ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
					surfaceData.perceptualSmoothness = GeometricNormalFiltering( surfaceData.perceptualSmoothness, T2W(fragInputs, 2), surfaceDescription.SpecularAAScreenSpaceVariance, surfaceDescription.SpecularAAThreshold );
				#endif

			}

			void GetSurfaceAndBuiltinData( GlobalSurfaceDescription surfaceDescription,FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData )
			{
				//#ifdef LOD_FADE_CROSSFADE
				//	uint3 fadeMaskSeed = asuint( ( int3 )( V * _ScreenSize.xyx ) ); // Quantize V to _ScreenSize values
				//	LODDitheringTransition( fadeMaskSeed, unity_LODFade.x );
				//#endif

				#ifdef _ALPHATEST_ON
					DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif

				float3 bentNormalWS;
				BuildSurfaceData( fragInputs, surfaceDescription, V, surfaceData, bentNormalWS );

				#if HAVE_DECALS
				if( _EnableDecals )
				{
					DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, surfaceDescription.Alpha);
					ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData);
				}
				#endif

				#if defined( ASE_SRP_VERSION ) && ASE_SRP_VERSION <= 50702
					InitBuiltinData( surfaceDescription.Alpha, bentNormalWS, -T2W(fragInputs, 2), fragInputs.positionRWS, fragInputs.texCoord1, fragInputs.texCoord2, builtinData );
				#else
					InitBuiltinData( posInput, surfaceDescription.Alpha, bentNormalWS, -T2W(fragInputs, 2), fragInputs.texCoord1, fragInputs.texCoord2, builtinData );
				#endif

				builtinData.emissiveColor = surfaceDescription.Emission;

				builtinData.depthOffset = 0.0;

				#if (SHADERPASS == SHADERPASS_DISTORTION)
					builtinData.distortion = surfaceDescription.Distortion;
					builtinData.distortionBlur = surfaceDescription.DistortionBlur;
				#else
					builtinData.distortion = float2( 0.0, 0.0 );
					builtinData.distortionBlur = 0.0;
				#endif

				PostInitBuiltinData( V, posInput, surfaceData, builtinData );
			}

			CBUFFER_START( UnityMetaPass )
			bool4 unity_MetaVertexControl;
			bool4 unity_MetaFragmentControl;
			CBUFFER_END

			float unity_OneOverOutputBoost;
			float unity_MaxOutputValue;

			PackedVaryingsMeshToPS Vert( AttributesMesh inputMesh  )
			{
				UNITY_SETUP_INSTANCE_ID( inputMesh );
				PackedVaryingsMeshToPS outputPackedVaryingsMeshToPS;
				UNITY_TRANSFER_INSTANCE_ID( inputMesh, outputPackedVaryingsMeshToPS );

				SphereImpostorVertex( inputMesh.vertex, inputMesh.normal, outputPackedVaryingsMeshToPS.frameUVs99, outputPackedVaryingsMeshToPS.viewPos99 );
				float3 viewToObj3965_g69600 = mul( GetWorldToObjectMatrix(), mul( UNITY_MATRIX_I_V , float4( outputPackedVaryingsMeshToPS.viewPos99.xyz, 1 ) ) ).xyz;
				float3 VertexPosition3564_g69600 = viewToObj3965_g69600;
				half3 VertexPos40_g69645 = VertexPosition3564_g69600;
				float3 appendResult74_g69645 = (float3(VertexPos40_g69645.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g69645 = appendResult74_g69645;
				float3 break84_g69645 = VertexPos40_g69645;
				float3 appendResult81_g69645 = (float3(0.0 , break84_g69645.y , break84_g69645.z));
				half3 VertexPosOtherAxis82_g69645 = appendResult81_g69645;
				float4 temp_output_91_19_g69623 = TVE_MotionCoords;
				float3 localObjectPosition_UNITY_MATRIX_M14_g69635 = ObjectPosition_UNITY_MATRIX_M();
				#ifdef SHADEROPTIONS_CAMERA_RELATIVE_RENDERING
				float3 staticSwitch13_g69635 = ( localObjectPosition_UNITY_MATRIX_M14_g69635 + _WorldSpaceCameraPos );
				#else
				float3 staticSwitch13_g69635 = localObjectPosition_UNITY_MATRIX_M14_g69635;
				#endif
				half3 ObjectData20_g69636 = staticSwitch13_g69635;
				float3 ase_worldPos = GetAbsolutePositionWS( TransformObjectToWorld( (inputMesh.vertex).xyz ) );
				half3 WorldData19_g69636 = ase_worldPos;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g69636 = WorldData19_g69636;
				#else
				float3 staticSwitch14_g69636 = ObjectData20_g69636;
				#endif
				float3 temp_output_114_0_g69635 = staticSwitch14_g69636;
				float3 vertexToFrag4543_g69600 = temp_output_114_0_g69635;
				float3 ObjectPosition4422_g69600 = vertexToFrag4543_g69600;
				half2 UV94_g69623 = ( (temp_output_91_19_g69623).zw + ( (temp_output_91_19_g69623).xy * (ObjectPosition4422_g69600).xz ) );
				float temp_output_84_0_g69623 = _LayerMotionValue;
				float4 lerpResult107_g69623 = lerp( TVE_MotionParams , saturate( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_MotionTex, sampler_linear_repeat, UV94_g69623,temp_output_84_0_g69623, 0.0 ) ) , TVE_MotionUsage[(int)temp_output_84_0_g69623]);
				half4 Global_Motion_Params4344_g69600 = lerpResult107_g69623;
				float4 break322_g69639 = Global_Motion_Params4344_g69600;
				float3 appendResult397_g69639 = (float3(break322_g69639.x , 0.0 , break322_g69639.y));
				float3 temp_output_398_0_g69639 = (appendResult397_g69639*2.0 + -1.0);
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				half2 Motion_DirectionOS39_g69600 = (( mul( GetWorldToObjectMatrix(), float4( temp_output_398_0_g69639 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_DirectionOS358_g69627 = Motion_DirectionOS39_g69600;
				float temp_output_3572_0_g69600 = saturate( VertexPosition3564_g69600.y );
				half Mesh_Motion_1082_g69600 = ( temp_output_3572_0_g69600 * 2.0 );
				half Wind_Power369_g69639 = break322_g69639.z;
				half Motion_WindPower2223_g69600 = Wind_Power369_g69639;
				half3 Input_Position419_g69643 = -ObjectPosition4422_g69600;
				half2 Motion_DirectionWS4464_g69600 = (temp_output_398_0_g69639).xz;
				half2 Input_DirectionWS423_g69643 = Motion_DirectionWS4464_g69600;
				float Motion_Scale287_g69643 = ( _MotionScale_10 + 0.2 );
				half Global_Scale448_g69643 = TVE_NoiseParams.x;
				half Input_Speed62_g69643 = _MotionSpeed_10;
				half Global_Speed449_g69643 = TVE_NoiseParams.y;
				float mulTime426_g69643 = _TimeParameters.x * ( Input_Speed62_g69643 * Global_Speed449_g69643 );
				half Global_DistScale561_g69643 = TVE_NoiseParams.w;
				float3 break461_g69643 = ( Input_Position419_g69643 * Global_DistScale561_g69643 );
				half Global_DistAmplitude559_g69643 = TVE_NoiseParams.z;
				float Noise_Distortion469_g69643 = ( sin( ( break461_g69643.x + break461_g69643.z ) ) * Global_DistAmplitude559_g69643 );
				half Motion_Variation284_g69643 = 0.0;
				float2 temp_output_425_0_g69643 = ( ( (Input_Position419_g69643).xz * Input_DirectionWS423_g69643 * Motion_Scale287_g69643 * Global_Scale448_g69643 ) + ( mulTime426_g69643 + Noise_Distortion469_g69643 + Motion_Variation284_g69643 ) );
				float2 break500_g69643 = ( temp_output_425_0_g69643 * 0.1178 );
				float2 break494_g69643 = ( temp_output_425_0_g69643 * 0.1742 );
				half Input_WindPower327_g69643 = Motion_WindPower2223_g69600;
				float lerpResult430_g69643 = lerp( 1.4 , 0.4 , Input_WindPower327_g69643);
				half Global_MotionNoise34_g69600 = (pow( (( sin( ( break500_g69643.x + break500_g69643.y ) ) * sin( ( break494_g69643.x + break494_g69643.y ) ) )*0.4 + 0.6) , lerpResult430_g69643 )*1.2 + -0.2);
				half Motion_10_Amplitude2258_g69600 = ( _MotionAmplitude_10 * Mesh_Motion_1082_g69600 * Motion_WindPower2223_g69600 * Global_MotionNoise34_g69600 );
				half Input_BendingAmplitude376_g69627 = Motion_10_Amplitude2258_g69600;
				half Input_InteractionAmplitude58_g69627 = _InteractionAmplitude;
				half Input_MeshMotion_10321_g69627 = Mesh_Motion_1082_g69600;
				half Input_InteractionUseMask62_g69627 = _InteractionMaskValue;
				float lerpResult371_g69627 = lerp( 2.0 , Input_MeshMotion_10321_g69627 , Input_InteractionUseMask62_g69627);
				half ObjectData20_g69628 = lerpResult371_g69627;
				half WorldData19_g69628 = Input_MeshMotion_10321_g69627;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g69628 = WorldData19_g69628;
				#else
				float staticSwitch14_g69628 = ObjectData20_g69628;
				#endif
				half Motion_10_Interaction373_g69627 = ( Input_InteractionAmplitude58_g69627 * staticSwitch14_g69628 );
				half Interaction_Mask66_g69600 = ( break322_g69639.w * break322_g69639.w );
				float Input_InteractionMask330_g69627 = Interaction_Mask66_g69600;
				float lerpResult360_g69627 = lerp( Input_BendingAmplitude376_g69627 , Motion_10_Interaction373_g69627 , saturate( ( Input_InteractionAmplitude58_g69627 * Input_InteractionMask330_g69627 ) ));
				float2 break364_g69627 = ( Input_DirectionOS358_g69627 * lerpResult360_g69627 );
				half Motion_10_BendingZ190_g69600 = break364_g69627.y;
				half Angle44_g69645 = Motion_10_BendingZ190_g69600;
				half3 VertexPos40_g69642 = ( VertexPosRotationAxis50_g69645 + ( VertexPosOtherAxis82_g69645 * cos( Angle44_g69645 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g69645 ) * sin( Angle44_g69645 ) ) );
				float3 appendResult74_g69642 = (float3(0.0 , 0.0 , VertexPos40_g69642.z));
				half3 VertexPosRotationAxis50_g69642 = appendResult74_g69642;
				float3 break84_g69642 = VertexPos40_g69642;
				float3 appendResult81_g69642 = (float3(break84_g69642.x , break84_g69642.y , 0.0));
				half3 VertexPosOtherAxis82_g69642 = appendResult81_g69642;
				half Motion_10_BendingX216_g69600 = break364_g69627.x;
				half Angle44_g69642 = -Motion_10_BendingX216_g69600;
				float3 Vertex_Motion_Object833_g69600 = ( VertexPosRotationAxis50_g69642 + ( VertexPosOtherAxis82_g69642 * cos( Angle44_g69642 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g69642 ) * sin( Angle44_g69642 ) ) );
				float4 temp_output_94_19_g69606 = TVE_VertexCoords;
				half2 UV97_g69606 = ( (temp_output_94_19_g69606).zw + ( (temp_output_94_19_g69606).xy * (ObjectPosition4422_g69600).xz ) );
				float temp_output_84_0_g69606 = _LayerVertexValue;
				float4 lerpResult109_g69606 = lerp( TVE_VertexParams , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_VertexTex, sampler_linear_repeat, UV97_g69606,temp_output_84_0_g69606, 0.0 ) , TVE_VertexUsage[(int)temp_output_84_0_g69606]);
				half4 Global_Vertex_Params4413_g69600 = lerpResult109_g69606;
				half Global_VertexTex_Size174_g69600 = saturate( Global_Vertex_Params4413_g69600.w );
				float lerpResult346_g69600 = lerp( 1.0 , Global_VertexTex_Size174_g69600 , _GlobalSize);
				float3 appendResult3480_g69600 = (float3(lerpResult346_g69600 , lerpResult346_g69600 , lerpResult346_g69600));
				half3 Vertex_Size1741_g69600 = appendResult3480_g69600;
				half3 _Vector5 = half3(1,1,1);
				float3 Vertex_SizeFade1740_g69600 = _Vector5;
				half IsInitialized3811_g69600 = _IsInitialized;
				float3 Final_VertexPosition890_g69600 = ( ( ( ( Vertex_Motion_Object833_g69600 * Vertex_Size1741_g69600 * Vertex_SizeFade1740_g69600 ) - VertexPosition3564_g69600 ) * IsInitialized3811_g69600 ) + _DisableSRPBatcher );
				
				outputPackedVaryingsMeshToPS.ase_texcoord2.xyz = vertexToFrag4543_g69600;
				outputPackedVaryingsMeshToPS.ase_texcoord3.xyz = ase_worldPos;
				
				
				//setting value to unused interpolator channels and avoid initialization warnings
				outputPackedVaryingsMeshToPS.ase_texcoord2.w = 0;
				outputPackedVaryingsMeshToPS.ase_texcoord3.w = 0;
				inputMesh.vertex.xyz += Final_VertexPosition890_g69600;

				float2 uv;

				if( unity_MetaVertexControl.x )
				{
					uv = inputMesh.uv1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
				}
				else if( unity_MetaVertexControl.y )
				{
					uv = inputMesh.uv2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
				}

				outputPackedVaryingsMeshToPS.positionCS = float4( uv * 2.0 - 1.0, inputMesh.vertex.z > 0 ? 1.0e-4 : 0.0, 1.0 );
				return outputPackedVaryingsMeshToPS;
			}

			float4 Frag( PackedVaryingsMeshToPS packedInput  ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID( packedInput );

				#ifdef LOD_FADE_CROSSFADE
				float3 VC = GetWorldSpaceNormalizeViewDir(packedInput.interp00.xyz);
				LODDitheringTransition(ComputeFadeMaskSeed(VC, packedInput.positionCS.xy), unity_LODFade.x);
				#endif

				FragInputs input;
				ZERO_INITIALIZE( FragInputs, input );
				GlobalSurfaceDescription surfaceDescription = (GlobalSurfaceDescription)0;
				SurfaceOutput o = (SurfaceOutput)0;

				o.Normal = float3( 0, 0, 1 );
				float4 clipPos = 0;
				float3 worldPos = 0;

				half Vegetation_Type4515_g69600 = _VegetationMode;
				float4 output0 = 0;
				float4 output1 = 0;
				SphereImpostorFragment( o, clipPos, worldPos, packedInput.frameUVs99, packedInput.viewPos99, output0, output1 );
				half3 Main_Albedo_Raw4295_g69600 = o.Albedo;
				float dotResult4302_g69600 = dot( float3(0.2126,0.7152,0.0722) , Main_Albedo_Raw4295_g69600 );
				float3 temp_cast_0 = (dotResult4302_g69600).xxx;
				float4 break3589_g69600 = output0;
				half Main_Mask_Leaves3712_g69600 = break3589_g69600.g;
				float lerpResult4305_g69600 = lerp( _ImpostorBarkSaturationValue , _ImpostorLeafSaturationValue , Main_Mask_Leaves3712_g69600);
				float3 lerpResult4303_g69600 = lerp( temp_cast_0 , Main_Albedo_Raw4295_g69600 , lerpResult4305_g69600);
				float4 lerpResult4310_g69600 = lerp( _ImpostorBarkColor , _ImpostorLeafColor , Main_Mask_Leaves3712_g69600);
				float dotResult4323_g69600 = dot( float3(0.2126,0.7152,0.0722) , Main_Albedo_Raw4295_g69600 );
				float3 temp_cast_2 = (dotResult4323_g69600).xxx;
				float3 lerpResult4317_g69600 = lerp( temp_cast_2 , Main_Albedo_Raw4295_g69600 , _ImpostorGrassSaturationValue);
				float3 ifLocalVar18_g69633 = 0;
				UNITY_BRANCH 
				if( Vegetation_Type4515_g69600 > 0.5 )
				ifLocalVar18_g69633 = ( lerpResult4303_g69600 * (lerpResult4310_g69600).rgb );
				else if( Vegetation_Type4515_g69600 < 0.5 )
				ifLocalVar18_g69633 = ( lerpResult4317_g69600 * (_ImpostorGrassColor).rgb );
				half3 Main_Albedo3817_g69600 = ifLocalVar18_g69633;
				half3 Blend_Albedo4137_g69600 = Main_Albedo3817_g69600;
				half3 Blend_AlbedoTinted3958_g69600 = ( Blend_Albedo4137_g69600 * float3(1,1,1) );
				float dotResult4002_g69600 = dot( Blend_AlbedoTinted3958_g69600 , float3(0.2126,0.7152,0.0722) );
				float3 temp_cast_3 = (dotResult4002_g69600).xxx;
				float4 temp_output_91_19_g69619 = TVE_ColorsCoords;
				float3 temp_output_3563_0_g69600 = worldPos;
				float3 WorldPosition4027_g69600 = temp_output_3563_0_g69600;
				float3 vertexToFrag4543_g69600 = packedInput.ase_texcoord2.xyz;
				float3 ObjectPosition4422_g69600 = vertexToFrag4543_g69600;
				float3 lerpResult4478_g69600 = lerp( WorldPosition4027_g69600 , ObjectPosition4422_g69600 , _ColorsPositionMode);
				half2 UV94_g69619 = ( (temp_output_91_19_g69619).zw + ( (temp_output_91_19_g69619).xy * (lerpResult4478_g69600).xz ) );
				float temp_output_82_0_g69619 = _LayerColorsValue;
				float4 lerpResult108_g69619 = lerp( TVE_ColorsParams , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_ColorsTex, sampler_linear_repeat, UV94_g69619,temp_output_82_0_g69619, 0.0 ) , TVE_ColorsUsage[(int)temp_output_82_0_g69619]);
				half Global_ColorsTex_A1701_g69600 = saturate( (lerpResult108_g69619).a );
				half Global_Colors_Influence3998_g69600 = Global_ColorsTex_A1701_g69600;
				float3 lerpResult4004_g69600 = lerp( Blend_AlbedoTinted3958_g69600 , temp_cast_3 , Global_Colors_Influence3998_g69600);
				half3 Global_ColorsTex_RGB1700_g69600 = (lerpResult108_g69619).rgb;
				half3 Global_Colors3856_g69600 = ( Global_ColorsTex_RGB1700_g69600 * 4.594794 );
				float3 break111_g69647 = ObjectPosition4422_g69600;
				half Global_DynamicMode4535_g69600 = _VertexDynamicMode;
				half Input_DynamicMode120_g69647 = Global_DynamicMode4535_g69600;
				half Main_Variation_Or_Metallic3607_g69600 = break3589_g69600.r;
				half Input_Variation124_g69647 = Main_Variation_Or_Metallic3607_g69600;
				half ObjectData20_g69648 = frac( ( ( ( break111_g69647.x + break111_g69647.y + break111_g69647.z ) * ( 1.0 - Input_DynamicMode120_g69647 ) ) + Input_Variation124_g69647 ) );
				half WorldData19_g69648 = Input_Variation124_g69647;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g69648 = WorldData19_g69648;
				#else
				float staticSwitch14_g69648 = ObjectData20_g69648;
				#endif
				float clampResult129_g69647 = clamp( staticSwitch14_g69648 , 0.01 , 0.99 );
				half Global_MeshVariation4531_g69600 = clampResult129_g69647;
				float lerpResult4092_g69600 = lerp( 1.0 , ( Global_MeshVariation4531_g69600 * Global_MeshVariation4531_g69600 ) , _ColorsVariationValue);
				half Global_Colors_Value3999_g69600 = ( _GlobalColors * lerpResult4092_g69600 );
				half Main_Height_Or_Blend3609_g69600 = break3589_g69600.b;
				float temp_output_7_0_g69641 = _ColorsMaskMinValue;
				half Global_Colors_Mask4022_g69600 = ( saturate( ( ( Main_Height_Or_Blend3609_g69600 - temp_output_7_0_g69641 ) / ( _ColorsMaskMaxValue - temp_output_7_0_g69641 ) ) ) * Main_Mask_Leaves3712_g69600 );
				float3 lerpResult4007_g69600 = lerp( Blend_AlbedoTinted3958_g69600 , ( lerpResult4004_g69600 * Global_Colors3856_g69600 ) , ( Global_Colors_Value3999_g69600 * Global_Colors_Mask4022_g69600 ));
				float3 lerpResult4086_g69600 = lerp( Blend_Albedo4137_g69600 , lerpResult4007_g69600 , Main_Mask_Leaves3712_g69600);
				half3 Blend_AlbedoColored3711_g69600 = lerpResult4086_g69600;
				float3 temp_output_3681_0_g69600 = (_SubsurfaceColor).rgb;
				float dotResult4019_g69600 = dot( temp_output_3681_0_g69600 , float3(0.2126,0.7152,0.0722) );
				float3 temp_cast_6 = (dotResult4019_g69600).xxx;
				float3 lerpResult4018_g69600 = lerp( temp_output_3681_0_g69600 , temp_cast_6 , Global_Colors_Influence3998_g69600);
				float3 lerpResult4017_g69600 = lerp( temp_output_3681_0_g69600 , ( lerpResult4018_g69600 * Global_Colors3856_g69600 ) , ( Global_Colors_Value3999_g69600 * Global_Colors_Mask4022_g69600 ));
				half3 Subsurface_Color3656_g69600 = lerpResult4017_g69600;
				half Global_Subsurface4111_g69600 = TVE_SubsurfaceValue;
				half Subsurface_Intensity3684_g69600 = ( _SubsurfaceValue * Global_Subsurface4111_g69600 );
				float temp_output_7_0_g69618 = _SubsurfaceMaskMinValue;
				half Subsurface_Mask3666_g69600 = ( saturate( ( ( Main_Height_Or_Blend3609_g69600 - temp_output_7_0_g69618 ) / ( _SubsurfaceMaskMaxValue - temp_output_7_0_g69618 ) ) ) * Main_Mask_Leaves3712_g69600 );
				half3 Subsurface_Transmission3659_g69600 = ( Subsurface_Color3656_g69600 * Subsurface_Intensity3684_g69600 * Subsurface_Mask3666_g69600 );
				half3 MainLight_Direction4110_g69600 = TVE_MainLightDirection;
				float3 ase_worldPos = packedInput.ase_texcoord3.xyz;
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 normalizeResult3635_g69600 = normalize( ase_worldViewDir );
				float dotResult3631_g69600 = dot( -MainLight_Direction4110_g69600 , normalizeResult3635_g69600 );
				float saferPower3620_g69600 = abs( saturate( dotResult3631_g69600 ) );
				#ifdef UNITY_PASS_FORWARDADD
				float staticSwitch3636_g69600 = 0.0;
				#else
				float staticSwitch3636_g69600 = ( pow( saferPower3620_g69600 , _SubsurfaceAngleValue ) * _SubsurfaceScatteringValue );
				#endif
				half Mask_Subsurface_View3614_g69600 = staticSwitch3636_g69600;
				half3 Subsurface_Approximation3702_g69600 = ( Subsurface_Transmission3659_g69600 * Blend_AlbedoColored3711_g69600 * Mask_Subsurface_View3614_g69600 );
				half3 Albedo_Subsurface3874_g69600 = ( Blend_AlbedoColored3711_g69600 + Subsurface_Approximation3702_g69600 );
				half3 Global_OverlayColor1758_g69600 = (TVE_OverlayColor).rgb;
				half3 World_Normal3638_g69600 = o.Normal;
				float lerpResult4521_g69600 = lerp( Main_Height_Or_Blend3609_g69600 , World_Normal3638_g69600.y , Vegetation_Type4515_g69600);
				half Main_AlbedoTex_G3807_g69600 = Main_Albedo_Raw4295_g69600.y;
				float4 temp_output_93_19_g69601 = TVE_ExtrasCoords;
				float3 lerpResult4483_g69600 = lerp( WorldPosition4027_g69600 , ObjectPosition4422_g69600 , _ExtrasPositionMode);
				half2 UV96_g69601 = ( (temp_output_93_19_g69601).zw + ( (temp_output_93_19_g69601).xy * (lerpResult4483_g69600).xz ) );
				float temp_output_84_0_g69601 = _LayerExtrasValue;
				float4 lerpResult109_g69601 = lerp( TVE_ExtrasParams , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_ExtrasTex, sampler_linear_repeat, UV96_g69601,temp_output_84_0_g69601, 0.0 ) , TVE_ExtrasUsage[(int)temp_output_84_0_g69601]);
				float4 break89_g69601 = lerpResult109_g69601;
				half Global_ExtrasTex_Overlay156_g69600 = break89_g69601.b;
				float temp_output_3774_0_g69600 = ( _GlobalOverlay * Global_ExtrasTex_Overlay156_g69600 );
				float lerpResult3746_g69600 = lerp( 1.0 , Global_MeshVariation4531_g69600 , _OverlayVariationValue);
				half Overlay_Commons3739_g69600 = ( temp_output_3774_0_g69600 * lerpResult3746_g69600 );
				float temp_output_7_0_g69632 = _OverlayMaskMinValue;
				half Overlay_Mask3762_g69600 = saturate( ( ( ( ( ( lerpResult4521_g69600 * 0.5 ) + Main_AlbedoTex_G3807_g69600 ) * Overlay_Commons3739_g69600 ) - temp_output_7_0_g69632 ) / ( _OverlayMaskMaxValue - temp_output_7_0_g69632 ) ) );
				float3 lerpResult3875_g69600 = lerp( Albedo_Subsurface3874_g69600 , Global_OverlayColor1758_g69600 , Overlay_Mask3762_g69600);
				half3 Final_Albedo4100_g69600 = lerpResult3875_g69600;
				half IsInitialized3811_g69600 = _IsInitialized;
				float3 lerpResult3815_g69600 = lerp( float3( 1,0,0 ) , Final_Albedo4100_g69600 , IsInitialized3811_g69600);
				
				float3 hdEmission4376_g69600 = ASEGetEmissionHDRColor(_EmissiveColor.rgb,_EmissiveIntensityParams.x,_EmissiveExposureValue,GetInverseCurrentExposureMultiplier());
				half Global_ExtrasTex_Emissive4408_g69600 = break89_g69601.r;
				float lerpResult4417_g69600 = lerp( 1.0 , Global_ExtrasTex_Emissive4408_g69600 , _GlobalEmissive);
				half3 Final_Emissive4365_g69600 = ( (( hdEmission4376_g69600 * output1 )).rgb * lerpResult4417_g69600 );
				
				half Main_Mask_Smoothness3820_g69600 = break3589_g69600.a;
				half Main_Smoothness3838_g69600 = ( Main_Mask_Smoothness3820_g69600 * _ImpostorSmoothnessValue );
				half Global_ExtrasTex_Wetness305_g69600 = break89_g69601.g;
				float lerpResult3892_g69600 = lerp( Main_Smoothness3838_g69600 , saturate( ( Main_Smoothness3838_g69600 + Global_ExtrasTex_Wetness305_g69600 ) ) , _GlobalWetness);
				half Final_Smoothness3898_g69600 = lerpResult3892_g69600;
				
				float temp_output_3577_0_g69600 = o.Alpha;
				float localCustomAlphaClipAlways4430_g69600 = ( temp_output_3577_0_g69600 );
				half Global_ExtrasTex_Alpha1033_g69600 = saturate( break89_g69601.a );
				float lerpResult4544_g69600 = lerp( 0.0 , Global_MeshVariation4531_g69600 , _AlphaVariationValue);
				half Global_Alpha_Variation4546_g69600 = lerpResult4544_g69600;
				float lerpResult4053_g69600 = lerp( 1.0 , ( ( Global_ExtrasTex_Alpha1033_g69600 - Global_Alpha_Variation4546_g69600 ) + 0.09 ) , _GlobalAlpha);
				float lerpResult4075_g69600 = lerp( 1.0 , lerpResult4053_g69600 , Main_Mask_Leaves3712_g69600);
				half Final_Alpha4102_g69600 = lerpResult4075_g69600;
				float Alpha4430_g69600 = Final_Alpha4102_g69600;
				{
				clip(Alpha4430_g69600 - 0.1);
				}
				float temp_output_3_0_g69644 = localCustomAlphaClipAlways4430_g69600;
				half Offest27_g69644 = 0.0;
				half Feather30_g69644 = 0.2;
				
				half Subsurface_HD3650_g69600 = ( 1.0 - ( Subsurface_Intensity3684_g69600 * Subsurface_Mask3666_g69600 ) );
				

				surfaceDescription.Albedo = lerpResult3815_g69600;
				o.Normal = World_Normal3638_g69600;
				surfaceDescription.BentNormal = float3( 0, 0, 1 );
				surfaceDescription.CoatMask = 0;
				surfaceDescription.Metallic = 0;

				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceDescription.Specular = 0;
				#endif

				surfaceDescription.Emission = Final_Emissive4365_g69600;
				surfaceDescription.Smoothness = Final_Smoothness3898_g69600;
				surfaceDescription.Occlusion = 1;
				surfaceDescription.Alpha = ( ( ( temp_output_3_0_g69644 - Offest27_g69644 ) / ( max( fwidth( temp_output_3_0_g69644 ) , 0.001 ) + Feather30_g69644 ) ) + Offest27_g69644 );

				#ifdef _ALPHATEST_ON
				surfaceDescription.AlphaClipThreshold = 0;
				#endif

				#ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
				surfaceDescription.SpecularAAScreenSpaceVariance = 0;
				surfaceDescription.SpecularAAThreshold = 0;
				#endif

				#ifdef _SPECULAR_OCCLUSION_CUSTOM
				surfaceDescription.SpecularOcclusion = 0;
				#endif

				#if defined(_HAS_REFRACTION) || defined(_MATERIAL_FEATURE_TRANSMISSION)
				surfaceDescription.Thickness = Subsurface_HD3650_g69600;
				#endif

				#ifdef _HAS_REFRACTION
				surfaceDescription.RefractionIndex = 1;
				surfaceDescription.RefractionColor = float3( 1,1,1 );
				surfaceDescription.RefractionDistance = 0;
				#endif

				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceDescription.SubsurfaceMask = 1;
				surfaceDescription.DiffusionProfile = _SubsurfaceDiffusion;
				#endif

				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceDescription.Anisotropy = 1;
				surfaceDescription.Tangent = float3( 1,0,0 );
				#endif

				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceDescription.IridescenceMask = 0;
				surfaceDescription.IridescenceThickness = 0;
				#endif

				packedInput.positionCS.zw = clipPos.zw;
				float3 positionRWS = worldPos;

				input.positionSS = packedInput.positionCS;
				input.positionRWS = positionRWS;
#if defined( ASE_SRP_VERSION ) && ASE_SRP_VERSION < 60900
				input.worldToTangent = k_identity3x3;
#else
				input.tangentToWorld = k_identity3x3;
#endif

				PositionInputs posInput = GetPositionInput( input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS );

				SurfaceData surfaceData;
				BuiltinData builtinData;

				float3 normalizedWorldViewDir = GetWorldSpaceNormalizeViewDir( input.positionRWS );

				GetSurfaceAndBuiltinData( surfaceDescription,input, normalizedWorldViewDir, posInput, surfaceData, builtinData );

				BSDFData bsdfData = ConvertSurfaceDataToBSDFData( input.positionSS.xy, surfaceData );
				LightTransportData lightTransportData = GetLightTransportData( surfaceData, builtinData, bsdfData );

				float4 res = float4( 0.0, 0.0, 0.0, 1.0 );
				if( unity_MetaFragmentControl.x )
				{
					res.rgb = clamp( pow( abs( lightTransportData.diffuseColor ), saturate( unity_OneOverOutputBoost ) ), 0, unity_MaxOutputValue );
				}

				if( unity_MetaFragmentControl.y )
				{
					res.rgb = lightTransportData.emissiveColor;
				}

				return res;
			}

			ENDHLSL
		}

		
		Pass
        {
			
            Name "ShadowCaster"
            Tags { "LightMode"="ShadowCaster" }
			ColorMask 0
        
            HLSLPROGRAM
			#define _MATERIAL_FEATURE_TRANSMISSION 1
			#define _DISABLE_SSR 1
			#define ASE_SRP_VERSION 120100
			#ifdef UNITY_COLORSPACE_GAMMA//AI_SRP
			#define unity_ColorSpaceDielectricSpec half4(0.220916301, 0.220916301, 0.220916301, 1.0 - 0.220916301)//AI_SRP
			#else//AI_SRP
			#define unity_ColorSpaceDielectricSpec half4(0.04, 0.04, 0.04, 1.0 - 0.04) //AI_SRP
			#endif//AI_SRP

			#pragma vertex Vert
			#pragma fragment Frag

			#if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define OUTPUT_SPLIT_LIGHTING
			#endif
        
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#if defined( ASE_SRP_VERSION ) && ASE_SRP_VERSION < 60900              
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Wind.hlsl"
			#endif
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
        
            #define SHADERPASS SHADERPASS_SHADOWS
            #define USE_LEGACY_UNITY_MATRIX_VARIABLES
        
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
        
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

			#if defined( ASE_SRP_VERSION ) && ASE_SRP_VERSION < 60900
			#define T2W(var, index) var.worldToTangent[index]
			#else
			#define T2W(var, index) var.tangentToWorld[index]
			#endif

			#define ai_ObjectToWorld GetObjectToWorldMatrix()
			#define ai_WorldToObject GetWorldToObjectMatrix()
			#define AI_INV_TWO_PI  INV_TWO_PI
			#define AI_PI          PI
			#define AI_INV_PI      INV_PI
			//TVE Pipeline Defines
			#define THE_VEGETATION_ENGINE
			#define TVE_IS_HD_PIPELINE
			//TVE Injection Defines
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END


			struct AttributesMesh 
			{
				float4 vertex : POSITION;
				float3 normal : NORMAL;
				float4 texcoord : TEXCOORD0;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};
        
			struct PackedVaryingsMeshToPS 
			{
				float4 positionCS : SV_Position;
				float3 interp00 : TEXCOORD10;
				float4 frameUVs99 : TEXCOORD0;
				float4 viewPos99 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			float4x4 unity_CameraProjection;
			float4x4 unity_CameraInvProjection;
			float4x4 unity_WorldToCamera;
			float4x4 unity_CameraToWorld;
			sampler2D _Albedo;
			sampler2D _Normals;
			half4 TVE_MotionParams;
			TEXTURE2D_ARRAY(TVE_MotionTex);
			half4 TVE_MotionCoords;
			SAMPLER(sampler_linear_repeat);
			float TVE_MotionUsage[10];
			half4 TVE_NoiseParams;
			half4 TVE_VertexParams;
			TEXTURE2D_ARRAY(TVE_VertexTex);
			half4 TVE_VertexCoords;
			float TVE_VertexUsage[10];
			half _DisableSRPBatcher;
			sampler2D _Mask;
			sampler2D _Emissive;
			half4 TVE_ExtrasParams;
			TEXTURE2D_ARRAY(TVE_ExtrasTex);
			half4 TVE_ExtrasCoords;
			float TVE_ExtrasUsage[10];
			CBUFFER_START( UnityPerMaterial )
			float4 _ImpostorGrassColor;
			half4 _SubsurfaceColor;
			float4 _ImpostorLeafColor;
			half4 _SubsurfaceMaskRemap;
			half4 _ColorsMaskRemap;
			float4 _ImpostorBarkColor;
			half4 _OverlayMaskRemap;
			half4 _EmissiveColor;
			half4 _DetailBlendRemap;
			float4 _AI_SizeOffset;
			float4 _NoiseMaskRemap;
			float4 _SubsurfaceDiffusion_Asset;
			float4 _SubsurfaceDiffusion_asset;
			float4 _GradientMaskRemap;
			float4 _EmissiveIntensityParams;
			float3 _AI_Offset;
			half _ImpostorLeafSaturationValue;
			half _ImpostorBarkSaturationValue;
			half _GlobalSize;
			half _MotionSpeed_10;
			half _InteractionMaskValue;
			half _InteractionAmplitude;
			half _MotionScale_10;
			half _MotionAmplitude_10;
			half _LayerMotionValue;
			float _AI_Clip;
			float _AI_ShadowView;
			float _AI_ShadowBias;
			half _LayerVertexValue;
			half _IsVegetationShader;
			half _VertexDynamicMode;
			half _ColorsPositionMode;
			half _GlobalWetness;
			half _ImpostorSmoothnessValue;
			half _GlobalEmissive;
			half _EmissiveExposureValue;
			half _OverlayMaskMaxValue;
			half _OverlayMaskMinValue;
			half _OverlayVariationValue;
			half _LayerExtrasValue;
			half _ImpostorGrassSaturationValue;
			half _ExtrasPositionMode;
			half _SubsurfaceMaskMaxValue;
			half _SubsurfaceMaskMinValue;
			half _SubsurfaceValue;
			half _ColorsMaskMaxValue;
			half _ColorsMaskMinValue;
			half _ColorsVariationValue;
			half _GlobalColors;
			half _LayerColorsValue;
			half _GlobalOverlay;
			float _AI_DepthSize;
			float _AI_ImpostorSize;
			float _AI_Parallax;
			half _SpaceGlobalLocals;
			half _SpaceGlobalPosition;
			half _SpaceGlobalLayers;
			half _SpaceMotionLocals;
			half _SubsurfaceAngleValue;
			half _DetailBlendMode;
			half _CategorySizeFade;
			half _IsImpostorShader;
			half _SubsurfaceScatteringValue;
			half _SubsurfaceAmbientValue;
			half _DetailMode;
			half _CategoryNoise;
			half _CategoryMotion;
			half _LayerReactValue;
			half _RenderQueue;
			half _IsTVEShader;
			half _CategoryGlobal;
			half _MessageSizeFade;
			half _SubsurfaceNormalValue;
			half _RenderPriority;
			half _SubsurfaceDirectValue;
			half _AlphaVariationValue;
			float _AI_FramesY;
			float _AI_FramesX;
			float _AI_Frames;
			half _RenderCoverage;
			float _RenderSpecular;
			half _IsSubsurfaceShader;
			half _ImpostorCat;
			float _AI_TextureBias;
			half _VertexPivotMode;
			half _SubsurfaceShadowValue;
			half _EmissiveFlagMode;
			float _IsVersion;
			half _CategorySubsurface;
			float _VegetationMode;
			half _CategoryEmissive;
			float _SubsurfaceDiffusion;
			half _CategoryDetail;
			half _IsInitialized;
			half _GlobalAlpha;
			CBUFFER_END

				
			inline void SphereImpostorVertex( inout float4 vertex, inout float3 normal, inout float4 frameUVs, inout float4 viewPos )
			{
				float2 uvOffset = _AI_SizeOffset.zw;
				float sizeX = _AI_FramesX;
				float sizeY = _AI_FramesY - 1; 
				float UVscale = _AI_ImpostorSize;
				float4 fractions = 1 / float4( sizeX, _AI_FramesY, sizeY, UVscale );
				float2 sizeFraction = fractions.xy;
				float axisSizeFraction = fractions.z;
				float fractionsUVscale = fractions.w;
				float3 worldOrigin = 0;
				float4 perspective = float4( 0, 0, 0, 1 );
				if( UNITY_MATRIX_P[ 3 ][ 3 ] == 1 )
				{
				perspective = float4( 0, 0, 5000, 0 );
				worldOrigin = ai_ObjectToWorld._m03_m13_m23;
				}
				float3 worldCameraPos = worldOrigin + mul( UNITY_MATRIX_I_V, perspective ).xyz;
				float3 objectCameraPosition = mul( ai_WorldToObject, float4( worldCameraPos, 1 ) ).xyz - _AI_Offset.xyz; 
				float3 objectCameraDirection = normalize( objectCameraPosition );
				float3 upVector = float3( 0,1,0 );
				float3 objectHorizontalVector = normalize( cross( objectCameraDirection, upVector ) );
				float3 objectVerticalVector = cross( objectHorizontalVector, objectCameraDirection );
				float verticalAngle = frac( atan2( -objectCameraDirection.z, -objectCameraDirection.x ) * AI_INV_TWO_PI ) * sizeX + 0.5;
				float verticalDot = dot( objectCameraDirection, upVector );
				float upAngle = ( acos( -verticalDot ) * AI_INV_PI ) + axisSizeFraction * 0.5f;
				float yRot = sizeFraction.x * AI_PI * verticalDot * ( 2 * frac( verticalAngle ) - 1 );
				float2 uvExpansion = vertex.xy;
				float cosY = cos( yRot );
				float sinY = sin( yRot );
				float2 uvRotator = mul( uvExpansion, float2x2( cosY, -sinY, sinY, cosY ) );
				float3 billboard = objectHorizontalVector * uvRotator.x + objectVerticalVector * uvRotator.y + _AI_Offset.xyz;
				float2 relativeCoords = float2( floor( verticalAngle ), min( floor( upAngle * sizeY ), sizeY ) );
				float2 frameUV = ( ( uvExpansion * fractionsUVscale + 0.5 ) + relativeCoords ) * sizeFraction;
				frameUVs.xy = frameUV - uvOffset;
				frameUVs.zw = 0;
				viewPos.w = 0;
				viewPos.xyz = TransformWorldToView( TransformObjectToWorld( billboard ) );
				vertex.xyz = billboard;
				normal.xyz = objectCameraDirection;
			}
			
			float3 ObjectPosition_UNITY_MATRIX_M(  )
			{
				return float3(UNITY_MATRIX_M[0].w, UNITY_MATRIX_M[1].w, UNITY_MATRIX_M[2].w );
			}
			
			inline void SphereImpostorFragment( inout SurfaceOutput o, out float4 clipPos, out float3 worldPos, float4 frameUV, float4 viewPos, out float4 output0, out float4 output1 )
			{
				#if _USE_PARALLAX_ON
				float4 parallaxSample = tex2Dbias( _Normals, float4(frameUV.xy, 0, -1) );
				frameUV.xy = ( ( 0.5 - parallaxSample.a ) * frameUV.zw ) + frameUV.xy;
				#endif
				float4 albedoSample = tex2Dbias( _Albedo, float4(frameUV.xy, 0, _AI_TextureBias) );
				o.Alpha = ( albedoSample.a - _AI_Clip );
				clip( o.Alpha );
				o.Albedo = albedoSample.rgb;
				#if defined(AI_HD_RENDERPIPELINE) && ( AI_HDRP_VERSION >= 50702 )
				float4 feat1 = _Features.SampleLevel( SamplerState_Point_Repeat, frameUV.xy, 0);
				o.Diffusion = feat1.rgb;
				o.Features = feat1.a;
				float4 test1 = _Specular.SampleLevel( SamplerState_Point_Repeat, frameUV.xy, 0);
				o.MetalTangent = test1.b;
				#endif
				output0 = tex2Dbias( _Mask, float4(frameUV.xy, 0, _AI_TextureBias) );
				output1 = tex2Dbias( _Emissive, float4(frameUV.xy, 0, _AI_TextureBias) );
				float4 normalSample = tex2Dbias( _Normals, float4(frameUV.xy, 0, _AI_TextureBias) );
				float4 remapNormal = normalSample * 2 - 1; 
				float3 worldNormal = normalize( mul( (float3x3)ai_ObjectToWorld, remapNormal.xyz ) );
				o.Normal = worldNormal;
				#if defined(UNITY_PASS_SHADOWCASTER) // Standard RP fix for deferred path
				float depth = remapNormal.a * _AI_DepthSize * 0.4999 * length( ai_ObjectToWorld[ 2 ].xyz );
				#else
				float depth = remapNormal.a * _AI_DepthSize * 0.5 * length( ai_ObjectToWorld[ 2 ].xyz );
				#endif
				#if ( defined(SHADERPASS) && (SHADERPASS == SHADERPASS_SHADOWS) ) || defined(UNITY_PASS_SHADOWCASTER)
				viewPos.z += depth * _AI_ShadowView;
				viewPos.z += -_AI_ShadowBias;
				#else 
				viewPos.z += depth;
				#endif
				worldPos = GetAbsolutePositionWS( mul( UNITY_MATRIX_I_V, float4( viewPos.xyz, 1 ) )).xyz;
				clipPos = mul( UNITY_MATRIX_P, float4( viewPos.xyz, 1 ) );
				#if defined(UNITY_PASS_SHADOWCASTER) && !defined(SHADERPASS)
				#if UNITY_REVERSED_Z
				clipPos.z = min( clipPos.z, clipPos.w * UNITY_NEAR_CLIP_VALUE );
				#else
				clipPos.z = max( clipPos.z, clipPos.w * UNITY_NEAR_CLIP_VALUE );
				#endif
				#endif
				clipPos.xyz /= clipPos.w;
				if( UNITY_NEAR_CLIP_VALUE < 0 )
				clipPos = clipPos * 0.5 + 0.5;
			}
			
                
			void BuildSurfaceData(FragInputs fragInputs, inout AlphaSurfaceDescription surfaceDescription, float3 V, out SurfaceData surfaceData, out float3 bentNormalWS)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);
        
				surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;
				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
					surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
				#endif
				#ifdef _MATERIAL_FEATURE_TRANSMISSION
					surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
				#endif
				#ifdef _MATERIAL_FEATURE_ANISOTROPY
					surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;
				#endif
        
				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
					surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
				#endif
				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
					surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
				#endif
        
				#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
					surfaceData.baseColor *= (1.0 - Max3(surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b));
				#endif
        
				GetNormalWS( fragInputs, float3( 0.0, 0.0, 1.0 ), surfaceData.normalWS, float3( 1.0, 1.0, 1.0 ) );
				bentNormalWS = surfaceData.normalWS;

				surfaceData.geomNormalWS = T2W(fragInputs, 2);
				
				#ifdef _HAS_REFRACTION
					if (_EnableSSRefraction)
					{
        
						surfaceData.transmittanceMask = (1.0 - surfaceDescription.Alpha);
						surfaceDescription.Alpha = 1.0;
					}
					else
					{
						surfaceData.ior = 1.0;
						surfaceData.transmittanceColor = float3(1.0, 1.0, 1.0);
						surfaceData.atDistance = 1.0;
						surfaceData.transmittanceMask = 0.0;
						surfaceDescription.Alpha = 1.0;
					}
				#else
					surfaceData.ior = 1.0;
					surfaceData.transmittanceColor = float3(1.0, 1.0, 1.0);
					surfaceData.atDistance = 1.0;
					surfaceData.transmittanceMask = 0.0;
				#endif
        
					surfaceData.tangentWS = normalize(T2W(fragInputs, 0).xyz);    // The tangent is not normalize in worldToTangent for mikkt. TODO: Check if it expected that we normalize with Morten. Tag: SURFACE_GRADIENT
					surfaceData.tangentWS = Orthonormalize(surfaceData.tangentWS, surfaceData.normalWS);
        
				#if defined(_SPECULAR_OCCLUSION_CUSTOM)
				#elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
					surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO(V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness(surfaceData.perceptualSmoothness));
				#elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
					surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion(ClampNdotV(dot(surfaceData.normalWS, V)), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness(surfaceData.perceptualSmoothness));
				#else
					surfaceData.specularOcclusion = 1.0;
				#endif
				#ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
					surfaceData.perceptualSmoothness = GeometricNormalFiltering(surfaceData.perceptualSmoothness, T2W(fragInputs, 2), surfaceDescription.SpecularAAScreenSpaceVariance, surfaceDescription.SpecularAAThreshold);
				#endif
			}
        
            void GetSurfaceAndBuiltinData(AlphaSurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
            {
				//#ifdef LOD_FADE_CROSSFADE
				//	uint3 fadeMaskSeed = asuint((int3)(V * _ScreenSize.xyx));
				//	LODDitheringTransition(fadeMaskSeed, unity_LODFade.x);
				//#endif
    
				#ifdef _ALPHATEST_ON
					DoAlphaTest ( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif
				float3 bentNormalWS;
				BuildSurfaceData(fragInputs, surfaceDescription, V, surfaceData, bentNormalWS);
        
				#if HAVE_DECALS
				if( _EnableDecals )
				{
					DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, surfaceDescription.Alpha);
					ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData);
				}
				#endif
        
				#if defined( ASE_SRP_VERSION ) && ASE_SRP_VERSION <= 50702
					InitBuiltinData( surfaceDescription.Alpha, bentNormalWS, -T2W(fragInputs, 2), fragInputs.positionRWS, fragInputs.texCoord1, fragInputs.texCoord2, builtinData );
				#else
					InitBuiltinData( posInput, surfaceDescription.Alpha, bentNormalWS, -T2W(fragInputs, 2), fragInputs.texCoord1, fragInputs.texCoord2, builtinData );
				#endif

				builtinData.depthOffset = 0.0;
        
				#if (SHADERPASS == SHADERPASS_DISTORTION)
					builtinData.distortion = surfaceDescription.Distortion;
					builtinData.distortionBlur = surfaceDescription.DistortionBlur;
				#else
					builtinData.distortion = float2(0.0, 0.0);
					builtinData.distortionBlur = 0.0;
				#endif
        
                PostInitBuiltinData(V, posInput, surfaceData, builtinData);
            }
        
			PackedVaryingsMeshToPS Vert(AttributesMesh inputMesh  )
			{
				PackedVaryingsMeshToPS outputPackedVaryingsMeshToPS;

				UNITY_SETUP_INSTANCE_ID( inputMesh );
				UNITY_TRANSFER_INSTANCE_ID( inputMesh, outputPackedVaryingsMeshToPS );
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(outputPackedVaryingsMeshToPS);

				SphereImpostorVertex( inputMesh.vertex, inputMesh.normal, outputPackedVaryingsMeshToPS.frameUVs99, outputPackedVaryingsMeshToPS.viewPos99 );
				float3 viewToObj3965_g69600 = mul( GetWorldToObjectMatrix(), mul( UNITY_MATRIX_I_V , float4( outputPackedVaryingsMeshToPS.viewPos99.xyz, 1 ) ) ).xyz;
				float3 VertexPosition3564_g69600 = viewToObj3965_g69600;
				half3 VertexPos40_g69645 = VertexPosition3564_g69600;
				float3 appendResult74_g69645 = (float3(VertexPos40_g69645.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g69645 = appendResult74_g69645;
				float3 break84_g69645 = VertexPos40_g69645;
				float3 appendResult81_g69645 = (float3(0.0 , break84_g69645.y , break84_g69645.z));
				half3 VertexPosOtherAxis82_g69645 = appendResult81_g69645;
				float4 temp_output_91_19_g69623 = TVE_MotionCoords;
				float3 localObjectPosition_UNITY_MATRIX_M14_g69635 = ObjectPosition_UNITY_MATRIX_M();
				#ifdef SHADEROPTIONS_CAMERA_RELATIVE_RENDERING
				float3 staticSwitch13_g69635 = ( localObjectPosition_UNITY_MATRIX_M14_g69635 + _WorldSpaceCameraPos );
				#else
				float3 staticSwitch13_g69635 = localObjectPosition_UNITY_MATRIX_M14_g69635;
				#endif
				half3 ObjectData20_g69636 = staticSwitch13_g69635;
				float3 ase_worldPos = GetAbsolutePositionWS( TransformObjectToWorld( (inputMesh.vertex).xyz ) );
				half3 WorldData19_g69636 = ase_worldPos;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g69636 = WorldData19_g69636;
				#else
				float3 staticSwitch14_g69636 = ObjectData20_g69636;
				#endif
				float3 temp_output_114_0_g69635 = staticSwitch14_g69636;
				float3 vertexToFrag4543_g69600 = temp_output_114_0_g69635;
				float3 ObjectPosition4422_g69600 = vertexToFrag4543_g69600;
				half2 UV94_g69623 = ( (temp_output_91_19_g69623).zw + ( (temp_output_91_19_g69623).xy * (ObjectPosition4422_g69600).xz ) );
				float temp_output_84_0_g69623 = _LayerMotionValue;
				float4 lerpResult107_g69623 = lerp( TVE_MotionParams , saturate( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_MotionTex, sampler_linear_repeat, UV94_g69623,temp_output_84_0_g69623, 0.0 ) ) , TVE_MotionUsage[(int)temp_output_84_0_g69623]);
				half4 Global_Motion_Params4344_g69600 = lerpResult107_g69623;
				float4 break322_g69639 = Global_Motion_Params4344_g69600;
				float3 appendResult397_g69639 = (float3(break322_g69639.x , 0.0 , break322_g69639.y));
				float3 temp_output_398_0_g69639 = (appendResult397_g69639*2.0 + -1.0);
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				half2 Motion_DirectionOS39_g69600 = (( mul( GetWorldToObjectMatrix(), float4( temp_output_398_0_g69639 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_DirectionOS358_g69627 = Motion_DirectionOS39_g69600;
				float temp_output_3572_0_g69600 = saturate( VertexPosition3564_g69600.y );
				half Mesh_Motion_1082_g69600 = ( temp_output_3572_0_g69600 * 2.0 );
				half Wind_Power369_g69639 = break322_g69639.z;
				half Motion_WindPower2223_g69600 = Wind_Power369_g69639;
				half3 Input_Position419_g69643 = -ObjectPosition4422_g69600;
				half2 Motion_DirectionWS4464_g69600 = (temp_output_398_0_g69639).xz;
				half2 Input_DirectionWS423_g69643 = Motion_DirectionWS4464_g69600;
				float Motion_Scale287_g69643 = ( _MotionScale_10 + 0.2 );
				half Global_Scale448_g69643 = TVE_NoiseParams.x;
				half Input_Speed62_g69643 = _MotionSpeed_10;
				half Global_Speed449_g69643 = TVE_NoiseParams.y;
				float mulTime426_g69643 = _TimeParameters.x * ( Input_Speed62_g69643 * Global_Speed449_g69643 );
				half Global_DistScale561_g69643 = TVE_NoiseParams.w;
				float3 break461_g69643 = ( Input_Position419_g69643 * Global_DistScale561_g69643 );
				half Global_DistAmplitude559_g69643 = TVE_NoiseParams.z;
				float Noise_Distortion469_g69643 = ( sin( ( break461_g69643.x + break461_g69643.z ) ) * Global_DistAmplitude559_g69643 );
				half Motion_Variation284_g69643 = 0.0;
				float2 temp_output_425_0_g69643 = ( ( (Input_Position419_g69643).xz * Input_DirectionWS423_g69643 * Motion_Scale287_g69643 * Global_Scale448_g69643 ) + ( mulTime426_g69643 + Noise_Distortion469_g69643 + Motion_Variation284_g69643 ) );
				float2 break500_g69643 = ( temp_output_425_0_g69643 * 0.1178 );
				float2 break494_g69643 = ( temp_output_425_0_g69643 * 0.1742 );
				half Input_WindPower327_g69643 = Motion_WindPower2223_g69600;
				float lerpResult430_g69643 = lerp( 1.4 , 0.4 , Input_WindPower327_g69643);
				half Global_MotionNoise34_g69600 = (pow( (( sin( ( break500_g69643.x + break500_g69643.y ) ) * sin( ( break494_g69643.x + break494_g69643.y ) ) )*0.4 + 0.6) , lerpResult430_g69643 )*1.2 + -0.2);
				half Motion_10_Amplitude2258_g69600 = ( _MotionAmplitude_10 * Mesh_Motion_1082_g69600 * Motion_WindPower2223_g69600 * Global_MotionNoise34_g69600 );
				half Input_BendingAmplitude376_g69627 = Motion_10_Amplitude2258_g69600;
				half Input_InteractionAmplitude58_g69627 = _InteractionAmplitude;
				half Input_MeshMotion_10321_g69627 = Mesh_Motion_1082_g69600;
				half Input_InteractionUseMask62_g69627 = _InteractionMaskValue;
				float lerpResult371_g69627 = lerp( 2.0 , Input_MeshMotion_10321_g69627 , Input_InteractionUseMask62_g69627);
				half ObjectData20_g69628 = lerpResult371_g69627;
				half WorldData19_g69628 = Input_MeshMotion_10321_g69627;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g69628 = WorldData19_g69628;
				#else
				float staticSwitch14_g69628 = ObjectData20_g69628;
				#endif
				half Motion_10_Interaction373_g69627 = ( Input_InteractionAmplitude58_g69627 * staticSwitch14_g69628 );
				half Interaction_Mask66_g69600 = ( break322_g69639.w * break322_g69639.w );
				float Input_InteractionMask330_g69627 = Interaction_Mask66_g69600;
				float lerpResult360_g69627 = lerp( Input_BendingAmplitude376_g69627 , Motion_10_Interaction373_g69627 , saturate( ( Input_InteractionAmplitude58_g69627 * Input_InteractionMask330_g69627 ) ));
				float2 break364_g69627 = ( Input_DirectionOS358_g69627 * lerpResult360_g69627 );
				half Motion_10_BendingZ190_g69600 = break364_g69627.y;
				half Angle44_g69645 = Motion_10_BendingZ190_g69600;
				half3 VertexPos40_g69642 = ( VertexPosRotationAxis50_g69645 + ( VertexPosOtherAxis82_g69645 * cos( Angle44_g69645 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g69645 ) * sin( Angle44_g69645 ) ) );
				float3 appendResult74_g69642 = (float3(0.0 , 0.0 , VertexPos40_g69642.z));
				half3 VertexPosRotationAxis50_g69642 = appendResult74_g69642;
				float3 break84_g69642 = VertexPos40_g69642;
				float3 appendResult81_g69642 = (float3(break84_g69642.x , break84_g69642.y , 0.0));
				half3 VertexPosOtherAxis82_g69642 = appendResult81_g69642;
				half Motion_10_BendingX216_g69600 = break364_g69627.x;
				half Angle44_g69642 = -Motion_10_BendingX216_g69600;
				float3 Vertex_Motion_Object833_g69600 = ( VertexPosRotationAxis50_g69642 + ( VertexPosOtherAxis82_g69642 * cos( Angle44_g69642 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g69642 ) * sin( Angle44_g69642 ) ) );
				float4 temp_output_94_19_g69606 = TVE_VertexCoords;
				half2 UV97_g69606 = ( (temp_output_94_19_g69606).zw + ( (temp_output_94_19_g69606).xy * (ObjectPosition4422_g69600).xz ) );
				float temp_output_84_0_g69606 = _LayerVertexValue;
				float4 lerpResult109_g69606 = lerp( TVE_VertexParams , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_VertexTex, sampler_linear_repeat, UV97_g69606,temp_output_84_0_g69606, 0.0 ) , TVE_VertexUsage[(int)temp_output_84_0_g69606]);
				half4 Global_Vertex_Params4413_g69600 = lerpResult109_g69606;
				half Global_VertexTex_Size174_g69600 = saturate( Global_Vertex_Params4413_g69600.w );
				float lerpResult346_g69600 = lerp( 1.0 , Global_VertexTex_Size174_g69600 , _GlobalSize);
				float3 appendResult3480_g69600 = (float3(lerpResult346_g69600 , lerpResult346_g69600 , lerpResult346_g69600));
				half3 Vertex_Size1741_g69600 = appendResult3480_g69600;
				half3 _Vector5 = half3(1,1,1);
				float3 Vertex_SizeFade1740_g69600 = _Vector5;
				half IsInitialized3811_g69600 = _IsInitialized;
				float3 Final_VertexPosition890_g69600 = ( ( ( ( Vertex_Motion_Object833_g69600 * Vertex_Size1741_g69600 * Vertex_SizeFade1740_g69600 ) - VertexPosition3564_g69600 ) * IsInitialized3811_g69600 ) + _DisableSRPBatcher );
				
				outputPackedVaryingsMeshToPS.ase_texcoord2.xyz = vertexToFrag4543_g69600;
				
				
				//setting value to unused interpolator channels and avoid initialization warnings
				outputPackedVaryingsMeshToPS.ase_texcoord2.w = 0;
				inputMesh.vertex.xyz += Final_VertexPosition890_g69600;

				float3 positionRWS = TransformObjectToWorld(inputMesh.vertex.xyz);
				outputPackedVaryingsMeshToPS.positionCS = TransformWorldToHClip(positionRWS);
				return outputPackedVaryingsMeshToPS;
			}

			void Frag(  PackedVaryingsMeshToPS packedInput
				#ifdef WRITE_NORMAL_BUFFER
				, out float4 outNormalBuffer : SV_Target0
					#ifdef WRITE_MSAA_DEPTH
				, out float1 depthColor : SV_Target1
					#endif
				#endif
				, out float outputDepth : SV_Depth
				
			)
			{
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( packedInput );
				UNITY_SETUP_INSTANCE_ID( packedInput );

				#ifdef LOD_FADE_CROSSFADE
				float3 VC = GetWorldSpaceNormalizeViewDir(packedInput.interp00.xyz);
				LODDitheringTransition(ComputeFadeMaskSeed(VC, packedInput.positionCS.xy), unity_LODFade.x);
				#endif

				FragInputs input;

				ZERO_INITIALIZE(FragInputs, input);
				AlphaSurfaceDescription surfaceDescription = (AlphaSurfaceDescription)0;
				SurfaceOutput o = (SurfaceOutput)0;

				o.Normal = float3( 0, 0, 1 );
				float4 clipPos = 0;
				float3 worldPos = 0;

				float4 output0 = 0;
				float4 output1 = 0;
				SphereImpostorFragment( o, clipPos, worldPos, packedInput.frameUVs99, packedInput.viewPos99, output0, output1 );
				float temp_output_3577_0_g69600 = o.Alpha;
				float localCustomAlphaClipAlways4430_g69600 = ( temp_output_3577_0_g69600 );
				float4 temp_output_93_19_g69601 = TVE_ExtrasCoords;
				float3 temp_output_3563_0_g69600 = worldPos;
				float3 WorldPosition4027_g69600 = temp_output_3563_0_g69600;
				float3 vertexToFrag4543_g69600 = packedInput.ase_texcoord2.xyz;
				float3 ObjectPosition4422_g69600 = vertexToFrag4543_g69600;
				float3 lerpResult4483_g69600 = lerp( WorldPosition4027_g69600 , ObjectPosition4422_g69600 , _ExtrasPositionMode);
				half2 UV96_g69601 = ( (temp_output_93_19_g69601).zw + ( (temp_output_93_19_g69601).xy * (lerpResult4483_g69600).xz ) );
				float temp_output_84_0_g69601 = _LayerExtrasValue;
				float4 lerpResult109_g69601 = lerp( TVE_ExtrasParams , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_ExtrasTex, sampler_linear_repeat, UV96_g69601,temp_output_84_0_g69601, 0.0 ) , TVE_ExtrasUsage[(int)temp_output_84_0_g69601]);
				float4 break89_g69601 = lerpResult109_g69601;
				half Global_ExtrasTex_Alpha1033_g69600 = saturate( break89_g69601.a );
				float3 break111_g69647 = ObjectPosition4422_g69600;
				half Global_DynamicMode4535_g69600 = _VertexDynamicMode;
				half Input_DynamicMode120_g69647 = Global_DynamicMode4535_g69600;
				float4 break3589_g69600 = output0;
				half Main_Variation_Or_Metallic3607_g69600 = break3589_g69600.r;
				half Input_Variation124_g69647 = Main_Variation_Or_Metallic3607_g69600;
				half ObjectData20_g69648 = frac( ( ( ( break111_g69647.x + break111_g69647.y + break111_g69647.z ) * ( 1.0 - Input_DynamicMode120_g69647 ) ) + Input_Variation124_g69647 ) );
				half WorldData19_g69648 = Input_Variation124_g69647;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g69648 = WorldData19_g69648;
				#else
				float staticSwitch14_g69648 = ObjectData20_g69648;
				#endif
				float clampResult129_g69647 = clamp( staticSwitch14_g69648 , 0.01 , 0.99 );
				half Global_MeshVariation4531_g69600 = clampResult129_g69647;
				float lerpResult4544_g69600 = lerp( 0.0 , Global_MeshVariation4531_g69600 , _AlphaVariationValue);
				half Global_Alpha_Variation4546_g69600 = lerpResult4544_g69600;
				float lerpResult4053_g69600 = lerp( 1.0 , ( ( Global_ExtrasTex_Alpha1033_g69600 - Global_Alpha_Variation4546_g69600 ) + 0.09 ) , _GlobalAlpha);
				half Main_Mask_Leaves3712_g69600 = break3589_g69600.g;
				float lerpResult4075_g69600 = lerp( 1.0 , lerpResult4053_g69600 , Main_Mask_Leaves3712_g69600);
				half Final_Alpha4102_g69600 = lerpResult4075_g69600;
				float Alpha4430_g69600 = Final_Alpha4102_g69600;
				{
				clip(Alpha4430_g69600 - 0.1);
				}
				float temp_output_3_0_g69644 = localCustomAlphaClipAlways4430_g69600;
				half Offest27_g69644 = 0.0;
				half Feather30_g69644 = 0.2;
				
				
				surfaceDescription.Alpha = ( ( ( temp_output_3_0_g69644 - Offest27_g69644 ) / ( max( fwidth( temp_output_3_0_g69644 ) , 0.001 ) + Feather30_g69644 ) ) + Offest27_g69644 );

				#ifdef _ALPHATEST_ON
				surfaceDescription.AlphaClipThreshold = 0;
				#endif

				packedInput.positionCS.zw = clipPos.zw;
				float3 positionRWS = worldPos;

				input.positionSS = packedInput.positionCS;
				input.positionRWS = positionRWS;
#if defined( ASE_SRP_VERSION ) && ASE_SRP_VERSION < 60900
				input.worldToTangent = k_identity3x3;
#else
				input.tangentToWorld = k_identity3x3;
#endif

				PositionInputs posInput = GetPositionInput( input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS );

				SurfaceData surfaceData;
				BuiltinData builtinData;

				float3 normalizedWorldViewDir = GetWorldSpaceNormalizeViewDir( input.positionRWS );

				GetSurfaceAndBuiltinData(surfaceDescription, input, normalizedWorldViewDir, posInput, surfaceData, builtinData);

				outputDepth = posInput.deviceDepth;

				#ifdef WRITE_NORMAL_BUFFER
					EncodeIntoNormalBuffer(ConvertSurfaceDataToNormalData(surfaceData), posInput.positionSS, outNormalBuffer);
					#ifdef WRITE_MSAA_DEPTH
					depthColor = packedInput.positionCS.z;
					#endif
				#endif
			}

            ENDHLSL
        }

		
        Pass
        {
			
            Name "DepthOnly"
            Tags { "LightMode"="DepthOnly" }
        
            HLSLPROGRAM
			#define _MATERIAL_FEATURE_TRANSMISSION 1
			#define _DISABLE_SSR 1
			#define ASE_SRP_VERSION 120100
			#ifdef UNITY_COLORSPACE_GAMMA//AI_SRP
			#define unity_ColorSpaceDielectricSpec half4(0.220916301, 0.220916301, 0.220916301, 1.0 - 0.220916301)//AI_SRP
			#else//AI_SRP
			#define unity_ColorSpaceDielectricSpec half4(0.04, 0.04, 0.04, 1.0 - 0.04) //AI_SRP
			#endif//AI_SRP

			#pragma vertex Vert
			#pragma fragment Frag

			#if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define OUTPUT_SPLIT_LIGHTING
			#endif
        
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#if defined( ASE_SRP_VERSION ) && ASE_SRP_VERSION < 60900              
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Wind.hlsl"
			#endif
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
        
            #define SHADERPASS SHADERPASS_DEPTH_ONLY
            #pragma multi_compile _ WRITE_NORMAL_BUFFER
            #pragma multi_compile _ WRITE_MSAA_DEPTH
        
            #define VARYINGS_NEED_POSITION_WS
            #define VARYINGS_NEED_TANGENT_TO_WORLD
            #define VARYINGS_NEED_TEXCOORD0
            #define VARYINGS_NEED_TEXCOORD1
            #define VARYINGS_NEED_TEXCOORD2
            #define VARYINGS_NEED_TEXCOORD3
            #define VARYINGS_NEED_COLOR
        
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"
        
			#if defined( ASE_SRP_VERSION ) && ASE_SRP_VERSION < 60900
			#define T2W(var, index) var.worldToTangent[index]
			#else
			#define T2W(var, index) var.tangentToWorld[index]
			#endif

			#define ai_ObjectToWorld GetObjectToWorldMatrix()
			#define ai_WorldToObject GetWorldToObjectMatrix()
			#define AI_INV_TWO_PI  INV_TWO_PI
			#define AI_PI          PI
			#define AI_INV_PI      INV_PI
			//TVE Pipeline Defines
			#define THE_VEGETATION_ENGINE
			#define TVE_IS_HD_PIPELINE
			//TVE Injection Defines
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END


			struct AttributesMesh 
			{
				float4 vertex : POSITION;
				float3 normal : NORMAL;
				float4 tangent : TANGENT;
				float4 texcoord : TEXCOORD0;
				float4 uv1 : TEXCOORD1;
				float4 uv2 : TEXCOORD2;
				float4 uv3 : TEXCOORD3;
				float4 color : COLOR;				
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};
        
			struct PackedVaryingsMeshToPS 
			{
				float4 positionCS : SV_Position;
				float3 interp00 : TEXCOORD0;
				float3 interp01 : TEXCOORD1;
				float4 interp02 : TEXCOORD2;
				float4 interp03 : TEXCOORD3;
				float4 interp04 : TEXCOORD4;
				float4 interp05 : TEXCOORD5;
				float4 interp06 : TEXCOORD6;
				float4 interp07 : TEXCOORD7;				
				float4 frameUVs99 : TEXCOORD8;
				float4 viewPos99 : TEXCOORD9;
				float4 ase_texcoord10 : TEXCOORD10;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};
      
			float4x4 unity_CameraProjection;
			float4x4 unity_CameraInvProjection;
			float4x4 unity_WorldToCamera;
			float4x4 unity_CameraToWorld;
			sampler2D _Albedo;
			sampler2D _Normals;
			half4 TVE_MotionParams;
			TEXTURE2D_ARRAY(TVE_MotionTex);
			half4 TVE_MotionCoords;
			SAMPLER(sampler_linear_repeat);
			float TVE_MotionUsage[10];
			half4 TVE_NoiseParams;
			half4 TVE_VertexParams;
			TEXTURE2D_ARRAY(TVE_VertexTex);
			half4 TVE_VertexCoords;
			float TVE_VertexUsage[10];
			half _DisableSRPBatcher;
			sampler2D _Mask;
			sampler2D _Emissive;
			half4 TVE_ExtrasParams;
			TEXTURE2D_ARRAY(TVE_ExtrasTex);
			half4 TVE_ExtrasCoords;
			float TVE_ExtrasUsage[10];
			CBUFFER_START( UnityPerMaterial )
			float4 _ImpostorGrassColor;
			half4 _SubsurfaceColor;
			float4 _ImpostorLeafColor;
			half4 _SubsurfaceMaskRemap;
			half4 _ColorsMaskRemap;
			float4 _ImpostorBarkColor;
			half4 _OverlayMaskRemap;
			half4 _EmissiveColor;
			half4 _DetailBlendRemap;
			float4 _AI_SizeOffset;
			float4 _NoiseMaskRemap;
			float4 _SubsurfaceDiffusion_Asset;
			float4 _SubsurfaceDiffusion_asset;
			float4 _GradientMaskRemap;
			float4 _EmissiveIntensityParams;
			float3 _AI_Offset;
			half _ImpostorLeafSaturationValue;
			half _ImpostorBarkSaturationValue;
			half _GlobalSize;
			half _MotionSpeed_10;
			half _InteractionMaskValue;
			half _InteractionAmplitude;
			half _MotionScale_10;
			half _MotionAmplitude_10;
			half _LayerMotionValue;
			float _AI_Clip;
			float _AI_ShadowView;
			float _AI_ShadowBias;
			half _LayerVertexValue;
			half _IsVegetationShader;
			half _VertexDynamicMode;
			half _ColorsPositionMode;
			half _GlobalWetness;
			half _ImpostorSmoothnessValue;
			half _GlobalEmissive;
			half _EmissiveExposureValue;
			half _OverlayMaskMaxValue;
			half _OverlayMaskMinValue;
			half _OverlayVariationValue;
			half _LayerExtrasValue;
			half _ImpostorGrassSaturationValue;
			half _ExtrasPositionMode;
			half _SubsurfaceMaskMaxValue;
			half _SubsurfaceMaskMinValue;
			half _SubsurfaceValue;
			half _ColorsMaskMaxValue;
			half _ColorsMaskMinValue;
			half _ColorsVariationValue;
			half _GlobalColors;
			half _LayerColorsValue;
			half _GlobalOverlay;
			float _AI_DepthSize;
			float _AI_ImpostorSize;
			float _AI_Parallax;
			half _SpaceGlobalLocals;
			half _SpaceGlobalPosition;
			half _SpaceGlobalLayers;
			half _SpaceMotionLocals;
			half _SubsurfaceAngleValue;
			half _DetailBlendMode;
			half _CategorySizeFade;
			half _IsImpostorShader;
			half _SubsurfaceScatteringValue;
			half _SubsurfaceAmbientValue;
			half _DetailMode;
			half _CategoryNoise;
			half _CategoryMotion;
			half _LayerReactValue;
			half _RenderQueue;
			half _IsTVEShader;
			half _CategoryGlobal;
			half _MessageSizeFade;
			half _SubsurfaceNormalValue;
			half _RenderPriority;
			half _SubsurfaceDirectValue;
			half _AlphaVariationValue;
			float _AI_FramesY;
			float _AI_FramesX;
			float _AI_Frames;
			half _RenderCoverage;
			float _RenderSpecular;
			half _IsSubsurfaceShader;
			half _ImpostorCat;
			float _AI_TextureBias;
			half _VertexPivotMode;
			half _SubsurfaceShadowValue;
			half _EmissiveFlagMode;
			float _IsVersion;
			half _CategorySubsurface;
			float _VegetationMode;
			half _CategoryEmissive;
			float _SubsurfaceDiffusion;
			half _CategoryDetail;
			half _IsInitialized;
			half _GlobalAlpha;
			CBUFFER_END


			inline void SphereImpostorVertex( inout float4 vertex, inout float3 normal, inout float4 frameUVs, inout float4 viewPos )
			{
				float2 uvOffset = _AI_SizeOffset.zw;
				float sizeX = _AI_FramesX;
				float sizeY = _AI_FramesY - 1; 
				float UVscale = _AI_ImpostorSize;
				float4 fractions = 1 / float4( sizeX, _AI_FramesY, sizeY, UVscale );
				float2 sizeFraction = fractions.xy;
				float axisSizeFraction = fractions.z;
				float fractionsUVscale = fractions.w;
				float3 worldOrigin = 0;
				float4 perspective = float4( 0, 0, 0, 1 );
				if( UNITY_MATRIX_P[ 3 ][ 3 ] == 1 )
				{
				perspective = float4( 0, 0, 5000, 0 );
				worldOrigin = ai_ObjectToWorld._m03_m13_m23;
				}
				float3 worldCameraPos = worldOrigin + mul( UNITY_MATRIX_I_V, perspective ).xyz;
				float3 objectCameraPosition = mul( ai_WorldToObject, float4( worldCameraPos, 1 ) ).xyz - _AI_Offset.xyz; 
				float3 objectCameraDirection = normalize( objectCameraPosition );
				float3 upVector = float3( 0,1,0 );
				float3 objectHorizontalVector = normalize( cross( objectCameraDirection, upVector ) );
				float3 objectVerticalVector = cross( objectHorizontalVector, objectCameraDirection );
				float verticalAngle = frac( atan2( -objectCameraDirection.z, -objectCameraDirection.x ) * AI_INV_TWO_PI ) * sizeX + 0.5;
				float verticalDot = dot( objectCameraDirection, upVector );
				float upAngle = ( acos( -verticalDot ) * AI_INV_PI ) + axisSizeFraction * 0.5f;
				float yRot = sizeFraction.x * AI_PI * verticalDot * ( 2 * frac( verticalAngle ) - 1 );
				float2 uvExpansion = vertex.xy;
				float cosY = cos( yRot );
				float sinY = sin( yRot );
				float2 uvRotator = mul( uvExpansion, float2x2( cosY, -sinY, sinY, cosY ) );
				float3 billboard = objectHorizontalVector * uvRotator.x + objectVerticalVector * uvRotator.y + _AI_Offset.xyz;
				float2 relativeCoords = float2( floor( verticalAngle ), min( floor( upAngle * sizeY ), sizeY ) );
				float2 frameUV = ( ( uvExpansion * fractionsUVscale + 0.5 ) + relativeCoords ) * sizeFraction;
				frameUVs.xy = frameUV - uvOffset;
				frameUVs.zw = 0;
				viewPos.w = 0;
				viewPos.xyz = TransformWorldToView( TransformObjectToWorld( billboard ) );
				vertex.xyz = billboard;
				normal.xyz = objectCameraDirection;
			}
			
			float3 ObjectPosition_UNITY_MATRIX_M(  )
			{
				return float3(UNITY_MATRIX_M[0].w, UNITY_MATRIX_M[1].w, UNITY_MATRIX_M[2].w );
			}
			
			inline void SphereImpostorFragment( inout SurfaceOutput o, out float4 clipPos, out float3 worldPos, float4 frameUV, float4 viewPos, out float4 output0, out float4 output1 )
			{
				#if _USE_PARALLAX_ON
				float4 parallaxSample = tex2Dbias( _Normals, float4(frameUV.xy, 0, -1) );
				frameUV.xy = ( ( 0.5 - parallaxSample.a ) * frameUV.zw ) + frameUV.xy;
				#endif
				float4 albedoSample = tex2Dbias( _Albedo, float4(frameUV.xy, 0, _AI_TextureBias) );
				o.Alpha = ( albedoSample.a - _AI_Clip );
				clip( o.Alpha );
				o.Albedo = albedoSample.rgb;
				#if defined(AI_HD_RENDERPIPELINE) && ( AI_HDRP_VERSION >= 50702 )
				float4 feat1 = _Features.SampleLevel( SamplerState_Point_Repeat, frameUV.xy, 0);
				o.Diffusion = feat1.rgb;
				o.Features = feat1.a;
				float4 test1 = _Specular.SampleLevel( SamplerState_Point_Repeat, frameUV.xy, 0);
				o.MetalTangent = test1.b;
				#endif
				output0 = tex2Dbias( _Mask, float4(frameUV.xy, 0, _AI_TextureBias) );
				output1 = tex2Dbias( _Emissive, float4(frameUV.xy, 0, _AI_TextureBias) );
				float4 normalSample = tex2Dbias( _Normals, float4(frameUV.xy, 0, _AI_TextureBias) );
				float4 remapNormal = normalSample * 2 - 1; 
				float3 worldNormal = normalize( mul( (float3x3)ai_ObjectToWorld, remapNormal.xyz ) );
				o.Normal = worldNormal;
				#if defined(UNITY_PASS_SHADOWCASTER) // Standard RP fix for deferred path
				float depth = remapNormal.a * _AI_DepthSize * 0.4999 * length( ai_ObjectToWorld[ 2 ].xyz );
				#else
				float depth = remapNormal.a * _AI_DepthSize * 0.5 * length( ai_ObjectToWorld[ 2 ].xyz );
				#endif
				#if ( defined(SHADERPASS) && (SHADERPASS == SHADERPASS_SHADOWS) ) || defined(UNITY_PASS_SHADOWCASTER)
				viewPos.z += depth * _AI_ShadowView;
				viewPos.z += -_AI_ShadowBias;
				#else 
				viewPos.z += depth;
				#endif
				worldPos = GetAbsolutePositionWS( mul( UNITY_MATRIX_I_V, float4( viewPos.xyz, 1 ) )).xyz;
				clipPos = mul( UNITY_MATRIX_P, float4( viewPos.xyz, 1 ) );
				#if defined(UNITY_PASS_SHADOWCASTER) && !defined(SHADERPASS)
				#if UNITY_REVERSED_Z
				clipPos.z = min( clipPos.z, clipPos.w * UNITY_NEAR_CLIP_VALUE );
				#else
				clipPos.z = max( clipPos.z, clipPos.w * UNITY_NEAR_CLIP_VALUE );
				#endif
				#endif
				clipPos.xyz /= clipPos.w;
				if( UNITY_NEAR_CLIP_VALUE < 0 )
				clipPos = clipPos * 0.5 + 0.5;
			}
			
                    
			void BuildSurfaceData(FragInputs fragInputs, inout SmoothSurfaceDescription surfaceDescription, float3 V, out SurfaceData surfaceData, out float3 bentNormalWS)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);
				surfaceData.perceptualSmoothness =      surfaceDescription.Smoothness;
                
				surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;
				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
					surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
				#endif
				#ifdef _MATERIAL_FEATURE_TRANSMISSION
					surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
				#endif
				#ifdef _MATERIAL_FEATURE_ANISOTROPY
					surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;
				#endif
        
				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
					surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
				#endif
				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
					surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
				#endif
        
				#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
					surfaceData.baseColor *= (1.0 - Max3(surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b));
				#endif
        
				GetNormalWS( fragInputs, float3( 0.0, 0.0, 1.0 ), surfaceData.normalWS, float3( 1.0, 1.0, 1.0 ) );
				bentNormalWS = surfaceData.normalWS;

				surfaceData.geomNormalWS = T2W(fragInputs, 2);
				
				#ifdef _HAS_REFRACTION
					surfaceData.transmittanceMask = 1.0 - surfaceDescription.Alpha;
					surfaceDescription.Alpha = 1.0;
				#endif
        
					surfaceData.tangentWS = normalize(T2W(fragInputs, 0).xyz);    // The tangent is not normalize in worldToTangent for mikkt. TODO: Check if it expected that we normalize with Morten. Tag: SURFACE_GRADIENT
					surfaceData.tangentWS = Orthonormalize(surfaceData.tangentWS, surfaceData.normalWS);
        
				#if defined(_SPECULAR_OCCLUSION_CUSTOM)
				#elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
					surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO(V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness(surfaceData.perceptualSmoothness));
				#elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
					surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion(ClampNdotV(dot(surfaceData.normalWS, V)), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness(surfaceData.perceptualSmoothness));
				#else
					surfaceData.specularOcclusion = 1.0;
				#endif
				#ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
					surfaceData.perceptualSmoothness = GeometricNormalFiltering(surfaceData.perceptualSmoothness, T2W(fragInputs, 2), surfaceDescription.SpecularAAScreenSpaceVariance, surfaceDescription.SpecularAAThreshold);
				#endif
			}
        
            void GetSurfaceAndBuiltinData(SmoothSurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
            {
				//#ifdef LOD_FADE_CROSSFADE
				//	uint3 fadeMaskSeed = asuint((int3)(V * _ScreenSize.xyx)); 
				//	LODDitheringTransition(fadeMaskSeed, unity_LODFade.x);
				//#endif
        
				#ifdef _ALPHATEST_ON
					DoAlphaTest ( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif

					float3 bentNormalWS;
					BuildSurfaceData(fragInputs, surfaceDescription, V, surfaceData, bentNormalWS);
        
				#if HAVE_DECALS
				if( _EnableDecals )
				{
					DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, surfaceDescription.Alpha);
					ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData);
				}
				#endif
        
				#if defined( ASE_SRP_VERSION ) && ASE_SRP_VERSION <= 50702
					InitBuiltinData( surfaceDescription.Alpha, bentNormalWS, -T2W(fragInputs, 2), fragInputs.positionRWS, fragInputs.texCoord1, fragInputs.texCoord2, builtinData );
				#else
					InitBuiltinData( posInput, surfaceDescription.Alpha, bentNormalWS, -T2W(fragInputs, 2), fragInputs.texCoord1, fragInputs.texCoord2, builtinData );
				#endif

				builtinData.depthOffset = 0.0;
        
				#if (SHADERPASS == SHADERPASS_DISTORTION)
					builtinData.distortion = surfaceDescription.Distortion;
					builtinData.distortionBlur = surfaceDescription.DistortionBlur;
				#else
					builtinData.distortion = float2(0.0, 0.0);
					builtinData.distortionBlur = 0.0;
				#endif
        
                PostInitBuiltinData(V, posInput, surfaceData, builtinData);
            }
        
			PackedVaryingsMeshToPS Vert(AttributesMesh inputMesh )
			{
				PackedVaryingsMeshToPS outputPackedVaryingsMeshToPS;

				UNITY_SETUP_INSTANCE_ID( inputMesh );
				UNITY_TRANSFER_INSTANCE_ID( inputMesh, outputPackedVaryingsMeshToPS );
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( outputPackedVaryingsMeshToPS );
				
				SphereImpostorVertex( inputMesh.vertex, inputMesh.normal, outputPackedVaryingsMeshToPS.frameUVs99, outputPackedVaryingsMeshToPS.viewPos99 );
				float3 viewToObj3965_g69600 = mul( GetWorldToObjectMatrix(), mul( UNITY_MATRIX_I_V , float4( outputPackedVaryingsMeshToPS.viewPos99.xyz, 1 ) ) ).xyz;
				float3 VertexPosition3564_g69600 = viewToObj3965_g69600;
				half3 VertexPos40_g69645 = VertexPosition3564_g69600;
				float3 appendResult74_g69645 = (float3(VertexPos40_g69645.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g69645 = appendResult74_g69645;
				float3 break84_g69645 = VertexPos40_g69645;
				float3 appendResult81_g69645 = (float3(0.0 , break84_g69645.y , break84_g69645.z));
				half3 VertexPosOtherAxis82_g69645 = appendResult81_g69645;
				float4 temp_output_91_19_g69623 = TVE_MotionCoords;
				float3 localObjectPosition_UNITY_MATRIX_M14_g69635 = ObjectPosition_UNITY_MATRIX_M();
				#ifdef SHADEROPTIONS_CAMERA_RELATIVE_RENDERING
				float3 staticSwitch13_g69635 = ( localObjectPosition_UNITY_MATRIX_M14_g69635 + _WorldSpaceCameraPos );
				#else
				float3 staticSwitch13_g69635 = localObjectPosition_UNITY_MATRIX_M14_g69635;
				#endif
				half3 ObjectData20_g69636 = staticSwitch13_g69635;
				float3 ase_worldPos = GetAbsolutePositionWS( TransformObjectToWorld( (inputMesh.vertex).xyz ) );
				half3 WorldData19_g69636 = ase_worldPos;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g69636 = WorldData19_g69636;
				#else
				float3 staticSwitch14_g69636 = ObjectData20_g69636;
				#endif
				float3 temp_output_114_0_g69635 = staticSwitch14_g69636;
				float3 vertexToFrag4543_g69600 = temp_output_114_0_g69635;
				float3 ObjectPosition4422_g69600 = vertexToFrag4543_g69600;
				half2 UV94_g69623 = ( (temp_output_91_19_g69623).zw + ( (temp_output_91_19_g69623).xy * (ObjectPosition4422_g69600).xz ) );
				float temp_output_84_0_g69623 = _LayerMotionValue;
				float4 lerpResult107_g69623 = lerp( TVE_MotionParams , saturate( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_MotionTex, sampler_linear_repeat, UV94_g69623,temp_output_84_0_g69623, 0.0 ) ) , TVE_MotionUsage[(int)temp_output_84_0_g69623]);
				half4 Global_Motion_Params4344_g69600 = lerpResult107_g69623;
				float4 break322_g69639 = Global_Motion_Params4344_g69600;
				float3 appendResult397_g69639 = (float3(break322_g69639.x , 0.0 , break322_g69639.y));
				float3 temp_output_398_0_g69639 = (appendResult397_g69639*2.0 + -1.0);
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				half2 Motion_DirectionOS39_g69600 = (( mul( GetWorldToObjectMatrix(), float4( temp_output_398_0_g69639 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_DirectionOS358_g69627 = Motion_DirectionOS39_g69600;
				float temp_output_3572_0_g69600 = saturate( VertexPosition3564_g69600.y );
				half Mesh_Motion_1082_g69600 = ( temp_output_3572_0_g69600 * 2.0 );
				half Wind_Power369_g69639 = break322_g69639.z;
				half Motion_WindPower2223_g69600 = Wind_Power369_g69639;
				half3 Input_Position419_g69643 = -ObjectPosition4422_g69600;
				half2 Motion_DirectionWS4464_g69600 = (temp_output_398_0_g69639).xz;
				half2 Input_DirectionWS423_g69643 = Motion_DirectionWS4464_g69600;
				float Motion_Scale287_g69643 = ( _MotionScale_10 + 0.2 );
				half Global_Scale448_g69643 = TVE_NoiseParams.x;
				half Input_Speed62_g69643 = _MotionSpeed_10;
				half Global_Speed449_g69643 = TVE_NoiseParams.y;
				float mulTime426_g69643 = _TimeParameters.x * ( Input_Speed62_g69643 * Global_Speed449_g69643 );
				half Global_DistScale561_g69643 = TVE_NoiseParams.w;
				float3 break461_g69643 = ( Input_Position419_g69643 * Global_DistScale561_g69643 );
				half Global_DistAmplitude559_g69643 = TVE_NoiseParams.z;
				float Noise_Distortion469_g69643 = ( sin( ( break461_g69643.x + break461_g69643.z ) ) * Global_DistAmplitude559_g69643 );
				half Motion_Variation284_g69643 = 0.0;
				float2 temp_output_425_0_g69643 = ( ( (Input_Position419_g69643).xz * Input_DirectionWS423_g69643 * Motion_Scale287_g69643 * Global_Scale448_g69643 ) + ( mulTime426_g69643 + Noise_Distortion469_g69643 + Motion_Variation284_g69643 ) );
				float2 break500_g69643 = ( temp_output_425_0_g69643 * 0.1178 );
				float2 break494_g69643 = ( temp_output_425_0_g69643 * 0.1742 );
				half Input_WindPower327_g69643 = Motion_WindPower2223_g69600;
				float lerpResult430_g69643 = lerp( 1.4 , 0.4 , Input_WindPower327_g69643);
				half Global_MotionNoise34_g69600 = (pow( (( sin( ( break500_g69643.x + break500_g69643.y ) ) * sin( ( break494_g69643.x + break494_g69643.y ) ) )*0.4 + 0.6) , lerpResult430_g69643 )*1.2 + -0.2);
				half Motion_10_Amplitude2258_g69600 = ( _MotionAmplitude_10 * Mesh_Motion_1082_g69600 * Motion_WindPower2223_g69600 * Global_MotionNoise34_g69600 );
				half Input_BendingAmplitude376_g69627 = Motion_10_Amplitude2258_g69600;
				half Input_InteractionAmplitude58_g69627 = _InteractionAmplitude;
				half Input_MeshMotion_10321_g69627 = Mesh_Motion_1082_g69600;
				half Input_InteractionUseMask62_g69627 = _InteractionMaskValue;
				float lerpResult371_g69627 = lerp( 2.0 , Input_MeshMotion_10321_g69627 , Input_InteractionUseMask62_g69627);
				half ObjectData20_g69628 = lerpResult371_g69627;
				half WorldData19_g69628 = Input_MeshMotion_10321_g69627;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g69628 = WorldData19_g69628;
				#else
				float staticSwitch14_g69628 = ObjectData20_g69628;
				#endif
				half Motion_10_Interaction373_g69627 = ( Input_InteractionAmplitude58_g69627 * staticSwitch14_g69628 );
				half Interaction_Mask66_g69600 = ( break322_g69639.w * break322_g69639.w );
				float Input_InteractionMask330_g69627 = Interaction_Mask66_g69600;
				float lerpResult360_g69627 = lerp( Input_BendingAmplitude376_g69627 , Motion_10_Interaction373_g69627 , saturate( ( Input_InteractionAmplitude58_g69627 * Input_InteractionMask330_g69627 ) ));
				float2 break364_g69627 = ( Input_DirectionOS358_g69627 * lerpResult360_g69627 );
				half Motion_10_BendingZ190_g69600 = break364_g69627.y;
				half Angle44_g69645 = Motion_10_BendingZ190_g69600;
				half3 VertexPos40_g69642 = ( VertexPosRotationAxis50_g69645 + ( VertexPosOtherAxis82_g69645 * cos( Angle44_g69645 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g69645 ) * sin( Angle44_g69645 ) ) );
				float3 appendResult74_g69642 = (float3(0.0 , 0.0 , VertexPos40_g69642.z));
				half3 VertexPosRotationAxis50_g69642 = appendResult74_g69642;
				float3 break84_g69642 = VertexPos40_g69642;
				float3 appendResult81_g69642 = (float3(break84_g69642.x , break84_g69642.y , 0.0));
				half3 VertexPosOtherAxis82_g69642 = appendResult81_g69642;
				half Motion_10_BendingX216_g69600 = break364_g69627.x;
				half Angle44_g69642 = -Motion_10_BendingX216_g69600;
				float3 Vertex_Motion_Object833_g69600 = ( VertexPosRotationAxis50_g69642 + ( VertexPosOtherAxis82_g69642 * cos( Angle44_g69642 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g69642 ) * sin( Angle44_g69642 ) ) );
				float4 temp_output_94_19_g69606 = TVE_VertexCoords;
				half2 UV97_g69606 = ( (temp_output_94_19_g69606).zw + ( (temp_output_94_19_g69606).xy * (ObjectPosition4422_g69600).xz ) );
				float temp_output_84_0_g69606 = _LayerVertexValue;
				float4 lerpResult109_g69606 = lerp( TVE_VertexParams , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_VertexTex, sampler_linear_repeat, UV97_g69606,temp_output_84_0_g69606, 0.0 ) , TVE_VertexUsage[(int)temp_output_84_0_g69606]);
				half4 Global_Vertex_Params4413_g69600 = lerpResult109_g69606;
				half Global_VertexTex_Size174_g69600 = saturate( Global_Vertex_Params4413_g69600.w );
				float lerpResult346_g69600 = lerp( 1.0 , Global_VertexTex_Size174_g69600 , _GlobalSize);
				float3 appendResult3480_g69600 = (float3(lerpResult346_g69600 , lerpResult346_g69600 , lerpResult346_g69600));
				half3 Vertex_Size1741_g69600 = appendResult3480_g69600;
				half3 _Vector5 = half3(1,1,1);
				float3 Vertex_SizeFade1740_g69600 = _Vector5;
				half IsInitialized3811_g69600 = _IsInitialized;
				float3 Final_VertexPosition890_g69600 = ( ( ( ( Vertex_Motion_Object833_g69600 * Vertex_Size1741_g69600 * Vertex_SizeFade1740_g69600 ) - VertexPosition3564_g69600 ) * IsInitialized3811_g69600 ) + _DisableSRPBatcher );
				
				outputPackedVaryingsMeshToPS.ase_texcoord10.xyz = vertexToFrag4543_g69600;
				
				
				//setting value to unused interpolator channels and avoid initialization warnings
				outputPackedVaryingsMeshToPS.ase_texcoord10.w = 0;
				inputMesh.vertex.xyz += Final_VertexPosition890_g69600;

				float3 positionRWS = TransformObjectToWorld( inputMesh.vertex.xyz );
				float3 normalWS = TransformObjectToWorldNormal(inputMesh.normal);
				float4 tangentWS = float4(TransformObjectToWorldDir(inputMesh.tangent.xyz), inputMesh.tangent.w);

				outputPackedVaryingsMeshToPS.positionCS = TransformWorldToHClip(positionRWS);
				outputPackedVaryingsMeshToPS.interp00.xyz = positionRWS;
				outputPackedVaryingsMeshToPS.interp01.xyz = normalWS;
				outputPackedVaryingsMeshToPS.interp02.xyzw = tangentWS;
				outputPackedVaryingsMeshToPS.interp03.xyzw = inputMesh.texcoord;
				outputPackedVaryingsMeshToPS.interp04.xyzw = inputMesh.uv1;
				outputPackedVaryingsMeshToPS.interp05.xyzw = inputMesh.uv2;
				outputPackedVaryingsMeshToPS.interp06.xyzw = inputMesh.uv3;
				outputPackedVaryingsMeshToPS.interp07.xyzw = inputMesh.color;
				
				return outputPackedVaryingsMeshToPS;
			}

			void Frag(  PackedVaryingsMeshToPS packedInput
				#ifdef WRITE_NORMAL_BUFFER
				, out float4 outNormalBuffer : SV_Target0
					#ifdef WRITE_MSAA_DEPTH
				, out float1 depthColor : SV_Target1
					#endif
				#endif
				, out float outputDepth : SV_Depth
				
			)
			{
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( packedInput );
				UNITY_SETUP_INSTANCE_ID( packedInput );

				#ifdef LOD_FADE_CROSSFADE
				float3 VC = GetWorldSpaceNormalizeViewDir(packedInput.interp00.xyz);
				LODDitheringTransition(ComputeFadeMaskSeed(VC, packedInput.positionCS.xy), unity_LODFade.x);
				#endif

				FragInputs input;

				ZERO_INITIALIZE(FragInputs, input);
				SmoothSurfaceDescription surfaceDescription = (SmoothSurfaceDescription)0;
				SurfaceOutput o = (SurfaceOutput)0;

				o.Normal = float3( 0, 0, 1 );
				float4 clipPos = 0;
				float3 worldPos = 0;

				float4 output0 = 0;
				float4 output1 = 0;
				SphereImpostorFragment( o, clipPos, worldPos, packedInput.frameUVs99, packedInput.viewPos99, output0, output1 );
				float4 break3589_g69600 = output0;
				half Main_Mask_Smoothness3820_g69600 = break3589_g69600.a;
				half Main_Smoothness3838_g69600 = ( Main_Mask_Smoothness3820_g69600 * _ImpostorSmoothnessValue );
				float4 temp_output_93_19_g69601 = TVE_ExtrasCoords;
				float3 temp_output_3563_0_g69600 = worldPos;
				float3 WorldPosition4027_g69600 = temp_output_3563_0_g69600;
				float3 vertexToFrag4543_g69600 = packedInput.ase_texcoord10.xyz;
				float3 ObjectPosition4422_g69600 = vertexToFrag4543_g69600;
				float3 lerpResult4483_g69600 = lerp( WorldPosition4027_g69600 , ObjectPosition4422_g69600 , _ExtrasPositionMode);
				half2 UV96_g69601 = ( (temp_output_93_19_g69601).zw + ( (temp_output_93_19_g69601).xy * (lerpResult4483_g69600).xz ) );
				float temp_output_84_0_g69601 = _LayerExtrasValue;
				float4 lerpResult109_g69601 = lerp( TVE_ExtrasParams , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_ExtrasTex, sampler_linear_repeat, UV96_g69601,temp_output_84_0_g69601, 0.0 ) , TVE_ExtrasUsage[(int)temp_output_84_0_g69601]);
				float4 break89_g69601 = lerpResult109_g69601;
				half Global_ExtrasTex_Wetness305_g69600 = break89_g69601.g;
				float lerpResult3892_g69600 = lerp( Main_Smoothness3838_g69600 , saturate( ( Main_Smoothness3838_g69600 + Global_ExtrasTex_Wetness305_g69600 ) ) , _GlobalWetness);
				half Final_Smoothness3898_g69600 = lerpResult3892_g69600;
				
				float temp_output_3577_0_g69600 = o.Alpha;
				float localCustomAlphaClipAlways4430_g69600 = ( temp_output_3577_0_g69600 );
				half Global_ExtrasTex_Alpha1033_g69600 = saturate( break89_g69601.a );
				float3 break111_g69647 = ObjectPosition4422_g69600;
				half Global_DynamicMode4535_g69600 = _VertexDynamicMode;
				half Input_DynamicMode120_g69647 = Global_DynamicMode4535_g69600;
				half Main_Variation_Or_Metallic3607_g69600 = break3589_g69600.r;
				half Input_Variation124_g69647 = Main_Variation_Or_Metallic3607_g69600;
				half ObjectData20_g69648 = frac( ( ( ( break111_g69647.x + break111_g69647.y + break111_g69647.z ) * ( 1.0 - Input_DynamicMode120_g69647 ) ) + Input_Variation124_g69647 ) );
				half WorldData19_g69648 = Input_Variation124_g69647;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g69648 = WorldData19_g69648;
				#else
				float staticSwitch14_g69648 = ObjectData20_g69648;
				#endif
				float clampResult129_g69647 = clamp( staticSwitch14_g69648 , 0.01 , 0.99 );
				half Global_MeshVariation4531_g69600 = clampResult129_g69647;
				float lerpResult4544_g69600 = lerp( 0.0 , Global_MeshVariation4531_g69600 , _AlphaVariationValue);
				half Global_Alpha_Variation4546_g69600 = lerpResult4544_g69600;
				float lerpResult4053_g69600 = lerp( 1.0 , ( ( Global_ExtrasTex_Alpha1033_g69600 - Global_Alpha_Variation4546_g69600 ) + 0.09 ) , _GlobalAlpha);
				half Main_Mask_Leaves3712_g69600 = break3589_g69600.g;
				float lerpResult4075_g69600 = lerp( 1.0 , lerpResult4053_g69600 , Main_Mask_Leaves3712_g69600);
				half Final_Alpha4102_g69600 = lerpResult4075_g69600;
				float Alpha4430_g69600 = Final_Alpha4102_g69600;
				{
				clip(Alpha4430_g69600 - 0.1);
				}
				float temp_output_3_0_g69644 = localCustomAlphaClipAlways4430_g69600;
				half Offest27_g69644 = 0.0;
				half Feather30_g69644 = 0.2;
				
				surfaceDescription.Smoothness = Final_Smoothness3898_g69600;
				surfaceDescription.Alpha = ( ( ( temp_output_3_0_g69644 - Offest27_g69644 ) / ( max( fwidth( temp_output_3_0_g69644 ) , 0.001 ) + Feather30_g69644 ) ) + Offest27_g69644 );

				#ifdef _ALPHATEST_ON
				surfaceDescription.AlphaClipThreshold = 0;
				#endif

				packedInput.positionCS.zw = clipPos.zw;
				float3 positionRWS = worldPos;
				float3 normalWS = o.Normal;
				float4 tangentWS = packedInput.interp02.xyzw;
				float4 texCoord0 = packedInput.interp03.xyzw;
				float4 texCoord1 = packedInput.interp04.xyzw;
				float4 texCoord2 = packedInput.interp05.xyzw;
				float4 texCoord3 = packedInput.interp06.xyzw;
				float4 vertexColor = packedInput.interp07.xyzw;

				input.positionSS = packedInput.positionCS;
				input.positionRWS = positionRWS;
#if defined( ASE_SRP_VERSION ) && ASE_SRP_VERSION < 60900
				input.worldToTangent = BuildWorldToTangent( tangentWS, normalWS );
#else
				input.tangentToWorld = BuildTangentToWorld( tangentWS, normalWS );
#endif
				input.texCoord0 = texCoord0;
				input.texCoord1 = texCoord1;
				input.texCoord2 = texCoord2;
				input.texCoord3 = texCoord3;
				input.color = vertexColor;

				PositionInputs posInput = GetPositionInput( input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS );

				float3 normalizedWorldViewDir = GetWorldSpaceNormalizeViewDir( input.positionRWS );

				SurfaceData surfaceData;
				BuiltinData builtinData;

				GetSurfaceAndBuiltinData(surfaceDescription, input, normalizedWorldViewDir, posInput, surfaceData, builtinData);

				outputDepth = posInput.deviceDepth;

				#ifdef WRITE_NORMAL_BUFFER
					EncodeIntoNormalBuffer(ConvertSurfaceDataToNormalData(surfaceData), posInput.positionSS, outNormalBuffer);
					#ifdef WRITE_MSAA_DEPTH
					depthColor = packedInput.positionCS.z;
					#endif
				#endif
			}
            ENDHLSL
        }

		
		Pass
        {
			
            Name "Forward"
            Tags { "LightMode"="Forward" }
			Stencil
			{
				Ref 10
				WriteMask 14
				Comp Always
				Pass Replace
				Fail Keep
				ZFail Keep
			}

        
            HLSLPROGRAM
        
			#define _MATERIAL_FEATURE_TRANSMISSION 1
			#define _DISABLE_SSR 1
			#define ASE_SRP_VERSION 120100
			#ifdef UNITY_COLORSPACE_GAMMA//AI_SRP
			#define unity_ColorSpaceDielectricSpec half4(0.220916301, 0.220916301, 0.220916301, 1.0 - 0.220916301)//AI_SRP
			#else//AI_SRP
			#define unity_ColorSpaceDielectricSpec half4(0.04, 0.04, 0.04, 1.0 - 0.04) //AI_SRP
			#endif//AI_SRP

        
			#pragma vertex Vert
			#pragma fragment Frag
        
			#if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define OUTPUT_SPLIT_LIGHTING
			#endif
        
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#if defined( ASE_SRP_VERSION ) && ASE_SRP_VERSION < 60900              
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Wind.hlsl"
			#endif
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
        
            #define SHADERPASS SHADERPASS_FORWARD
            #pragma multi_compile _ LIGHTMAP_ON
            #pragma multi_compile _ DIRLIGHTMAP_COMBINED
            #pragma multi_compile _ DYNAMICLIGHTMAP_ON
            #pragma multi_compile _ SHADOWS_SHADOWMASK
            #pragma multi_compile DECALS_OFF DECALS_3RT DECALS_4RT
            #define LIGHTLOOP_TILE_PASS
            #pragma multi_compile USE_FPTL_LIGHTLIST USE_CLUSTERED_LIGHTLIST
            #pragma multi_compile SHADOW_LOW SHADOW_MEDIUM SHADOW_HIGH
        
            #define VARYINGS_NEED_POSITION_WS
            #define VARYINGS_NEED_TANGENT_TO_WORLD
            #define VARYINGS_NEED_TEXCOORD1
            #define VARYINGS_NEED_TEXCOORD2
        
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Lighting/Lighting.hlsl"
        
			#define HAS_LIGHTLOOP
        
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Lighting/LightLoop/LightLoopDef.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Lighting/LightLoop/LightLoop.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

			#if defined( ASE_SRP_VERSION ) && ASE_SRP_VERSION < 60900
			#define T2W(var, index) var.worldToTangent[index]
			#else
			#define T2W(var, index) var.tangentToWorld[index]
			#endif

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/CommonLighting.hlsl"
			#define ai_ObjectToWorld GetObjectToWorldMatrix()
			#define ai_WorldToObject GetWorldToObjectMatrix()
			#define AI_INV_TWO_PI  INV_TWO_PI
			#define AI_PI          PI
			#define AI_INV_PI      INV_PI
			//TVE Pipeline Defines
			#define THE_VEGETATION_ENGINE
			#define TVE_IS_HD_PIPELINE
			//TVE Injection Defines
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END


			struct AttributesMesh 
			{
				float4 vertex : POSITION;
				float3 normal : NORMAL; 
				float4 tangent : TANGENT; 
				float4 texcoord : TEXCOORD0;
				float4 uv1 : TEXCOORD1;
				float4 uv2 : TEXCOORD2;				
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};
        
			struct PackedVaryingsMeshToPS 
			{
				float4 positionCS : SV_Position;
				float3 interp00 : TEXCOORD0;
				float3 interp01 : TEXCOORD1;
				float4 interp02 : TEXCOORD2;
				float4 interp03 : TEXCOORD3;
				float4 interp04 : TEXCOORD4;
				float4 interp05 : TEXCOORD5;				
				float4 frameUVs99 : TEXCOORD6;
				float4 viewPos99 : TEXCOORD7;
				float4 ase_texcoord8 : TEXCOORD8;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			float4x4 unity_CameraProjection;
			float4x4 unity_CameraInvProjection;
			float4x4 unity_WorldToCamera;
			float4x4 unity_CameraToWorld;
			sampler2D _Albedo;
			sampler2D _Normals;
			half4 TVE_MotionParams;
			TEXTURE2D_ARRAY(TVE_MotionTex);
			half4 TVE_MotionCoords;
			SAMPLER(sampler_linear_repeat);
			float TVE_MotionUsage[10];
			half4 TVE_NoiseParams;
			half4 TVE_VertexParams;
			TEXTURE2D_ARRAY(TVE_VertexTex);
			half4 TVE_VertexCoords;
			float TVE_VertexUsage[10];
			half _DisableSRPBatcher;
			sampler2D _Mask;
			sampler2D _Emissive;
			half4 TVE_ColorsParams;
			TEXTURE2D_ARRAY(TVE_ColorsTex);
			half4 TVE_ColorsCoords;
			float TVE_ColorsUsage[10];
			half TVE_SubsurfaceValue;
			half3 TVE_MainLightDirection;
			half4 TVE_OverlayColor;
			half4 TVE_ExtrasParams;
			TEXTURE2D_ARRAY(TVE_ExtrasTex);
			half4 TVE_ExtrasCoords;
			float TVE_ExtrasUsage[10];
			CBUFFER_START( UnityPerMaterial )
			float4 _ImpostorGrassColor;
			half4 _SubsurfaceColor;
			float4 _ImpostorLeafColor;
			half4 _SubsurfaceMaskRemap;
			half4 _ColorsMaskRemap;
			float4 _ImpostorBarkColor;
			half4 _OverlayMaskRemap;
			half4 _EmissiveColor;
			half4 _DetailBlendRemap;
			float4 _AI_SizeOffset;
			float4 _NoiseMaskRemap;
			float4 _SubsurfaceDiffusion_Asset;
			float4 _SubsurfaceDiffusion_asset;
			float4 _GradientMaskRemap;
			float4 _EmissiveIntensityParams;
			float3 _AI_Offset;
			half _ImpostorLeafSaturationValue;
			half _ImpostorBarkSaturationValue;
			half _GlobalSize;
			half _MotionSpeed_10;
			half _InteractionMaskValue;
			half _InteractionAmplitude;
			half _MotionScale_10;
			half _MotionAmplitude_10;
			half _LayerMotionValue;
			float _AI_Clip;
			float _AI_ShadowView;
			float _AI_ShadowBias;
			half _LayerVertexValue;
			half _IsVegetationShader;
			half _VertexDynamicMode;
			half _ColorsPositionMode;
			half _GlobalWetness;
			half _ImpostorSmoothnessValue;
			half _GlobalEmissive;
			half _EmissiveExposureValue;
			half _OverlayMaskMaxValue;
			half _OverlayMaskMinValue;
			half _OverlayVariationValue;
			half _LayerExtrasValue;
			half _ImpostorGrassSaturationValue;
			half _ExtrasPositionMode;
			half _SubsurfaceMaskMaxValue;
			half _SubsurfaceMaskMinValue;
			half _SubsurfaceValue;
			half _ColorsMaskMaxValue;
			half _ColorsMaskMinValue;
			half _ColorsVariationValue;
			half _GlobalColors;
			half _LayerColorsValue;
			half _GlobalOverlay;
			float _AI_DepthSize;
			float _AI_ImpostorSize;
			float _AI_Parallax;
			half _SpaceGlobalLocals;
			half _SpaceGlobalPosition;
			half _SpaceGlobalLayers;
			half _SpaceMotionLocals;
			half _SubsurfaceAngleValue;
			half _DetailBlendMode;
			half _CategorySizeFade;
			half _IsImpostorShader;
			half _SubsurfaceScatteringValue;
			half _SubsurfaceAmbientValue;
			half _DetailMode;
			half _CategoryNoise;
			half _CategoryMotion;
			half _LayerReactValue;
			half _RenderQueue;
			half _IsTVEShader;
			half _CategoryGlobal;
			half _MessageSizeFade;
			half _SubsurfaceNormalValue;
			half _RenderPriority;
			half _SubsurfaceDirectValue;
			half _AlphaVariationValue;
			float _AI_FramesY;
			float _AI_FramesX;
			float _AI_Frames;
			half _RenderCoverage;
			float _RenderSpecular;
			half _IsSubsurfaceShader;
			half _ImpostorCat;
			float _AI_TextureBias;
			half _VertexPivotMode;
			half _SubsurfaceShadowValue;
			half _EmissiveFlagMode;
			float _IsVersion;
			half _CategorySubsurface;
			float _VegetationMode;
			half _CategoryEmissive;
			float _SubsurfaceDiffusion;
			half _CategoryDetail;
			half _IsInitialized;
			half _GlobalAlpha;
			CBUFFER_END


			inline void SphereImpostorVertex( inout float4 vertex, inout float3 normal, inout float4 frameUVs, inout float4 viewPos )
			{
				float2 uvOffset = _AI_SizeOffset.zw;
				float sizeX = _AI_FramesX;
				float sizeY = _AI_FramesY - 1; 
				float UVscale = _AI_ImpostorSize;
				float4 fractions = 1 / float4( sizeX, _AI_FramesY, sizeY, UVscale );
				float2 sizeFraction = fractions.xy;
				float axisSizeFraction = fractions.z;
				float fractionsUVscale = fractions.w;
				float3 worldOrigin = 0;
				float4 perspective = float4( 0, 0, 0, 1 );
				if( UNITY_MATRIX_P[ 3 ][ 3 ] == 1 )
				{
				perspective = float4( 0, 0, 5000, 0 );
				worldOrigin = ai_ObjectToWorld._m03_m13_m23;
				}
				float3 worldCameraPos = worldOrigin + mul( UNITY_MATRIX_I_V, perspective ).xyz;
				float3 objectCameraPosition = mul( ai_WorldToObject, float4( worldCameraPos, 1 ) ).xyz - _AI_Offset.xyz; 
				float3 objectCameraDirection = normalize( objectCameraPosition );
				float3 upVector = float3( 0,1,0 );
				float3 objectHorizontalVector = normalize( cross( objectCameraDirection, upVector ) );
				float3 objectVerticalVector = cross( objectHorizontalVector, objectCameraDirection );
				float verticalAngle = frac( atan2( -objectCameraDirection.z, -objectCameraDirection.x ) * AI_INV_TWO_PI ) * sizeX + 0.5;
				float verticalDot = dot( objectCameraDirection, upVector );
				float upAngle = ( acos( -verticalDot ) * AI_INV_PI ) + axisSizeFraction * 0.5f;
				float yRot = sizeFraction.x * AI_PI * verticalDot * ( 2 * frac( verticalAngle ) - 1 );
				float2 uvExpansion = vertex.xy;
				float cosY = cos( yRot );
				float sinY = sin( yRot );
				float2 uvRotator = mul( uvExpansion, float2x2( cosY, -sinY, sinY, cosY ) );
				float3 billboard = objectHorizontalVector * uvRotator.x + objectVerticalVector * uvRotator.y + _AI_Offset.xyz;
				float2 relativeCoords = float2( floor( verticalAngle ), min( floor( upAngle * sizeY ), sizeY ) );
				float2 frameUV = ( ( uvExpansion * fractionsUVscale + 0.5 ) + relativeCoords ) * sizeFraction;
				frameUVs.xy = frameUV - uvOffset;
				frameUVs.zw = 0;
				viewPos.w = 0;
				viewPos.xyz = TransformWorldToView( TransformObjectToWorld( billboard ) );
				vertex.xyz = billboard;
				normal.xyz = objectCameraDirection;
			}
			
			float3 ObjectPosition_UNITY_MATRIX_M(  )
			{
				return float3(UNITY_MATRIX_M[0].w, UNITY_MATRIX_M[1].w, UNITY_MATRIX_M[2].w );
			}
			
			inline void SphereImpostorFragment( inout SurfaceOutput o, out float4 clipPos, out float3 worldPos, float4 frameUV, float4 viewPos, out float4 output0, out float4 output1 )
			{
				#if _USE_PARALLAX_ON
				float4 parallaxSample = tex2Dbias( _Normals, float4(frameUV.xy, 0, -1) );
				frameUV.xy = ( ( 0.5 - parallaxSample.a ) * frameUV.zw ) + frameUV.xy;
				#endif
				float4 albedoSample = tex2Dbias( _Albedo, float4(frameUV.xy, 0, _AI_TextureBias) );
				o.Alpha = ( albedoSample.a - _AI_Clip );
				clip( o.Alpha );
				o.Albedo = albedoSample.rgb;
				#if defined(AI_HD_RENDERPIPELINE) && ( AI_HDRP_VERSION >= 50702 )
				float4 feat1 = _Features.SampleLevel( SamplerState_Point_Repeat, frameUV.xy, 0);
				o.Diffusion = feat1.rgb;
				o.Features = feat1.a;
				float4 test1 = _Specular.SampleLevel( SamplerState_Point_Repeat, frameUV.xy, 0);
				o.MetalTangent = test1.b;
				#endif
				output0 = tex2Dbias( _Mask, float4(frameUV.xy, 0, _AI_TextureBias) );
				output1 = tex2Dbias( _Emissive, float4(frameUV.xy, 0, _AI_TextureBias) );
				float4 normalSample = tex2Dbias( _Normals, float4(frameUV.xy, 0, _AI_TextureBias) );
				float4 remapNormal = normalSample * 2 - 1; 
				float3 worldNormal = normalize( mul( (float3x3)ai_ObjectToWorld, remapNormal.xyz ) );
				o.Normal = worldNormal;
				#if defined(UNITY_PASS_SHADOWCASTER) // Standard RP fix for deferred path
				float depth = remapNormal.a * _AI_DepthSize * 0.4999 * length( ai_ObjectToWorld[ 2 ].xyz );
				#else
				float depth = remapNormal.a * _AI_DepthSize * 0.5 * length( ai_ObjectToWorld[ 2 ].xyz );
				#endif
				#if ( defined(SHADERPASS) && (SHADERPASS == SHADERPASS_SHADOWS) ) || defined(UNITY_PASS_SHADOWCASTER)
				viewPos.z += depth * _AI_ShadowView;
				viewPos.z += -_AI_ShadowBias;
				#else 
				viewPos.z += depth;
				#endif
				worldPos = GetAbsolutePositionWS( mul( UNITY_MATRIX_I_V, float4( viewPos.xyz, 1 ) )).xyz;
				clipPos = mul( UNITY_MATRIX_P, float4( viewPos.xyz, 1 ) );
				#if defined(UNITY_PASS_SHADOWCASTER) && !defined(SHADERPASS)
				#if UNITY_REVERSED_Z
				clipPos.z = min( clipPos.z, clipPos.w * UNITY_NEAR_CLIP_VALUE );
				#else
				clipPos.z = max( clipPos.z, clipPos.w * UNITY_NEAR_CLIP_VALUE );
				#endif
				#endif
				clipPos.xyz /= clipPos.w;
				if( UNITY_NEAR_CLIP_VALUE < 0 )
				clipPos = clipPos * 0.5 + 0.5;
			}
			
			float3 ASEGetEmissionHDRColor(float3 ldrColor, float luminanceIntensity, float exposureWeight, float inverseCurrentExposureMultiplier)
			{
				float3 hdrColor = ldrColor * luminanceIntensity;
				hdrColor = lerp( hdrColor* inverseCurrentExposureMultiplier, hdrColor, exposureWeight);
				return hdrColor;
			}
			
                  
			void BuildSurfaceData(FragInputs fragInputs, inout GlobalSurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData, out float3 bentNormalWS)
            {
                ZERO_INITIALIZE(SurfaceData, surfaceData);
                surfaceData.baseColor =                 surfaceDescription.Albedo;
                surfaceData.perceptualSmoothness =      surfaceDescription.Smoothness;
                surfaceData.ambientOcclusion =          surfaceDescription.Occlusion;
                surfaceData.specularColor =             surfaceDescription.Specular;
                surfaceData.coatMask =                  surfaceDescription.CoatMask;
        
				#ifdef _HAS_REFRACTION
					if (_EnableSSRefraction)
					{
						surfaceData.ior =                       surfaceDescription.RefractionIndex;
						surfaceData.transmittanceColor =        surfaceDescription.RefractionColor;
						surfaceData.atDistance =                surfaceDescription.RefractionDistance;

						surfaceData.transmittanceMask = (1.0 - surfaceDescription.Alpha);
						surfaceDescription.Alpha = 1.0;
					}
					else
					{
						surfaceData.ior = 1.0;
						surfaceData.transmittanceColor = float3(1.0, 1.0, 1.0);
						surfaceData.atDistance = 1.0;
						surfaceData.transmittanceMask = 0.0;
						surfaceDescription.Alpha = 1.0;
					}
				#else
					surfaceData.ior = 1.0;
					surfaceData.transmittanceColor = float3(1.0, 1.0, 1.0);
					surfaceData.atDistance = 1.0;
					surfaceData.transmittanceMask = 0.0;
				#endif
                
				#ifdef _MATERIAL_FEATURE_IRIDESCENCE		
					surfaceData.iridescenceMask =           surfaceDescription.IridescenceMask;
					surfaceData.iridescenceThickness =      surfaceDescription.IridescenceThickness;
				#endif

				surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;
				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
					surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
				#endif
				#ifdef _MATERIAL_FEATURE_TRANSMISSION
					surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
				#endif
				#ifdef _MATERIAL_FEATURE_ANISOTROPY
					surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;
				#endif
				#ifdef ASE_LIT_CLEAR_COAT
					surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
				#endif
				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
					surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
				#endif
				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
					surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
				#endif
        
				#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
					surfaceData.baseColor *= (1.0 - Max3(surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b));
				#endif
        
				GetNormalWS( fragInputs, float3( 0.0, 0.0, 1.0 ), surfaceData.normalWS, float3( 1.0, 1.0, 1.0 ) );
        
				bentNormalWS = surfaceData.normalWS;
				
				#ifdef ASE_BENT_NORMAL
					GetNormalWS(fragInputs, surfaceDescription.BentNormal, bentNormalWS, float3( 1, 1, 1 ) );
				#endif

				surfaceData.geomNormalWS = T2W(fragInputs, 2);
				
				#if defined(_HAS_REFRACTION) || defined(_MATERIAL_FEATURE_TRANSMISSION)
					surfaceData.thickness =	                 surfaceDescription.Thickness;
				#endif

				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
					surfaceData.subsurfaceMask =            surfaceDescription.SubsurfaceMask;
				#endif

				#if defined( _MATERIAL_FEATURE_SUBSURFACE_SCATTERING ) || defined( _MATERIAL_FEATURE_TRANSMISSION )
					surfaceData.diffusionProfileHash = asuint(surfaceDescription.DiffusionProfile);
				#endif

				surfaceData.tangentWS = normalize( T2W(fragInputs, 0).xyz );
				#ifdef _MATERIAL_FEATURE_ANISOTROPY
					surfaceData.anisotropy = surfaceDescription.Anisotropy;
					surfaceData.tangentWS = TransformTangentToWorld(surfaceDescription.Tangent, fragInputs.worldToTangent);
				#endif
				surfaceData.tangentWS = Orthonormalize(surfaceData.tangentWS, surfaceData.normalWS);
        
				#if defined(_SPECULAR_OCCLUSION_CUSTOM)
					surfaceData.specularOcclusion = surfaceDescription.SpecularOcclusion;
				#elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
					surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO(V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness(surfaceData.perceptualSmoothness));
				#elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
					surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion(ClampNdotV(dot(surfaceData.normalWS, V)), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness(surfaceData.perceptualSmoothness));
				#else
					surfaceData.specularOcclusion = 1.0;
				#endif
        
				#ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
					surfaceData.perceptualSmoothness = GeometricNormalFiltering(surfaceData.perceptualSmoothness, T2W(fragInputs, 2), surfaceDescription.SpecularAAScreenSpaceVariance, surfaceDescription.SpecularAAThreshold);
				#endif
            }
			
			void GetSurfaceAndBuiltinData(GlobalSurfaceDescription surfaceDescription,FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				//#ifdef LOD_FADE_CROSSFADE
				//	uint3 fadeMaskSeed = asuint((int3)(V * _ScreenSize.xyx));
				//	LODDitheringTransition(fadeMaskSeed, unity_LODFade.x);
				//#endif
        
				#ifdef _ALPHATEST_ON
						DoAlphaTest(surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold);
				#endif
        
				float3 bentNormalWS;
				BuildSurfaceData(fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS);
        
				#if HAVE_DECALS
				if( _EnableDecals )
				{
					DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, surfaceDescription.Alpha);
					ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData);
				}
				#endif
        
				#if defined( ASE_SRP_VERSION ) && ASE_SRP_VERSION <= 50702
					InitBuiltinData( surfaceDescription.Alpha, bentNormalWS, -T2W(fragInputs, 2), fragInputs.positionRWS, fragInputs.texCoord1, fragInputs.texCoord2, builtinData );
				#else
					InitBuiltinData( posInput, surfaceDescription.Alpha, bentNormalWS, -T2W(fragInputs, 2), fragInputs.texCoord1, fragInputs.texCoord2, builtinData );
				#endif

				builtinData.emissiveColor = surfaceDescription.Emission;
        
				builtinData.depthOffset = 0.0;
        
				#if (SHADERPASS == SHADERPASS_DISTORTION)
					builtinData.distortion = surfaceDescription.Distortion;
					builtinData.distortionBlur = surfaceDescription.DistortionBlur;
				#else
					builtinData.distortion = float2(0.0, 0.0);
					builtinData.distortionBlur = 0.0;
				#endif
        
				PostInitBuiltinData(V, posInput, surfaceData, builtinData);
			}
    
			PackedVaryingsMeshToPS Vert(AttributesMesh inputMesh )
			{
				PackedVaryingsMeshToPS outputPackedVaryingsMeshToPS;

				UNITY_SETUP_INSTANCE_ID( inputMesh );
				UNITY_TRANSFER_INSTANCE_ID( inputMesh, outputPackedVaryingsMeshToPS );
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( outputPackedVaryingsMeshToPS );

				SphereImpostorVertex( inputMesh.vertex, inputMesh.normal, outputPackedVaryingsMeshToPS.frameUVs99, outputPackedVaryingsMeshToPS.viewPos99 );
				float3 viewToObj3965_g69600 = mul( GetWorldToObjectMatrix(), mul( UNITY_MATRIX_I_V , float4( outputPackedVaryingsMeshToPS.viewPos99.xyz, 1 ) ) ).xyz;
				float3 VertexPosition3564_g69600 = viewToObj3965_g69600;
				half3 VertexPos40_g69645 = VertexPosition3564_g69600;
				float3 appendResult74_g69645 = (float3(VertexPos40_g69645.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g69645 = appendResult74_g69645;
				float3 break84_g69645 = VertexPos40_g69645;
				float3 appendResult81_g69645 = (float3(0.0 , break84_g69645.y , break84_g69645.z));
				half3 VertexPosOtherAxis82_g69645 = appendResult81_g69645;
				float4 temp_output_91_19_g69623 = TVE_MotionCoords;
				float3 localObjectPosition_UNITY_MATRIX_M14_g69635 = ObjectPosition_UNITY_MATRIX_M();
				#ifdef SHADEROPTIONS_CAMERA_RELATIVE_RENDERING
				float3 staticSwitch13_g69635 = ( localObjectPosition_UNITY_MATRIX_M14_g69635 + _WorldSpaceCameraPos );
				#else
				float3 staticSwitch13_g69635 = localObjectPosition_UNITY_MATRIX_M14_g69635;
				#endif
				half3 ObjectData20_g69636 = staticSwitch13_g69635;
				float3 ase_worldPos = GetAbsolutePositionWS( TransformObjectToWorld( (inputMesh.vertex).xyz ) );
				half3 WorldData19_g69636 = ase_worldPos;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g69636 = WorldData19_g69636;
				#else
				float3 staticSwitch14_g69636 = ObjectData20_g69636;
				#endif
				float3 temp_output_114_0_g69635 = staticSwitch14_g69636;
				float3 vertexToFrag4543_g69600 = temp_output_114_0_g69635;
				float3 ObjectPosition4422_g69600 = vertexToFrag4543_g69600;
				half2 UV94_g69623 = ( (temp_output_91_19_g69623).zw + ( (temp_output_91_19_g69623).xy * (ObjectPosition4422_g69600).xz ) );
				float temp_output_84_0_g69623 = _LayerMotionValue;
				float4 lerpResult107_g69623 = lerp( TVE_MotionParams , saturate( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_MotionTex, sampler_linear_repeat, UV94_g69623,temp_output_84_0_g69623, 0.0 ) ) , TVE_MotionUsage[(int)temp_output_84_0_g69623]);
				half4 Global_Motion_Params4344_g69600 = lerpResult107_g69623;
				float4 break322_g69639 = Global_Motion_Params4344_g69600;
				float3 appendResult397_g69639 = (float3(break322_g69639.x , 0.0 , break322_g69639.y));
				float3 temp_output_398_0_g69639 = (appendResult397_g69639*2.0 + -1.0);
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				half2 Motion_DirectionOS39_g69600 = (( mul( GetWorldToObjectMatrix(), float4( temp_output_398_0_g69639 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_DirectionOS358_g69627 = Motion_DirectionOS39_g69600;
				float temp_output_3572_0_g69600 = saturate( VertexPosition3564_g69600.y );
				half Mesh_Motion_1082_g69600 = ( temp_output_3572_0_g69600 * 2.0 );
				half Wind_Power369_g69639 = break322_g69639.z;
				half Motion_WindPower2223_g69600 = Wind_Power369_g69639;
				half3 Input_Position419_g69643 = -ObjectPosition4422_g69600;
				half2 Motion_DirectionWS4464_g69600 = (temp_output_398_0_g69639).xz;
				half2 Input_DirectionWS423_g69643 = Motion_DirectionWS4464_g69600;
				float Motion_Scale287_g69643 = ( _MotionScale_10 + 0.2 );
				half Global_Scale448_g69643 = TVE_NoiseParams.x;
				half Input_Speed62_g69643 = _MotionSpeed_10;
				half Global_Speed449_g69643 = TVE_NoiseParams.y;
				float mulTime426_g69643 = _TimeParameters.x * ( Input_Speed62_g69643 * Global_Speed449_g69643 );
				half Global_DistScale561_g69643 = TVE_NoiseParams.w;
				float3 break461_g69643 = ( Input_Position419_g69643 * Global_DistScale561_g69643 );
				half Global_DistAmplitude559_g69643 = TVE_NoiseParams.z;
				float Noise_Distortion469_g69643 = ( sin( ( break461_g69643.x + break461_g69643.z ) ) * Global_DistAmplitude559_g69643 );
				half Motion_Variation284_g69643 = 0.0;
				float2 temp_output_425_0_g69643 = ( ( (Input_Position419_g69643).xz * Input_DirectionWS423_g69643 * Motion_Scale287_g69643 * Global_Scale448_g69643 ) + ( mulTime426_g69643 + Noise_Distortion469_g69643 + Motion_Variation284_g69643 ) );
				float2 break500_g69643 = ( temp_output_425_0_g69643 * 0.1178 );
				float2 break494_g69643 = ( temp_output_425_0_g69643 * 0.1742 );
				half Input_WindPower327_g69643 = Motion_WindPower2223_g69600;
				float lerpResult430_g69643 = lerp( 1.4 , 0.4 , Input_WindPower327_g69643);
				half Global_MotionNoise34_g69600 = (pow( (( sin( ( break500_g69643.x + break500_g69643.y ) ) * sin( ( break494_g69643.x + break494_g69643.y ) ) )*0.4 + 0.6) , lerpResult430_g69643 )*1.2 + -0.2);
				half Motion_10_Amplitude2258_g69600 = ( _MotionAmplitude_10 * Mesh_Motion_1082_g69600 * Motion_WindPower2223_g69600 * Global_MotionNoise34_g69600 );
				half Input_BendingAmplitude376_g69627 = Motion_10_Amplitude2258_g69600;
				half Input_InteractionAmplitude58_g69627 = _InteractionAmplitude;
				half Input_MeshMotion_10321_g69627 = Mesh_Motion_1082_g69600;
				half Input_InteractionUseMask62_g69627 = _InteractionMaskValue;
				float lerpResult371_g69627 = lerp( 2.0 , Input_MeshMotion_10321_g69627 , Input_InteractionUseMask62_g69627);
				half ObjectData20_g69628 = lerpResult371_g69627;
				half WorldData19_g69628 = Input_MeshMotion_10321_g69627;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g69628 = WorldData19_g69628;
				#else
				float staticSwitch14_g69628 = ObjectData20_g69628;
				#endif
				half Motion_10_Interaction373_g69627 = ( Input_InteractionAmplitude58_g69627 * staticSwitch14_g69628 );
				half Interaction_Mask66_g69600 = ( break322_g69639.w * break322_g69639.w );
				float Input_InteractionMask330_g69627 = Interaction_Mask66_g69600;
				float lerpResult360_g69627 = lerp( Input_BendingAmplitude376_g69627 , Motion_10_Interaction373_g69627 , saturate( ( Input_InteractionAmplitude58_g69627 * Input_InteractionMask330_g69627 ) ));
				float2 break364_g69627 = ( Input_DirectionOS358_g69627 * lerpResult360_g69627 );
				half Motion_10_BendingZ190_g69600 = break364_g69627.y;
				half Angle44_g69645 = Motion_10_BendingZ190_g69600;
				half3 VertexPos40_g69642 = ( VertexPosRotationAxis50_g69645 + ( VertexPosOtherAxis82_g69645 * cos( Angle44_g69645 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g69645 ) * sin( Angle44_g69645 ) ) );
				float3 appendResult74_g69642 = (float3(0.0 , 0.0 , VertexPos40_g69642.z));
				half3 VertexPosRotationAxis50_g69642 = appendResult74_g69642;
				float3 break84_g69642 = VertexPos40_g69642;
				float3 appendResult81_g69642 = (float3(break84_g69642.x , break84_g69642.y , 0.0));
				half3 VertexPosOtherAxis82_g69642 = appendResult81_g69642;
				half Motion_10_BendingX216_g69600 = break364_g69627.x;
				half Angle44_g69642 = -Motion_10_BendingX216_g69600;
				float3 Vertex_Motion_Object833_g69600 = ( VertexPosRotationAxis50_g69642 + ( VertexPosOtherAxis82_g69642 * cos( Angle44_g69642 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g69642 ) * sin( Angle44_g69642 ) ) );
				float4 temp_output_94_19_g69606 = TVE_VertexCoords;
				half2 UV97_g69606 = ( (temp_output_94_19_g69606).zw + ( (temp_output_94_19_g69606).xy * (ObjectPosition4422_g69600).xz ) );
				float temp_output_84_0_g69606 = _LayerVertexValue;
				float4 lerpResult109_g69606 = lerp( TVE_VertexParams , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_VertexTex, sampler_linear_repeat, UV97_g69606,temp_output_84_0_g69606, 0.0 ) , TVE_VertexUsage[(int)temp_output_84_0_g69606]);
				half4 Global_Vertex_Params4413_g69600 = lerpResult109_g69606;
				half Global_VertexTex_Size174_g69600 = saturate( Global_Vertex_Params4413_g69600.w );
				float lerpResult346_g69600 = lerp( 1.0 , Global_VertexTex_Size174_g69600 , _GlobalSize);
				float3 appendResult3480_g69600 = (float3(lerpResult346_g69600 , lerpResult346_g69600 , lerpResult346_g69600));
				half3 Vertex_Size1741_g69600 = appendResult3480_g69600;
				half3 _Vector5 = half3(1,1,1);
				float3 Vertex_SizeFade1740_g69600 = _Vector5;
				half IsInitialized3811_g69600 = _IsInitialized;
				float3 Final_VertexPosition890_g69600 = ( ( ( ( Vertex_Motion_Object833_g69600 * Vertex_Size1741_g69600 * Vertex_SizeFade1740_g69600 ) - VertexPosition3564_g69600 ) * IsInitialized3811_g69600 ) + _DisableSRPBatcher );
				
				outputPackedVaryingsMeshToPS.ase_texcoord8.xyz = vertexToFrag4543_g69600;
				
				
				//setting value to unused interpolator channels and avoid initialization warnings
				outputPackedVaryingsMeshToPS.ase_texcoord8.w = 0;
				inputMesh.vertex.xyz += Final_VertexPosition890_g69600;

				float3 positionRWS = TransformObjectToWorld(inputMesh.vertex.xyz );
				float3 normalWS = TransformObjectToWorldNormal(inputMesh.normal);
				float4 tangentWS = float4(TransformObjectToWorldDir(inputMesh.tangent.xyz), inputMesh.tangent.w);

				outputPackedVaryingsMeshToPS.positionCS = TransformWorldToHClip(positionRWS);
				outputPackedVaryingsMeshToPS.interp00.xyz = positionRWS;
				outputPackedVaryingsMeshToPS.interp01.xyz = normalWS;
				outputPackedVaryingsMeshToPS.interp02.xyzw = tangentWS;
				outputPackedVaryingsMeshToPS.interp03.xyzw = inputMesh.texcoord;
				outputPackedVaryingsMeshToPS.interp04.xyzw = inputMesh.uv1;
				outputPackedVaryingsMeshToPS.interp05.xyzw = inputMesh.uv2;
				return outputPackedVaryingsMeshToPS;
			}

			void Frag(PackedVaryingsMeshToPS packedInput,
				#ifdef OUTPUT_SPLIT_LIGHTING
					out float4 outColor : SV_Target0,
					out float4 outDiffuseLighting : SV_Target1,
					OUTPUT_SSSBUFFER(outSSSBuffer)
				#else
					out float4 outColor : SV_Target0
				#endif
					, out float outputDepth : SV_Depth
				
			)
			{
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(packedInput);
				UNITY_SETUP_INSTANCE_ID( packedInput );

				#ifdef LOD_FADE_CROSSFADE
				float3 VC = GetWorldSpaceNormalizeViewDir(packedInput.interp00.xyz);
				LODDitheringTransition(ComputeFadeMaskSeed(VC, packedInput.positionCS.xy), unity_LODFade.x);
				#endif

				FragInputs input;

				ZERO_INITIALIZE(FragInputs, input);
				GlobalSurfaceDescription surfaceDescription = (GlobalSurfaceDescription)0;
				SurfaceOutput o = (SurfaceOutput)0;

				o.Normal = packedInput.interp01.xyz; //float3( 0, 0, 1 );
				float4 clipPos = packedInput.positionCS;  //0;
				float3 worldPos = packedInput.interp00.xyz; //0;

				half Vegetation_Type4515_g69600 = _VegetationMode;
				float4 output0 = 0;
				float4 output1 = 0;
				SphereImpostorFragment( o, clipPos, worldPos, packedInput.frameUVs99, packedInput.viewPos99, output0, output1 );
				half3 Main_Albedo_Raw4295_g69600 = o.Albedo;
				float dotResult4302_g69600 = dot( float3(0.2126,0.7152,0.0722) , Main_Albedo_Raw4295_g69600 );
				float3 temp_cast_0 = (dotResult4302_g69600).xxx;
				float4 break3589_g69600 = output0;
				half Main_Mask_Leaves3712_g69600 = break3589_g69600.g;
				float lerpResult4305_g69600 = lerp( _ImpostorBarkSaturationValue , _ImpostorLeafSaturationValue , Main_Mask_Leaves3712_g69600);
				float3 lerpResult4303_g69600 = lerp( temp_cast_0 , Main_Albedo_Raw4295_g69600 , lerpResult4305_g69600);
				float4 lerpResult4310_g69600 = lerp( _ImpostorBarkColor , _ImpostorLeafColor , Main_Mask_Leaves3712_g69600);
				float dotResult4323_g69600 = dot( float3(0.2126,0.7152,0.0722) , Main_Albedo_Raw4295_g69600 );
				float3 temp_cast_2 = (dotResult4323_g69600).xxx;
				float3 lerpResult4317_g69600 = lerp( temp_cast_2 , Main_Albedo_Raw4295_g69600 , _ImpostorGrassSaturationValue);
				float3 ifLocalVar18_g69633 = 0;
				UNITY_BRANCH 
				if( Vegetation_Type4515_g69600 > 0.5 )
				ifLocalVar18_g69633 = ( lerpResult4303_g69600 * (lerpResult4310_g69600).rgb );
				else if( Vegetation_Type4515_g69600 < 0.5 )
				ifLocalVar18_g69633 = ( lerpResult4317_g69600 * (_ImpostorGrassColor).rgb );
				half3 Main_Albedo3817_g69600 = ifLocalVar18_g69633;
				half3 Blend_Albedo4137_g69600 = Main_Albedo3817_g69600;
				half3 Blend_AlbedoTinted3958_g69600 = ( Blend_Albedo4137_g69600 * float3(1,1,1) );
				float dotResult4002_g69600 = dot( Blend_AlbedoTinted3958_g69600 , float3(0.2126,0.7152,0.0722) );
				float3 temp_cast_3 = (dotResult4002_g69600).xxx;
				float4 temp_output_91_19_g69619 = TVE_ColorsCoords;
				float3 temp_output_3563_0_g69600 = worldPos;
				float3 WorldPosition4027_g69600 = temp_output_3563_0_g69600;
				float3 vertexToFrag4543_g69600 = packedInput.ase_texcoord8.xyz;
				float3 ObjectPosition4422_g69600 = vertexToFrag4543_g69600;
				float3 lerpResult4478_g69600 = lerp( WorldPosition4027_g69600 , ObjectPosition4422_g69600 , _ColorsPositionMode);
				half2 UV94_g69619 = ( (temp_output_91_19_g69619).zw + ( (temp_output_91_19_g69619).xy * (lerpResult4478_g69600).xz ) );
				float temp_output_82_0_g69619 = _LayerColorsValue;
				float4 lerpResult108_g69619 = lerp( TVE_ColorsParams , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_ColorsTex, sampler_linear_repeat, UV94_g69619,temp_output_82_0_g69619, 0.0 ) , TVE_ColorsUsage[(int)temp_output_82_0_g69619]);
				half Global_ColorsTex_A1701_g69600 = saturate( (lerpResult108_g69619).a );
				half Global_Colors_Influence3998_g69600 = Global_ColorsTex_A1701_g69600;
				float3 lerpResult4004_g69600 = lerp( Blend_AlbedoTinted3958_g69600 , temp_cast_3 , Global_Colors_Influence3998_g69600);
				half3 Global_ColorsTex_RGB1700_g69600 = (lerpResult108_g69619).rgb;
				half3 Global_Colors3856_g69600 = ( Global_ColorsTex_RGB1700_g69600 * 4.594794 );
				float3 break111_g69647 = ObjectPosition4422_g69600;
				half Global_DynamicMode4535_g69600 = _VertexDynamicMode;
				half Input_DynamicMode120_g69647 = Global_DynamicMode4535_g69600;
				half Main_Variation_Or_Metallic3607_g69600 = break3589_g69600.r;
				half Input_Variation124_g69647 = Main_Variation_Or_Metallic3607_g69600;
				half ObjectData20_g69648 = frac( ( ( ( break111_g69647.x + break111_g69647.y + break111_g69647.z ) * ( 1.0 - Input_DynamicMode120_g69647 ) ) + Input_Variation124_g69647 ) );
				half WorldData19_g69648 = Input_Variation124_g69647;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g69648 = WorldData19_g69648;
				#else
				float staticSwitch14_g69648 = ObjectData20_g69648;
				#endif
				float clampResult129_g69647 = clamp( staticSwitch14_g69648 , 0.01 , 0.99 );
				half Global_MeshVariation4531_g69600 = clampResult129_g69647;
				float lerpResult4092_g69600 = lerp( 1.0 , ( Global_MeshVariation4531_g69600 * Global_MeshVariation4531_g69600 ) , _ColorsVariationValue);
				half Global_Colors_Value3999_g69600 = ( _GlobalColors * lerpResult4092_g69600 );
				half Main_Height_Or_Blend3609_g69600 = break3589_g69600.b;
				float temp_output_7_0_g69641 = _ColorsMaskMinValue;
				half Global_Colors_Mask4022_g69600 = ( saturate( ( ( Main_Height_Or_Blend3609_g69600 - temp_output_7_0_g69641 ) / ( _ColorsMaskMaxValue - temp_output_7_0_g69641 ) ) ) * Main_Mask_Leaves3712_g69600 );
				float3 lerpResult4007_g69600 = lerp( Blend_AlbedoTinted3958_g69600 , ( lerpResult4004_g69600 * Global_Colors3856_g69600 ) , ( Global_Colors_Value3999_g69600 * Global_Colors_Mask4022_g69600 ));
				float3 lerpResult4086_g69600 = lerp( Blend_Albedo4137_g69600 , lerpResult4007_g69600 , Main_Mask_Leaves3712_g69600);
				half3 Blend_AlbedoColored3711_g69600 = lerpResult4086_g69600;
				float3 temp_output_3681_0_g69600 = (_SubsurfaceColor).rgb;
				float dotResult4019_g69600 = dot( temp_output_3681_0_g69600 , float3(0.2126,0.7152,0.0722) );
				float3 temp_cast_6 = (dotResult4019_g69600).xxx;
				float3 lerpResult4018_g69600 = lerp( temp_output_3681_0_g69600 , temp_cast_6 , Global_Colors_Influence3998_g69600);
				float3 lerpResult4017_g69600 = lerp( temp_output_3681_0_g69600 , ( lerpResult4018_g69600 * Global_Colors3856_g69600 ) , ( Global_Colors_Value3999_g69600 * Global_Colors_Mask4022_g69600 ));
				half3 Subsurface_Color3656_g69600 = lerpResult4017_g69600;
				half Global_Subsurface4111_g69600 = TVE_SubsurfaceValue;
				half Subsurface_Intensity3684_g69600 = ( _SubsurfaceValue * Global_Subsurface4111_g69600 );
				float temp_output_7_0_g69618 = _SubsurfaceMaskMinValue;
				half Subsurface_Mask3666_g69600 = ( saturate( ( ( Main_Height_Or_Blend3609_g69600 - temp_output_7_0_g69618 ) / ( _SubsurfaceMaskMaxValue - temp_output_7_0_g69618 ) ) ) * Main_Mask_Leaves3712_g69600 );
				half3 Subsurface_Transmission3659_g69600 = ( Subsurface_Color3656_g69600 * Subsurface_Intensity3684_g69600 * Subsurface_Mask3666_g69600 );
				half3 MainLight_Direction4110_g69600 = TVE_MainLightDirection;
				float3 ase_worldPos = GetAbsolutePositionWS( packedInput.interp00 );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 normalizeResult3635_g69600 = normalize( ase_worldViewDir );
				float dotResult3631_g69600 = dot( -MainLight_Direction4110_g69600 , normalizeResult3635_g69600 );
				float saferPower3620_g69600 = abs( saturate( dotResult3631_g69600 ) );
				#ifdef UNITY_PASS_FORWARDADD
				float staticSwitch3636_g69600 = 0.0;
				#else
				float staticSwitch3636_g69600 = ( pow( saferPower3620_g69600 , _SubsurfaceAngleValue ) * _SubsurfaceScatteringValue );
				#endif
				half Mask_Subsurface_View3614_g69600 = staticSwitch3636_g69600;
				half3 Subsurface_Approximation3702_g69600 = ( Subsurface_Transmission3659_g69600 * Blend_AlbedoColored3711_g69600 * Mask_Subsurface_View3614_g69600 );
				half3 Albedo_Subsurface3874_g69600 = ( Blend_AlbedoColored3711_g69600 + Subsurface_Approximation3702_g69600 );
				half3 Global_OverlayColor1758_g69600 = (TVE_OverlayColor).rgb;
				half3 World_Normal3638_g69600 = o.Normal;
				float lerpResult4521_g69600 = lerp( Main_Height_Or_Blend3609_g69600 , World_Normal3638_g69600.y , Vegetation_Type4515_g69600);
				half Main_AlbedoTex_G3807_g69600 = Main_Albedo_Raw4295_g69600.y;
				float4 temp_output_93_19_g69601 = TVE_ExtrasCoords;
				float3 lerpResult4483_g69600 = lerp( WorldPosition4027_g69600 , ObjectPosition4422_g69600 , _ExtrasPositionMode);
				half2 UV96_g69601 = ( (temp_output_93_19_g69601).zw + ( (temp_output_93_19_g69601).xy * (lerpResult4483_g69600).xz ) );
				float temp_output_84_0_g69601 = _LayerExtrasValue;
				float4 lerpResult109_g69601 = lerp( TVE_ExtrasParams , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_ExtrasTex, sampler_linear_repeat, UV96_g69601,temp_output_84_0_g69601, 0.0 ) , TVE_ExtrasUsage[(int)temp_output_84_0_g69601]);
				float4 break89_g69601 = lerpResult109_g69601;
				half Global_ExtrasTex_Overlay156_g69600 = break89_g69601.b;
				float temp_output_3774_0_g69600 = ( _GlobalOverlay * Global_ExtrasTex_Overlay156_g69600 );
				float lerpResult3746_g69600 = lerp( 1.0 , Global_MeshVariation4531_g69600 , _OverlayVariationValue);
				half Overlay_Commons3739_g69600 = ( temp_output_3774_0_g69600 * lerpResult3746_g69600 );
				float temp_output_7_0_g69632 = _OverlayMaskMinValue;
				half Overlay_Mask3762_g69600 = saturate( ( ( ( ( ( lerpResult4521_g69600 * 0.5 ) + Main_AlbedoTex_G3807_g69600 ) * Overlay_Commons3739_g69600 ) - temp_output_7_0_g69632 ) / ( _OverlayMaskMaxValue - temp_output_7_0_g69632 ) ) );
				float3 lerpResult3875_g69600 = lerp( Albedo_Subsurface3874_g69600 , Global_OverlayColor1758_g69600 , Overlay_Mask3762_g69600);
				half3 Final_Albedo4100_g69600 = lerpResult3875_g69600;
				half IsInitialized3811_g69600 = _IsInitialized;
				float3 lerpResult3815_g69600 = lerp( float3( 1,0,0 ) , Final_Albedo4100_g69600 , IsInitialized3811_g69600);
				
				float3 hdEmission4376_g69600 = ASEGetEmissionHDRColor(_EmissiveColor.rgb,_EmissiveIntensityParams.x,_EmissiveExposureValue,GetInverseCurrentExposureMultiplier());
				half Global_ExtrasTex_Emissive4408_g69600 = break89_g69601.r;
				float lerpResult4417_g69600 = lerp( 1.0 , Global_ExtrasTex_Emissive4408_g69600 , _GlobalEmissive);
				half3 Final_Emissive4365_g69600 = ( (( hdEmission4376_g69600 * output1 )).rgb * lerpResult4417_g69600 );
				
				half Main_Mask_Smoothness3820_g69600 = break3589_g69600.a;
				half Main_Smoothness3838_g69600 = ( Main_Mask_Smoothness3820_g69600 * _ImpostorSmoothnessValue );
				half Global_ExtrasTex_Wetness305_g69600 = break89_g69601.g;
				float lerpResult3892_g69600 = lerp( Main_Smoothness3838_g69600 , saturate( ( Main_Smoothness3838_g69600 + Global_ExtrasTex_Wetness305_g69600 ) ) , _GlobalWetness);
				half Final_Smoothness3898_g69600 = lerpResult3892_g69600;
				
				float temp_output_3577_0_g69600 = o.Alpha;
				float localCustomAlphaClipAlways4430_g69600 = ( temp_output_3577_0_g69600 );
				half Global_ExtrasTex_Alpha1033_g69600 = saturate( break89_g69601.a );
				float lerpResult4544_g69600 = lerp( 0.0 , Global_MeshVariation4531_g69600 , _AlphaVariationValue);
				half Global_Alpha_Variation4546_g69600 = lerpResult4544_g69600;
				float lerpResult4053_g69600 = lerp( 1.0 , ( ( Global_ExtrasTex_Alpha1033_g69600 - Global_Alpha_Variation4546_g69600 ) + 0.09 ) , _GlobalAlpha);
				float lerpResult4075_g69600 = lerp( 1.0 , lerpResult4053_g69600 , Main_Mask_Leaves3712_g69600);
				half Final_Alpha4102_g69600 = lerpResult4075_g69600;
				float Alpha4430_g69600 = Final_Alpha4102_g69600;
				{
				clip(Alpha4430_g69600 - 0.1);
				}
				float temp_output_3_0_g69644 = localCustomAlphaClipAlways4430_g69600;
				half Offest27_g69644 = 0.0;
				half Feather30_g69644 = 0.2;
				
				half Subsurface_HD3650_g69600 = ( 1.0 - ( Subsurface_Intensity3684_g69600 * Subsurface_Mask3666_g69600 ) );
				
				surfaceDescription.Albedo = lerpResult3815_g69600;
				o.Normal = World_Normal3638_g69600;
				surfaceDescription.BentNormal = float3( 0, 0, 1 );
				surfaceDescription.CoatMask = 0;
				surfaceDescription.Metallic = 0;
					
				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceDescription.Specular = 0;
				#endif
					
				surfaceDescription.Emission = Final_Emissive4365_g69600;
				surfaceDescription.Smoothness = Final_Smoothness3898_g69600;
				surfaceDescription.Occlusion = 1;
				surfaceDescription.Alpha = ( ( ( temp_output_3_0_g69644 - Offest27_g69644 ) / ( max( fwidth( temp_output_3_0_g69644 ) , 0.001 ) + Feather30_g69644 ) ) + Offest27_g69644 );
					
				#ifdef _ALPHATEST_ON
				surfaceDescription.AlphaClipThreshold = 0;
				#endif

				#ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
				surfaceDescription.SpecularAAScreenSpaceVariance = 0;
				surfaceDescription.SpecularAAThreshold = 0;
				#endif

				#ifdef _SPECULAR_OCCLUSION_CUSTOM
				surfaceDescription.SpecularOcclusion = 0;
				#endif

				#if defined(_HAS_REFRACTION) || defined(_MATERIAL_FEATURE_TRANSMISSION)
				surfaceDescription.Thickness = Subsurface_HD3650_g69600;
				#endif

				#ifdef _HAS_REFRACTION
				surfaceDescription.RefractionIndex = 1;
				surfaceDescription.RefractionColor = float3(1,1,1);
				surfaceDescription.RefractionDistance = 0;
				#endif

				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceDescription.SubsurfaceMask = 1;
				#endif

				#if defined( _MATERIAL_FEATURE_SUBSURFACE_SCATTERING ) || defined( _MATERIAL_FEATURE_TRANSMISSION )
				surfaceDescription.DiffusionProfile = _SubsurfaceDiffusion;
				#endif

				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceDescription.Anisotropy = 1;
				surfaceDescription.Tangent = float3(1,0,0);
				#endif

				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceDescription.IridescenceMask = 0;
				surfaceDescription.IridescenceThickness = 0;
				#endif

				float4 bakedGI = float4( 0, 0, 0, 0 );

				packedInput.positionCS.zw = clipPos.zw;
				float3 positionRWS = worldPos;
				float3 normalWS = o.Normal;
				float4 tangentWS = packedInput.interp02.xyzw;

				input.positionSS = packedInput.positionCS;
				input.positionRWS = positionRWS;
#if defined( ASE_SRP_VERSION ) && ASE_SRP_VERSION < 60900
				input.worldToTangent = BuildWorldToTangent( tangentWS, normalWS );
#else
				input.tangentToWorld = BuildTangentToWorld( tangentWS, normalWS );
#endif
				input.texCoord0 = packedInput.interp03.xyzw;
				input.texCoord1 = packedInput.interp04.xyzw;
				input.texCoord2 = packedInput.interp05.xyzw;

				uint2 tileIndex = uint2( input.positionSS.xy ) / GetTileSize();
#if defined( ASE_SRP_VERSION ) && ASE_SRP_VERSION < 60900
				#if defined(UNITY_SINGLE_PASS_STEREO)
					tileIndex.x -= unity_StereoEyeIndex * _NumTileClusteredX;
				#endif
				PositionInputs posInput = GetPositionInput_Stereo( input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS.xyz, tileIndex, unity_StereoEyeIndex );
#else
				PositionInputs posInput = GetPositionInput( input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS.xyz, tileIndex );
#endif
				float3 normalizedWorldViewDir = GetWorldSpaceNormalizeViewDir( input.positionRWS );

				SurfaceData surfaceData;
				BuiltinData builtinData;
				
				GetSurfaceAndBuiltinData( surfaceDescription, input, normalizedWorldViewDir, posInput, surfaceData, builtinData);
				BSDFData bsdfData = ConvertSurfaceDataToBSDFData(input.positionSS.xy, surfaceData);
				PreLightData preLightData = GetPreLightData(normalizedWorldViewDir, posInput, bsdfData);

				#ifdef CUSTOM_BAKED_GI
					half4 decodeInstructions = half4( LIGHTMAP_HDR_MULTIPLIER, LIGHTMAP_HDR_EXPONENT, 0.0h, 0.0h );
					builtinData.bakeDiffuseLighting = UnpackLightmapRGBM( bakedGI, decodeInstructions ) * EMISSIVE_RGBM_SCALE * bsdfData.diffuseColor;
				#endif

				outColor = float4(0.0, 0.0, 0.0, 0.0);
				#ifdef _SURFACE_TYPE_TRANSPARENT
					uint featureFlags = LIGHT_FEATURE_MASK_FLAGS_TRANSPARENT;
				#else
					uint featureFlags = LIGHT_FEATURE_MASK_FLAGS_OPAQUE;
				#endif
				//float3 diffuseLighting;
				//float3 specularLighting;

				//LightLoop(normalizedWorldViewDir, posInput, preLightData, bsdfData, builtinData, featureFlags, diffuseLighting, specularLighting);
				LightLoopOutput lightLoopOutput;
				LightLoop(normalizedWorldViewDir, posInput, preLightData, bsdfData, builtinData, featureFlags, lightLoopOutput);

				// Alias
				float3 diffuseLighting = lightLoopOutput.diffuseLighting;
				float3 specularLighting = lightLoopOutput.specularLighting;

				diffuseLighting *= GetCurrentExposureMultiplier();
				specularLighting *= GetCurrentExposureMultiplier();

				#ifdef OUTPUT_SPLIT_LIGHTING
					if (_EnableSubsurfaceScattering != 0 && ShouldOutputSplitLighting(bsdfData))
					{
						outColor = float4(specularLighting, 1.0);
						outDiffuseLighting = float4(TagLightingForSSS(diffuseLighting), 1.0);
					}
					else
					{
						outColor = float4(diffuseLighting + specularLighting, 1.0);
						outDiffuseLighting = 0;
					}
					ENCODE_INTO_SSSBUFFER(surfaceData, posInput.positionSS, outSSSBuffer);
				#else
					outColor = ApplyBlendMode(diffuseLighting, specularLighting, builtinData.opacity);
					outColor = EvaluateAtmosphericScattering(posInput, normalizedWorldViewDir, outColor);
				#endif

				outputDepth = posInput.deviceDepth;
			}
            ENDHLSL
        }
		
    }
    
	
	CustomEditor "TVEShaderCoreGUI"
}
/*ASEBEGIN
Version=18934
1920;0;1920;1029;2195.436;1032.668;1;True;False
Node;AmplifyShaderEditor.TexturePropertyNode;101;-1664,-256;Inherit;True;Property;_Mask;Impostor Baked Masks;3;1;[NoScaleOffset];Create;False;0;0;0;False;0;False;None;None;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.TexturePropertyNode;332;-1664,-64;Inherit;True;Property;_Emissive;Impostor Emissive Map;4;1;[NoScaleOffset];Create;False;0;0;0;False;0;False;None;None;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.AmplifyImpostorNode;99;-1408,-256;Inherit;False;9710;Spherical;False;True;True;15;17;16;14;5;13;12;8;1;2;11;10;9;7;6;21;18;2;Specular;False;9;0;SAMPLER2D;;False;1;SAMPLER2D;;False;2;SAMPLER2D;;False;3;SAMPLER2D;;False;4;SAMPLER2D;;False;5;SAMPLER2D;;False;6;SAMPLER2D;;False;7;SAMPLER2D;;False;8;SAMPLERSTATE;;False;17;FLOAT4;8;FLOAT4;9;FLOAT4;10;FLOAT4;11;FLOAT4;12;FLOAT4;13;FLOAT4;14;FLOAT4;15;FLOAT3;0;FLOAT3;1;FLOAT3;2;FLOAT3;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT3;7;FLOAT3;16
Node;AmplifyShaderEditor.RangedFloatNode;336;-1664,-640;Half;False;Property;_RenderCoverage;Impostor Alpha To Mask;20;1;[Enum];Create;False;0;2;Off;0;On;1;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;334;-1152,-768;Half;False;Property;_IsSubsurfaceShader;_IsSubsurfaceShader;142;1;[HideInInspector];Create;True;0;0;0;True;0;False;1;1;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;313;-1664,512;Inherit;False;Is ShaderType;-1;;69649;90bdd02d483309144a404aee7f41383d;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;111;-1664,-768;Half;False;Property;_ImpostorCat;[ Impostor Cat ];0;0;Create;True;0;0;0;True;1;StyledCategory(Impostor Settings, 5, 10);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;335;-1408,-640;Inherit;False;Property;_RenderSpecular;Impostor Render Specular;19;1;[Enum];Create;False;0;2;Off;0;On;1;0;True;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;330;-576,-768;Inherit;False;Compile All Shaders;-1;;69599;e67c8238031dbf04ab79a5d4d63d1b4f;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;331;-768,-768;Inherit;False;Compile Impostors;-1;;69598;1cfd52e266bd86c47a094d0358cb5b93;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;333;-1408,512;Inherit;False;Define Pipeline HD AI;-1;;69597;4bfc56eb4c68eb8429d853b857b9fcbe;0;0;1;FLOAT;529
Node;AmplifyShaderEditor.RangedFloatNode;314;-1408,-768;Half;False;Property;_IsVegetationShader;_IsVegetationShader;143;1;[HideInInspector];Create;True;0;0;0;True;0;False;1;1;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;306;-1024,-256;Inherit;False;Base Impostor;22;;69600;47a437226c28ea34bad309b04e5582cd;31,4299,0,4398,1,4399,1,4400,1,4405,1,4404,1,4406,1,4412,1,4410,1,4447,1,4020,1,4010,1,3868,1,4338,1,4434,1,4539,1,4336,1,3881,1,3891,1,4416,1,1745,1,3479,0,3707,1,3952,1,4496,0,4186,0,1742,0,3484,0,860,1,2260,1,2261,1;7;3592;COLOR;0,0,0,0;False;4370;COLOR;0,0,0,0;False;3583;FLOAT3;0,0,0;False;3574;FLOAT3;0,0,0;False;3577;FLOAT;0;False;3563;FLOAT3;0,0,0;False;3964;FLOAT3;0,0,0;False;15;FLOAT3;3597;FLOAT3;3594;FLOAT3;4372;FLOAT;4373;FLOAT;3595;FLOAT;4119;FLOAT;3598;FLOAT;3980;FLOAT3;3974;FLOAT;3973;FLOAT;3975;FLOAT;4334;FLOAT;3593;FLOAT;4335;FLOAT3;534
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;323;-592,-256;Float;False;False;-1;2;ASEMaterialInspector;0;1;New Amplify Shader;4e5791d7c677cf540a160f0a09e2385a;True;SceneSelectionPass;0;1;SceneSelectionPass;0;False;True;1;1;False;-1;0;False;-1;0;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;True;1;False;-1;True;3;False;-1;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;8;d3d11;metal;vulkan;xboxone;xboxseries;ps4;playstation;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;False;False;False;False;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=SceneSelectionPass;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;325;-592,-256;Float;False;False;-1;2;ASEMaterialInspector;0;1;New Amplify Shader;4e5791d7c677cf540a160f0a09e2385a;True;ShadowCaster;0;3;ShadowCaster;0;False;True;1;1;False;-1;0;False;-1;0;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;True;1;False;-1;True;3;False;-1;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;8;d3d11;metal;vulkan;xboxone;xboxseries;ps4;playstation;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;False;False;False;False;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=ShadowCaster;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;327;-592,-256;Float;False;False;-1;2;ASEMaterialInspector;0;1;New Amplify Shader;4e5791d7c677cf540a160f0a09e2385a;True;Motion Vectors;0;5;Motion Vectors;0;False;True;1;1;False;-1;0;False;-1;0;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;True;1;False;-1;True;3;False;-1;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;8;d3d11;metal;vulkan;xboxone;xboxseries;ps4;playstation;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;40;False;-1;255;False;-1;40;False;-1;7;False;-1;3;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;False;False;False;True;1;LightMode=MotionVectors;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;329;-592,-256;Float;False;False;-1;2;ASEMaterialInspector;0;1;New Amplify Shader;4e5791d7c677cf540a160f0a09e2385a;True;Forward;0;7;Forward;0;False;True;1;1;False;-1;0;False;-1;0;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;True;1;False;-1;True;3;False;-1;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;8;d3d11;metal;vulkan;xboxone;xboxseries;ps4;playstation;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;10;False;-1;255;False;-1;14;False;-1;7;False;-1;3;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;False;False;False;True;1;LightMode=Forward;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;322;-592,-256;Float;False;True;-1;2;TVEShaderCoreGUI;0;21;BOXOPHOBIC/The Vegetation Engine/Impostors/Vegetation Subsurface Lit (Spherical);4e5791d7c677cf540a160f0a09e2385a;True;GBuffer;0;0;GBuffer;26;False;True;1;1;False;-1;0;False;-1;0;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;True;1;False;-1;True;3;False;-1;False;True;4;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;ImpostorType=Spherical;True;5;True;8;d3d11;metal;vulkan;xboxone;xboxseries;ps4;playstation;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;10;False;-1;255;False;-1;14;False;-1;7;False;-1;3;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;False;False;False;True;1;LightMode=GBuffer;False;False;0;;0;0;Standard;16;Material Type,InvertActionOnDeselection;5;0;Energy Conserving Specular,InvertActionOnDeselection;0;0;Transmission,InvertActionOnDeselection;0;0;Surface Type;0;0;Alpha Cutoff;0;0;Receive Decals;0;0;Receives SSR;0;0;Specular AA;0;0;Specular Occlusion Mode;0;0;Distortion;0;0;Distortion Mode;0;0;Distortion Depth Test;0;0;Blend Preserves Specular;1;0;Fog;1;0;Draw Before Refraction;0;0;Refraction Model;0;0;0;8;True;True;True;True;True;False;False;True;False;;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;328;-592,-256;Float;False;False;-1;2;ASEMaterialInspector;0;1;New Amplify Shader;4e5791d7c677cf540a160f0a09e2385a;True;Distortion;0;6;Distortion;2;False;True;1;1;False;-1;0;False;-1;0;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;True;1;False;-1;True;3;False;-1;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;8;d3d11;metal;vulkan;xboxone;xboxseries;ps4;playstation;switch;0;False;True;4;1;False;-1;1;False;-1;4;1;False;-1;1;False;-1;True;1;False;-1;5;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;False;-1;False;True;1;LightMode=DistortionVectors;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;326;-592,-256;Float;False;False;-1;2;ASEMaterialInspector;0;1;New Amplify Shader;4e5791d7c677cf540a160f0a09e2385a;True;DepthOnly;0;4;DepthOnly;0;False;True;1;1;False;-1;0;False;-1;0;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;True;1;False;-1;True;3;False;-1;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;8;d3d11;metal;vulkan;xboxone;xboxseries;ps4;playstation;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=DepthOnly;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;324;-592,-256;Float;False;False;-1;2;ASEMaterialInspector;0;1;New Amplify Shader;4e5791d7c677cf540a160f0a09e2385a;True;META;0;2;META;0;False;True;1;1;False;-1;0;False;-1;0;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;True;1;False;-1;True;3;False;-1;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;8;d3d11;metal;vulkan;xboxone;xboxseries;ps4;playstation;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.CommentaryNode;301;-1664,384;Inherit;False;1279.438;100;Features;0;;0,1,0.5,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;300;-1664,-384;Inherit;False;1279.896;100;Final;0;;0,1,0.5,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;299;-1664,-896;Inherit;False;1282.438;100;Internal;0;;1,0.252,0,1;0;0
WireConnection;99;0;101;0
WireConnection;99;1;332;0
WireConnection;306;3592;99;8
WireConnection;306;4370;99;9
WireConnection;306;3583;99;0
WireConnection;306;3574;99;1
WireConnection;306;3577;99;6
WireConnection;306;3563;99;7
WireConnection;306;3964;99;16
WireConnection;322;0;306;3597
WireConnection;322;1;306;3594
WireConnection;322;6;306;4372
WireConnection;322;7;306;3598
WireConnection;322;9;306;3593
WireConnection;322;16;306;3973
WireConnection;322;21;306;3975
WireConnection;322;11;306;534
ASEEND*/
//CHKSM=0856DA02067946A55C162040B3D469FBC840AD05
