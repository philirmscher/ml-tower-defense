// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "BOXOPHOBIC/The Vegetation Engine/Default/Bark Standard Lit"
{
	Properties
	{
		[HideInInspector] _AlphaCutoff("Alpha Cutoff ", Range(0, 1)) = 0.5
		[StyledCategory(Render Settings, 5, 10)]_CategoryRender("[ Category Render ]", Float) = 0
		[Enum(Opaque,0,Transparent,1)]_RenderMode("Render Mode", Float) = 0
		[Enum(Off,0,On,1)]_RenderZWrite("Render ZWrite", Float) = 1
		[Enum(Both,0,Back,1,Front,2)]_RenderCull("Render Faces", Float) = 0
		[Enum(Flip,0,Mirror,1,Same,2)]_RenderNormals("Render Normals", Float) = 0
		[HideInInspector]_RenderQueue("Render Queue", Float) = 0
		[HideInInspector]_RenderPriority("Render Priority", Float) = 0
		[Enum(Off,0,On,1)]_RenderSpecular("Render Specular", Float) = 1
		[Enum(Off,0,On,1)]_RenderDecals("Render Decals", Float) = 0
		[Enum(Off,0,On,1)]_RenderSSR("Render SSR", Float) = 0
		[Space(10)]_RenderDirect("Render Direct", Range( 0 , 1)) = 1
		_RenderShadow("Render Shadow", Range( 0 , 1)) = 1
		_RenderAmbient("Render Ambient", Range( 0 , 1)) = 1
		[Enum(Off,0,On,1)][Space(10)]_RenderClip("Alpha Clipping", Float) = 1
		[Enum(Off,0,On,1)]_RenderCoverage("Alpha To Mask", Float) = 0
		_AlphaClipValue("Alpha Treshold", Range( 0 , 1)) = 0.5
		[StyledSpace(10)]_SpaceRenderFade("# Space Render Fade", Float) = 0
		_FadeCameraValue("Fade by Camera Distance", Range( 0 , 1)) = 1
		[StyledCategory(Global Settings)]_CategoryGlobal("[ Category Global ]", Float) = 0
		[StyledEnum(TVELayers, Default 0 Layer_1 1 Layer_2 2 Layer_3 3 Layer_4 4 Layer_5 5 Layer_6 6 Layer_7 7 Layer_8 8, 0, 0)]_LayerExtrasValue("Layer Extras", Float) = 0
		[StyledEnum(TVELayers, Default 0 Layer_1 1 Layer_2 2 Layer_3 3 Layer_4 4 Layer_5 5 Layer_6 6 Layer_7 7 Layer_8 8, 0, 0)]_LayerMotionValue("Layer Motion", Float) = 0
		[StyledEnum(TVELayers, Default 0 Layer_1 1 Layer_2 2 Layer_3 3 Layer_4 4 Layer_5 5 Layer_6 6 Layer_7 7 Layer_8 8, 0, 0)]_LayerVertexValue("Layer Vertex", Float) = 0
		[StyledSpace(10)]_SpaceGlobalLayers("# Space Global Layers", Float) = 0
		[StyledMessage(Info, Procedural Variation in use. The Variation might not work as expected when switching from one LOD to another., _VertexVariationMode, 1 , 0, 10)]_MessageGlobalsVariation("# Message Globals Variation", Float) = 0
		_GlobalOverlay("Global Overlay", Range( 0 , 1)) = 1
		_GlobalWetness("Global Wetness", Range( 0 , 1)) = 1
		_GlobalEmissive("Global Emissive", Range( 0 , 1)) = 1
		_GlobalSize("Global Size Fade", Range( 0 , 1)) = 1
		[StyledSpace(10)]_SpaceGlobalLocals("# Space Global Locals", Float) = 0
		[StyledRemapSlider(_ColorsMaskMinValue, _ColorsMaskMaxValue, 0, 1)]_ColorsMaskRemap("Color Mask", Vector) = (0,0,0,0)
		[StyledRemapSlider(_AlphaMaskMinValue, _AlphaMaskMaxValue, 0, 1, 10, 0)]_AlphaMaskRemap("Alpha Mask", Vector) = (0,0,0,0)
		[StyledRemapSlider(_OverlayMaskMinValue, _OverlayMaskMaxValue, 0, 1)]_OverlayMaskRemap("Overlay Mask", Vector) = (0,0,0,0)
		[HideInInspector]_OverlayMaskMinValue("Overlay Mask Min Value", Range( 0 , 1)) = 0.45
		[HideInInspector]_OverlayMaskMaxValue("Overlay Mask Max Value", Range( 0 , 1)) = 0.55
		[StyledSpace(10)]_SpaceGlobalPosition("# Space Global Position", Float) = 0
		[StyledToggle]_ExtrasPositionMode("Use Pivot Position for Extras", Float) = 0
		[StyledCategory(Main Settings)]_CategoryMain("[Category Main ]", Float) = 0
		[NoScaleOffset][StyledTextureSingleLine]_MainAlbedoTex("Main Albedo", 2D) = "white" {}
		[NoScaleOffset][StyledTextureSingleLine]_MainNormalTex("Main Normal", 2D) = "bump" {}
		[NoScaleOffset][StyledTextureSingleLine]_MainMaskTex("Main Mask", 2D) = "white" {}
		[Space(10)][StyledVector(9)]_MainUVs("Main UVs", Vector) = (1,1,0,0)
		[HDR]_MainColor("Main Color", Color) = (1,1,1,1)
		_MainNormalValue("Main Normal", Range( -8 , 8)) = 1
		_MainOcclusionValue("Main Occlusion", Range( 0 , 1)) = 0
		_MainSmoothnessValue("Main Smoothness", Range( 0 , 1)) = 0
		[StyledCategory(Detail Settings)]_CategoryDetail("[ Category Detail ]", Float) = 0
		[Enum(Off,0,On,1)]_DetailMode("Detail Mode", Float) = 0
		[Enum(Overlay,0,Replace,1)]_DetailBlendMode("Detail Blend", Float) = 1
		[Enum(Vertex Blue,0,Projection,1)]_DetailTypeMode("Detail Type", Float) = 0
		[Enum(UV 0,0,Baked,1)]_DetailCoordMode("Detail Coord", Float) = 0
		[NoScaleOffset][StyledTextureSingleLine]_SecondAlbedoTex("Detail Albedo", 2D) = "white" {}
		[NoScaleOffset][StyledTextureSingleLine]_SecondNormalTex("Detail Normal", 2D) = "bump" {}
		[NoScaleOffset][StyledTextureSingleLine]_SecondMaskTex("Detail Mask", 2D) = "white" {}
		[Space(10)][StyledVector(9)]_SecondUVs("Detail UVs", Vector) = (1,1,0,0)
		[HDR]_SecondColor("Detail Color", Color) = (1,1,1,1)
		_SecondNormalValue("Detail Normal", Range( -8 , 8)) = 1
		_SecondOcclusionValue("Detail Occlusion", Range( 0 , 1)) = 0
		_SecondSmoothnessValue("Detail Smoothness", Range( 0 , 1)) = 0
		[Space(10)]_DetailNormalValue("Detail Use Main Normal", Range( 0 , 1)) = 0.5
		[Enum(Main Mask,0,Detail Mask,1)][Space(10)]_DetailMaskMode("Detail Mask Source", Float) = 0
		[Enum(Off,0,On,1)]_DetailMaskInvertMode("Detail Mask Invert", Float) = 0
		_DetailMeshValue("Detail Mask Offset", Range( -1 , 1)) = 0
		[StyledRemapSlider(_DetailBlendMinValue, _DetailBlendMaxValue,0,1)]_DetailBlendRemap("Detail Blending", Vector) = (0,0,0,0)
		[HideInInspector]_DetailBlendMinValue("Detail Blend Min Value", Range( 0 , 1)) = 0.2
		[HideInInspector]_DetailBlendMaxValue("Detail Blend Max Value", Range( 0 , 1)) = 0.3
		[StyledCategory(Occlusion Settings)]_CategoryOcclusion("[ Category Occlusion ]", Float) = 0
		[HDR]_VertexOcclusionColor("Vertex Occlusion Color", Color) = (1,1,1,1)
		[StyledRemapSlider(_VertexOcclusionMinValue, _VertexOcclusionMaxValue, 0, 1)]_VertexOcclusionRemap("Vertex Occlusion Mask", Vector) = (0,0,0,0)
		[HideInInspector]_VertexOcclusionMinValue("Vertex Occlusion Min Value", Range( 0 , 1)) = 0
		[HideInInspector]_VertexOcclusionMaxValue("Vertex Occlusion Max Value", Range( 0 , 1)) = 1
		[StyledCategory(Subsurface Settings)]_CategorySubsurface("[ Category Subsurface ]", Float) = 0
		[StyledRemapSlider(_SubsurfaceMaskMinValue, _SubsurfaceMaskMaxValue,0,1)]_SubsurfaceMaskRemap("Subsurface Mask", Vector) = (0,0,0,0)
		[Space(10)][DiffusionProfile]_SubsurfaceDiffusion("Subsurface Diffusion", Float) = 0
		[HideInInspector]_SubsurfaceDiffusion_Asset("Subsurface Diffusion", Vector) = (0,0,0,0)
		[HideInInspector][Space(10)][ASEDiffusionProfile(_SubsurfaceDiffusion)]_SubsurfaceDiffusion_asset("Subsurface Diffusion", Vector) = (0,0,0,0)
		[Space(10)]_SubsurfaceScatteringValue("Subsurface Scattering", Range( 0 , 16)) = 2
		_SubsurfaceAngleValue("Subsurface Angle", Range( 1 , 16)) = 8
		_SubsurfaceNormalValue("Subsurface Normal", Range( 0 , 1)) = 0
		_SubsurfaceDirectValue("Subsurface Direct", Range( 0 , 1)) = 1
		_SubsurfaceAmbientValue("Subsurface Ambient", Range( 0 , 1)) = 0.2
		_SubsurfaceShadowValue("Subsurface Shadow", Range( 0 , 1)) = 1
		[StyledCategory(Gradient Settings)]_CategoryGradient("[ Category Gradient ]", Float) = 0
		[StyledRemapSlider(_GradientMinValue, _GradientMaxValue, 0, 1)]_GradientMaskRemap("Gradient Mask", Vector) = (0,0,0,0)
		[StyledCategory(Noise Settings)]_CategoryNoise("[ Category Noise ]", Float) = 0
		[StyledRemapSlider(_NoiseMinValue, _NoiseMaxValue, 0, 1)]_NoiseMaskRemap("Noise Mask", Vector) = (0,0,0,0)
		[StyledCategory(Emissive Settings)]_CategoryEmissive("[ Category Emissive]", Float) = 0
		[NoScaleOffset][Space(10)][StyledTextureSingleLine]_EmissiveTex("Emissive Texture", 2D) = "white" {}
		[Space(10)][StyledVector(9)]_EmissiveUVs("Emissive UVs", Vector) = (1,1,0,0)
		[Enum(None,0,Any,10,Baked,20,Realtime,30)]_EmissiveFlagMode("Emissive Baking", Float) = 0
		[HDR]_EmissiveColor("Emissive Color", Color) = (0,0,0,0)
		[StyledEmissiveIntensity]_EmissiveIntensityParams("Emissive Intensity", Vector) = (1,1,1,0)
		_EmissiveExposureValue("Emissive Weight", Range( 0 , 1)) = 1
		[StyledCategory(Perspective Settings)]_CategoryPerspective("[ Category Perspective ]", Float) = 0
		[StyledCategory(Size Fade Settings)]_CategorySizeFade("[ Category Size Fade ]", Float) = 0
		[StyledMessage(Info, The Size Fade feature is recommended to be used to fade out vegetation at a distance in combination with the LOD Groups or with a 3rd party culling system., _SizeFadeMode, 1, 0, 10)]_MessageSizeFade("# Message Size Fade", Float) = 0
		[StyledCategory(Motion Settings)]_CategoryMotion("[ Category Motion ]", Float) = 0
		[StyledMessage(Info, Procedural variation in use. Use the Scale settings if the Variation is splitting the mesh., _VertexVariationMode, 1 , 0, 10)]_MessageMotionVariation("# Message Motion Variation", Float) = 0
		_MotionFacingValue("Motion Facing Direction", Range( 0 , 1)) = 1
		[StyledSpace(10)]_SpaceMotionGlobals("# SpaceMotionGlobals", Float) = 0
		_MotionAmplitude_10("Bending Amplitude", Range( 0 , 2)) = 0.2
		[IntRange]_MotionSpeed_10("Bending Speed", Range( 0 , 40)) = 2
		_MotionScale_10("Bending Scale", Range( 0 , 20)) = 0
		_MotionVariation_10("Bending Variation", Range( 0 , 20)) = 0
		[Space(10)]_MotionAmplitude_20("Squash Amplitude", Range( 0 , 2)) = 0.2
		[IntRange]_MotionSpeed_20("Squash Speed", Range( 0 , 40)) = 6
		_MotionScale_20("Squash Scale", Range( 0 , 20)) = 0.5
		_MotionVariation_20("Squash Variation", Range( 0 , 20)) = 0
		[Space(10)]_InteractionAmplitude("Interaction Amplitude", Range( 0 , 2)) = 1
		_InteractionMaskValue("Interaction Use Mask", Range( 0 , 1)) = 1
		[StyledSpace(10)]_SpaceMotionLocals("# SpaceMotionLocals", Float) = 0
		[ASEEnd][StyledToggle]_MotionValue_20("Use Squash Motion Settings", Float) = 1
		[HideInInspector][StyledToggle]_VertexPivotMode("Enable Pre Baked Pivots", Float) = 0
		[HideInInspector][StyledToggle]_VertexDataMode("Enable Batching Support", Float) = 0
		[HideInInspector][StyledToggle]_VertexDynamicMode("Enable Dynamic Support", Float) = 0
		[HideInInspector]_render_normals("_render_normals", Vector) = (1,1,1,0)
		[HideInInspector]_Cutoff("Legacy Cutoff", Float) = 0.5
		[HideInInspector]_Color("Legacy Color", Color) = (0,0,0,0)
		[HideInInspector]_MainTex("Legacy MainTex", 2D) = "white" {}
		[HideInInspector]_BumpMap("Legacy BumpMap", 2D) = "white" {}
		[HideInInspector]_LayerReactValue("Legacy Layer React", Float) = 0
		[HideInInspector]_VertexRollingMode("Legacy Vertex Rolling", Float) = 1
		[HideInInspector]_MaxBoundsInfo("Legacy Bounds Info", Vector) = (1,1,1,1)
		[HideInInspector]_VertexVariationMode("_VertexVariationMode", Float) = 0
		[HideInInspector]_VertexMasksMode("_VertexMasksMode", Float) = 0
		[HideInInspector]_IsTVEShader("_IsTVEShader", Float) = 1
		[HideInInspector]_IsVersion("_IsVersion", Float) = 650
		[HideInInspector]_HasEmissive("_HasEmissive", Float) = 0
		[HideInInspector]_HasGradient("_HasGradient", Float) = 0
		[HideInInspector]_HasOcclusion("_HasOcclusion", Float) = 0
		[HideInInspector]_IsBarkShader("_IsBarkShader", Float) = 1
		[HideInInspector]_IsStandardShader("_IsStandardShader", Float) = 1
		[HideInInspector]_render_cull("_render_cull", Float) = 0
		[HideInInspector]_render_src("_render_src", Float) = 1
		[HideInInspector]_render_dst("_render_dst", Float) = 0
		[HideInInspector]_render_zw("_render_zw", Float) = 1


		// Transparency
		[HideInInspector][ToggleUI] _UseShadowThreshold("Use Shadow Threshold", Float) = 0
		[HideInInspector][ToggleUI] _AlphaCutoffEnable("Alpha Cutoff Enable", Float) = 0
		[HideInInspector][ToggleUI] _TransparentBackfaceEnable("Transparent Backface Enable", Float) = 0
		[HideInInspector]_TransparentSortPriority("Transparent Sort Priority", Float) = 0
		[HideInInspector][ToggleUI] _TransparentWritingMotionVec("Transparent Writing MotionVec", Float) = 0

		// Stencil state Forward
		[HideInInspector] _StencilRef("Stencil Ref", Int) = 0 // StencilUsage.Clear
		[HideInInspector] _StencilWriteMask("Stencil Write Mask", Int) = 3 // StencilUsage.RequiresDeferredLighting | StencilUsage.SubsurfaceScattering
		// Stencil state GBuffer
		[HideInInspector] _StencilRefGBuffer("Stencil Ref GBuffer", Int) = 2 // StencilUsage.RequiresDeferredLighting
		[HideInInspector] _StencilWriteMaskGBuffer("Stencil Write Mask GBuffer", Int) = 3 // StencilUsage.RequiresDeferredLighting | StencilUsage.SubsurfaceScattering
		// Stencil state Depth prepass
		[HideInInspector] _StencilRefDepth("Stencil Ref Depth", Int) = 0 // Nothing
		[HideInInspector] _StencilWriteMaskDepth("Stencil Write Mask Depth", Int) = 8 // StencilUsage.TraceReflectionRay
		// Stencil state Motion vector pass
		[HideInInspector] _StencilRefMV("Stencil Ref MV", Int) = 32 // StencilUsage.ObjectMotionVector
		[HideInInspector] _StencilWriteMaskMV("Stencil Write Mask MV", Int) = 32 // StencilUsage.ObjectMotionVector
		// Distortion vector pass
		[HideInInspector] _StencilRefDistortionVec("Stencil Ref Distortion Vec", Int) = 2 // StencilUsage.DistortionVectors
		[HideInInspector] _StencilWriteMaskDistortionVec("Stencil Write Mask Distortion Vec", Int) = 2 // StencilUsage.DistortionVectors

		// Blending state
		[HideInInspector] _SurfaceType("Surface Type", Float) = 0
		[HideInInspector] _BlendMode("Blend Mode", Float) = 0
		[HideInInspector] _SrcBlend("Src Blend", Float) = 1
		[HideInInspector] _DstBlend("Dst Blend", Float) = 0
		[HideInInspector] _AlphaSrcBlend("Alpha Src Blend", Float) = 1
		[HideInInspector] _AlphaDstBlend("Alpha Dst Blend", Float) = 0
		[HideInInspector][ToggleUI] _ZWrite("ZWrite", Float) = 1
		[HideInInspector][ToggleUI] _TransparentZWrite("Transparent ZWrite", Float) = 0
		[HideInInspector] _CullMode("Cull Mode", Float) = 2
		[HideInInspector] _CullModeForward("Cull Mode Forward", Float) = 2 // This mode is dedicated to Forward to correctly handle backface then front face rendering thin transparent
		[HideInInspector][Enum(UnityEditor.Rendering.HighDefinition.TransparentCullMode)] _TransparentCullMode("Transparent Cull Mode", Int) = 2 // Back culling by default
		[HideInInspector][Enum(UnityEditor.Rendering.HighDefinition.OpaqueCullMode)] _OpaqueCullMode("Opaque Cull Mode", Int) = 2 // Back culling by default
		[HideInInspector] _ZTestDepthEqualForOpaque("ZTest Depth Equal For Transparent Cull Mode", Int) = 4 // Less equal
		[HideInInspector] _ZTestGBuffer("ZTest GBuffer", Int) = 4
		[HideInInspector][Enum(UnityEngine.Rendering.CompareFunction)] _ZTestTransparent("ZTest Transparent", Int) = 4 // Less equal

		[HideInInspector][ToggleUI] _EnableFogOnTransparent("Enable Fog", Float) = 1 // Enable Fog On Transparent
		[HideInInspector][ToggleUI] _EnableBlendModePreserveSpecularLighting("Enable Blend Mode Preserve Specular Lighting", Float) = 1

		[HideInInspector][ToggleUI] _DoubleSidedEnable("Double sided enable", Float) = 0
		[HideInInspector][Enum(Flip, 0, Mirror, 1, None, 2)] _DoubleSidedNormalMode("Double sided normal mode", Float) = 1
		[HideInInspector] _DoubleSidedConstants("DoubleSidedConstants", Vector) = (1, 1, -1, 0)
		[HideInInspector][Enum(Auto, 0, On, 1, Off, 2)] _DoubleSidedGIMode("Double sided GI mode", Float) = 0 //DoubleSidedGIMode added in api 12x and higher

		[HideInInspector][Enum(Subsurface Scattering, 0, Standard, 1, Anisotropy, 2, Iridescence, 3, Specular Color, 4, Translucent, 5)] _MaterialID("MaterialId", Int) = 1 // MaterialId.Standard
		[HideInInspector][ToggleUI] _TransmissionEnable("Transmission Enable", Float) = 1
        //[HideInInspector][Enum(Off, 0, From Ambient Occlusion, 1)]  _SpecularOcclusionMode("Specular Occlusion Mode", Int) = 1

		[HideInInspector][ToggleUI] _SupportDecals("Support Decals", Float) = 1
		[HideInInspector][ToggleUI] _ReceivesSSR("Receives SSR", Float) = 1
		[HideInInspector][ToggleUI] _ReceivesSSRTransparent("Receives SSR Transparent", Float) = 0
		[HideInInspector] [ToggleUI] _AddPrecomputedVelocity("Add Precomputed Velocity", Float) = 1
		[HideInInspector][ToggleUI] _RequireSplitLighting("Require Split Lighting", Float) = 0// ase only used to select Standard,Anisotropy,Iridescence,Specular Color,Translucent

		[HideInInspector] _EmissionColor("Color", Color) = (1, 1, 1)
		[HideInInspector] _RenderQueueType("Render Queue Type", Float) = 1
	
		[HideInInspector][NoScaleOffset]unity_Lightmaps("unity_Lightmaps", 2DArray) = "" {}
        [HideInInspector][NoScaleOffset]unity_LightmapsInd("unity_LightmapsInd", 2DArray) = "" {}
        [HideInInspector][NoScaleOffset]unity_ShadowMasks("unity_ShadowMasks", 2DArray) = "" {}

		//_TessPhongStrength( "Tess Phong Strength", Range( 0, 1 ) ) = 0.5
		//_TessValue( "Tess Max Tessellation", Range( 1, 32 ) ) = 16
		//_TessMin( "Tess Min Distance", Float ) = 10
		//_TessMax( "Tess Max Distance", Float ) = 25
		//_TessEdgeLength ( "Tess Edge length", Range( 2, 50 ) ) = 16
		//_TessMaxDisp( "Tess Max Displacement", Float ) = 25
	}

	SubShader
	{
		LOD 0

		

		Tags { "RenderPipeline"="HDRenderPipeline" "RenderType"="Opaque" "Queue"="Geometry" }

		HLSLINCLUDE
		#pragma target 4.5
		#pragma only_renderers d3d11 metal vulkan xboxone xboxseries playstation switch 

		struct GlobalSurfaceDescription // GBuffer Forward META TransparentBackface
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
			float AlphaClipThresholdShadow;
			float AlphaClipThresholdDepthPrepass;
			float AlphaClipThresholdDepthPostpass;
			float SpecularAAScreenSpaceVariance;
			float SpecularAAThreshold;
			float SpecularOcclusion;
			float DepthOffset;
			//Refraction
			float RefractionIndex;
			float3 RefractionColor;
			float RefractionDistance;
			//SSS
			float DiffusionProfile;
			float SubsurfaceMask;
			// Transmission + Diffusion Profile
			float Thickness;
			//Anisotropic ratio(0->no isotropic; 1->full anisotropy in tangent direction, -1->full anisotropy in bitangent direction)
			float Anisotropy;
			float3 Tangent;
			//Iridescence
			float IridescenceMask;
			float IridescenceThickness;
			//BakedGI
			float3 BakedGI;
			float3 BakedBackGI;
			//Virtual Texturing
			float4 VTPackedFeedback;
		};

		struct AlphaSurfaceDescription // ShadowCaster
		{
			float Alpha;
			float AlphaClipThreshold;
			float AlphaClipThresholdShadow;
			float DepthOffset;
		};

		struct SceneSurfaceDescription // SceneSelection
		{
			float Alpha;
			float AlphaClipThreshold;
			float DepthOffset;
		};

		struct PrePassSurfaceDescription // DepthPrePass
		{
			float3 Normal;
			float Smoothness;
			float Alpha;
			float AlphaClipThresholdDepthPrepass;
			float DepthOffset;
		};

		struct PostPassSurfaceDescription //DepthPostPass
		{
			float Alpha;
			float AlphaClipThresholdDepthPostpass;
			float DepthOffset;
		};

		struct SmoothSurfaceDescription // MotionVectors DepthOnly
		{
			float3 Normal;
			float Smoothness;
			float Alpha;
			float AlphaClipThreshold;
			float DepthOffset;
		};

		struct DistortionSurfaceDescription //Distortion
		{
			float Alpha;
			float2 Distortion;
			float DistortionBlur;
			float AlphaClipThreshold;
		};
		
		#ifndef ASE_TESS_FUNCS
		#define ASE_TESS_FUNCS
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

		float DistanceFromPlaneASE (float3 pos, float4 plane)
		{
			return dot (float4(pos,1.0f), plane);
		}

		bool WorldViewFrustumCull (float3 wpos0, float3 wpos1, float3 wpos2, float cullEps, float4 planes[6] )
		{
			float4 planeTest;
			planeTest.x = (( DistanceFromPlaneASE(wpos0, planes[0]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos1, planes[0]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos2, planes[0]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.y = (( DistanceFromPlaneASE(wpos0, planes[1]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos1, planes[1]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos2, planes[1]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.z = (( DistanceFromPlaneASE(wpos0, planes[2]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos1, planes[2]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos2, planes[2]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.w = (( DistanceFromPlaneASE(wpos0, planes[3]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos1, planes[3]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos2, planes[3]) > -cullEps) ? 1.0f : 0.0f );
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
		#endif //ASE_TESS_FUNCS
		ENDHLSL
		
		Pass
		{
			
			Name "GBuffer"
			Tags { "LightMode"="GBuffer" } // This will be only for opaque object based on the RenderQueue index
			Cull [_CullMode]
			ZTest [_ZTestGBuffer]

			Stencil
			{
				Ref [_StencilRefGBuffer]
				WriteMask [_StencilWriteMaskGBuffer]
				Comp Always
				Pass Replace
				Fail Keep
				ZFail Keep
			}


			HLSLPROGRAM

			#define _MATERIAL_FEATURE_SPECULAR_COLOR 1
			#define _ENERGY_CONSERVING_SPECULAR 1
			#pragma multi_compile _ DOTS_INSTANCING_ON
			#pragma multi_compile_instancing
			#pragma instancing_options renderinglayer
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#define ASE_ABSOLUTE_VERTEX_POS 1
			#define _AMBIENT_OCCLUSION 1
			#define HAVE_MESH_MODIFICATION
			#define ASE_SRP_VERSION 120100
			#if !defined(ASE_NEED_CULLFACE)
			#define ASE_NEED_CULLFACE 1
			#endif //ASE_NEED_CULLFACE


			// Keyword for transparent
			#pragma shader_feature _SURFACE_TYPE_TRANSPARENT
			#pragma shader_feature_local_fragment _ _ENABLE_FOG_ON_TRANSPARENT
			#pragma shader_feature_local _ _TRANSPARENT_WRITES_MOTION_VEC

			#pragma multi_compile _ DEBUG_DISPLAY
			#pragma multi_compile _ LIGHTMAP_ON
			#pragma multi_compile _ DIRLIGHTMAP_COMBINED
			#pragma multi_compile _ DYNAMICLIGHTMAP_ON
			#pragma multi_compile_fragment _ SHADOWS_SHADOWMASK
			#pragma multi_compile_fragment PROBE_VOLUMES_OFF PROBE_VOLUMES_L1 PROBE_VOLUMES_L2

			// Setup DECALS_OFF so the shader stripper can remove variants
			#pragma multi_compile_fragment DECALS_OFF DECALS_3RT DECALS_4RT
			#pragma multi_compile_fragment _ DECAL_SURFACE_GRADIENT
			#pragma multi_compile_fragment _ LIGHT_LAYERS

			#define SHADERPASS SHADERPASS_GBUFFER

			#if !defined(DEBUG_DISPLAY) && defined(_ALPHATEST_ON)
			#define SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST
			#endif

			#pragma vertex Vert
			#pragma fragment Frag
			
			//-------------------------------------------------------------------------------------
	        // Define
	        //-------------------------------------------------------------------------------------

	        #if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
	        #define OUTPUT_SPLIT_LIGHTING
	        #endif

	        #if defined(_TRANSPARENT_WRITES_MOTION_VEC) && defined(_SURFACE_TYPE_TRANSPARENT)
	        #define _WRITE_TRANSPARENT_MOTION_VECTOR
	        #endif

			#if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define OUTPUT_SPLIT_LIGHTING
			#endif

		    #if defined(SHADER_LIT) && !defined(_SURFACE_TYPE_TRANSPARENT)
            #define _DEFERRED_CAPABLE_MATERIAL
            #endif
 
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl" 
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl" 
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphHeader.hlsl" 
			
            #ifdef DEBUG_DISPLAY
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
			#endif

			CBUFFER_START( UnityPerMaterial )
			half4 _SecondColor;
			half4 _MainColor;
			half4 _MainUVs;
			half4 _ColorsMaskRemap;
			half4 _SecondUVs;
			half4 _OverlayMaskRemap;
			float4 _Color;
			float4 _SubsurfaceDiffusion_Asset;
			float4 _MaxBoundsInfo;
			float4 _SubsurfaceDiffusion_asset;
			float4 _GradientMaskRemap;
			half4 _VertexOcclusionColor;
			half4 _SubsurfaceMaskRemap;
			half4 _AlphaMaskRemap;
			half4 _DetailBlendRemap;
			float4 _EmissiveIntensityParams;
			float4 _NoiseMaskRemap;
			half4 _EmissiveUVs;
			half4 _EmissiveColor;
			half4 _VertexOcclusionRemap;
			half3 _render_normals;
			half _render_dst;
			half _MotionSpeed_20;
			half _RenderDirect;
			half _MotionVariation_20;
			half _IsStandardShader;
			half _MotionScale_20;
			half _InteractionMaskValue;
			half _MotionVariation_10;
			half _VertexDynamicMode;
			float _MotionSpeed_10;
			half _render_src;
			half _MotionAmplitude_20;
			float _MotionScale_10;
			half _MotionAmplitude_10;
			half _LayerMotionValue;
			half _VertexPivotMode;
			half _InteractionAmplitude;
			half _MotionValue_20;
			half _render_zw;
			half _VertexDataMode;
			half _MainOcclusionValue;
			half _GlobalWetness;
			half _SecondSmoothnessValue;
			half _MainSmoothnessValue;
			half _GlobalEmissive;
			half _EmissiveExposureValue;
			half _RenderSpecular;
			half _SecondNormalValue;
			half _DetailNormalValue;
			half _MainNormalValue;
			half _VertexOcclusionMaxValue;
			half _VertexOcclusionMinValue;
			half _OverlayMaskMaxValue;
			half _OverlayMaskMinValue;
			half _LayerExtrasValue;
			half _ExtrasPositionMode;
			half _GlobalOverlay;
			half _DetailBlendMaxValue;
			half _DetailBlendMinValue;
			half _DetailMaskInvertMode;
			half _DetailMaskMode;
			half _DetailMeshValue;
			half _DetailCoordMode;
			half _GlobalSize;
			half _LayerVertexValue;
			half _MotionFacingValue;
			half _CategoryRender;
			half _SubsurfaceDirectValue;
			half _RenderSSR;
			half _CategoryOcclusion;
			half _MessageSizeFade;
			half _DetailTypeMode;
			half _CategoryGlobal;
			half _CategorySizeFade;
			half _CategoryPerspective;
			half _IsVersion;
			half _CategoryNoise;
			half _RenderMode;
			half _HasOcclusion;
			half _CategoryDetail;
			half _HasEmissive;
			half _CategoryMotion;
			half _SubsurfaceNormalValue;
			half _EmissiveFlagMode;
			half _SpaceMotionGlobals;
			half _SubsurfaceShadowValue;
			half _RenderCoverage;
			half _RenderPriority;
			float _SubsurfaceDiffusion;
			half _VertexRollingMode;
			half _Cutoff;
			half _SubsurfaceScatteringValue;
			half _render_cull;
			half _IsBarkShader;
			half _CategorySubsurface;
			half _SpaceGlobalPosition;
			half _RenderClip;
			half _MessageMotionVariation;
			half _RenderCull;
			half _SecondOcclusionValue;
			half _RenderZWrite;
			half _SubsurfaceAmbientValue;
			half _RenderQueue;
			half _SubsurfaceAngleValue;
			half _AlphaClipValue;
			half _VertexMasksMode;
			half _LayerReactValue;
			half _DetailBlendMode;
			half _VertexVariationMode;
			half _RenderDecals;
			half _RenderShadow;
			half _DetailMode;
			half _SpaceRenderFade;
			half _IsTVEShader;
			half _CategoryEmissive;
			half _RenderAmbient;
			half _CategoryMain;
			half _CategoryGradient;
			half _SpaceGlobalLocals;
			half _SpaceMotionLocals;
			half _SpaceGlobalLayers;
			half _RenderNormals;
			half _HasGradient;
			half _MessageGlobalsVariation;
			half _FadeCameraValue;
			float4 _EmissionColor;
			float _AlphaCutoff;
			float _RenderQueueType;
			#ifdef _ADD_PRECOMPUTED_VELOCITY
			float _AddPrecomputedVelocity;
			#endif
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilRefDistortionVec;
			float _StencilWriteMaskDistortionVec;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
			float _SrcBlend;
			float _DstBlend;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _TransparentZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _EnableFogOnTransparent;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END
			sampler2D _BumpMap;
			half TVE_Enabled;
			sampler2D _MainTex;
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
			sampler2D _MainAlbedoTex;
			sampler2D _SecondAlbedoTex;
			sampler2D _MainMaskTex;
			sampler2D _SecondMaskTex;
			half4 TVE_OverlayColor;
			half4 TVE_ExtrasParams;
			TEXTURE2D_ARRAY(TVE_ExtrasTex);
			half4 TVE_ExtrasCoords;
			float TVE_ExtrasUsage[10];
			sampler2D _MainNormalTex;
			sampler2D _SecondNormalTex;
			sampler2D _EmissiveTex;
			half TVE_OverlaySmoothness;
			half TVE_CameraFadeStart;
			half TVE_CameraFadeEnd;
			sampler3D TVE_ScreenTex3D;
			half TVE_ScreenTexCoord;


			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/CommonLighting.hlsl"
			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_VFACE
			#pragma shader_feature_local TVE_FEATURE_CLIP
			#pragma shader_feature_local TVE_FEATURE_BATCHING
			#pragma shader_feature_local TVE_FEATURE_DETAIL
			//TVE Pipeline Defines
			#define THE_VEGETATION_ENGINE
			#define TVE_IS_HD_PIPELINE
			//TVE HD Pipeline Defines
			#pragma shader_feature_local _DISABLE_DECALS
			#pragma shader_feature_local _DISABLE_SSR
			//TVE Injection Defines
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END
			//TVE Shader Type Defines
			#define TVE_IS_VEGETATION_SHADER


			#if defined(_DOUBLESIDED_ON) && !defined(ASE_NEED_CULLFACE)
				#define ASE_NEED_CULLFACE 1
			#endif

			struct AttributesMesh
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 uv1 : TEXCOORD1;
				float4 uv2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryingsMeshToPS
			{
				float4 positionCS : SV_Position;
				float3 positionRWS : TEXCOORD0;
				float3 normalWS : TEXCOORD1;
				float4 tangentWS : TEXCOORD2;
				float4 uv1 : TEXCOORD3;
				float4 uv2 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_texcoord6 : TEXCOORD6;
				float4 ase_texcoord7 : TEXCOORD7;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord8 : TEXCOORD8;
				float4 ase_texcoord9 : TEXCOORD9;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
				#if defined(SHADER_STAGE_FRAGMENT) && defined(ASE_NEED_CULLFACE)
				FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
				#endif
			};


			float3 ObjectPosition_UNITY_MATRIX_M(  )
			{
				return float3(UNITY_MATRIX_M[0].w, UNITY_MATRIX_M[1].w, UNITY_MATRIX_M[2].w );
			}
			
			float2 DecodeFloatToVector2( float enc )
			{
				float2 result ;
				result.y = enc % 2048;
				result.x = floor(enc / 2048);
				return result / (2048 - 1);
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

				surfaceData.specularOcclusion = 1.0;

				// surface data
				surfaceData.baseColor =					surfaceDescription.Albedo;
				surfaceData.perceptualSmoothness =		surfaceDescription.Smoothness;
				surfaceData.ambientOcclusion =			surfaceDescription.Occlusion;
				surfaceData.metallic =					surfaceDescription.Metallic;
				surfaceData.coatMask =					surfaceDescription.CoatMask;

				#ifdef _SPECULAR_OCCLUSION_CUSTOM
				surfaceData.specularOcclusion =			surfaceDescription.SpecularOcclusion;
				#endif
				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceData.subsurfaceMask =			surfaceDescription.SubsurfaceMask;
				#endif
				#if defined(_HAS_REFRACTION) || defined(_MATERIAL_FEATURE_TRANSMISSION)
				surfaceData.thickness =					surfaceDescription.Thickness;
				#endif
				#if defined( _MATERIAL_FEATURE_SUBSURFACE_SCATTERING ) || defined( _MATERIAL_FEATURE_TRANSMISSION )
				surfaceData.diffusionProfileHash =		asuint(surfaceDescription.DiffusionProfile);
				#endif
				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceData.specularColor =				surfaceDescription.Specular;
				#endif
				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.anisotropy =				surfaceDescription.Anisotropy;
				#endif
				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceData.iridescenceMask =			surfaceDescription.IridescenceMask;
				surfaceData.iridescenceThickness =		surfaceDescription.IridescenceThickness;
				#endif

				// refraction
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


				// material features
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
                #ifdef ASE_LIT_CLEAR_COAT
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
                #endif
				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
				#endif

				// others
				#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
				surfaceData.baseColor *= ( 1.0 - Max3( surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b ) );
				#endif
				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				// normals
				float3 normalTS = float3(0.0f, 0.0f, 1.0f);
				normalTS = surfaceDescription.Normal;
				GetNormalWS( fragInputs, normalTS, surfaceData.normalWS, doubleSidedConstants );

				surfaceData.geomNormalWS = fragInputs.tangentToWorld[2];
				surfaceData.tangentWS = normalize( fragInputs.tangentToWorld[ 0 ].xyz );

				// decals
				#if HAVE_DECALS
				if( _EnableDecals )
				{
					DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, surfaceDescription.Alpha);
					ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData);
				}
				#endif // DECAL_SURFACE_GRADIENT

				bentNormalWS = surfaceData.normalWS;

				#ifdef ASE_BENT_NORMAL
				GetNormalWS( fragInputs, surfaceDescription.BentNormal, bentNormalWS, doubleSidedConstants );
				#endif

				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.tangentWS = TransformTangentToWorld( surfaceDescription.Tangent, fragInputs.tangentToWorld );
				#endif
				surfaceData.tangentWS = Orthonormalize( surfaceData.tangentWS, surfaceData.normalWS );


				#if defined(_SPECULAR_OCCLUSION_CUSTOM)
				#elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO( V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness( surfaceData.perceptualSmoothness ) );
				#elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion( ClampNdotV( dot( surfaceData.normalWS, V ) ), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness( surfaceData.perceptualSmoothness ) );
				#endif

				#ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
				surfaceData.perceptualSmoothness = GeometricNormalFiltering( surfaceData.perceptualSmoothness, fragInputs.tangentToWorld[ 2 ], surfaceDescription.SpecularAAScreenSpaceVariance, surfaceDescription.SpecularAAThreshold );
				#endif

				// debug
				#if defined(DEBUG_DISPLAY)
				if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
				{
					surfaceData.metallic = 0;
				}
				ApplyDebugToSurfaceData(fragInputs.tangentToWorld, surfaceData);
				#endif
			}

			void GetSurfaceAndBuiltinData(GlobalSurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				#ifdef LOD_FADE_CROSSFADE
				LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
				#endif

				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				ApplyDoubleSidedFlipOrMirror( fragInputs, doubleSidedConstants );

				#ifdef _ALPHATEST_ON
				DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif

				#ifdef _DEPTHOFFSET_ON
				ApplyDepthOffsetPositionInput( V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput );
				#endif

				float3 bentNormalWS;
				BuildSurfaceData( fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS );

				InitBuiltinData( posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[ 2 ], fragInputs.texCoord1, fragInputs.texCoord2, builtinData );

				#ifdef _DEPTHOFFSET_ON
				builtinData.depthOffset = surfaceDescription.DepthOffset;
				#endif
				
				#ifdef _ALPHATEST_ON 
				builtinData.alphaClipTreshold = surfaceDescription.AlphaClipThreshold;
                #endif

				#ifdef UNITY_VIRTUAL_TEXTURING
                builtinData.vtPackedFeedback = surfaceDescription.VTPackedFeedback;
                #endif

				#ifdef _ASE_BAKEDGI
				builtinData.bakeDiffuseLighting = surfaceDescription.BakedGI;
				#endif
				#ifdef _ASE_BAKEDBACKGI
				builtinData.backBakeDiffuseLighting = surfaceDescription.BakedBackGI;
				#endif

				builtinData.emissiveColor = surfaceDescription.Emission;

				builtinData.distortion = float2(0.0, 0.0);
				builtinData.distortionBlur = 0.0;

				PostInitBuiltinData(V, posInput, surfaceData, builtinData);
			}

			PackedVaryingsMeshToPS VertexFunction(AttributesMesh inputMesh )
			{
				PackedVaryingsMeshToPS outputPackedVaryingsMeshToPS;

				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, outputPackedVaryingsMeshToPS);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( outputPackedVaryingsMeshToPS );

				float3 VertexPosition3588_g70929 = inputMesh.positionOS;
				half3 Mesh_PivotsOS2291_g70929 = half3(0,0,0);
				float3 temp_output_2283_0_g70929 = ( VertexPosition3588_g70929 - Mesh_PivotsOS2291_g70929 );
				half3 VertexPos40_g71005 = temp_output_2283_0_g70929;
				float3 appendResult74_g71005 = (float3(VertexPos40_g71005.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g71005 = appendResult74_g71005;
				float3 break84_g71005 = VertexPos40_g71005;
				float3 appendResult81_g71005 = (float3(0.0 , break84_g71005.y , break84_g71005.z));
				half3 VertexPosOtherAxis82_g71005 = appendResult81_g71005;
				float4 temp_output_91_19_g70965 = TVE_MotionCoords;
				float3 localObjectPosition_UNITY_MATRIX_M14_g70996 = ObjectPosition_UNITY_MATRIX_M();
				float3 appendResult60_g70954 = (float3(inputMesh.ase_texcoord3.x , inputMesh.ase_texcoord3.z , inputMesh.ase_texcoord3.y));
				half3 Mesh_PivotsData2831_g70929 = ( appendResult60_g70954 * _VertexPivotMode );
				float3 temp_output_122_0_g70996 = Mesh_PivotsData2831_g70929;
				float3 PivotsOnly105_g70996 = (mul( GetObjectToWorldMatrix(), float4( temp_output_122_0_g70996 , 0.0 ) ).xyz).xyz;
				#ifdef SHADEROPTIONS_CAMERA_RELATIVE_RENDERING
				float3 staticSwitch13_g70996 = ( ( localObjectPosition_UNITY_MATRIX_M14_g70996 + PivotsOnly105_g70996 ) + _WorldSpaceCameraPos );
				#else
				float3 staticSwitch13_g70996 = ( localObjectPosition_UNITY_MATRIX_M14_g70996 + PivotsOnly105_g70996 );
				#endif
				half3 ObjectData20_g70997 = staticSwitch13_g70996;
				float3 ase_worldPos = GetAbsolutePositionWS( TransformObjectToWorld( (inputMesh.positionOS).xyz ) );
				half3 WorldData19_g70997 = ase_worldPos;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g70997 = WorldData19_g70997;
				#else
				float3 staticSwitch14_g70997 = ObjectData20_g70997;
				#endif
				float3 temp_output_114_0_g70996 = staticSwitch14_g70997;
				float3 vertexToFrag4224_g70929 = temp_output_114_0_g70996;
				half3 ObjectData20_g70970 = vertexToFrag4224_g70929;
				float3 vertexToFrag3890_g70929 = ase_worldPos;
				half3 WorldData19_g70970 = vertexToFrag3890_g70929;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g70970 = WorldData19_g70970;
				#else
				float3 staticSwitch14_g70970 = ObjectData20_g70970;
				#endif
				float3 ObjectPosition4223_g70929 = staticSwitch14_g70970;
				half2 UV94_g70965 = ( (temp_output_91_19_g70965).zw + ( (temp_output_91_19_g70965).xy * (ObjectPosition4223_g70929).xz ) );
				float temp_output_84_0_g70965 = _LayerMotionValue;
				float4 lerpResult107_g70965 = lerp( TVE_MotionParams , saturate( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_MotionTex, sampler_linear_repeat, UV94_g70965,temp_output_84_0_g70965, 0.0 ) ) , TVE_MotionUsage[(int)temp_output_84_0_g70965]);
				half4 Global_Motion_Params3909_g70929 = lerpResult107_g70965;
				float4 break322_g70972 = Global_Motion_Params3909_g70929;
				float3 appendResult397_g70972 = (float3(break322_g70972.x , 0.0 , break322_g70972.y));
				float3 temp_output_398_0_g70972 = (appendResult397_g70972*2.0 + -1.0);
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				half2 Global_MotionDirectionOS39_g70929 = (( mul( GetWorldToObjectMatrix(), float4( temp_output_398_0_g70972 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_DirectionOS358_g71001 = Global_MotionDirectionOS39_g70929;
				half Mesh_Height1524_g70929 = inputMesh.ase_color.a;
				half Mesh_Height114_g70956 = Mesh_Height1524_g70929;
				half ObjectData20_g70957 = ( Mesh_Height114_g70956 * 2.0 );
				float enc62_g70955 = inputMesh.ase_texcoord.w;
				float2 localDecodeFloatToVector262_g70955 = DecodeFloatToVector2( enc62_g70955 );
				float2 break63_g70955 = ( localDecodeFloatToVector262_g70955 * 100.0 );
				float Bounds_Height5230_g70929 = break63_g70955.x;
				float Bounds_Height117_g70956 = Bounds_Height5230_g70929;
				half WorldData19_g70957 = ( ( Mesh_Height114_g70956 * Mesh_Height114_g70956 ) * Bounds_Height117_g70956 * 2.0 );
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g70957 = WorldData19_g70957;
				#else
				float staticSwitch14_g70957 = ObjectData20_g70957;
				#endif
				half Motion_10_Mask5242_g70929 = staticSwitch14_g70957;
				half Wind_Power369_g70972 = break322_g70972.z;
				half Global_MotionPower2223_g70929 = Wind_Power369_g70972;
				half3 Input_Position419_g70975 = -ObjectPosition4223_g70929;
				half2 Global_MotionDirectionWS4683_g70929 = (temp_output_398_0_g70972).xz;
				half2 Input_DirectionWS423_g70975 = Global_MotionDirectionWS4683_g70929;
				float Motion_Scale287_g70975 = ( _MotionScale_10 + 0.2 );
				half Global_Scale448_g70975 = TVE_NoiseParams.x;
				half Input_Speed62_g70975 = _MotionSpeed_10;
				half Global_Speed449_g70975 = TVE_NoiseParams.y;
				float mulTime426_g70975 = _TimeParameters.x * ( Input_Speed62_g70975 * Global_Speed449_g70975 );
				half Global_DistScale561_g70975 = TVE_NoiseParams.w;
				float3 break461_g70975 = ( Input_Position419_g70975 * Global_DistScale561_g70975 );
				half Global_DistAmplitude559_g70975 = TVE_NoiseParams.z;
				float Noise_Distortion469_g70975 = ( sin( ( break461_g70975.x + break461_g70975.z ) ) * Global_DistAmplitude559_g70975 );
				float3 break111_g70958 = ObjectPosition4223_g70929;
				half Global_DynamicMode5112_g70929 = _VertexDynamicMode;
				half Input_DynamicMode120_g70958 = Global_DynamicMode5112_g70929;
				float Mesh_Variation16_g70929 = inputMesh.ase_color.r;
				half Input_Variation124_g70958 = Mesh_Variation16_g70929;
				half ObjectData20_g70959 = frac( ( ( ( break111_g70958.x + break111_g70958.y + break111_g70958.z ) * ( 1.0 - Input_DynamicMode120_g70958 ) ) + Input_Variation124_g70958 ) );
				half WorldData19_g70959 = Input_Variation124_g70958;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g70959 = WorldData19_g70959;
				#else
				float staticSwitch14_g70959 = ObjectData20_g70959;
				#endif
				float clampResult129_g70958 = clamp( staticSwitch14_g70959 , 0.01 , 0.99 );
				half Global_MeshVariation5104_g70929 = clampResult129_g70958;
				half Motion_Variation284_g70975 = ( _MotionVariation_10 * Global_MeshVariation5104_g70929 );
				float2 temp_output_425_0_g70975 = ( ( (Input_Position419_g70975).xz * Input_DirectionWS423_g70975 * Motion_Scale287_g70975 * Global_Scale448_g70975 ) + ( mulTime426_g70975 + Noise_Distortion469_g70975 + Motion_Variation284_g70975 ) );
				float2 break500_g70975 = ( temp_output_425_0_g70975 * 0.1178 );
				float2 break494_g70975 = ( temp_output_425_0_g70975 * 0.1742 );
				half Input_WindPower327_g70975 = Global_MotionPower2223_g70929;
				float lerpResult430_g70975 = lerp( 1.4 , 0.4 , Input_WindPower327_g70975);
				half Global_MotionNoise34_g70929 = (pow( (( sin( ( break500_g70975.x + break500_g70975.y ) ) * sin( ( break494_g70975.x + break494_g70975.y ) ) )*0.4 + 0.6) , lerpResult430_g70975 )*1.2 + -0.2);
				half Motion_10_Amplitude2258_g70929 = ( _MotionAmplitude_10 * Motion_10_Mask5242_g70929 * Global_MotionPower2223_g70929 * Global_MotionNoise34_g70929 );
				half Input_BendingAmplitude376_g71001 = Motion_10_Amplitude2258_g70929;
				half Input_InteractionAmplitude58_g71001 = _InteractionAmplitude;
				half Input_MeshMotion_10321_g71001 = Motion_10_Mask5242_g70929;
				half Input_InteractionUseMask62_g71001 = _InteractionMaskValue;
				float lerpResult371_g71001 = lerp( 2.0 , Input_MeshMotion_10321_g71001 , Input_InteractionUseMask62_g71001);
				half ObjectData20_g71002 = lerpResult371_g71001;
				half WorldData19_g71002 = Input_MeshMotion_10321_g71001;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g71002 = WorldData19_g71002;
				#else
				float staticSwitch14_g71002 = ObjectData20_g71002;
				#endif
				half Motion_10_Interaction373_g71001 = ( Input_InteractionAmplitude58_g71001 * staticSwitch14_g71002 );
				half Global_InteractionMask66_g70929 = ( break322_g70972.w * break322_g70972.w );
				float Input_InteractionMask330_g71001 = Global_InteractionMask66_g70929;
				float lerpResult360_g71001 = lerp( Input_BendingAmplitude376_g71001 , Motion_10_Interaction373_g71001 , saturate( ( Input_InteractionAmplitude58_g71001 * Input_InteractionMask330_g71001 ) ));
				float2 break364_g71001 = ( Input_DirectionOS358_g71001 * lerpResult360_g71001 );
				half Motion_10_BendingZ190_g70929 = break364_g71001.y;
				half Angle44_g71005 = Motion_10_BendingZ190_g70929;
				half3 VertexPos40_g71004 = ( VertexPosRotationAxis50_g71005 + ( VertexPosOtherAxis82_g71005 * cos( Angle44_g71005 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g71005 ) * sin( Angle44_g71005 ) ) );
				float3 appendResult74_g71004 = (float3(0.0 , 0.0 , VertexPos40_g71004.z));
				half3 VertexPosRotationAxis50_g71004 = appendResult74_g71004;
				float3 break84_g71004 = VertexPos40_g71004;
				float3 appendResult81_g71004 = (float3(break84_g71004.x , break84_g71004.y , 0.0));
				half3 VertexPosOtherAxis82_g71004 = appendResult81_g71004;
				half Motion_10_BendingX216_g70929 = break364_g71001.x;
				half Angle44_g71004 = -Motion_10_BendingX216_g70929;
				half Input_Scale321_g70944 = _MotionScale_20;
				half Input_Variation330_g70944 = ( _MotionVariation_20 * Global_MeshVariation5104_g70929 );
				half Input_Speed62_g70944 = _MotionSpeed_20;
				float mulTime349_g70944 = _TimeParameters.x * Input_Speed62_g70944;
				float temp_output_302_0_g70944 = sin( ( ( ( ase_worldPos.x + ase_worldPos.y + ase_worldPos.z ) * Input_Scale321_g70944 ) + Input_Variation330_g70944 + mulTime349_g70944 ) );
				float enc59_g70955 = inputMesh.ase_texcoord.z;
				float2 localDecodeFloatToVector259_g70955 = DecodeFloatToVector2( enc59_g70955 );
				float2 break61_g70955 = localDecodeFloatToVector259_g70955;
				half Mesh_Motion_2060_g70929 = break61_g70955.x;
				half Mesh_Motion_20115_g70956 = Mesh_Motion_2060_g70929;
				float Bounds_Radius5231_g70929 = break63_g70955.y;
				float Bounds_Radius118_g70956 = Bounds_Radius5231_g70929;
				half Motion_20_Mask5243_g70929 = ( Mesh_Motion_20115_g70956 * Bounds_Radius118_g70956 );
				half3 Input_Position419_g70960 = VertexPosition3588_g70929;
				float3 normalizeResult518_g70960 = normalize( Input_Position419_g70960 );
				half2 Input_DirectionOS423_g70960 = Global_MotionDirectionOS39_g70929;
				float2 break521_g70960 = -Input_DirectionOS423_g70960;
				float3 appendResult522_g70960 = (float3(break521_g70960.x , 0.0 , break521_g70960.y));
				float dotResult519_g70960 = dot( normalizeResult518_g70960 , appendResult522_g70960 );
				half Input_Mask62_g70960 = _MotionFacingValue;
				float lerpResult524_g70960 = lerp( 1.0 , (dotResult519_g70960*0.5 + 0.5) , Input_Mask62_g70960);
				half ObjectData20_g70961 = lerpResult524_g70960;
				half WorldData19_g70961 = 1.0;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g70961 = WorldData19_g70961;
				#else
				float staticSwitch14_g70961 = ObjectData20_g70961;
				#endif
				half Motion_FacingMask5214_g70929 = staticSwitch14_g70961;
				half Motion_20_Amplitude4381_g70929 = ( _MotionAmplitude_20 * _MotionValue_20 * Motion_20_Mask5243_g70929 * Global_MotionPower2223_g70929 * Global_MotionNoise34_g70929 * Motion_FacingMask5214_g70929 );
				half Input_Amplitude58_g70944 = Motion_20_Amplitude4381_g70929;
				half2 Input_DirectionOS366_g70944 = Global_MotionDirectionOS39_g70929;
				float2 break371_g70944 = Input_DirectionOS366_g70944;
				float3 appendResult372_g70944 = (float3(break371_g70944.x , ( temp_output_302_0_g70944 * 0.1 ) , break371_g70944.y));
				half3 Motion_20_Squash4418_g70929 = ( ( (temp_output_302_0_g70944*0.2 + 1.0) * Input_Amplitude58_g70944 ) * appendResult372_g70944 );
				float3 Vertex_Motion_Object833_g70929 = ( ( VertexPosRotationAxis50_g71004 + ( VertexPosOtherAxis82_g71004 * cos( Angle44_g71004 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g71004 ) * sin( Angle44_g71004 ) ) ) + Motion_20_Squash4418_g70929 );
				float3 temp_output_3474_0_g70929 = ( VertexPosition3588_g70929 - Mesh_PivotsOS2291_g70929 );
				float3 appendResult2043_g70929 = (float3(Motion_10_BendingX216_g70929 , 0.0 , Motion_10_BendingZ190_g70929));
				float3 Vertex_Motion_World1118_g70929 = ( ( temp_output_3474_0_g70929 + appendResult2043_g70929 ) + Motion_20_Squash4418_g70929 );
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch4976_g70929 = Vertex_Motion_World1118_g70929;
				#else
				float3 staticSwitch4976_g70929 = ( Vertex_Motion_Object833_g70929 + ( _VertexDataMode * 0.0 ) );
				#endif
				float4 temp_output_94_19_g70988 = TVE_VertexCoords;
				half2 UV97_g70988 = ( (temp_output_94_19_g70988).zw + ( (temp_output_94_19_g70988).xy * (ObjectPosition4223_g70929).xz ) );
				float temp_output_84_0_g70988 = _LayerVertexValue;
				float4 lerpResult109_g70988 = lerp( TVE_VertexParams , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_VertexTex, sampler_linear_repeat, UV97_g70988,temp_output_84_0_g70988, 0.0 ) , TVE_VertexUsage[(int)temp_output_84_0_g70988]);
				half4 Global_Object_Params4173_g70929 = lerpResult109_g70988;
				half Global_VertexSize174_g70929 = saturate( Global_Object_Params4173_g70929.w );
				float lerpResult346_g70929 = lerp( 1.0 , Global_VertexSize174_g70929 , _GlobalSize);
				float3 appendResult3480_g70929 = (float3(lerpResult346_g70929 , lerpResult346_g70929 , lerpResult346_g70929));
				half3 ObjectData20_g70964 = appendResult3480_g70929;
				half3 _Vector11 = half3(1,1,1);
				half3 WorldData19_g70964 = _Vector11;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g70964 = WorldData19_g70964;
				#else
				float3 staticSwitch14_g70964 = ObjectData20_g70964;
				#endif
				half3 Vertex_Size1741_g70929 = staticSwitch14_g70964;
				half3 _Vector5 = half3(1,1,1);
				float3 Vertex_SizeFade1740_g70929 = _Vector5;
				half3 Grass_Perspective2661_g70929 = half3(0,0,0);
				float3 lerpResult16_g70963 = lerp( VertexPosition3588_g70929 , ( ( staticSwitch4976_g70929 * Vertex_Size1741_g70929 * Vertex_SizeFade1740_g70929 ) + Mesh_PivotsOS2291_g70929 + Grass_Perspective2661_g70929 ) , TVE_Enabled);
				float3 Final_VertexPosition890_g70929 = ( lerpResult16_g70963 + _DisableSRPBatcher );
				
				float2 appendResult21_g70955 = (float2(inputMesh.uv1.z , inputMesh.uv1.w));
				float2 Mesh_DetailCoord3_g70929 = appendResult21_g70955;
				float2 lerpResult1545_g70929 = lerp( inputMesh.ase_texcoord.xy , Mesh_DetailCoord3_g70929 , _DetailCoordMode);
				float2 vertexToFrag11_g71000 = ( ( lerpResult1545_g70929 * (_SecondUVs).xy ) + (_SecondUVs).zw );
				outputPackedVaryingsMeshToPS.ase_texcoord6.xy = vertexToFrag11_g71000;
				half Mesh_DetailMask90_g70929 = inputMesh.ase_color.b;
				float temp_output_990_0_g70929 = ( Mesh_DetailMask90_g70929 - 0.5 );
				float vertexToFrag11_g70931 = ( temp_output_990_0_g70929 + _DetailMeshValue );
				outputPackedVaryingsMeshToPS.ase_texcoord6.z = vertexToFrag11_g70931;
				float3 ase_worldNormal = TransformObjectToWorldNormal(inputMesh.normalOS);
				float3 vertexToFrag5058_g70929 = ase_worldNormal;
				outputPackedVaryingsMeshToPS.ase_texcoord7.xyz = vertexToFrag5058_g70929;
				outputPackedVaryingsMeshToPS.ase_texcoord8.xyz = vertexToFrag3890_g70929;
				outputPackedVaryingsMeshToPS.ase_texcoord9.xyz = vertexToFrag4224_g70929;
				float Mesh_Occlusion318_g70929 = inputMesh.ase_color.g;
				float temp_output_7_0_g70969 = _VertexOcclusionMinValue;
				float temp_output_3377_0_g70929 = saturate( ( ( Mesh_Occlusion318_g70929 - temp_output_7_0_g70969 ) / ( _VertexOcclusionMaxValue - temp_output_7_0_g70969 ) ) );
				float vertexToFrag11_g70973 = temp_output_3377_0_g70929;
				outputPackedVaryingsMeshToPS.ase_texcoord6.w = vertexToFrag11_g70973;
				
				float temp_output_7_0_g70945 = TVE_CameraFadeStart;
				float lerpResult4755_g70929 = lerp( 1.0 , saturate( ( ( distance( ase_worldPos , _WorldSpaceCameraPos ) - temp_output_7_0_g70945 ) / ( TVE_CameraFadeEnd - temp_output_7_0_g70945 ) ) ) , _FadeCameraValue);
				float vertexToFrag11_g70951 = lerpResult4755_g70929;
				outputPackedVaryingsMeshToPS.ase_texcoord7.w = vertexToFrag11_g70951;
				
				outputPackedVaryingsMeshToPS.ase_texcoord5 = inputMesh.ase_texcoord;
				outputPackedVaryingsMeshToPS.ase_normal = inputMesh.normalOS;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				outputPackedVaryingsMeshToPS.ase_texcoord8.w = 0;
				outputPackedVaryingsMeshToPS.ase_texcoord9.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue = Final_VertexPosition890_g70929;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif

				inputMesh.normalOS =  inputMesh.normalOS ;
				inputMesh.tangentOS =  inputMesh.tangentOS ;

				float3 positionRWS = TransformObjectToWorld(inputMesh.positionOS);
				float3 normalWS = TransformObjectToWorldNormal(inputMesh.normalOS);
				float4 tangentWS = float4(TransformObjectToWorldDir(inputMesh.tangentOS.xyz), inputMesh.tangentOS.w);

				outputPackedVaryingsMeshToPS.positionCS = TransformWorldToHClip(positionRWS);
				outputPackedVaryingsMeshToPS.positionRWS.xyz = positionRWS;
				outputPackedVaryingsMeshToPS.normalWS.xyz = normalWS;
				outputPackedVaryingsMeshToPS.tangentWS.xyzw = tangentWS;
				outputPackedVaryingsMeshToPS.uv1.xyzw = inputMesh.uv1;
				outputPackedVaryingsMeshToPS.uv2.xyzw = inputMesh.uv2;
				return outputPackedVaryingsMeshToPS;
			}

			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float3 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 uv1 : TEXCOORD1;
				float4 uv2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl Vert ( AttributesMesh v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.positionOS = v.positionOS;
				o.normalOS = v.normalOS;
				o.tangentOS = v.tangentOS;
				o.uv1 = v.uv1;
				o.uv2 = v.uv2;
				o.ase_texcoord3 = v.ase_texcoord3;
				o.ase_color = v.ase_color;
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				float3 cameraPos = 0;
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), cameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, GetObjectToWorldMatrix(), cameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), cameraPos, _ScreenParams, _FrustumPlanes );
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
			PackedVaryingsMeshToPS DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				AttributesMesh o = (AttributesMesh) 0;
				o.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				o.uv1 = patch[0].uv1 * bary.x + patch[1].uv1 * bary.y + patch[2].uv1 * bary.z;
				o.uv2 = patch[0].uv2 * bary.x + patch[1].uv2 * bary.y + patch[2].uv2 * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			PackedVaryingsMeshToPS Vert ( AttributesMesh v )
			{
				return VertexFunction( v );
			}
			#endif

			void Frag( PackedVaryingsMeshToPS packedInput,
						OUTPUT_GBUFFER(outGBuffer)
						#ifdef _DEPTHOFFSET_ON
						, out float outputDepth : SV_Depth
						#endif
						
						)
			{
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( packedInput );
				UNITY_SETUP_INSTANCE_ID( packedInput );
				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);
				input.tangentToWorld = k_identity3x3;
				float3 positionRWS = packedInput.positionRWS.xyz;
				float3 normalWS = packedInput.normalWS.xyz;
				float4 tangentWS = packedInput.tangentWS.xyzw;

				input.positionSS = packedInput.positionCS;
				input.positionRWS = positionRWS;
				input.tangentToWorld = BuildTangentToWorld(tangentWS, normalWS);
				input.texCoord1 = packedInput.uv1.xyzw;
				input.texCoord2 = packedInput.uv2.xyzw;

				#if _DOUBLESIDED_ON && SHADER_STAGE_FRAGMENT
				input.isFrontFace = IS_FRONT_VFACE( packedInput.cullFace, true, false);
				#elif SHADER_STAGE_FRAGMENT
				#if defined(ASE_NEED_CULLFACE)
				input.isFrontFace = IS_FRONT_VFACE( packedInput.cullFace, true, false );
				#endif
				#endif
				half isFrontFace = input.isFrontFace;

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS);
				float3 V = GetWorldSpaceNormalizeViewDir(input.positionRWS);
				SurfaceData surfaceData;
				BuiltinData builtinData;

				GlobalSurfaceDescription surfaceDescription = (GlobalSurfaceDescription)0;
				half2 Main_UVs15_g70929 = ( ( packedInput.ase_texcoord5.xy * (_MainUVs).xy ) + (_MainUVs).zw );
				float4 tex2DNode29_g70929 = tex2D( _MainAlbedoTex, Main_UVs15_g70929 );
				half3 Main_Albedo99_g70929 = ( (_MainColor).rgb * (tex2DNode29_g70929).rgb );
				float2 vertexToFrag11_g71000 = packedInput.ase_texcoord6.xy;
				half2 Second_UVs17_g70929 = vertexToFrag11_g71000;
				float4 tex2DNode89_g70929 = tex2D( _SecondAlbedoTex, Second_UVs17_g70929 );
				half3 Second_Albedo153_g70929 = (( _SecondColor * tex2DNode89_g70929 )).rgb;
				float3 lerpResult4834_g70929 = lerp( ( Main_Albedo99_g70929 * Second_Albedo153_g70929 * 4.594794 ) , Second_Albedo153_g70929 , _DetailBlendMode);
				float vertexToFrag11_g70931 = packedInput.ase_texcoord6.z;
				half Blend_Source1540_g70929 = vertexToFrag11_g70931;
				float4 tex2DNode35_g70929 = tex2D( _MainMaskTex, Main_UVs15_g70929 );
				half Main_Mask57_g70929 = tex2DNode35_g70929.b;
				float4 tex2DNode33_g70929 = tex2D( _SecondMaskTex, Second_UVs17_g70929 );
				half Second_Mask81_g70929 = tex2DNode33_g70929.b;
				float lerpResult1327_g70929 = lerp( Main_Mask57_g70929 , Second_Mask81_g70929 , _DetailMaskMode);
				float lerpResult4058_g70929 = lerp( lerpResult1327_g70929 , ( 1.0 - lerpResult1327_g70929 ) , _DetailMaskInvertMode);
				float temp_output_7_0_g71007 = _DetailBlendMinValue;
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch4838_g70929 = saturate( ( ( saturate( ( Blend_Source1540_g70929 + ( Blend_Source1540_g70929 * lerpResult4058_g70929 ) ) ) - temp_output_7_0_g71007 ) / ( _DetailBlendMaxValue - temp_output_7_0_g71007 ) ) );
				#else
				float staticSwitch4838_g70929 = 0.0;
				#endif
				half Mask_Detail147_g70929 = staticSwitch4838_g70929;
				float3 lerpResult235_g70929 = lerp( Main_Albedo99_g70929 , lerpResult4834_g70929 , Mask_Detail147_g70929);
				#ifdef TVE_FEATURE_DETAIL
				float3 staticSwitch255_g70929 = lerpResult235_g70929;
				#else
				float3 staticSwitch255_g70929 = Main_Albedo99_g70929;
				#endif
				half3 Blend_Albedo265_g70929 = staticSwitch255_g70929;
				half3 Blend_AlbedoTinted2808_g70929 = ( ( float3(1,1,1) * float3(1,1,1) * float3(1,1,1) ) * Blend_Albedo265_g70929 );
				half3 Blend_AlbedoColored863_g70929 = Blend_AlbedoTinted2808_g70929;
				half3 Blend_AlbedoAndSubsurface149_g70929 = Blend_AlbedoColored863_g70929;
				half3 Global_OverlayColor1758_g70929 = (TVE_OverlayColor).rgb;
				float3 vertexToFrag5058_g70929 = packedInput.ase_texcoord7.xyz;
				half3 World_Normal4101_g70929 = vertexToFrag5058_g70929;
				half Global_DynamicMode5112_g70929 = _VertexDynamicMode;
				float lerpResult4801_g70929 = lerp( World_Normal4101_g70929.y , packedInput.ase_normal.y , Global_DynamicMode5112_g70929);
				float lerpResult3567_g70929 = lerp( 0.5 , 1.0 , lerpResult4801_g70929);
				float4 temp_output_93_19_g70934 = TVE_ExtrasCoords;
				float3 vertexToFrag3890_g70929 = packedInput.ase_texcoord8.xyz;
				float3 WorldPosition3905_g70929 = vertexToFrag3890_g70929;
				float3 vertexToFrag4224_g70929 = packedInput.ase_texcoord9.xyz;
				half3 ObjectData20_g70970 = vertexToFrag4224_g70929;
				half3 WorldData19_g70970 = vertexToFrag3890_g70929;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g70970 = WorldData19_g70970;
				#else
				float3 staticSwitch14_g70970 = ObjectData20_g70970;
				#endif
				float3 ObjectPosition4223_g70929 = staticSwitch14_g70970;
				float3 lerpResult4827_g70929 = lerp( WorldPosition3905_g70929 , ObjectPosition4223_g70929 , _ExtrasPositionMode);
				half2 UV96_g70934 = ( (temp_output_93_19_g70934).zw + ( (temp_output_93_19_g70934).xy * (lerpResult4827_g70929).xz ) );
				float temp_output_84_0_g70934 = _LayerExtrasValue;
				float4 lerpResult109_g70934 = lerp( TVE_ExtrasParams , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_ExtrasTex, sampler_linear_repeat, UV96_g70934,temp_output_84_0_g70934, 0.0 ) , TVE_ExtrasUsage[(int)temp_output_84_0_g70934]);
				float4 break89_g70934 = lerpResult109_g70934;
				half Global_Extras_Overlay156_g70929 = break89_g70934.b;
				half Overlay_Variation4560_g70929 = 1.0;
				half Overlay_Commons1365_g70929 = ( _GlobalOverlay * Global_Extras_Overlay156_g70929 * Overlay_Variation4560_g70929 );
				half Overlay_Mask_3D5122_g70929 = ( ( ( lerpResult3567_g70929 * 0.5 ) + Blend_Albedo265_g70929.y ) * Overlay_Commons1365_g70929 );
				float temp_output_7_0_g70971 = _OverlayMaskMinValue;
				half Overlay_Mask269_g70929 = saturate( ( ( Overlay_Mask_3D5122_g70929 - temp_output_7_0_g70971 ) / ( _OverlayMaskMaxValue - temp_output_7_0_g70971 ) ) );
				float3 lerpResult336_g70929 = lerp( Blend_AlbedoAndSubsurface149_g70929 , Global_OverlayColor1758_g70929 , Overlay_Mask269_g70929);
				half3 Final_Albedo359_g70929 = lerpResult336_g70929;
				float3 temp_cast_2 = (1.0).xxx;
				float vertexToFrag11_g70973 = packedInput.ase_texcoord6.w;
				float3 lerpResult2945_g70929 = lerp( (_VertexOcclusionColor).rgb , temp_cast_2 , vertexToFrag11_g70973);
				float3 Vertex_Occlusion648_g70929 = lerpResult2945_g70929;
				
				float3 unpack4112_g70929 = UnpackNormalScale( tex2D( _MainNormalTex, Main_UVs15_g70929 ), _MainNormalValue );
				unpack4112_g70929.z = lerp( 1, unpack4112_g70929.z, saturate(_MainNormalValue) );
				half3 Main_Normal137_g70929 = unpack4112_g70929;
				float3 lerpResult3372_g70929 = lerp( float3( 0,0,1 ) , Main_Normal137_g70929 , _DetailNormalValue);
				float3 unpack4114_g70929 = UnpackNormalScale( tex2D( _SecondNormalTex, Second_UVs17_g70929 ), _SecondNormalValue );
				unpack4114_g70929.z = lerp( 1, unpack4114_g70929.z, saturate(_SecondNormalValue) );
				half3 Second_Normal179_g70929 = unpack4114_g70929;
				float3 lerpResult3376_g70929 = lerp( Main_Normal137_g70929 , BlendNormal( lerpResult3372_g70929 , Second_Normal179_g70929 ) , Mask_Detail147_g70929);
				#ifdef TVE_FEATURE_DETAIL
				float3 staticSwitch267_g70929 = lerpResult3376_g70929;
				#else
				float3 staticSwitch267_g70929 = Main_Normal137_g70929;
				#endif
				float3 temp_output_13_0_g70940 = staticSwitch267_g70929;
				float3 switchResult12_g70940 = (((isFrontFace>0)?(temp_output_13_0_g70940):(( temp_output_13_0_g70940 * _render_normals ))));
				half3 Blend_Normal312_g70929 = switchResult12_g70940;
				half3 Final_Normal366_g70929 = Blend_Normal312_g70929;
				
				half Render_Specular4861_g70929 = _RenderSpecular;
				float3 temp_cast_5 = (( 0.04 * Render_Specular4861_g70929 )).xxx;
				
				float3 hdEmission4189_g70929 = ASEGetEmissionHDRColor(_EmissiveColor.rgb,_EmissiveIntensityParams.x,_EmissiveExposureValue,GetInverseCurrentExposureMultiplier());
				half2 Emissive_UVs2468_g70929 = ( ( packedInput.ase_texcoord5.xy * (_EmissiveUVs).xy ) + (_EmissiveUVs).zw );
				half Global_Extras_Emissive4203_g70929 = break89_g70934.r;
				float lerpResult4206_g70929 = lerp( 1.0 , Global_Extras_Emissive4203_g70929 , _GlobalEmissive);
				half3 Final_Emissive2476_g70929 = ( (( hdEmission4189_g70929 * tex2D( _EmissiveTex, Emissive_UVs2468_g70929 ) )).rgb * lerpResult4206_g70929 );
				
				half Main_Smoothness227_g70929 = ( tex2DNode35_g70929.a * _MainSmoothnessValue );
				half Second_Smoothness236_g70929 = ( tex2DNode33_g70929.a * _SecondSmoothnessValue );
				float lerpResult266_g70929 = lerp( Main_Smoothness227_g70929 , Second_Smoothness236_g70929 , Mask_Detail147_g70929);
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch297_g70929 = lerpResult266_g70929;
				#else
				float staticSwitch297_g70929 = Main_Smoothness227_g70929;
				#endif
				half Blend_Smoothness314_g70929 = staticSwitch297_g70929;
				half Global_OverlaySmoothness311_g70929 = TVE_OverlaySmoothness;
				float lerpResult343_g70929 = lerp( Blend_Smoothness314_g70929 , Global_OverlaySmoothness311_g70929 , Overlay_Mask269_g70929);
				half Final_Smoothness371_g70929 = lerpResult343_g70929;
				half Global_Extras_Wetness305_g70929 = break89_g70934.g;
				float lerpResult3673_g70929 = lerp( 0.0 , Global_Extras_Wetness305_g70929 , _GlobalWetness);
				half Final_SmoothnessAndWetness4130_g70929 = saturate( ( Final_Smoothness371_g70929 + lerpResult3673_g70929 ) );
				
				float lerpResult240_g70929 = lerp( 1.0 , tex2DNode35_g70929.g , _MainOcclusionValue);
				half Main_Occlusion247_g70929 = lerpResult240_g70929;
				float lerpResult239_g70929 = lerp( 1.0 , tex2DNode33_g70929.g , _SecondOcclusionValue);
				half Second_Occlusion251_g70929 = lerpResult239_g70929;
				float lerpResult294_g70929 = lerp( Main_Occlusion247_g70929 , Second_Occlusion251_g70929 , Mask_Detail147_g70929);
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch310_g70929 = lerpResult294_g70929;
				#else
				float staticSwitch310_g70929 = Main_Occlusion247_g70929;
				#endif
				half Blend_Occlusion323_g70929 = staticSwitch310_g70929;
				
				float localCustomAlphaClip9_g70962 = ( 0.0 );
				float vertexToFrag11_g70951 = packedInput.ase_texcoord7.w;
				half Fade_Camera_Mask5149_g70929 = 1.0;
				float lerpResult5141_g70929 = lerp( 1.0 , vertexToFrag11_g70951 , Fade_Camera_Mask5149_g70929);
				half Fade_Camera3743_g70929 = lerpResult5141_g70929;
				float temp_output_41_0_g70948 = ( 1.0 * Fade_Camera3743_g70929 );
				half Final_AlphaFade3727_g70929 = saturate( ( temp_output_41_0_g70948 + ( temp_output_41_0_g70948 * tex3D( TVE_ScreenTex3D, ( TVE_ScreenTexCoord * WorldPosition3905_g70929 ) ).r ) ) );
				float Main_Alpha316_g70929 = ( _MainColor.a * tex2DNode29_g70929.a );
				half AlphaTreshold2132_g70929 = _AlphaClipValue;
				half Final_Alpha3754_g70929 = ( Main_Alpha316_g70929 - ( AlphaTreshold2132_g70929 - 0.5 ) );
				float temp_output_661_0_g70929 = ( Final_AlphaFade3727_g70929 * Final_Alpha3754_g70929 );
				float temp_output_3_0_g70949 = temp_output_661_0_g70929;
				half Offest27_g70949 = 0.5;
				half Feather30_g70949 = 0.5;
				float temp_output_3_0_g70962 = ( ( ( temp_output_3_0_g70949 - Offest27_g70949 ) / ( max( fwidth( temp_output_3_0_g70949 ) , 0.001 ) + Feather30_g70949 ) ) + Offest27_g70949 );
				float Alpha9_g70962 = temp_output_3_0_g70962;
				float temp_output_15_0_g70962 = 0.5;
				float Treshold9_g70962 = temp_output_15_0_g70962;
				{
				#if TVE_FEATURE_CLIP
				clip(Alpha9_g70962 - Treshold9_g70962);
				#endif
				}
				half Final_Clip914_g70929 = Alpha9_g70962;
				
				surfaceDescription.Albedo = ( Final_Albedo359_g70929 * Vertex_Occlusion648_g70929 );
				surfaceDescription.Normal = Final_Normal366_g70929;
				surfaceDescription.BentNormal = float3( 0, 0, 1 );
				surfaceDescription.CoatMask = 0;
				surfaceDescription.Metallic = 0;

				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceDescription.Specular = temp_cast_5;
				#endif

				surfaceDescription.Emission = Final_Emissive2476_g70929;
				surfaceDescription.Smoothness = Final_SmoothnessAndWetness4130_g70929;
				surfaceDescription.Occlusion = Blend_Occlusion323_g70929;
				surfaceDescription.Alpha = Final_Clip914_g70929;

				#ifdef _ALPHATEST_ON
				surfaceDescription.AlphaClipThreshold = _AlphaCutoff;
				#endif

				#ifdef _ALPHATEST_SHADOW_ON
				surfaceDescription.AlphaClipThresholdShadow = 0.5;
				#endif

				surfaceDescription.AlphaClipThresholdDepthPrepass = 0.5;
				surfaceDescription.AlphaClipThresholdDepthPostpass = 0.5;

				#ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
				surfaceDescription.SpecularAAScreenSpaceVariance = 0;
				surfaceDescription.SpecularAAThreshold = 0;
				#endif

				#ifdef _SPECULAR_OCCLUSION_CUSTOM
				surfaceDescription.SpecularOcclusion = 0;
				#endif

				#if defined(_HAS_REFRACTION) || defined(_MATERIAL_FEATURE_TRANSMISSION)
				surfaceDescription.Thickness = 1;
				#endif

				#ifdef _HAS_REFRACTION
				surfaceDescription.RefractionIndex = 1;
				surfaceDescription.RefractionColor = float3( 1, 1, 1 );
				surfaceDescription.RefractionDistance = 0;
				#endif

				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceDescription.SubsurfaceMask = 1;
				#endif

				#if defined( _MATERIAL_FEATURE_SUBSURFACE_SCATTERING ) || defined( _MATERIAL_FEATURE_TRANSMISSION )
				surfaceDescription.DiffusionProfile = 0;
				#endif

				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceDescription.Anisotropy = 1;
				surfaceDescription.Tangent = float3( 1, 0, 0 );
				#endif

				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceDescription.IridescenceMask = 0;
				surfaceDescription.IridescenceThickness = 0;
				#endif

				#ifdef _ASE_DISTORTION
				surfaceDescription.Distortion = float2 ( 2, -1 );
				surfaceDescription.DistortionBlur = 1;
				#endif

				#ifdef _ASE_BAKEDGI
				surfaceDescription.BakedGI = 0;
				#endif
				#ifdef _ASE_BAKEDBACKGI
				surfaceDescription.BakedBackGI = 0;
				#endif

				#ifdef _DEPTHOFFSET_ON
				surfaceDescription.DepthOffset = 0;
				#endif

				#ifdef UNITY_VIRTUAL_TEXTURING
				surfaceDescription.VTPackedFeedback = float4(1.0f,1.0f,1.0f,1.0f);
				#endif

				GetSurfaceAndBuiltinData( surfaceDescription, input, V, posInput, surfaceData, builtinData );
				ENCODE_INTO_GBUFFER( surfaceData, builtinData, posInput.positionSS, outGBuffer );
				#ifdef _DEPTHOFFSET_ON
				outputDepth = posInput.deviceDepth;
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

			#define _MATERIAL_FEATURE_SPECULAR_COLOR 1
			#define _ENERGY_CONSERVING_SPECULAR 1
			#pragma multi_compile _ DOTS_INSTANCING_ON
			#pragma multi_compile_instancing
			#pragma instancing_options renderinglayer
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#define ASE_ABSOLUTE_VERTEX_POS 1
			#define _AMBIENT_OCCLUSION 1
			#define HAVE_MESH_MODIFICATION
			#define ASE_SRP_VERSION 120100
			#if !defined(ASE_NEED_CULLFACE)
			#define ASE_NEED_CULLFACE 1
			#endif //ASE_NEED_CULLFACE


			// Keyword for transparent
			#pragma shader_feature _SURFACE_TYPE_TRANSPARENT
			#pragma shader_feature_local_fragment _ _ENABLE_FOG_ON_TRANSPARENT
			#pragma shader_feature_local _ _TRANSPARENT_WRITES_MOTION_VEC

			#pragma shader_feature _ EDITOR_VISUALIZATION

			#define SHADERPASS SHADERPASS_LIGHT_TRANSPORT

			#pragma vertex Vert
			#pragma fragment Frag

			//-------------------------------------------------------------------------------------
			// Define
			//-------------------------------------------------------------------------------------

			#if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define OUTPUT_SPLIT_LIGHTING
			#endif

            #if defined(_TRANSPARENT_WRITES_MOTION_VEC) && defined(_SURFACE_TYPE_TRANSPARENT)
            #define _WRITE_TRANSPARENT_MOTION_VECTOR
            #endif

			#if defined(SHADER_LIT) && !defined(_SURFACE_TYPE_TRANSPARENT)
            #define _DEFERRED_CAPABLE_MATERIAL
            #endif

            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl" 
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl" 
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphHeader.hlsl"

			#ifdef DEBUG_DISPLAY
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
			#endif
			
			CBUFFER_START( UnityPerMaterial )
			half4 _SecondColor;
			half4 _MainColor;
			half4 _MainUVs;
			half4 _ColorsMaskRemap;
			half4 _SecondUVs;
			half4 _OverlayMaskRemap;
			float4 _Color;
			float4 _SubsurfaceDiffusion_Asset;
			float4 _MaxBoundsInfo;
			float4 _SubsurfaceDiffusion_asset;
			float4 _GradientMaskRemap;
			half4 _VertexOcclusionColor;
			half4 _SubsurfaceMaskRemap;
			half4 _AlphaMaskRemap;
			half4 _DetailBlendRemap;
			float4 _EmissiveIntensityParams;
			float4 _NoiseMaskRemap;
			half4 _EmissiveUVs;
			half4 _EmissiveColor;
			half4 _VertexOcclusionRemap;
			half3 _render_normals;
			half _render_dst;
			half _MotionSpeed_20;
			half _RenderDirect;
			half _MotionVariation_20;
			half _IsStandardShader;
			half _MotionScale_20;
			half _InteractionMaskValue;
			half _MotionVariation_10;
			half _VertexDynamicMode;
			float _MotionSpeed_10;
			half _render_src;
			half _MotionAmplitude_20;
			float _MotionScale_10;
			half _MotionAmplitude_10;
			half _LayerMotionValue;
			half _VertexPivotMode;
			half _InteractionAmplitude;
			half _MotionValue_20;
			half _render_zw;
			half _VertexDataMode;
			half _MainOcclusionValue;
			half _GlobalWetness;
			half _SecondSmoothnessValue;
			half _MainSmoothnessValue;
			half _GlobalEmissive;
			half _EmissiveExposureValue;
			half _RenderSpecular;
			half _SecondNormalValue;
			half _DetailNormalValue;
			half _MainNormalValue;
			half _VertexOcclusionMaxValue;
			half _VertexOcclusionMinValue;
			half _OverlayMaskMaxValue;
			half _OverlayMaskMinValue;
			half _LayerExtrasValue;
			half _ExtrasPositionMode;
			half _GlobalOverlay;
			half _DetailBlendMaxValue;
			half _DetailBlendMinValue;
			half _DetailMaskInvertMode;
			half _DetailMaskMode;
			half _DetailMeshValue;
			half _DetailCoordMode;
			half _GlobalSize;
			half _LayerVertexValue;
			half _MotionFacingValue;
			half _CategoryRender;
			half _SubsurfaceDirectValue;
			half _RenderSSR;
			half _CategoryOcclusion;
			half _MessageSizeFade;
			half _DetailTypeMode;
			half _CategoryGlobal;
			half _CategorySizeFade;
			half _CategoryPerspective;
			half _IsVersion;
			half _CategoryNoise;
			half _RenderMode;
			half _HasOcclusion;
			half _CategoryDetail;
			half _HasEmissive;
			half _CategoryMotion;
			half _SubsurfaceNormalValue;
			half _EmissiveFlagMode;
			half _SpaceMotionGlobals;
			half _SubsurfaceShadowValue;
			half _RenderCoverage;
			half _RenderPriority;
			float _SubsurfaceDiffusion;
			half _VertexRollingMode;
			half _Cutoff;
			half _SubsurfaceScatteringValue;
			half _render_cull;
			half _IsBarkShader;
			half _CategorySubsurface;
			half _SpaceGlobalPosition;
			half _RenderClip;
			half _MessageMotionVariation;
			half _RenderCull;
			half _SecondOcclusionValue;
			half _RenderZWrite;
			half _SubsurfaceAmbientValue;
			half _RenderQueue;
			half _SubsurfaceAngleValue;
			half _AlphaClipValue;
			half _VertexMasksMode;
			half _LayerReactValue;
			half _DetailBlendMode;
			half _VertexVariationMode;
			half _RenderDecals;
			half _RenderShadow;
			half _DetailMode;
			half _SpaceRenderFade;
			half _IsTVEShader;
			half _CategoryEmissive;
			half _RenderAmbient;
			half _CategoryMain;
			half _CategoryGradient;
			half _SpaceGlobalLocals;
			half _SpaceMotionLocals;
			half _SpaceGlobalLayers;
			half _RenderNormals;
			half _HasGradient;
			half _MessageGlobalsVariation;
			half _FadeCameraValue;
			float4 _EmissionColor;
			float _AlphaCutoff;
			float _RenderQueueType;
			#ifdef _ADD_PRECOMPUTED_VELOCITY
			float _AddPrecomputedVelocity;
			#endif
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilRefDistortionVec;
			float _StencilWriteMaskDistortionVec;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
			float _SrcBlend;
			float _DstBlend;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _TransparentZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _EnableFogOnTransparent;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END
			sampler2D _BumpMap;
			half TVE_Enabled;
			sampler2D _MainTex;
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
			sampler2D _MainAlbedoTex;
			sampler2D _SecondAlbedoTex;
			sampler2D _MainMaskTex;
			sampler2D _SecondMaskTex;
			half4 TVE_OverlayColor;
			half4 TVE_ExtrasParams;
			TEXTURE2D_ARRAY(TVE_ExtrasTex);
			half4 TVE_ExtrasCoords;
			float TVE_ExtrasUsage[10];
			sampler2D _MainNormalTex;
			sampler2D _SecondNormalTex;
			sampler2D _EmissiveTex;
			half TVE_OverlaySmoothness;
			half TVE_CameraFadeStart;
			half TVE_CameraFadeEnd;
			sampler3D TVE_ScreenTex3D;
			half TVE_ScreenTexCoord;


			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/CommonLighting.hlsl"
			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_VFACE
			#pragma shader_feature_local TVE_FEATURE_CLIP
			#pragma shader_feature_local TVE_FEATURE_BATCHING
			#pragma shader_feature_local TVE_FEATURE_DETAIL
			//TVE Pipeline Defines
			#define THE_VEGETATION_ENGINE
			#define TVE_IS_HD_PIPELINE
			//TVE HD Pipeline Defines
			#pragma shader_feature_local _DISABLE_DECALS
			#pragma shader_feature_local _DISABLE_SSR
			//TVE Injection Defines
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END
			//TVE Shader Type Defines
			#define TVE_IS_VEGETATION_SHADER


			#if defined(_DOUBLESIDED_ON) && !defined(ASE_NEED_CULLFACE)
				#define ASE_NEED_CULLFACE 1
			#endif

			struct AttributesMesh
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 uv0 : TEXCOORD0;
				float4 uv1 : TEXCOORD1;
				float4 uv2 : TEXCOORD2;
				float4 uv3 : TEXCOORD3;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryingsMeshToPS
			{
				float4 positionCS : SV_Position;
				#ifdef EDITOR_VISUALIZATION
				float2 VizUV : TEXCOORD0;
				float4 LightCoord : TEXCOORD1;
				#endif
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_texcoord6 : TEXCOORD6;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				#if defined(SHADER_STAGE_FRAGMENT) && defined(ASE_NEED_CULLFACE)
				FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
				#endif
			};

			float3 ObjectPosition_UNITY_MATRIX_M(  )
			{
				return float3(UNITY_MATRIX_M[0].w, UNITY_MATRIX_M[1].w, UNITY_MATRIX_M[2].w );
			}
			
			float2 DecodeFloatToVector2( float enc )
			{
				float2 result ;
				result.y = enc % 2048;
				result.x = floor(enc / 2048);
				return result / (2048 - 1);
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

				surfaceData.specularOcclusion = 1.0;

				// surface data
				surfaceData.baseColor =					surfaceDescription.Albedo;
				surfaceData.perceptualSmoothness =		surfaceDescription.Smoothness;
				surfaceData.ambientOcclusion =			surfaceDescription.Occlusion;
				surfaceData.metallic =					surfaceDescription.Metallic;
				surfaceData.coatMask =					surfaceDescription.CoatMask;

				#ifdef _SPECULAR_OCCLUSION_CUSTOM
				surfaceData.specularOcclusion =			surfaceDescription.SpecularOcclusion;
				#endif
				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceData.subsurfaceMask =			surfaceDescription.SubsurfaceMask;
				#endif
				#if defined(_HAS_REFRACTION) || defined(_MATERIAL_FEATURE_TRANSMISSION)
				surfaceData.thickness =					surfaceDescription.Thickness;
				#endif
				#if defined( _MATERIAL_FEATURE_SUBSURFACE_SCATTERING ) || defined( _MATERIAL_FEATURE_TRANSMISSION )
				surfaceData.diffusionProfileHash =		asuint(surfaceDescription.DiffusionProfile);
				#endif
				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceData.specularColor =				surfaceDescription.Specular;
				#endif
				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.anisotropy =				surfaceDescription.Anisotropy;
				#endif
				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceData.iridescenceMask =			surfaceDescription.IridescenceMask;
				surfaceData.iridescenceThickness =		surfaceDescription.IridescenceThickness;
				#endif

				// refraction
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

				// material features
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

				// others
				#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
				surfaceData.baseColor *= ( 1.0 - Max3( surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b ) );
				#endif
				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				// normals
				float3 normalTS = float3(0.0f, 0.0f, 1.0f);
				normalTS = surfaceDescription.Normal;
				GetNormalWS( fragInputs, normalTS, surfaceData.normalWS, doubleSidedConstants );

				surfaceData.geomNormalWS = fragInputs.tangentToWorld[2];
				surfaceData.tangentWS = normalize( fragInputs.tangentToWorld[ 0 ].xyz );

				// decals
				#if HAVE_DECALS
				if( _EnableDecals )
				{
					DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, surfaceDescription.Alpha);
					ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData);
				}
				#endif

				bentNormalWS = surfaceData.normalWS;
				
				#ifdef ASE_BENT_NORMAL
				GetNormalWS( fragInputs, surfaceDescription.BentNormal, bentNormalWS, doubleSidedConstants );
				#endif

				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.tangentWS = TransformTangentToWorld( surfaceDescription.Tangent, fragInputs.tangentToWorld );
				#endif
				surfaceData.tangentWS = Orthonormalize( surfaceData.tangentWS, surfaceData.normalWS );


				#if defined(_SPECULAR_OCCLUSION_CUSTOM)
				#elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO( V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness( surfaceData.perceptualSmoothness ) );
				#elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion( ClampNdotV( dot( surfaceData.normalWS, V ) ), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness( surfaceData.perceptualSmoothness ) );
				#endif

				#ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
				surfaceData.perceptualSmoothness = GeometricNormalFiltering( surfaceData.perceptualSmoothness, fragInputs.tangentToWorld[ 2 ], surfaceDescription.SpecularAAScreenSpaceVariance, surfaceDescription.SpecularAAThreshold );
				#endif

				// debug
				#if defined(DEBUG_DISPLAY)
				if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
				{
					surfaceData.metallic = 0;
				}
				ApplyDebugToSurfaceData(fragInputs.tangentToWorld, surfaceData);
				#endif
			}

			void GetSurfaceAndBuiltinData(GlobalSurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				#ifdef LOD_FADE_CROSSFADE
				LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
				#endif

				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				ApplyDoubleSidedFlipOrMirror( fragInputs, doubleSidedConstants );

				#ifdef _ALPHATEST_ON
				DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif

				#ifdef _DEPTHOFFSET_ON
				builtinData.depthOffset = surfaceDescription.DepthOffset;
				ApplyDepthOffsetPositionInput( V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput );
				#endif

				float3 bentNormalWS;
				BuildSurfaceData( fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS );

				InitBuiltinData( posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[ 2 ], fragInputs.texCoord1, fragInputs.texCoord2, builtinData );

				builtinData.emissiveColor = surfaceDescription.Emission;

				#if (SHADERPASS == SHADERPASS_DISTORTION)
				builtinData.distortion = surfaceDescription.Distortion;
				builtinData.distortionBlur = surfaceDescription.DistortionBlur;
				#else
				builtinData.distortion = float2(0.0, 0.0);
				builtinData.distortionBlur = 0.0;
				#endif

				PostInitBuiltinData(V, posInput, surfaceData, builtinData);
			}

			#if SHADERPASS == SHADERPASS_LIGHT_TRANSPORT			
			#define SCENEPICKINGPASS
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/PickingSpaceTransforms.hlsl"
			#endif

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/MetaPass.hlsl"

			PackedVaryingsMeshToPS VertexFunction(AttributesMesh inputMesh  )
			{
				PackedVaryingsMeshToPS outputPackedVaryingsMeshToPS;

				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, outputPackedVaryingsMeshToPS);

				float3 VertexPosition3588_g70929 = inputMesh.positionOS;
				half3 Mesh_PivotsOS2291_g70929 = half3(0,0,0);
				float3 temp_output_2283_0_g70929 = ( VertexPosition3588_g70929 - Mesh_PivotsOS2291_g70929 );
				half3 VertexPos40_g71005 = temp_output_2283_0_g70929;
				float3 appendResult74_g71005 = (float3(VertexPos40_g71005.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g71005 = appendResult74_g71005;
				float3 break84_g71005 = VertexPos40_g71005;
				float3 appendResult81_g71005 = (float3(0.0 , break84_g71005.y , break84_g71005.z));
				half3 VertexPosOtherAxis82_g71005 = appendResult81_g71005;
				float4 temp_output_91_19_g70965 = TVE_MotionCoords;
				float3 localObjectPosition_UNITY_MATRIX_M14_g70996 = ObjectPosition_UNITY_MATRIX_M();
				float3 appendResult60_g70954 = (float3(inputMesh.uv3.x , inputMesh.uv3.z , inputMesh.uv3.y));
				half3 Mesh_PivotsData2831_g70929 = ( appendResult60_g70954 * _VertexPivotMode );
				float3 temp_output_122_0_g70996 = Mesh_PivotsData2831_g70929;
				float3 PivotsOnly105_g70996 = (mul( GetObjectToWorldMatrix(), float4( temp_output_122_0_g70996 , 0.0 ) ).xyz).xyz;
				#ifdef SHADEROPTIONS_CAMERA_RELATIVE_RENDERING
				float3 staticSwitch13_g70996 = ( ( localObjectPosition_UNITY_MATRIX_M14_g70996 + PivotsOnly105_g70996 ) + _WorldSpaceCameraPos );
				#else
				float3 staticSwitch13_g70996 = ( localObjectPosition_UNITY_MATRIX_M14_g70996 + PivotsOnly105_g70996 );
				#endif
				half3 ObjectData20_g70997 = staticSwitch13_g70996;
				float3 ase_worldPos = GetAbsolutePositionWS( TransformObjectToWorld( (inputMesh.positionOS).xyz ) );
				half3 WorldData19_g70997 = ase_worldPos;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g70997 = WorldData19_g70997;
				#else
				float3 staticSwitch14_g70997 = ObjectData20_g70997;
				#endif
				float3 temp_output_114_0_g70996 = staticSwitch14_g70997;
				float3 vertexToFrag4224_g70929 = temp_output_114_0_g70996;
				half3 ObjectData20_g70970 = vertexToFrag4224_g70929;
				float3 vertexToFrag3890_g70929 = ase_worldPos;
				half3 WorldData19_g70970 = vertexToFrag3890_g70929;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g70970 = WorldData19_g70970;
				#else
				float3 staticSwitch14_g70970 = ObjectData20_g70970;
				#endif
				float3 ObjectPosition4223_g70929 = staticSwitch14_g70970;
				half2 UV94_g70965 = ( (temp_output_91_19_g70965).zw + ( (temp_output_91_19_g70965).xy * (ObjectPosition4223_g70929).xz ) );
				float temp_output_84_0_g70965 = _LayerMotionValue;
				float4 lerpResult107_g70965 = lerp( TVE_MotionParams , saturate( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_MotionTex, sampler_linear_repeat, UV94_g70965,temp_output_84_0_g70965, 0.0 ) ) , TVE_MotionUsage[(int)temp_output_84_0_g70965]);
				half4 Global_Motion_Params3909_g70929 = lerpResult107_g70965;
				float4 break322_g70972 = Global_Motion_Params3909_g70929;
				float3 appendResult397_g70972 = (float3(break322_g70972.x , 0.0 , break322_g70972.y));
				float3 temp_output_398_0_g70972 = (appendResult397_g70972*2.0 + -1.0);
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				half2 Global_MotionDirectionOS39_g70929 = (( mul( GetWorldToObjectMatrix(), float4( temp_output_398_0_g70972 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_DirectionOS358_g71001 = Global_MotionDirectionOS39_g70929;
				half Mesh_Height1524_g70929 = inputMesh.ase_color.a;
				half Mesh_Height114_g70956 = Mesh_Height1524_g70929;
				half ObjectData20_g70957 = ( Mesh_Height114_g70956 * 2.0 );
				float enc62_g70955 = inputMesh.uv0.w;
				float2 localDecodeFloatToVector262_g70955 = DecodeFloatToVector2( enc62_g70955 );
				float2 break63_g70955 = ( localDecodeFloatToVector262_g70955 * 100.0 );
				float Bounds_Height5230_g70929 = break63_g70955.x;
				float Bounds_Height117_g70956 = Bounds_Height5230_g70929;
				half WorldData19_g70957 = ( ( Mesh_Height114_g70956 * Mesh_Height114_g70956 ) * Bounds_Height117_g70956 * 2.0 );
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g70957 = WorldData19_g70957;
				#else
				float staticSwitch14_g70957 = ObjectData20_g70957;
				#endif
				half Motion_10_Mask5242_g70929 = staticSwitch14_g70957;
				half Wind_Power369_g70972 = break322_g70972.z;
				half Global_MotionPower2223_g70929 = Wind_Power369_g70972;
				half3 Input_Position419_g70975 = -ObjectPosition4223_g70929;
				half2 Global_MotionDirectionWS4683_g70929 = (temp_output_398_0_g70972).xz;
				half2 Input_DirectionWS423_g70975 = Global_MotionDirectionWS4683_g70929;
				float Motion_Scale287_g70975 = ( _MotionScale_10 + 0.2 );
				half Global_Scale448_g70975 = TVE_NoiseParams.x;
				half Input_Speed62_g70975 = _MotionSpeed_10;
				half Global_Speed449_g70975 = TVE_NoiseParams.y;
				float mulTime426_g70975 = _TimeParameters.x * ( Input_Speed62_g70975 * Global_Speed449_g70975 );
				half Global_DistScale561_g70975 = TVE_NoiseParams.w;
				float3 break461_g70975 = ( Input_Position419_g70975 * Global_DistScale561_g70975 );
				half Global_DistAmplitude559_g70975 = TVE_NoiseParams.z;
				float Noise_Distortion469_g70975 = ( sin( ( break461_g70975.x + break461_g70975.z ) ) * Global_DistAmplitude559_g70975 );
				float3 break111_g70958 = ObjectPosition4223_g70929;
				half Global_DynamicMode5112_g70929 = _VertexDynamicMode;
				half Input_DynamicMode120_g70958 = Global_DynamicMode5112_g70929;
				float Mesh_Variation16_g70929 = inputMesh.ase_color.r;
				half Input_Variation124_g70958 = Mesh_Variation16_g70929;
				half ObjectData20_g70959 = frac( ( ( ( break111_g70958.x + break111_g70958.y + break111_g70958.z ) * ( 1.0 - Input_DynamicMode120_g70958 ) ) + Input_Variation124_g70958 ) );
				half WorldData19_g70959 = Input_Variation124_g70958;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g70959 = WorldData19_g70959;
				#else
				float staticSwitch14_g70959 = ObjectData20_g70959;
				#endif
				float clampResult129_g70958 = clamp( staticSwitch14_g70959 , 0.01 , 0.99 );
				half Global_MeshVariation5104_g70929 = clampResult129_g70958;
				half Motion_Variation284_g70975 = ( _MotionVariation_10 * Global_MeshVariation5104_g70929 );
				float2 temp_output_425_0_g70975 = ( ( (Input_Position419_g70975).xz * Input_DirectionWS423_g70975 * Motion_Scale287_g70975 * Global_Scale448_g70975 ) + ( mulTime426_g70975 + Noise_Distortion469_g70975 + Motion_Variation284_g70975 ) );
				float2 break500_g70975 = ( temp_output_425_0_g70975 * 0.1178 );
				float2 break494_g70975 = ( temp_output_425_0_g70975 * 0.1742 );
				half Input_WindPower327_g70975 = Global_MotionPower2223_g70929;
				float lerpResult430_g70975 = lerp( 1.4 , 0.4 , Input_WindPower327_g70975);
				half Global_MotionNoise34_g70929 = (pow( (( sin( ( break500_g70975.x + break500_g70975.y ) ) * sin( ( break494_g70975.x + break494_g70975.y ) ) )*0.4 + 0.6) , lerpResult430_g70975 )*1.2 + -0.2);
				half Motion_10_Amplitude2258_g70929 = ( _MotionAmplitude_10 * Motion_10_Mask5242_g70929 * Global_MotionPower2223_g70929 * Global_MotionNoise34_g70929 );
				half Input_BendingAmplitude376_g71001 = Motion_10_Amplitude2258_g70929;
				half Input_InteractionAmplitude58_g71001 = _InteractionAmplitude;
				half Input_MeshMotion_10321_g71001 = Motion_10_Mask5242_g70929;
				half Input_InteractionUseMask62_g71001 = _InteractionMaskValue;
				float lerpResult371_g71001 = lerp( 2.0 , Input_MeshMotion_10321_g71001 , Input_InteractionUseMask62_g71001);
				half ObjectData20_g71002 = lerpResult371_g71001;
				half WorldData19_g71002 = Input_MeshMotion_10321_g71001;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g71002 = WorldData19_g71002;
				#else
				float staticSwitch14_g71002 = ObjectData20_g71002;
				#endif
				half Motion_10_Interaction373_g71001 = ( Input_InteractionAmplitude58_g71001 * staticSwitch14_g71002 );
				half Global_InteractionMask66_g70929 = ( break322_g70972.w * break322_g70972.w );
				float Input_InteractionMask330_g71001 = Global_InteractionMask66_g70929;
				float lerpResult360_g71001 = lerp( Input_BendingAmplitude376_g71001 , Motion_10_Interaction373_g71001 , saturate( ( Input_InteractionAmplitude58_g71001 * Input_InteractionMask330_g71001 ) ));
				float2 break364_g71001 = ( Input_DirectionOS358_g71001 * lerpResult360_g71001 );
				half Motion_10_BendingZ190_g70929 = break364_g71001.y;
				half Angle44_g71005 = Motion_10_BendingZ190_g70929;
				half3 VertexPos40_g71004 = ( VertexPosRotationAxis50_g71005 + ( VertexPosOtherAxis82_g71005 * cos( Angle44_g71005 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g71005 ) * sin( Angle44_g71005 ) ) );
				float3 appendResult74_g71004 = (float3(0.0 , 0.0 , VertexPos40_g71004.z));
				half3 VertexPosRotationAxis50_g71004 = appendResult74_g71004;
				float3 break84_g71004 = VertexPos40_g71004;
				float3 appendResult81_g71004 = (float3(break84_g71004.x , break84_g71004.y , 0.0));
				half3 VertexPosOtherAxis82_g71004 = appendResult81_g71004;
				half Motion_10_BendingX216_g70929 = break364_g71001.x;
				half Angle44_g71004 = -Motion_10_BendingX216_g70929;
				half Input_Scale321_g70944 = _MotionScale_20;
				half Input_Variation330_g70944 = ( _MotionVariation_20 * Global_MeshVariation5104_g70929 );
				half Input_Speed62_g70944 = _MotionSpeed_20;
				float mulTime349_g70944 = _TimeParameters.x * Input_Speed62_g70944;
				float temp_output_302_0_g70944 = sin( ( ( ( ase_worldPos.x + ase_worldPos.y + ase_worldPos.z ) * Input_Scale321_g70944 ) + Input_Variation330_g70944 + mulTime349_g70944 ) );
				float enc59_g70955 = inputMesh.uv0.z;
				float2 localDecodeFloatToVector259_g70955 = DecodeFloatToVector2( enc59_g70955 );
				float2 break61_g70955 = localDecodeFloatToVector259_g70955;
				half Mesh_Motion_2060_g70929 = break61_g70955.x;
				half Mesh_Motion_20115_g70956 = Mesh_Motion_2060_g70929;
				float Bounds_Radius5231_g70929 = break63_g70955.y;
				float Bounds_Radius118_g70956 = Bounds_Radius5231_g70929;
				half Motion_20_Mask5243_g70929 = ( Mesh_Motion_20115_g70956 * Bounds_Radius118_g70956 );
				half3 Input_Position419_g70960 = VertexPosition3588_g70929;
				float3 normalizeResult518_g70960 = normalize( Input_Position419_g70960 );
				half2 Input_DirectionOS423_g70960 = Global_MotionDirectionOS39_g70929;
				float2 break521_g70960 = -Input_DirectionOS423_g70960;
				float3 appendResult522_g70960 = (float3(break521_g70960.x , 0.0 , break521_g70960.y));
				float dotResult519_g70960 = dot( normalizeResult518_g70960 , appendResult522_g70960 );
				half Input_Mask62_g70960 = _MotionFacingValue;
				float lerpResult524_g70960 = lerp( 1.0 , (dotResult519_g70960*0.5 + 0.5) , Input_Mask62_g70960);
				half ObjectData20_g70961 = lerpResult524_g70960;
				half WorldData19_g70961 = 1.0;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g70961 = WorldData19_g70961;
				#else
				float staticSwitch14_g70961 = ObjectData20_g70961;
				#endif
				half Motion_FacingMask5214_g70929 = staticSwitch14_g70961;
				half Motion_20_Amplitude4381_g70929 = ( _MotionAmplitude_20 * _MotionValue_20 * Motion_20_Mask5243_g70929 * Global_MotionPower2223_g70929 * Global_MotionNoise34_g70929 * Motion_FacingMask5214_g70929 );
				half Input_Amplitude58_g70944 = Motion_20_Amplitude4381_g70929;
				half2 Input_DirectionOS366_g70944 = Global_MotionDirectionOS39_g70929;
				float2 break371_g70944 = Input_DirectionOS366_g70944;
				float3 appendResult372_g70944 = (float3(break371_g70944.x , ( temp_output_302_0_g70944 * 0.1 ) , break371_g70944.y));
				half3 Motion_20_Squash4418_g70929 = ( ( (temp_output_302_0_g70944*0.2 + 1.0) * Input_Amplitude58_g70944 ) * appendResult372_g70944 );
				float3 Vertex_Motion_Object833_g70929 = ( ( VertexPosRotationAxis50_g71004 + ( VertexPosOtherAxis82_g71004 * cos( Angle44_g71004 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g71004 ) * sin( Angle44_g71004 ) ) ) + Motion_20_Squash4418_g70929 );
				float3 temp_output_3474_0_g70929 = ( VertexPosition3588_g70929 - Mesh_PivotsOS2291_g70929 );
				float3 appendResult2043_g70929 = (float3(Motion_10_BendingX216_g70929 , 0.0 , Motion_10_BendingZ190_g70929));
				float3 Vertex_Motion_World1118_g70929 = ( ( temp_output_3474_0_g70929 + appendResult2043_g70929 ) + Motion_20_Squash4418_g70929 );
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch4976_g70929 = Vertex_Motion_World1118_g70929;
				#else
				float3 staticSwitch4976_g70929 = ( Vertex_Motion_Object833_g70929 + ( _VertexDataMode * 0.0 ) );
				#endif
				float4 temp_output_94_19_g70988 = TVE_VertexCoords;
				half2 UV97_g70988 = ( (temp_output_94_19_g70988).zw + ( (temp_output_94_19_g70988).xy * (ObjectPosition4223_g70929).xz ) );
				float temp_output_84_0_g70988 = _LayerVertexValue;
				float4 lerpResult109_g70988 = lerp( TVE_VertexParams , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_VertexTex, sampler_linear_repeat, UV97_g70988,temp_output_84_0_g70988, 0.0 ) , TVE_VertexUsage[(int)temp_output_84_0_g70988]);
				half4 Global_Object_Params4173_g70929 = lerpResult109_g70988;
				half Global_VertexSize174_g70929 = saturate( Global_Object_Params4173_g70929.w );
				float lerpResult346_g70929 = lerp( 1.0 , Global_VertexSize174_g70929 , _GlobalSize);
				float3 appendResult3480_g70929 = (float3(lerpResult346_g70929 , lerpResult346_g70929 , lerpResult346_g70929));
				half3 ObjectData20_g70964 = appendResult3480_g70929;
				half3 _Vector11 = half3(1,1,1);
				half3 WorldData19_g70964 = _Vector11;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g70964 = WorldData19_g70964;
				#else
				float3 staticSwitch14_g70964 = ObjectData20_g70964;
				#endif
				half3 Vertex_Size1741_g70929 = staticSwitch14_g70964;
				half3 _Vector5 = half3(1,1,1);
				float3 Vertex_SizeFade1740_g70929 = _Vector5;
				half3 Grass_Perspective2661_g70929 = half3(0,0,0);
				float3 lerpResult16_g70963 = lerp( VertexPosition3588_g70929 , ( ( staticSwitch4976_g70929 * Vertex_Size1741_g70929 * Vertex_SizeFade1740_g70929 ) + Mesh_PivotsOS2291_g70929 + Grass_Perspective2661_g70929 ) , TVE_Enabled);
				float3 Final_VertexPosition890_g70929 = ( lerpResult16_g70963 + _DisableSRPBatcher );
				
				float2 appendResult21_g70955 = (float2(inputMesh.uv1.z , inputMesh.uv1.w));
				float2 Mesh_DetailCoord3_g70929 = appendResult21_g70955;
				float2 lerpResult1545_g70929 = lerp( inputMesh.uv0.xy , Mesh_DetailCoord3_g70929 , _DetailCoordMode);
				float2 vertexToFrag11_g71000 = ( ( lerpResult1545_g70929 * (_SecondUVs).xy ) + (_SecondUVs).zw );
				outputPackedVaryingsMeshToPS.ase_texcoord3.xy = vertexToFrag11_g71000;
				half Mesh_DetailMask90_g70929 = inputMesh.ase_color.b;
				float temp_output_990_0_g70929 = ( Mesh_DetailMask90_g70929 - 0.5 );
				float vertexToFrag11_g70931 = ( temp_output_990_0_g70929 + _DetailMeshValue );
				outputPackedVaryingsMeshToPS.ase_texcoord3.z = vertexToFrag11_g70931;
				float3 ase_worldNormal = TransformObjectToWorldNormal(inputMesh.normalOS);
				float3 vertexToFrag5058_g70929 = ase_worldNormal;
				outputPackedVaryingsMeshToPS.ase_texcoord4.xyz = vertexToFrag5058_g70929;
				outputPackedVaryingsMeshToPS.ase_texcoord5.xyz = vertexToFrag3890_g70929;
				outputPackedVaryingsMeshToPS.ase_texcoord6.xyz = vertexToFrag4224_g70929;
				float Mesh_Occlusion318_g70929 = inputMesh.ase_color.g;
				float temp_output_7_0_g70969 = _VertexOcclusionMinValue;
				float temp_output_3377_0_g70929 = saturate( ( ( Mesh_Occlusion318_g70929 - temp_output_7_0_g70969 ) / ( _VertexOcclusionMaxValue - temp_output_7_0_g70969 ) ) );
				float vertexToFrag11_g70973 = temp_output_3377_0_g70929;
				outputPackedVaryingsMeshToPS.ase_texcoord3.w = vertexToFrag11_g70973;
				
				float temp_output_7_0_g70945 = TVE_CameraFadeStart;
				float lerpResult4755_g70929 = lerp( 1.0 , saturate( ( ( distance( ase_worldPos , _WorldSpaceCameraPos ) - temp_output_7_0_g70945 ) / ( TVE_CameraFadeEnd - temp_output_7_0_g70945 ) ) ) , _FadeCameraValue);
				float vertexToFrag11_g70951 = lerpResult4755_g70929;
				outputPackedVaryingsMeshToPS.ase_texcoord4.w = vertexToFrag11_g70951;
				
				outputPackedVaryingsMeshToPS.ase_texcoord2 = inputMesh.uv0;
				outputPackedVaryingsMeshToPS.ase_normal = inputMesh.normalOS;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				outputPackedVaryingsMeshToPS.ase_texcoord5.w = 0;
				outputPackedVaryingsMeshToPS.ase_texcoord6.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue = Final_VertexPosition890_g70929;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif

				inputMesh.normalOS =  inputMesh.normalOS ;
				inputMesh.tangentOS =  inputMesh.tangentOS ;

				outputPackedVaryingsMeshToPS.positionCS = UnityMetaVertexPosition(inputMesh.positionOS, inputMesh.uv1.xy, inputMesh.uv2.xy, unity_LightmapST, unity_DynamicLightmapST);


				#ifdef EDITOR_VISUALIZATION
					float2 vizUV = 0;
					float4 lightCoord = 0;
					UnityEditorVizData(inputMesh.positionOS.xyz, inputMesh.uv0.xy, inputMesh.uv1.xy, inputMesh.uv2.xy, vizUV, lightCoord);

					outputPackedVaryingsMeshToPS.VizUV.xy = vizUV;
					outputPackedVaryingsMeshToPS.LightCoord = lightCoord;
				#endif

				return outputPackedVaryingsMeshToPS;
			}

			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float3 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 uv0 : TEXCOORD0;
				float4 uv1 : TEXCOORD1;
				float4 uv2 : TEXCOORD2;
				float4 uv3 : TEXCOORD3;
				float4 ase_color : COLOR;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl Vert ( AttributesMesh v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.positionOS = v.positionOS;
				o.normalOS = v.normalOS;
				o.tangentOS = v.tangentOS;
				o.uv0 = v.uv0;
				o.uv1 = v.uv1;
				o.uv2 = v.uv2;
				o.uv3 = v.uv3;
				o.ase_color = v.ase_color;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				float3 cameraPos = 0;
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), cameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, GetObjectToWorldMatrix(), cameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), cameraPos, _ScreenParams, _FrustumPlanes );
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
			PackedVaryingsMeshToPS DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				AttributesMesh o = (AttributesMesh) 0;
				o.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				o.uv0 = patch[0].uv0 * bary.x + patch[1].uv0 * bary.y + patch[2].uv0 * bary.z;
				o.uv1 = patch[0].uv1 * bary.x + patch[1].uv1 * bary.y + patch[2].uv1 * bary.z;
				o.uv2 = patch[0].uv2 * bary.x + patch[1].uv2 * bary.y + patch[2].uv2 * bary.z;
				o.uv3 = patch[0].uv3 * bary.x + patch[1].uv3 * bary.y + patch[2].uv3 * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			PackedVaryingsMeshToPS Vert ( AttributesMesh v )
			{
				return VertexFunction( v );
			}
			#endif

			float4 Frag(PackedVaryingsMeshToPS packedInput  ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID( packedInput );
				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);
				input.tangentToWorld = k_identity3x3;
				input.positionSS = packedInput.positionCS;

				#if _DOUBLESIDED_ON && SHADER_STAGE_FRAGMENT
				input.isFrontFace = IS_FRONT_VFACE( packedInput.cullFace, true, false);
				#elif SHADER_STAGE_FRAGMENT
				#if defined(ASE_NEED_CULLFACE)
				input.isFrontFace = IS_FRONT_VFACE(packedInput.cullFace, true, false);
				#endif
				#endif
				half isFrontFace = input.isFrontFace;

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS);
				float3 V = float3(1.0, 1.0, 1.0);

				SurfaceData surfaceData;
				BuiltinData builtinData;
				GlobalSurfaceDescription surfaceDescription = (GlobalSurfaceDescription)0;
				half2 Main_UVs15_g70929 = ( ( packedInput.ase_texcoord2.xy * (_MainUVs).xy ) + (_MainUVs).zw );
				float4 tex2DNode29_g70929 = tex2D( _MainAlbedoTex, Main_UVs15_g70929 );
				half3 Main_Albedo99_g70929 = ( (_MainColor).rgb * (tex2DNode29_g70929).rgb );
				float2 vertexToFrag11_g71000 = packedInput.ase_texcoord3.xy;
				half2 Second_UVs17_g70929 = vertexToFrag11_g71000;
				float4 tex2DNode89_g70929 = tex2D( _SecondAlbedoTex, Second_UVs17_g70929 );
				half3 Second_Albedo153_g70929 = (( _SecondColor * tex2DNode89_g70929 )).rgb;
				float3 lerpResult4834_g70929 = lerp( ( Main_Albedo99_g70929 * Second_Albedo153_g70929 * 4.594794 ) , Second_Albedo153_g70929 , _DetailBlendMode);
				float vertexToFrag11_g70931 = packedInput.ase_texcoord3.z;
				half Blend_Source1540_g70929 = vertexToFrag11_g70931;
				float4 tex2DNode35_g70929 = tex2D( _MainMaskTex, Main_UVs15_g70929 );
				half Main_Mask57_g70929 = tex2DNode35_g70929.b;
				float4 tex2DNode33_g70929 = tex2D( _SecondMaskTex, Second_UVs17_g70929 );
				half Second_Mask81_g70929 = tex2DNode33_g70929.b;
				float lerpResult1327_g70929 = lerp( Main_Mask57_g70929 , Second_Mask81_g70929 , _DetailMaskMode);
				float lerpResult4058_g70929 = lerp( lerpResult1327_g70929 , ( 1.0 - lerpResult1327_g70929 ) , _DetailMaskInvertMode);
				float temp_output_7_0_g71007 = _DetailBlendMinValue;
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch4838_g70929 = saturate( ( ( saturate( ( Blend_Source1540_g70929 + ( Blend_Source1540_g70929 * lerpResult4058_g70929 ) ) ) - temp_output_7_0_g71007 ) / ( _DetailBlendMaxValue - temp_output_7_0_g71007 ) ) );
				#else
				float staticSwitch4838_g70929 = 0.0;
				#endif
				half Mask_Detail147_g70929 = staticSwitch4838_g70929;
				float3 lerpResult235_g70929 = lerp( Main_Albedo99_g70929 , lerpResult4834_g70929 , Mask_Detail147_g70929);
				#ifdef TVE_FEATURE_DETAIL
				float3 staticSwitch255_g70929 = lerpResult235_g70929;
				#else
				float3 staticSwitch255_g70929 = Main_Albedo99_g70929;
				#endif
				half3 Blend_Albedo265_g70929 = staticSwitch255_g70929;
				half3 Blend_AlbedoTinted2808_g70929 = ( ( float3(1,1,1) * float3(1,1,1) * float3(1,1,1) ) * Blend_Albedo265_g70929 );
				half3 Blend_AlbedoColored863_g70929 = Blend_AlbedoTinted2808_g70929;
				half3 Blend_AlbedoAndSubsurface149_g70929 = Blend_AlbedoColored863_g70929;
				half3 Global_OverlayColor1758_g70929 = (TVE_OverlayColor).rgb;
				float3 vertexToFrag5058_g70929 = packedInput.ase_texcoord4.xyz;
				half3 World_Normal4101_g70929 = vertexToFrag5058_g70929;
				half Global_DynamicMode5112_g70929 = _VertexDynamicMode;
				float lerpResult4801_g70929 = lerp( World_Normal4101_g70929.y , packedInput.ase_normal.y , Global_DynamicMode5112_g70929);
				float lerpResult3567_g70929 = lerp( 0.5 , 1.0 , lerpResult4801_g70929);
				float4 temp_output_93_19_g70934 = TVE_ExtrasCoords;
				float3 vertexToFrag3890_g70929 = packedInput.ase_texcoord5.xyz;
				float3 WorldPosition3905_g70929 = vertexToFrag3890_g70929;
				float3 vertexToFrag4224_g70929 = packedInput.ase_texcoord6.xyz;
				half3 ObjectData20_g70970 = vertexToFrag4224_g70929;
				half3 WorldData19_g70970 = vertexToFrag3890_g70929;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g70970 = WorldData19_g70970;
				#else
				float3 staticSwitch14_g70970 = ObjectData20_g70970;
				#endif
				float3 ObjectPosition4223_g70929 = staticSwitch14_g70970;
				float3 lerpResult4827_g70929 = lerp( WorldPosition3905_g70929 , ObjectPosition4223_g70929 , _ExtrasPositionMode);
				half2 UV96_g70934 = ( (temp_output_93_19_g70934).zw + ( (temp_output_93_19_g70934).xy * (lerpResult4827_g70929).xz ) );
				float temp_output_84_0_g70934 = _LayerExtrasValue;
				float4 lerpResult109_g70934 = lerp( TVE_ExtrasParams , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_ExtrasTex, sampler_linear_repeat, UV96_g70934,temp_output_84_0_g70934, 0.0 ) , TVE_ExtrasUsage[(int)temp_output_84_0_g70934]);
				float4 break89_g70934 = lerpResult109_g70934;
				half Global_Extras_Overlay156_g70929 = break89_g70934.b;
				half Overlay_Variation4560_g70929 = 1.0;
				half Overlay_Commons1365_g70929 = ( _GlobalOverlay * Global_Extras_Overlay156_g70929 * Overlay_Variation4560_g70929 );
				half Overlay_Mask_3D5122_g70929 = ( ( ( lerpResult3567_g70929 * 0.5 ) + Blend_Albedo265_g70929.y ) * Overlay_Commons1365_g70929 );
				float temp_output_7_0_g70971 = _OverlayMaskMinValue;
				half Overlay_Mask269_g70929 = saturate( ( ( Overlay_Mask_3D5122_g70929 - temp_output_7_0_g70971 ) / ( _OverlayMaskMaxValue - temp_output_7_0_g70971 ) ) );
				float3 lerpResult336_g70929 = lerp( Blend_AlbedoAndSubsurface149_g70929 , Global_OverlayColor1758_g70929 , Overlay_Mask269_g70929);
				half3 Final_Albedo359_g70929 = lerpResult336_g70929;
				float3 temp_cast_2 = (1.0).xxx;
				float vertexToFrag11_g70973 = packedInput.ase_texcoord3.w;
				float3 lerpResult2945_g70929 = lerp( (_VertexOcclusionColor).rgb , temp_cast_2 , vertexToFrag11_g70973);
				float3 Vertex_Occlusion648_g70929 = lerpResult2945_g70929;
				
				float3 unpack4112_g70929 = UnpackNormalScale( tex2D( _MainNormalTex, Main_UVs15_g70929 ), _MainNormalValue );
				unpack4112_g70929.z = lerp( 1, unpack4112_g70929.z, saturate(_MainNormalValue) );
				half3 Main_Normal137_g70929 = unpack4112_g70929;
				float3 lerpResult3372_g70929 = lerp( float3( 0,0,1 ) , Main_Normal137_g70929 , _DetailNormalValue);
				float3 unpack4114_g70929 = UnpackNormalScale( tex2D( _SecondNormalTex, Second_UVs17_g70929 ), _SecondNormalValue );
				unpack4114_g70929.z = lerp( 1, unpack4114_g70929.z, saturate(_SecondNormalValue) );
				half3 Second_Normal179_g70929 = unpack4114_g70929;
				float3 lerpResult3376_g70929 = lerp( Main_Normal137_g70929 , BlendNormal( lerpResult3372_g70929 , Second_Normal179_g70929 ) , Mask_Detail147_g70929);
				#ifdef TVE_FEATURE_DETAIL
				float3 staticSwitch267_g70929 = lerpResult3376_g70929;
				#else
				float3 staticSwitch267_g70929 = Main_Normal137_g70929;
				#endif
				float3 temp_output_13_0_g70940 = staticSwitch267_g70929;
				float3 switchResult12_g70940 = (((isFrontFace>0)?(temp_output_13_0_g70940):(( temp_output_13_0_g70940 * _render_normals ))));
				half3 Blend_Normal312_g70929 = switchResult12_g70940;
				half3 Final_Normal366_g70929 = Blend_Normal312_g70929;
				
				half Render_Specular4861_g70929 = _RenderSpecular;
				float3 temp_cast_5 = (( 0.04 * Render_Specular4861_g70929 )).xxx;
				
				float3 hdEmission4189_g70929 = ASEGetEmissionHDRColor(_EmissiveColor.rgb,_EmissiveIntensityParams.x,_EmissiveExposureValue,GetInverseCurrentExposureMultiplier());
				half2 Emissive_UVs2468_g70929 = ( ( packedInput.ase_texcoord2.xy * (_EmissiveUVs).xy ) + (_EmissiveUVs).zw );
				half Global_Extras_Emissive4203_g70929 = break89_g70934.r;
				float lerpResult4206_g70929 = lerp( 1.0 , Global_Extras_Emissive4203_g70929 , _GlobalEmissive);
				half3 Final_Emissive2476_g70929 = ( (( hdEmission4189_g70929 * tex2D( _EmissiveTex, Emissive_UVs2468_g70929 ) )).rgb * lerpResult4206_g70929 );
				
				half Main_Smoothness227_g70929 = ( tex2DNode35_g70929.a * _MainSmoothnessValue );
				half Second_Smoothness236_g70929 = ( tex2DNode33_g70929.a * _SecondSmoothnessValue );
				float lerpResult266_g70929 = lerp( Main_Smoothness227_g70929 , Second_Smoothness236_g70929 , Mask_Detail147_g70929);
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch297_g70929 = lerpResult266_g70929;
				#else
				float staticSwitch297_g70929 = Main_Smoothness227_g70929;
				#endif
				half Blend_Smoothness314_g70929 = staticSwitch297_g70929;
				half Global_OverlaySmoothness311_g70929 = TVE_OverlaySmoothness;
				float lerpResult343_g70929 = lerp( Blend_Smoothness314_g70929 , Global_OverlaySmoothness311_g70929 , Overlay_Mask269_g70929);
				half Final_Smoothness371_g70929 = lerpResult343_g70929;
				half Global_Extras_Wetness305_g70929 = break89_g70934.g;
				float lerpResult3673_g70929 = lerp( 0.0 , Global_Extras_Wetness305_g70929 , _GlobalWetness);
				half Final_SmoothnessAndWetness4130_g70929 = saturate( ( Final_Smoothness371_g70929 + lerpResult3673_g70929 ) );
				
				float lerpResult240_g70929 = lerp( 1.0 , tex2DNode35_g70929.g , _MainOcclusionValue);
				half Main_Occlusion247_g70929 = lerpResult240_g70929;
				float lerpResult239_g70929 = lerp( 1.0 , tex2DNode33_g70929.g , _SecondOcclusionValue);
				half Second_Occlusion251_g70929 = lerpResult239_g70929;
				float lerpResult294_g70929 = lerp( Main_Occlusion247_g70929 , Second_Occlusion251_g70929 , Mask_Detail147_g70929);
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch310_g70929 = lerpResult294_g70929;
				#else
				float staticSwitch310_g70929 = Main_Occlusion247_g70929;
				#endif
				half Blend_Occlusion323_g70929 = staticSwitch310_g70929;
				
				float localCustomAlphaClip9_g70962 = ( 0.0 );
				float vertexToFrag11_g70951 = packedInput.ase_texcoord4.w;
				half Fade_Camera_Mask5149_g70929 = 1.0;
				float lerpResult5141_g70929 = lerp( 1.0 , vertexToFrag11_g70951 , Fade_Camera_Mask5149_g70929);
				half Fade_Camera3743_g70929 = lerpResult5141_g70929;
				float temp_output_41_0_g70948 = ( 1.0 * Fade_Camera3743_g70929 );
				half Final_AlphaFade3727_g70929 = saturate( ( temp_output_41_0_g70948 + ( temp_output_41_0_g70948 * tex3D( TVE_ScreenTex3D, ( TVE_ScreenTexCoord * WorldPosition3905_g70929 ) ).r ) ) );
				float Main_Alpha316_g70929 = ( _MainColor.a * tex2DNode29_g70929.a );
				half AlphaTreshold2132_g70929 = _AlphaClipValue;
				half Final_Alpha3754_g70929 = ( Main_Alpha316_g70929 - ( AlphaTreshold2132_g70929 - 0.5 ) );
				float temp_output_661_0_g70929 = ( Final_AlphaFade3727_g70929 * Final_Alpha3754_g70929 );
				float temp_output_3_0_g70949 = temp_output_661_0_g70929;
				half Offest27_g70949 = 0.5;
				half Feather30_g70949 = 0.5;
				float temp_output_3_0_g70962 = ( ( ( temp_output_3_0_g70949 - Offest27_g70949 ) / ( max( fwidth( temp_output_3_0_g70949 ) , 0.001 ) + Feather30_g70949 ) ) + Offest27_g70949 );
				float Alpha9_g70962 = temp_output_3_0_g70962;
				float temp_output_15_0_g70962 = 0.5;
				float Treshold9_g70962 = temp_output_15_0_g70962;
				{
				#if TVE_FEATURE_CLIP
				clip(Alpha9_g70962 - Treshold9_g70962);
				#endif
				}
				half Final_Clip914_g70929 = Alpha9_g70962;
				
				surfaceDescription.Albedo = ( Final_Albedo359_g70929 * Vertex_Occlusion648_g70929 );
				surfaceDescription.Normal = Final_Normal366_g70929;
				surfaceDescription.BentNormal = float3( 0, 0, 1 );
				surfaceDescription.CoatMask = 0;
				surfaceDescription.Metallic = 0;

				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceDescription.Specular = temp_cast_5;
				#endif

				surfaceDescription.Emission = Final_Emissive2476_g70929;
				surfaceDescription.Smoothness = Final_SmoothnessAndWetness4130_g70929;
				surfaceDescription.Occlusion = Blend_Occlusion323_g70929;
				surfaceDescription.Alpha = Final_Clip914_g70929;

				#ifdef _ALPHATEST_ON
				surfaceDescription.AlphaClipThreshold = _AlphaCutoff;
				#endif

				#ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
				surfaceDescription.SpecularAAScreenSpaceVariance = 0;
				surfaceDescription.SpecularAAThreshold = 0;
				#endif

				#ifdef _SPECULAR_OCCLUSION_CUSTOM
				surfaceDescription.SpecularOcclusion = 0;
				#endif

				#if defined(_HAS_REFRACTION) || defined(_MATERIAL_FEATURE_TRANSMISSION)
				surfaceDescription.Thickness = 1;
				#endif

				#ifdef _HAS_REFRACTION
				surfaceDescription.RefractionIndex = 1;
				surfaceDescription.RefractionColor = float3( 1, 1, 1 );
				surfaceDescription.RefractionDistance = 0;
				#endif

				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceDescription.SubsurfaceMask = 1;
				#endif

				#if defined( _MATERIAL_FEATURE_SUBSURFACE_SCATTERING ) || defined( _MATERIAL_FEATURE_TRANSMISSION )
				surfaceDescription.DiffusionProfile = 0;
				#endif

				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceDescription.Anisotropy = 1;
				surfaceDescription.Tangent = float3( 1, 0, 0 );
				#endif

				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceDescription.IridescenceMask = 0;
				surfaceDescription.IridescenceThickness = 0;
				#endif

				GetSurfaceAndBuiltinData(surfaceDescription,input, V, posInput, surfaceData, builtinData);

				BSDFData bsdfData = ConvertSurfaceDataToBSDFData(input.positionSS.xy, surfaceData);
				LightTransportData lightTransportData = GetLightTransportData(surfaceData, builtinData, bsdfData);

				float4 res = float4( 0.0, 0.0, 0.0, 1.0 );
				UnityMetaInput metaInput;
				metaInput.Albedo = lightTransportData.diffuseColor.rgb;
				metaInput.Emission = lightTransportData.emissiveColor;
			#ifdef EDITOR_VISUALIZATION
				metaInput.VizUV = packedInput.VizUV;
				metaInput.LightCoord = packedInput.LightCoord;
			#endif
				res = UnityMetaFragment(metaInput);

				return res;
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "ShadowCaster"
			Tags { "LightMode"="ShadowCaster" }
			Cull [_CullMode]
			ZWrite On
			ZClip [_ZClip]
			ZTest LEqual
			ColorMask 0

			HLSLPROGRAM

			#define _MATERIAL_FEATURE_SPECULAR_COLOR 1
			#define _ENERGY_CONSERVING_SPECULAR 1
			#pragma multi_compile _ DOTS_INSTANCING_ON
			#pragma multi_compile_instancing
			#pragma instancing_options renderinglayer
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#define ASE_ABSOLUTE_VERTEX_POS 1
			#define _AMBIENT_OCCLUSION 1
			#define HAVE_MESH_MODIFICATION
			#define ASE_SRP_VERSION 120100


			// Keyword for transparent
			#pragma shader_feature _SURFACE_TYPE_TRANSPARENT
			#pragma shader_feature_local_fragment _ _ENABLE_FOG_ON_TRANSPARENT

			#define SHADERPASS SHADERPASS_SHADOWS

			#pragma vertex Vert
			#pragma fragment Frag

			//-------------------------------------------------------------------------------------
			// Define
			//-------------------------------------------------------------------------------------

			#if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define OUTPUT_SPLIT_LIGHTING
			#endif

            #if defined(_TRANSPARENT_WRITES_MOTION_VEC) && defined(_SURFACE_TYPE_TRANSPARENT)
            #define _WRITE_TRANSPARENT_MOTION_VECTOR
            #endif

            //#define USE_LEGACY_UNITY_MATRIX_VARIABLES

			#if defined(SHADER_LIT) && !defined(_SURFACE_TYPE_TRANSPARENT)
            #define _DEFERRED_CAPABLE_MATERIAL
            #endif

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl" 
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl" 
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphHeader.hlsl"

			#ifdef DEBUG_DISPLAY
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
			#endif

			CBUFFER_START( UnityPerMaterial )
			half4 _SecondColor;
			half4 _MainColor;
			half4 _MainUVs;
			half4 _ColorsMaskRemap;
			half4 _SecondUVs;
			half4 _OverlayMaskRemap;
			float4 _Color;
			float4 _SubsurfaceDiffusion_Asset;
			float4 _MaxBoundsInfo;
			float4 _SubsurfaceDiffusion_asset;
			float4 _GradientMaskRemap;
			half4 _VertexOcclusionColor;
			half4 _SubsurfaceMaskRemap;
			half4 _AlphaMaskRemap;
			half4 _DetailBlendRemap;
			float4 _EmissiveIntensityParams;
			float4 _NoiseMaskRemap;
			half4 _EmissiveUVs;
			half4 _EmissiveColor;
			half4 _VertexOcclusionRemap;
			half3 _render_normals;
			half _render_dst;
			half _MotionSpeed_20;
			half _RenderDirect;
			half _MotionVariation_20;
			half _IsStandardShader;
			half _MotionScale_20;
			half _InteractionMaskValue;
			half _MotionVariation_10;
			half _VertexDynamicMode;
			float _MotionSpeed_10;
			half _render_src;
			half _MotionAmplitude_20;
			float _MotionScale_10;
			half _MotionAmplitude_10;
			half _LayerMotionValue;
			half _VertexPivotMode;
			half _InteractionAmplitude;
			half _MotionValue_20;
			half _render_zw;
			half _VertexDataMode;
			half _MainOcclusionValue;
			half _GlobalWetness;
			half _SecondSmoothnessValue;
			half _MainSmoothnessValue;
			half _GlobalEmissive;
			half _EmissiveExposureValue;
			half _RenderSpecular;
			half _SecondNormalValue;
			half _DetailNormalValue;
			half _MainNormalValue;
			half _VertexOcclusionMaxValue;
			half _VertexOcclusionMinValue;
			half _OverlayMaskMaxValue;
			half _OverlayMaskMinValue;
			half _LayerExtrasValue;
			half _ExtrasPositionMode;
			half _GlobalOverlay;
			half _DetailBlendMaxValue;
			half _DetailBlendMinValue;
			half _DetailMaskInvertMode;
			half _DetailMaskMode;
			half _DetailMeshValue;
			half _DetailCoordMode;
			half _GlobalSize;
			half _LayerVertexValue;
			half _MotionFacingValue;
			half _CategoryRender;
			half _SubsurfaceDirectValue;
			half _RenderSSR;
			half _CategoryOcclusion;
			half _MessageSizeFade;
			half _DetailTypeMode;
			half _CategoryGlobal;
			half _CategorySizeFade;
			half _CategoryPerspective;
			half _IsVersion;
			half _CategoryNoise;
			half _RenderMode;
			half _HasOcclusion;
			half _CategoryDetail;
			half _HasEmissive;
			half _CategoryMotion;
			half _SubsurfaceNormalValue;
			half _EmissiveFlagMode;
			half _SpaceMotionGlobals;
			half _SubsurfaceShadowValue;
			half _RenderCoverage;
			half _RenderPriority;
			float _SubsurfaceDiffusion;
			half _VertexRollingMode;
			half _Cutoff;
			half _SubsurfaceScatteringValue;
			half _render_cull;
			half _IsBarkShader;
			half _CategorySubsurface;
			half _SpaceGlobalPosition;
			half _RenderClip;
			half _MessageMotionVariation;
			half _RenderCull;
			half _SecondOcclusionValue;
			half _RenderZWrite;
			half _SubsurfaceAmbientValue;
			half _RenderQueue;
			half _SubsurfaceAngleValue;
			half _AlphaClipValue;
			half _VertexMasksMode;
			half _LayerReactValue;
			half _DetailBlendMode;
			half _VertexVariationMode;
			half _RenderDecals;
			half _RenderShadow;
			half _DetailMode;
			half _SpaceRenderFade;
			half _IsTVEShader;
			half _CategoryEmissive;
			half _RenderAmbient;
			half _CategoryMain;
			half _CategoryGradient;
			half _SpaceGlobalLocals;
			half _SpaceMotionLocals;
			half _SpaceGlobalLayers;
			half _RenderNormals;
			half _HasGradient;
			half _MessageGlobalsVariation;
			half _FadeCameraValue;
			float4 _EmissionColor;
			float _AlphaCutoff;
			float _RenderQueueType;
			#ifdef _ADD_PRECOMPUTED_VELOCITY
			float _AddPrecomputedVelocity;
			#endif
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilRefDistortionVec;
			float _StencilWriteMaskDistortionVec;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
			float _SrcBlend;
			float _DstBlend;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _TransparentZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _EnableFogOnTransparent;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END
			sampler2D _BumpMap;
			half TVE_Enabled;
			sampler2D _MainTex;
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
			half TVE_CameraFadeStart;
			half TVE_CameraFadeEnd;
			sampler3D TVE_ScreenTex3D;
			half TVE_ScreenTexCoord;
			sampler2D _MainAlbedoTex;


			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"

			#define ASE_NEEDS_VERT_POSITION
			#pragma shader_feature_local TVE_FEATURE_CLIP
			#pragma shader_feature_local TVE_FEATURE_BATCHING
			//TVE Pipeline Defines
			#define THE_VEGETATION_ENGINE
			#define TVE_IS_HD_PIPELINE
			//TVE HD Pipeline Defines
			#pragma shader_feature_local _DISABLE_DECALS
			#pragma shader_feature_local _DISABLE_SSR
			//TVE Injection Defines
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END
			//TVE Shader Type Defines
			#define TVE_IS_VEGETATION_SHADER


			#if defined(_DOUBLESIDED_ON) && !defined(ASE_NEED_CULLFACE)
				#define ASE_NEED_CULLFACE 1
			#endif

			struct AttributesMesh
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryingsMeshToPS
			{
				float4 positionCS : SV_Position;
				float3 positionRWS : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
				#if defined(SHADER_STAGE_FRAGMENT) && defined(ASE_NEED_CULLFACE)
				FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
				#endif
			};

			float3 ObjectPosition_UNITY_MATRIX_M(  )
			{
				return float3(UNITY_MATRIX_M[0].w, UNITY_MATRIX_M[1].w, UNITY_MATRIX_M[2].w );
			}
			
			float2 DecodeFloatToVector2( float enc )
			{
				float2 result ;
				result.y = enc % 2048;
				result.x = floor(enc / 2048);
				return result / (2048 - 1);
			}
			

			void BuildSurfaceData(FragInputs fragInputs, inout AlphaSurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData, out float3 bentNormalWS)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);

				surfaceData.specularOcclusion = 1.0;

				// surface data

				// refraction
				#ifdef _HAS_REFRACTION
				if( _EnableSSRefraction )
				{
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


				// material features
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

				// others
				#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
				surfaceData.baseColor *= ( 1.0 - Max3( surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b ) );
				#endif
				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				// normals
				float3 normalTS = float3(0.0f, 0.0f, 1.0f);
				GetNormalWS( fragInputs, normalTS, surfaceData.normalWS, doubleSidedConstants );

				surfaceData.geomNormalWS = fragInputs.tangentToWorld[2];
				surfaceData.tangentWS = normalize( fragInputs.tangentToWorld[ 0 ].xyz );
				
				// decals
				#if HAVE_DECALS
				if( _EnableDecals )
				{
					DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, surfaceDescription.Alpha);
					ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData);
				}
				#endif

				bentNormalWS = surfaceData.normalWS;
				surfaceData.tangentWS = Orthonormalize( surfaceData.tangentWS, surfaceData.normalWS );

				#if defined(_SPECULAR_OCCLUSION_CUSTOM)
				#elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO( V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness( surfaceData.perceptualSmoothness ) );
				#elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion( ClampNdotV( dot( surfaceData.normalWS, V ) ), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness( surfaceData.perceptualSmoothness ) );
				#endif

				// debug
				#if defined(DEBUG_DISPLAY)
				if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
				{
					surfaceData.metallic = 0;
				}
				ApplyDebugToSurfaceData(fragInputs.tangentToWorld, surfaceData);
				#endif
			}

			void GetSurfaceAndBuiltinData(AlphaSurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				#ifdef LOD_FADE_CROSSFADE
				LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
				#endif

				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				ApplyDoubleSidedFlipOrMirror( fragInputs, doubleSidedConstants );

				#ifdef _ALPHATEST_ON
				#ifdef _ALPHATEST_SHADOW_ON
				DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThresholdShadow );
				#else
				DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif
				#endif

				#ifdef _DEPTHOFFSET_ON
				builtinData.depthOffset = surfaceDescription.DepthOffset;
				ApplyDepthOffsetPositionInput( V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput );
				#endif

				float3 bentNormalWS;
				BuildSurfaceData( fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS );

				InitBuiltinData( posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[ 2 ], fragInputs.texCoord1, fragInputs.texCoord2, builtinData );

				PostInitBuiltinData(V, posInput, surfaceData, builtinData);
			}

			PackedVaryingsMeshToPS VertexFunction(AttributesMesh inputMesh )
			{
				PackedVaryingsMeshToPS outputPackedVaryingsMeshToPS;
				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, outputPackedVaryingsMeshToPS);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( outputPackedVaryingsMeshToPS );

				float3 VertexPosition3588_g70929 = inputMesh.positionOS;
				half3 Mesh_PivotsOS2291_g70929 = half3(0,0,0);
				float3 temp_output_2283_0_g70929 = ( VertexPosition3588_g70929 - Mesh_PivotsOS2291_g70929 );
				half3 VertexPos40_g71005 = temp_output_2283_0_g70929;
				float3 appendResult74_g71005 = (float3(VertexPos40_g71005.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g71005 = appendResult74_g71005;
				float3 break84_g71005 = VertexPos40_g71005;
				float3 appendResult81_g71005 = (float3(0.0 , break84_g71005.y , break84_g71005.z));
				half3 VertexPosOtherAxis82_g71005 = appendResult81_g71005;
				float4 temp_output_91_19_g70965 = TVE_MotionCoords;
				float3 localObjectPosition_UNITY_MATRIX_M14_g70996 = ObjectPosition_UNITY_MATRIX_M();
				float3 appendResult60_g70954 = (float3(inputMesh.ase_texcoord3.x , inputMesh.ase_texcoord3.z , inputMesh.ase_texcoord3.y));
				half3 Mesh_PivotsData2831_g70929 = ( appendResult60_g70954 * _VertexPivotMode );
				float3 temp_output_122_0_g70996 = Mesh_PivotsData2831_g70929;
				float3 PivotsOnly105_g70996 = (mul( GetObjectToWorldMatrix(), float4( temp_output_122_0_g70996 , 0.0 ) ).xyz).xyz;
				#ifdef SHADEROPTIONS_CAMERA_RELATIVE_RENDERING
				float3 staticSwitch13_g70996 = ( ( localObjectPosition_UNITY_MATRIX_M14_g70996 + PivotsOnly105_g70996 ) + _WorldSpaceCameraPos );
				#else
				float3 staticSwitch13_g70996 = ( localObjectPosition_UNITY_MATRIX_M14_g70996 + PivotsOnly105_g70996 );
				#endif
				half3 ObjectData20_g70997 = staticSwitch13_g70996;
				float3 ase_worldPos = GetAbsolutePositionWS( TransformObjectToWorld( (inputMesh.positionOS).xyz ) );
				half3 WorldData19_g70997 = ase_worldPos;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g70997 = WorldData19_g70997;
				#else
				float3 staticSwitch14_g70997 = ObjectData20_g70997;
				#endif
				float3 temp_output_114_0_g70996 = staticSwitch14_g70997;
				float3 vertexToFrag4224_g70929 = temp_output_114_0_g70996;
				half3 ObjectData20_g70970 = vertexToFrag4224_g70929;
				float3 vertexToFrag3890_g70929 = ase_worldPos;
				half3 WorldData19_g70970 = vertexToFrag3890_g70929;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g70970 = WorldData19_g70970;
				#else
				float3 staticSwitch14_g70970 = ObjectData20_g70970;
				#endif
				float3 ObjectPosition4223_g70929 = staticSwitch14_g70970;
				half2 UV94_g70965 = ( (temp_output_91_19_g70965).zw + ( (temp_output_91_19_g70965).xy * (ObjectPosition4223_g70929).xz ) );
				float temp_output_84_0_g70965 = _LayerMotionValue;
				float4 lerpResult107_g70965 = lerp( TVE_MotionParams , saturate( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_MotionTex, sampler_linear_repeat, UV94_g70965,temp_output_84_0_g70965, 0.0 ) ) , TVE_MotionUsage[(int)temp_output_84_0_g70965]);
				half4 Global_Motion_Params3909_g70929 = lerpResult107_g70965;
				float4 break322_g70972 = Global_Motion_Params3909_g70929;
				float3 appendResult397_g70972 = (float3(break322_g70972.x , 0.0 , break322_g70972.y));
				float3 temp_output_398_0_g70972 = (appendResult397_g70972*2.0 + -1.0);
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				half2 Global_MotionDirectionOS39_g70929 = (( mul( GetWorldToObjectMatrix(), float4( temp_output_398_0_g70972 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_DirectionOS358_g71001 = Global_MotionDirectionOS39_g70929;
				half Mesh_Height1524_g70929 = inputMesh.ase_color.a;
				half Mesh_Height114_g70956 = Mesh_Height1524_g70929;
				half ObjectData20_g70957 = ( Mesh_Height114_g70956 * 2.0 );
				float enc62_g70955 = inputMesh.ase_texcoord.w;
				float2 localDecodeFloatToVector262_g70955 = DecodeFloatToVector2( enc62_g70955 );
				float2 break63_g70955 = ( localDecodeFloatToVector262_g70955 * 100.0 );
				float Bounds_Height5230_g70929 = break63_g70955.x;
				float Bounds_Height117_g70956 = Bounds_Height5230_g70929;
				half WorldData19_g70957 = ( ( Mesh_Height114_g70956 * Mesh_Height114_g70956 ) * Bounds_Height117_g70956 * 2.0 );
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g70957 = WorldData19_g70957;
				#else
				float staticSwitch14_g70957 = ObjectData20_g70957;
				#endif
				half Motion_10_Mask5242_g70929 = staticSwitch14_g70957;
				half Wind_Power369_g70972 = break322_g70972.z;
				half Global_MotionPower2223_g70929 = Wind_Power369_g70972;
				half3 Input_Position419_g70975 = -ObjectPosition4223_g70929;
				half2 Global_MotionDirectionWS4683_g70929 = (temp_output_398_0_g70972).xz;
				half2 Input_DirectionWS423_g70975 = Global_MotionDirectionWS4683_g70929;
				float Motion_Scale287_g70975 = ( _MotionScale_10 + 0.2 );
				half Global_Scale448_g70975 = TVE_NoiseParams.x;
				half Input_Speed62_g70975 = _MotionSpeed_10;
				half Global_Speed449_g70975 = TVE_NoiseParams.y;
				float mulTime426_g70975 = _TimeParameters.x * ( Input_Speed62_g70975 * Global_Speed449_g70975 );
				half Global_DistScale561_g70975 = TVE_NoiseParams.w;
				float3 break461_g70975 = ( Input_Position419_g70975 * Global_DistScale561_g70975 );
				half Global_DistAmplitude559_g70975 = TVE_NoiseParams.z;
				float Noise_Distortion469_g70975 = ( sin( ( break461_g70975.x + break461_g70975.z ) ) * Global_DistAmplitude559_g70975 );
				float3 break111_g70958 = ObjectPosition4223_g70929;
				half Global_DynamicMode5112_g70929 = _VertexDynamicMode;
				half Input_DynamicMode120_g70958 = Global_DynamicMode5112_g70929;
				float Mesh_Variation16_g70929 = inputMesh.ase_color.r;
				half Input_Variation124_g70958 = Mesh_Variation16_g70929;
				half ObjectData20_g70959 = frac( ( ( ( break111_g70958.x + break111_g70958.y + break111_g70958.z ) * ( 1.0 - Input_DynamicMode120_g70958 ) ) + Input_Variation124_g70958 ) );
				half WorldData19_g70959 = Input_Variation124_g70958;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g70959 = WorldData19_g70959;
				#else
				float staticSwitch14_g70959 = ObjectData20_g70959;
				#endif
				float clampResult129_g70958 = clamp( staticSwitch14_g70959 , 0.01 , 0.99 );
				half Global_MeshVariation5104_g70929 = clampResult129_g70958;
				half Motion_Variation284_g70975 = ( _MotionVariation_10 * Global_MeshVariation5104_g70929 );
				float2 temp_output_425_0_g70975 = ( ( (Input_Position419_g70975).xz * Input_DirectionWS423_g70975 * Motion_Scale287_g70975 * Global_Scale448_g70975 ) + ( mulTime426_g70975 + Noise_Distortion469_g70975 + Motion_Variation284_g70975 ) );
				float2 break500_g70975 = ( temp_output_425_0_g70975 * 0.1178 );
				float2 break494_g70975 = ( temp_output_425_0_g70975 * 0.1742 );
				half Input_WindPower327_g70975 = Global_MotionPower2223_g70929;
				float lerpResult430_g70975 = lerp( 1.4 , 0.4 , Input_WindPower327_g70975);
				half Global_MotionNoise34_g70929 = (pow( (( sin( ( break500_g70975.x + break500_g70975.y ) ) * sin( ( break494_g70975.x + break494_g70975.y ) ) )*0.4 + 0.6) , lerpResult430_g70975 )*1.2 + -0.2);
				half Motion_10_Amplitude2258_g70929 = ( _MotionAmplitude_10 * Motion_10_Mask5242_g70929 * Global_MotionPower2223_g70929 * Global_MotionNoise34_g70929 );
				half Input_BendingAmplitude376_g71001 = Motion_10_Amplitude2258_g70929;
				half Input_InteractionAmplitude58_g71001 = _InteractionAmplitude;
				half Input_MeshMotion_10321_g71001 = Motion_10_Mask5242_g70929;
				half Input_InteractionUseMask62_g71001 = _InteractionMaskValue;
				float lerpResult371_g71001 = lerp( 2.0 , Input_MeshMotion_10321_g71001 , Input_InteractionUseMask62_g71001);
				half ObjectData20_g71002 = lerpResult371_g71001;
				half WorldData19_g71002 = Input_MeshMotion_10321_g71001;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g71002 = WorldData19_g71002;
				#else
				float staticSwitch14_g71002 = ObjectData20_g71002;
				#endif
				half Motion_10_Interaction373_g71001 = ( Input_InteractionAmplitude58_g71001 * staticSwitch14_g71002 );
				half Global_InteractionMask66_g70929 = ( break322_g70972.w * break322_g70972.w );
				float Input_InteractionMask330_g71001 = Global_InteractionMask66_g70929;
				float lerpResult360_g71001 = lerp( Input_BendingAmplitude376_g71001 , Motion_10_Interaction373_g71001 , saturate( ( Input_InteractionAmplitude58_g71001 * Input_InteractionMask330_g71001 ) ));
				float2 break364_g71001 = ( Input_DirectionOS358_g71001 * lerpResult360_g71001 );
				half Motion_10_BendingZ190_g70929 = break364_g71001.y;
				half Angle44_g71005 = Motion_10_BendingZ190_g70929;
				half3 VertexPos40_g71004 = ( VertexPosRotationAxis50_g71005 + ( VertexPosOtherAxis82_g71005 * cos( Angle44_g71005 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g71005 ) * sin( Angle44_g71005 ) ) );
				float3 appendResult74_g71004 = (float3(0.0 , 0.0 , VertexPos40_g71004.z));
				half3 VertexPosRotationAxis50_g71004 = appendResult74_g71004;
				float3 break84_g71004 = VertexPos40_g71004;
				float3 appendResult81_g71004 = (float3(break84_g71004.x , break84_g71004.y , 0.0));
				half3 VertexPosOtherAxis82_g71004 = appendResult81_g71004;
				half Motion_10_BendingX216_g70929 = break364_g71001.x;
				half Angle44_g71004 = -Motion_10_BendingX216_g70929;
				half Input_Scale321_g70944 = _MotionScale_20;
				half Input_Variation330_g70944 = ( _MotionVariation_20 * Global_MeshVariation5104_g70929 );
				half Input_Speed62_g70944 = _MotionSpeed_20;
				float mulTime349_g70944 = _TimeParameters.x * Input_Speed62_g70944;
				float temp_output_302_0_g70944 = sin( ( ( ( ase_worldPos.x + ase_worldPos.y + ase_worldPos.z ) * Input_Scale321_g70944 ) + Input_Variation330_g70944 + mulTime349_g70944 ) );
				float enc59_g70955 = inputMesh.ase_texcoord.z;
				float2 localDecodeFloatToVector259_g70955 = DecodeFloatToVector2( enc59_g70955 );
				float2 break61_g70955 = localDecodeFloatToVector259_g70955;
				half Mesh_Motion_2060_g70929 = break61_g70955.x;
				half Mesh_Motion_20115_g70956 = Mesh_Motion_2060_g70929;
				float Bounds_Radius5231_g70929 = break63_g70955.y;
				float Bounds_Radius118_g70956 = Bounds_Radius5231_g70929;
				half Motion_20_Mask5243_g70929 = ( Mesh_Motion_20115_g70956 * Bounds_Radius118_g70956 );
				half3 Input_Position419_g70960 = VertexPosition3588_g70929;
				float3 normalizeResult518_g70960 = normalize( Input_Position419_g70960 );
				half2 Input_DirectionOS423_g70960 = Global_MotionDirectionOS39_g70929;
				float2 break521_g70960 = -Input_DirectionOS423_g70960;
				float3 appendResult522_g70960 = (float3(break521_g70960.x , 0.0 , break521_g70960.y));
				float dotResult519_g70960 = dot( normalizeResult518_g70960 , appendResult522_g70960 );
				half Input_Mask62_g70960 = _MotionFacingValue;
				float lerpResult524_g70960 = lerp( 1.0 , (dotResult519_g70960*0.5 + 0.5) , Input_Mask62_g70960);
				half ObjectData20_g70961 = lerpResult524_g70960;
				half WorldData19_g70961 = 1.0;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g70961 = WorldData19_g70961;
				#else
				float staticSwitch14_g70961 = ObjectData20_g70961;
				#endif
				half Motion_FacingMask5214_g70929 = staticSwitch14_g70961;
				half Motion_20_Amplitude4381_g70929 = ( _MotionAmplitude_20 * _MotionValue_20 * Motion_20_Mask5243_g70929 * Global_MotionPower2223_g70929 * Global_MotionNoise34_g70929 * Motion_FacingMask5214_g70929 );
				half Input_Amplitude58_g70944 = Motion_20_Amplitude4381_g70929;
				half2 Input_DirectionOS366_g70944 = Global_MotionDirectionOS39_g70929;
				float2 break371_g70944 = Input_DirectionOS366_g70944;
				float3 appendResult372_g70944 = (float3(break371_g70944.x , ( temp_output_302_0_g70944 * 0.1 ) , break371_g70944.y));
				half3 Motion_20_Squash4418_g70929 = ( ( (temp_output_302_0_g70944*0.2 + 1.0) * Input_Amplitude58_g70944 ) * appendResult372_g70944 );
				float3 Vertex_Motion_Object833_g70929 = ( ( VertexPosRotationAxis50_g71004 + ( VertexPosOtherAxis82_g71004 * cos( Angle44_g71004 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g71004 ) * sin( Angle44_g71004 ) ) ) + Motion_20_Squash4418_g70929 );
				float3 temp_output_3474_0_g70929 = ( VertexPosition3588_g70929 - Mesh_PivotsOS2291_g70929 );
				float3 appendResult2043_g70929 = (float3(Motion_10_BendingX216_g70929 , 0.0 , Motion_10_BendingZ190_g70929));
				float3 Vertex_Motion_World1118_g70929 = ( ( temp_output_3474_0_g70929 + appendResult2043_g70929 ) + Motion_20_Squash4418_g70929 );
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch4976_g70929 = Vertex_Motion_World1118_g70929;
				#else
				float3 staticSwitch4976_g70929 = ( Vertex_Motion_Object833_g70929 + ( _VertexDataMode * 0.0 ) );
				#endif
				float4 temp_output_94_19_g70988 = TVE_VertexCoords;
				half2 UV97_g70988 = ( (temp_output_94_19_g70988).zw + ( (temp_output_94_19_g70988).xy * (ObjectPosition4223_g70929).xz ) );
				float temp_output_84_0_g70988 = _LayerVertexValue;
				float4 lerpResult109_g70988 = lerp( TVE_VertexParams , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_VertexTex, sampler_linear_repeat, UV97_g70988,temp_output_84_0_g70988, 0.0 ) , TVE_VertexUsage[(int)temp_output_84_0_g70988]);
				half4 Global_Object_Params4173_g70929 = lerpResult109_g70988;
				half Global_VertexSize174_g70929 = saturate( Global_Object_Params4173_g70929.w );
				float lerpResult346_g70929 = lerp( 1.0 , Global_VertexSize174_g70929 , _GlobalSize);
				float3 appendResult3480_g70929 = (float3(lerpResult346_g70929 , lerpResult346_g70929 , lerpResult346_g70929));
				half3 ObjectData20_g70964 = appendResult3480_g70929;
				half3 _Vector11 = half3(1,1,1);
				half3 WorldData19_g70964 = _Vector11;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g70964 = WorldData19_g70964;
				#else
				float3 staticSwitch14_g70964 = ObjectData20_g70964;
				#endif
				half3 Vertex_Size1741_g70929 = staticSwitch14_g70964;
				half3 _Vector5 = half3(1,1,1);
				float3 Vertex_SizeFade1740_g70929 = _Vector5;
				half3 Grass_Perspective2661_g70929 = half3(0,0,0);
				float3 lerpResult16_g70963 = lerp( VertexPosition3588_g70929 , ( ( staticSwitch4976_g70929 * Vertex_Size1741_g70929 * Vertex_SizeFade1740_g70929 ) + Mesh_PivotsOS2291_g70929 + Grass_Perspective2661_g70929 ) , TVE_Enabled);
				float3 Final_VertexPosition890_g70929 = ( lerpResult16_g70963 + _DisableSRPBatcher );
				
				float temp_output_7_0_g70945 = TVE_CameraFadeStart;
				float lerpResult4755_g70929 = lerp( 1.0 , saturate( ( ( distance( ase_worldPos , _WorldSpaceCameraPos ) - temp_output_7_0_g70945 ) / ( TVE_CameraFadeEnd - temp_output_7_0_g70945 ) ) ) , _FadeCameraValue);
				float vertexToFrag11_g70951 = lerpResult4755_g70929;
				outputPackedVaryingsMeshToPS.ase_texcoord1.x = vertexToFrag11_g70951;
				outputPackedVaryingsMeshToPS.ase_texcoord1.yzw = vertexToFrag3890_g70929;
				
				outputPackedVaryingsMeshToPS.ase_texcoord2 = inputMesh.ase_texcoord;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue = Final_VertexPosition890_g70929;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif

				inputMesh.normalOS =  inputMesh.normalOS ;

				float3 positionRWS = TransformObjectToWorld(inputMesh.positionOS);
				outputPackedVaryingsMeshToPS.positionCS = TransformWorldToHClip(positionRWS);
				outputPackedVaryingsMeshToPS.positionRWS.xyz = positionRWS;
				return outputPackedVaryingsMeshToPS;
			}

			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float3 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl Vert ( AttributesMesh v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.positionOS = v.positionOS;
				o.normalOS = v.normalOS;
				o.ase_texcoord3 = v.ase_texcoord3;
				o.ase_color = v.ase_color;
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				float3 cameraPos = 0;
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), cameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, GetObjectToWorldMatrix(), cameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), cameraPos, _ScreenParams, _FrustumPlanes );
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
			PackedVaryingsMeshToPS DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				AttributesMesh o = (AttributesMesh) 0;
				o.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			PackedVaryingsMeshToPS Vert ( AttributesMesh v )
			{
				return VertexFunction( v );
			}
			#endif
			
			#if defined(WRITE_NORMAL_BUFFER) && defined(WRITE_MSAA_DEPTH)
			#define SV_TARGET_DECAL SV_Target2
			#elif defined(WRITE_NORMAL_BUFFER) || defined(WRITE_MSAA_DEPTH)
			#define SV_TARGET_DECAL SV_Target1
			#else
			#define SV_TARGET_DECAL SV_Target0
			#endif

			void Frag( PackedVaryingsMeshToPS packedInput
						#if defined(SCENESELECTIONPASS) || defined(SCENEPICKINGPASS)
						, out float4 outColor : SV_Target0
						#else
							#ifdef WRITE_MSAA_DEPTH
							, out float4 depthColor : SV_Target0
								#ifdef WRITE_NORMAL_BUFFER
								, out float4 outNormalBuffer : SV_Target1
								#endif
							#else
								#ifdef WRITE_NORMAL_BUFFER
								, out float4 outNormalBuffer : SV_Target0
								#endif
							#endif

							#if defined(WRITE_DECAL_BUFFER) && !defined(_DISABLE_DECALS)
							, out float4 outDecalBuffer : SV_TARGET_DECAL
							#endif
						#endif

						#if defined(_DEPTHOFFSET_ON) && !defined(SCENEPICKINGPASS)
						, out float outputDepth : SV_Depth
						#endif
						
					)
			{
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( packedInput );
				UNITY_SETUP_INSTANCE_ID( packedInput );

				float3 positionRWS = packedInput.positionRWS.xyz;

				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);

				input.tangentToWorld = k_identity3x3;
				input.positionSS = packedInput.positionCS;

				input.positionRWS = positionRWS;

				#if _DOUBLESIDED_ON && SHADER_STAGE_FRAGMENT
				input.isFrontFace = IS_FRONT_VFACE( packedInput.cullFace, true, false);
				#elif SHADER_STAGE_FRAGMENT
				#if defined(ASE_NEED_CULLFACE)
				input.isFrontFace = IS_FRONT_VFACE( packedInput.cullFace, true, false );
				#endif
				#endif
				half isFrontFace = input.isFrontFace;

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS);

				float3 V = GetWorldSpaceNormalizeViewDir(input.positionRWS);

				AlphaSurfaceDescription surfaceDescription = (AlphaSurfaceDescription)0;
				float localCustomAlphaClip9_g70962 = ( 0.0 );
				float vertexToFrag11_g70951 = packedInput.ase_texcoord1.x;
				half Fade_Camera_Mask5149_g70929 = 1.0;
				float lerpResult5141_g70929 = lerp( 1.0 , vertexToFrag11_g70951 , Fade_Camera_Mask5149_g70929);
				half Fade_Camera3743_g70929 = lerpResult5141_g70929;
				float temp_output_41_0_g70948 = ( 1.0 * Fade_Camera3743_g70929 );
				float3 vertexToFrag3890_g70929 = packedInput.ase_texcoord1.yzw;
				float3 WorldPosition3905_g70929 = vertexToFrag3890_g70929;
				half Final_AlphaFade3727_g70929 = saturate( ( temp_output_41_0_g70948 + ( temp_output_41_0_g70948 * tex3D( TVE_ScreenTex3D, ( TVE_ScreenTexCoord * WorldPosition3905_g70929 ) ).r ) ) );
				half2 Main_UVs15_g70929 = ( ( packedInput.ase_texcoord2.xy * (_MainUVs).xy ) + (_MainUVs).zw );
				float4 tex2DNode29_g70929 = tex2D( _MainAlbedoTex, Main_UVs15_g70929 );
				float Main_Alpha316_g70929 = ( _MainColor.a * tex2DNode29_g70929.a );
				half AlphaTreshold2132_g70929 = _AlphaClipValue;
				half Final_Alpha3754_g70929 = ( Main_Alpha316_g70929 - ( AlphaTreshold2132_g70929 - 0.5 ) );
				float temp_output_661_0_g70929 = ( Final_AlphaFade3727_g70929 * Final_Alpha3754_g70929 );
				float temp_output_3_0_g70949 = temp_output_661_0_g70929;
				half Offest27_g70949 = 0.5;
				half Feather30_g70949 = 0.5;
				float temp_output_3_0_g70962 = ( ( ( temp_output_3_0_g70949 - Offest27_g70949 ) / ( max( fwidth( temp_output_3_0_g70949 ) , 0.001 ) + Feather30_g70949 ) ) + Offest27_g70949 );
				float Alpha9_g70962 = temp_output_3_0_g70962;
				float temp_output_15_0_g70962 = 0.5;
				float Treshold9_g70962 = temp_output_15_0_g70962;
				{
				#if TVE_FEATURE_CLIP
				clip(Alpha9_g70962 - Treshold9_g70962);
				#endif
				}
				half Final_Clip914_g70929 = Alpha9_g70962;
				
				surfaceDescription.Alpha = Final_Clip914_g70929;

				#ifdef _ALPHATEST_ON
				surfaceDescription.AlphaClipThreshold = _AlphaCutoff;
				#endif

				#ifdef _ALPHATEST_SHADOW_ON
				surfaceDescription.AlphaClipThresholdShadow = 0.5;
				#endif

				#ifdef _DEPTHOFFSET_ON
				surfaceDescription.DepthOffset = 0;
				#endif

				SurfaceData surfaceData;
				BuiltinData builtinData;
				GetSurfaceAndBuiltinData(surfaceDescription, input, V, posInput, surfaceData, builtinData);

				#ifdef _DEPTHOFFSET_ON
				outputDepth = posInput.deviceDepth;
				float bias = max(abs(ddx(posInput.deviceDepth)), abs(ddy(posInput.deviceDepth))) * _SlopeScaleDepthBias;
				outputDepth += bias;
				#endif

				#ifdef WRITE_MSAA_DEPTH
				depthColor = packedInput.vmesh.positionCS.z;

				#ifdef _ALPHATOMASK_ON
				depthColor.a = SharpenAlpha(builtinData.opacity, builtinData.alphaClipTreshold);
				#endif
				#endif

				#if defined(WRITE_NORMAL_BUFFER)
				EncodeIntoNormalBuffer(ConvertSurfaceDataToNormalData(surfaceData), outNormalBuffer);
				#endif

				#if defined(WRITE_DECAL_BUFFER) && !defined(_DISABLE_DECALS)
				DecalPrepassData decalPrepassData;
				decalPrepassData.geomNormalWS = surfaceData.geomNormalWS;
				decalPrepassData.decalLayerMask = GetMeshRenderingDecalLayer();
				EncodeIntoDecalPrepassBuffer(decalPrepassData, outDecalBuffer);
				#endif
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "SceneSelectionPass"
			Tags { "LightMode"="SceneSelectionPass" }
			Cull Off

			HLSLPROGRAM

			#define _MATERIAL_FEATURE_SPECULAR_COLOR 1
			#define _ENERGY_CONSERVING_SPECULAR 1
			#pragma multi_compile _ DOTS_INSTANCING_ON
			#pragma multi_compile_instancing
			#pragma instancing_options renderinglayer
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#define ASE_ABSOLUTE_VERTEX_POS 1
			#define _AMBIENT_OCCLUSION 1
			#define HAVE_MESH_MODIFICATION
			#define ASE_SRP_VERSION 120100


			// Keyword for transparent
			#pragma shader_feature _SURFACE_TYPE_TRANSPARENT
			#pragma shader_feature_local_fragment _ _ENABLE_FOG_ON_TRANSPARENT
			#pragma shader_feature_local _ _TRANSPARENT_WRITES_MOTION_VEC

			#define SHADERPASS SHADERPASS_DEPTH_ONLY
			#define SCENESELECTIONPASS 1
			#pragma editor_sync_compilation

			#pragma vertex Vert
			#pragma fragment Frag

			//-------------------------------------------------------------------------------------
			// Define
			//-------------------------------------------------------------------------------------

			#if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define OUTPUT_SPLIT_LIGHTING
			#endif

            #if defined(_TRANSPARENT_WRITES_MOTION_VEC) && defined(_SURFACE_TYPE_TRANSPARENT)
            #define _WRITE_TRANSPARENT_MOTION_VECTOR
            #endif

			#if defined(SHADER_LIT) && !defined(_SURFACE_TYPE_TRANSPARENT)
            #define _DEFERRED_CAPABLE_MATERIAL
            #endif

            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl" 
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl" 
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphHeader.hlsl" 

			#ifdef DEBUG_DISPLAY
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
			#endif

			CBUFFER_START( UnityPerMaterial )
			half4 _SecondColor;
			half4 _MainColor;
			half4 _MainUVs;
			half4 _ColorsMaskRemap;
			half4 _SecondUVs;
			half4 _OverlayMaskRemap;
			float4 _Color;
			float4 _SubsurfaceDiffusion_Asset;
			float4 _MaxBoundsInfo;
			float4 _SubsurfaceDiffusion_asset;
			float4 _GradientMaskRemap;
			half4 _VertexOcclusionColor;
			half4 _SubsurfaceMaskRemap;
			half4 _AlphaMaskRemap;
			half4 _DetailBlendRemap;
			float4 _EmissiveIntensityParams;
			float4 _NoiseMaskRemap;
			half4 _EmissiveUVs;
			half4 _EmissiveColor;
			half4 _VertexOcclusionRemap;
			half3 _render_normals;
			half _render_dst;
			half _MotionSpeed_20;
			half _RenderDirect;
			half _MotionVariation_20;
			half _IsStandardShader;
			half _MotionScale_20;
			half _InteractionMaskValue;
			half _MotionVariation_10;
			half _VertexDynamicMode;
			float _MotionSpeed_10;
			half _render_src;
			half _MotionAmplitude_20;
			float _MotionScale_10;
			half _MotionAmplitude_10;
			half _LayerMotionValue;
			half _VertexPivotMode;
			half _InteractionAmplitude;
			half _MotionValue_20;
			half _render_zw;
			half _VertexDataMode;
			half _MainOcclusionValue;
			half _GlobalWetness;
			half _SecondSmoothnessValue;
			half _MainSmoothnessValue;
			half _GlobalEmissive;
			half _EmissiveExposureValue;
			half _RenderSpecular;
			half _SecondNormalValue;
			half _DetailNormalValue;
			half _MainNormalValue;
			half _VertexOcclusionMaxValue;
			half _VertexOcclusionMinValue;
			half _OverlayMaskMaxValue;
			half _OverlayMaskMinValue;
			half _LayerExtrasValue;
			half _ExtrasPositionMode;
			half _GlobalOverlay;
			half _DetailBlendMaxValue;
			half _DetailBlendMinValue;
			half _DetailMaskInvertMode;
			half _DetailMaskMode;
			half _DetailMeshValue;
			half _DetailCoordMode;
			half _GlobalSize;
			half _LayerVertexValue;
			half _MotionFacingValue;
			half _CategoryRender;
			half _SubsurfaceDirectValue;
			half _RenderSSR;
			half _CategoryOcclusion;
			half _MessageSizeFade;
			half _DetailTypeMode;
			half _CategoryGlobal;
			half _CategorySizeFade;
			half _CategoryPerspective;
			half _IsVersion;
			half _CategoryNoise;
			half _RenderMode;
			half _HasOcclusion;
			half _CategoryDetail;
			half _HasEmissive;
			half _CategoryMotion;
			half _SubsurfaceNormalValue;
			half _EmissiveFlagMode;
			half _SpaceMotionGlobals;
			half _SubsurfaceShadowValue;
			half _RenderCoverage;
			half _RenderPriority;
			float _SubsurfaceDiffusion;
			half _VertexRollingMode;
			half _Cutoff;
			half _SubsurfaceScatteringValue;
			half _render_cull;
			half _IsBarkShader;
			half _CategorySubsurface;
			half _SpaceGlobalPosition;
			half _RenderClip;
			half _MessageMotionVariation;
			half _RenderCull;
			half _SecondOcclusionValue;
			half _RenderZWrite;
			half _SubsurfaceAmbientValue;
			half _RenderQueue;
			half _SubsurfaceAngleValue;
			half _AlphaClipValue;
			half _VertexMasksMode;
			half _LayerReactValue;
			half _DetailBlendMode;
			half _VertexVariationMode;
			half _RenderDecals;
			half _RenderShadow;
			half _DetailMode;
			half _SpaceRenderFade;
			half _IsTVEShader;
			half _CategoryEmissive;
			half _RenderAmbient;
			half _CategoryMain;
			half _CategoryGradient;
			half _SpaceGlobalLocals;
			half _SpaceMotionLocals;
			half _SpaceGlobalLayers;
			half _RenderNormals;
			half _HasGradient;
			half _MessageGlobalsVariation;
			half _FadeCameraValue;
			float4 _EmissionColor;
			float _AlphaCutoff;
			float _RenderQueueType;
			#ifdef _ADD_PRECOMPUTED_VELOCITY
			float _AddPrecomputedVelocity;
			#endif
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilRefDistortionVec;
			float _StencilWriteMaskDistortionVec;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
			float _SrcBlend;
			float _DstBlend;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _TransparentZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _EnableFogOnTransparent;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			sampler2D _BumpMap;
			half TVE_Enabled;
			sampler2D _MainTex;
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
			half TVE_CameraFadeStart;
			half TVE_CameraFadeEnd;
			sampler3D TVE_ScreenTex3D;
			half TVE_ScreenTexCoord;
			sampler2D _MainAlbedoTex;


			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/PickingSpaceTransforms.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"

			#define ASE_NEEDS_VERT_POSITION
			#pragma shader_feature_local TVE_FEATURE_CLIP
			#pragma shader_feature_local TVE_FEATURE_BATCHING
			//TVE Pipeline Defines
			#define THE_VEGETATION_ENGINE
			#define TVE_IS_HD_PIPELINE
			//TVE HD Pipeline Defines
			#pragma shader_feature_local _DISABLE_DECALS
			#pragma shader_feature_local _DISABLE_SSR
			//TVE Injection Defines
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END
			//TVE Shader Type Defines
			#define TVE_IS_VEGETATION_SHADER


			#if defined(_DOUBLESIDED_ON) && !defined(ASE_NEED_CULLFACE)
				#define ASE_NEED_CULLFACE 1
			#endif

			struct AttributesMesh
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryingsMeshToPS
			{
				float4 positionCS : SV_Position;
				float3 positionRWS : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
				#if defined(SHADER_STAGE_FRAGMENT) && defined(ASE_NEED_CULLFACE)
				FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
				#endif
			};

			int _ObjectId;
			int _PassValue;

			float3 ObjectPosition_UNITY_MATRIX_M(  )
			{
				return float3(UNITY_MATRIX_M[0].w, UNITY_MATRIX_M[1].w, UNITY_MATRIX_M[2].w );
			}
			
			float2 DecodeFloatToVector2( float enc )
			{
				float2 result ;
				result.y = enc % 2048;
				result.x = floor(enc / 2048);
				return result / (2048 - 1);
			}
			

			void BuildSurfaceData(FragInputs fragInputs, inout SceneSurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData, out float3 bentNormalWS)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);

				surfaceData.specularOcclusion = 1.0;

				// surface data

				// refraction
				#ifdef _HAS_REFRACTION
				if( _EnableSSRefraction )
				{
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


				// material features
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

				// others
				#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
				surfaceData.baseColor *= ( 1.0 - Max3( surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b ) );
				#endif
				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				// normals
				float3 normalTS = float3(0.0f, 0.0f, 1.0f);
				GetNormalWS( fragInputs, normalTS, surfaceData.normalWS, doubleSidedConstants );

				surfaceData.geomNormalWS = fragInputs.tangentToWorld[2];
				surfaceData.tangentWS = normalize( fragInputs.tangentToWorld[ 0 ].xyz );

				// decals
				#if HAVE_DECALS
				if( _EnableDecals )
				{
					DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, surfaceDescription.Alpha);
					ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData);
				}
				#endif

				bentNormalWS = surfaceData.normalWS;
				surfaceData.tangentWS = Orthonormalize( surfaceData.tangentWS, surfaceData.normalWS );

				#if defined(_SPECULAR_OCCLUSION_CUSTOM)
				#elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO( V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness( surfaceData.perceptualSmoothness ) );
				#elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion( ClampNdotV( dot( surfaceData.normalWS, V ) ), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness( surfaceData.perceptualSmoothness ) );
				#endif

				// debug
				#if defined(DEBUG_DISPLAY)
				if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
				{
					surfaceData.metallic = 0;
				}
				ApplyDebugToSurfaceData(fragInputs.tangentToWorld, surfaceData);
				#endif
			}

			void GetSurfaceAndBuiltinData(SceneSurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				#ifdef LOD_FADE_CROSSFADE
				LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
				#endif

				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				ApplyDoubleSidedFlipOrMirror( fragInputs, doubleSidedConstants );

				#ifdef _ALPHATEST_ON
				DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif

				#ifdef _DEPTHOFFSET_ON
				builtinData.depthOffset = surfaceDescription.DepthOffset;
				ApplyDepthOffsetPositionInput( V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput );
				#endif

				float3 bentNormalWS;
				BuildSurfaceData( fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS );

				InitBuiltinData( posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[ 2 ], fragInputs.texCoord1, fragInputs.texCoord2, builtinData );

				PostInitBuiltinData(V, posInput, surfaceData, builtinData);
			}

			PackedVaryingsMeshToPS VertexFunction(AttributesMesh inputMesh )
			{
				PackedVaryingsMeshToPS outputPackedVaryingsMeshToPS;
				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, outputPackedVaryingsMeshToPS);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( outputPackedVaryingsMeshToPS );

				float3 VertexPosition3588_g70929 = inputMesh.positionOS;
				half3 Mesh_PivotsOS2291_g70929 = half3(0,0,0);
				float3 temp_output_2283_0_g70929 = ( VertexPosition3588_g70929 - Mesh_PivotsOS2291_g70929 );
				half3 VertexPos40_g71005 = temp_output_2283_0_g70929;
				float3 appendResult74_g71005 = (float3(VertexPos40_g71005.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g71005 = appendResult74_g71005;
				float3 break84_g71005 = VertexPos40_g71005;
				float3 appendResult81_g71005 = (float3(0.0 , break84_g71005.y , break84_g71005.z));
				half3 VertexPosOtherAxis82_g71005 = appendResult81_g71005;
				float4 temp_output_91_19_g70965 = TVE_MotionCoords;
				float3 localObjectPosition_UNITY_MATRIX_M14_g70996 = ObjectPosition_UNITY_MATRIX_M();
				float3 appendResult60_g70954 = (float3(inputMesh.ase_texcoord3.x , inputMesh.ase_texcoord3.z , inputMesh.ase_texcoord3.y));
				half3 Mesh_PivotsData2831_g70929 = ( appendResult60_g70954 * _VertexPivotMode );
				float3 temp_output_122_0_g70996 = Mesh_PivotsData2831_g70929;
				float3 PivotsOnly105_g70996 = (mul( GetObjectToWorldMatrix(), float4( temp_output_122_0_g70996 , 0.0 ) ).xyz).xyz;
				#ifdef SHADEROPTIONS_CAMERA_RELATIVE_RENDERING
				float3 staticSwitch13_g70996 = ( ( localObjectPosition_UNITY_MATRIX_M14_g70996 + PivotsOnly105_g70996 ) + _WorldSpaceCameraPos );
				#else
				float3 staticSwitch13_g70996 = ( localObjectPosition_UNITY_MATRIX_M14_g70996 + PivotsOnly105_g70996 );
				#endif
				half3 ObjectData20_g70997 = staticSwitch13_g70996;
				float3 ase_worldPos = GetAbsolutePositionWS( TransformObjectToWorld( (inputMesh.positionOS).xyz ) );
				half3 WorldData19_g70997 = ase_worldPos;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g70997 = WorldData19_g70997;
				#else
				float3 staticSwitch14_g70997 = ObjectData20_g70997;
				#endif
				float3 temp_output_114_0_g70996 = staticSwitch14_g70997;
				float3 vertexToFrag4224_g70929 = temp_output_114_0_g70996;
				half3 ObjectData20_g70970 = vertexToFrag4224_g70929;
				float3 vertexToFrag3890_g70929 = ase_worldPos;
				half3 WorldData19_g70970 = vertexToFrag3890_g70929;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g70970 = WorldData19_g70970;
				#else
				float3 staticSwitch14_g70970 = ObjectData20_g70970;
				#endif
				float3 ObjectPosition4223_g70929 = staticSwitch14_g70970;
				half2 UV94_g70965 = ( (temp_output_91_19_g70965).zw + ( (temp_output_91_19_g70965).xy * (ObjectPosition4223_g70929).xz ) );
				float temp_output_84_0_g70965 = _LayerMotionValue;
				float4 lerpResult107_g70965 = lerp( TVE_MotionParams , saturate( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_MotionTex, sampler_linear_repeat, UV94_g70965,temp_output_84_0_g70965, 0.0 ) ) , TVE_MotionUsage[(int)temp_output_84_0_g70965]);
				half4 Global_Motion_Params3909_g70929 = lerpResult107_g70965;
				float4 break322_g70972 = Global_Motion_Params3909_g70929;
				float3 appendResult397_g70972 = (float3(break322_g70972.x , 0.0 , break322_g70972.y));
				float3 temp_output_398_0_g70972 = (appendResult397_g70972*2.0 + -1.0);
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				half2 Global_MotionDirectionOS39_g70929 = (( mul( GetWorldToObjectMatrix(), float4( temp_output_398_0_g70972 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_DirectionOS358_g71001 = Global_MotionDirectionOS39_g70929;
				half Mesh_Height1524_g70929 = inputMesh.ase_color.a;
				half Mesh_Height114_g70956 = Mesh_Height1524_g70929;
				half ObjectData20_g70957 = ( Mesh_Height114_g70956 * 2.0 );
				float enc62_g70955 = inputMesh.ase_texcoord.w;
				float2 localDecodeFloatToVector262_g70955 = DecodeFloatToVector2( enc62_g70955 );
				float2 break63_g70955 = ( localDecodeFloatToVector262_g70955 * 100.0 );
				float Bounds_Height5230_g70929 = break63_g70955.x;
				float Bounds_Height117_g70956 = Bounds_Height5230_g70929;
				half WorldData19_g70957 = ( ( Mesh_Height114_g70956 * Mesh_Height114_g70956 ) * Bounds_Height117_g70956 * 2.0 );
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g70957 = WorldData19_g70957;
				#else
				float staticSwitch14_g70957 = ObjectData20_g70957;
				#endif
				half Motion_10_Mask5242_g70929 = staticSwitch14_g70957;
				half Wind_Power369_g70972 = break322_g70972.z;
				half Global_MotionPower2223_g70929 = Wind_Power369_g70972;
				half3 Input_Position419_g70975 = -ObjectPosition4223_g70929;
				half2 Global_MotionDirectionWS4683_g70929 = (temp_output_398_0_g70972).xz;
				half2 Input_DirectionWS423_g70975 = Global_MotionDirectionWS4683_g70929;
				float Motion_Scale287_g70975 = ( _MotionScale_10 + 0.2 );
				half Global_Scale448_g70975 = TVE_NoiseParams.x;
				half Input_Speed62_g70975 = _MotionSpeed_10;
				half Global_Speed449_g70975 = TVE_NoiseParams.y;
				float mulTime426_g70975 = _TimeParameters.x * ( Input_Speed62_g70975 * Global_Speed449_g70975 );
				half Global_DistScale561_g70975 = TVE_NoiseParams.w;
				float3 break461_g70975 = ( Input_Position419_g70975 * Global_DistScale561_g70975 );
				half Global_DistAmplitude559_g70975 = TVE_NoiseParams.z;
				float Noise_Distortion469_g70975 = ( sin( ( break461_g70975.x + break461_g70975.z ) ) * Global_DistAmplitude559_g70975 );
				float3 break111_g70958 = ObjectPosition4223_g70929;
				half Global_DynamicMode5112_g70929 = _VertexDynamicMode;
				half Input_DynamicMode120_g70958 = Global_DynamicMode5112_g70929;
				float Mesh_Variation16_g70929 = inputMesh.ase_color.r;
				half Input_Variation124_g70958 = Mesh_Variation16_g70929;
				half ObjectData20_g70959 = frac( ( ( ( break111_g70958.x + break111_g70958.y + break111_g70958.z ) * ( 1.0 - Input_DynamicMode120_g70958 ) ) + Input_Variation124_g70958 ) );
				half WorldData19_g70959 = Input_Variation124_g70958;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g70959 = WorldData19_g70959;
				#else
				float staticSwitch14_g70959 = ObjectData20_g70959;
				#endif
				float clampResult129_g70958 = clamp( staticSwitch14_g70959 , 0.01 , 0.99 );
				half Global_MeshVariation5104_g70929 = clampResult129_g70958;
				half Motion_Variation284_g70975 = ( _MotionVariation_10 * Global_MeshVariation5104_g70929 );
				float2 temp_output_425_0_g70975 = ( ( (Input_Position419_g70975).xz * Input_DirectionWS423_g70975 * Motion_Scale287_g70975 * Global_Scale448_g70975 ) + ( mulTime426_g70975 + Noise_Distortion469_g70975 + Motion_Variation284_g70975 ) );
				float2 break500_g70975 = ( temp_output_425_0_g70975 * 0.1178 );
				float2 break494_g70975 = ( temp_output_425_0_g70975 * 0.1742 );
				half Input_WindPower327_g70975 = Global_MotionPower2223_g70929;
				float lerpResult430_g70975 = lerp( 1.4 , 0.4 , Input_WindPower327_g70975);
				half Global_MotionNoise34_g70929 = (pow( (( sin( ( break500_g70975.x + break500_g70975.y ) ) * sin( ( break494_g70975.x + break494_g70975.y ) ) )*0.4 + 0.6) , lerpResult430_g70975 )*1.2 + -0.2);
				half Motion_10_Amplitude2258_g70929 = ( _MotionAmplitude_10 * Motion_10_Mask5242_g70929 * Global_MotionPower2223_g70929 * Global_MotionNoise34_g70929 );
				half Input_BendingAmplitude376_g71001 = Motion_10_Amplitude2258_g70929;
				half Input_InteractionAmplitude58_g71001 = _InteractionAmplitude;
				half Input_MeshMotion_10321_g71001 = Motion_10_Mask5242_g70929;
				half Input_InteractionUseMask62_g71001 = _InteractionMaskValue;
				float lerpResult371_g71001 = lerp( 2.0 , Input_MeshMotion_10321_g71001 , Input_InteractionUseMask62_g71001);
				half ObjectData20_g71002 = lerpResult371_g71001;
				half WorldData19_g71002 = Input_MeshMotion_10321_g71001;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g71002 = WorldData19_g71002;
				#else
				float staticSwitch14_g71002 = ObjectData20_g71002;
				#endif
				half Motion_10_Interaction373_g71001 = ( Input_InteractionAmplitude58_g71001 * staticSwitch14_g71002 );
				half Global_InteractionMask66_g70929 = ( break322_g70972.w * break322_g70972.w );
				float Input_InteractionMask330_g71001 = Global_InteractionMask66_g70929;
				float lerpResult360_g71001 = lerp( Input_BendingAmplitude376_g71001 , Motion_10_Interaction373_g71001 , saturate( ( Input_InteractionAmplitude58_g71001 * Input_InteractionMask330_g71001 ) ));
				float2 break364_g71001 = ( Input_DirectionOS358_g71001 * lerpResult360_g71001 );
				half Motion_10_BendingZ190_g70929 = break364_g71001.y;
				half Angle44_g71005 = Motion_10_BendingZ190_g70929;
				half3 VertexPos40_g71004 = ( VertexPosRotationAxis50_g71005 + ( VertexPosOtherAxis82_g71005 * cos( Angle44_g71005 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g71005 ) * sin( Angle44_g71005 ) ) );
				float3 appendResult74_g71004 = (float3(0.0 , 0.0 , VertexPos40_g71004.z));
				half3 VertexPosRotationAxis50_g71004 = appendResult74_g71004;
				float3 break84_g71004 = VertexPos40_g71004;
				float3 appendResult81_g71004 = (float3(break84_g71004.x , break84_g71004.y , 0.0));
				half3 VertexPosOtherAxis82_g71004 = appendResult81_g71004;
				half Motion_10_BendingX216_g70929 = break364_g71001.x;
				half Angle44_g71004 = -Motion_10_BendingX216_g70929;
				half Input_Scale321_g70944 = _MotionScale_20;
				half Input_Variation330_g70944 = ( _MotionVariation_20 * Global_MeshVariation5104_g70929 );
				half Input_Speed62_g70944 = _MotionSpeed_20;
				float mulTime349_g70944 = _TimeParameters.x * Input_Speed62_g70944;
				float temp_output_302_0_g70944 = sin( ( ( ( ase_worldPos.x + ase_worldPos.y + ase_worldPos.z ) * Input_Scale321_g70944 ) + Input_Variation330_g70944 + mulTime349_g70944 ) );
				float enc59_g70955 = inputMesh.ase_texcoord.z;
				float2 localDecodeFloatToVector259_g70955 = DecodeFloatToVector2( enc59_g70955 );
				float2 break61_g70955 = localDecodeFloatToVector259_g70955;
				half Mesh_Motion_2060_g70929 = break61_g70955.x;
				half Mesh_Motion_20115_g70956 = Mesh_Motion_2060_g70929;
				float Bounds_Radius5231_g70929 = break63_g70955.y;
				float Bounds_Radius118_g70956 = Bounds_Radius5231_g70929;
				half Motion_20_Mask5243_g70929 = ( Mesh_Motion_20115_g70956 * Bounds_Radius118_g70956 );
				half3 Input_Position419_g70960 = VertexPosition3588_g70929;
				float3 normalizeResult518_g70960 = normalize( Input_Position419_g70960 );
				half2 Input_DirectionOS423_g70960 = Global_MotionDirectionOS39_g70929;
				float2 break521_g70960 = -Input_DirectionOS423_g70960;
				float3 appendResult522_g70960 = (float3(break521_g70960.x , 0.0 , break521_g70960.y));
				float dotResult519_g70960 = dot( normalizeResult518_g70960 , appendResult522_g70960 );
				half Input_Mask62_g70960 = _MotionFacingValue;
				float lerpResult524_g70960 = lerp( 1.0 , (dotResult519_g70960*0.5 + 0.5) , Input_Mask62_g70960);
				half ObjectData20_g70961 = lerpResult524_g70960;
				half WorldData19_g70961 = 1.0;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g70961 = WorldData19_g70961;
				#else
				float staticSwitch14_g70961 = ObjectData20_g70961;
				#endif
				half Motion_FacingMask5214_g70929 = staticSwitch14_g70961;
				half Motion_20_Amplitude4381_g70929 = ( _MotionAmplitude_20 * _MotionValue_20 * Motion_20_Mask5243_g70929 * Global_MotionPower2223_g70929 * Global_MotionNoise34_g70929 * Motion_FacingMask5214_g70929 );
				half Input_Amplitude58_g70944 = Motion_20_Amplitude4381_g70929;
				half2 Input_DirectionOS366_g70944 = Global_MotionDirectionOS39_g70929;
				float2 break371_g70944 = Input_DirectionOS366_g70944;
				float3 appendResult372_g70944 = (float3(break371_g70944.x , ( temp_output_302_0_g70944 * 0.1 ) , break371_g70944.y));
				half3 Motion_20_Squash4418_g70929 = ( ( (temp_output_302_0_g70944*0.2 + 1.0) * Input_Amplitude58_g70944 ) * appendResult372_g70944 );
				float3 Vertex_Motion_Object833_g70929 = ( ( VertexPosRotationAxis50_g71004 + ( VertexPosOtherAxis82_g71004 * cos( Angle44_g71004 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g71004 ) * sin( Angle44_g71004 ) ) ) + Motion_20_Squash4418_g70929 );
				float3 temp_output_3474_0_g70929 = ( VertexPosition3588_g70929 - Mesh_PivotsOS2291_g70929 );
				float3 appendResult2043_g70929 = (float3(Motion_10_BendingX216_g70929 , 0.0 , Motion_10_BendingZ190_g70929));
				float3 Vertex_Motion_World1118_g70929 = ( ( temp_output_3474_0_g70929 + appendResult2043_g70929 ) + Motion_20_Squash4418_g70929 );
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch4976_g70929 = Vertex_Motion_World1118_g70929;
				#else
				float3 staticSwitch4976_g70929 = ( Vertex_Motion_Object833_g70929 + ( _VertexDataMode * 0.0 ) );
				#endif
				float4 temp_output_94_19_g70988 = TVE_VertexCoords;
				half2 UV97_g70988 = ( (temp_output_94_19_g70988).zw + ( (temp_output_94_19_g70988).xy * (ObjectPosition4223_g70929).xz ) );
				float temp_output_84_0_g70988 = _LayerVertexValue;
				float4 lerpResult109_g70988 = lerp( TVE_VertexParams , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_VertexTex, sampler_linear_repeat, UV97_g70988,temp_output_84_0_g70988, 0.0 ) , TVE_VertexUsage[(int)temp_output_84_0_g70988]);
				half4 Global_Object_Params4173_g70929 = lerpResult109_g70988;
				half Global_VertexSize174_g70929 = saturate( Global_Object_Params4173_g70929.w );
				float lerpResult346_g70929 = lerp( 1.0 , Global_VertexSize174_g70929 , _GlobalSize);
				float3 appendResult3480_g70929 = (float3(lerpResult346_g70929 , lerpResult346_g70929 , lerpResult346_g70929));
				half3 ObjectData20_g70964 = appendResult3480_g70929;
				half3 _Vector11 = half3(1,1,1);
				half3 WorldData19_g70964 = _Vector11;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g70964 = WorldData19_g70964;
				#else
				float3 staticSwitch14_g70964 = ObjectData20_g70964;
				#endif
				half3 Vertex_Size1741_g70929 = staticSwitch14_g70964;
				half3 _Vector5 = half3(1,1,1);
				float3 Vertex_SizeFade1740_g70929 = _Vector5;
				half3 Grass_Perspective2661_g70929 = half3(0,0,0);
				float3 lerpResult16_g70963 = lerp( VertexPosition3588_g70929 , ( ( staticSwitch4976_g70929 * Vertex_Size1741_g70929 * Vertex_SizeFade1740_g70929 ) + Mesh_PivotsOS2291_g70929 + Grass_Perspective2661_g70929 ) , TVE_Enabled);
				float3 Final_VertexPosition890_g70929 = ( lerpResult16_g70963 + _DisableSRPBatcher );
				
				float temp_output_7_0_g70945 = TVE_CameraFadeStart;
				float lerpResult4755_g70929 = lerp( 1.0 , saturate( ( ( distance( ase_worldPos , _WorldSpaceCameraPos ) - temp_output_7_0_g70945 ) / ( TVE_CameraFadeEnd - temp_output_7_0_g70945 ) ) ) , _FadeCameraValue);
				float vertexToFrag11_g70951 = lerpResult4755_g70929;
				outputPackedVaryingsMeshToPS.ase_texcoord1.x = vertexToFrag11_g70951;
				outputPackedVaryingsMeshToPS.ase_texcoord1.yzw = vertexToFrag3890_g70929;
				
				outputPackedVaryingsMeshToPS.ase_texcoord2 = inputMesh.ase_texcoord;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue = Final_VertexPosition890_g70929;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif

				inputMesh.normalOS =  inputMesh.normalOS ;

				float3 positionRWS = TransformObjectToWorld(inputMesh.positionOS);
				outputPackedVaryingsMeshToPS.positionCS = TransformWorldToHClip(positionRWS);
				outputPackedVaryingsMeshToPS.positionRWS.xyz = positionRWS;
				return outputPackedVaryingsMeshToPS;
			}

			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float3 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl Vert ( AttributesMesh v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.positionOS = v.positionOS;
				o.normalOS = v.normalOS;
				o.ase_texcoord3 = v.ase_texcoord3;
				o.ase_color = v.ase_color;
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				float3 cameraPos = 0;
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), cameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, GetObjectToWorldMatrix(), cameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), cameraPos, _ScreenParams, _FrustumPlanes );
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
			PackedVaryingsMeshToPS DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				AttributesMesh o = (AttributesMesh) 0;
				o.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			PackedVaryingsMeshToPS Vert ( AttributesMesh v )
			{
				return VertexFunction( v );
			}
			#endif
			
			#if defined(WRITE_NORMAL_BUFFER) && defined(WRITE_MSAA_DEPTH)
			#define SV_TARGET_DECAL SV_Target2
			#elif defined(WRITE_NORMAL_BUFFER) || defined(WRITE_MSAA_DEPTH)
			#define SV_TARGET_DECAL SV_Target1
			#else
			#define SV_TARGET_DECAL SV_Target0
			#endif

			void Frag( PackedVaryingsMeshToPS packedInput
						, out float4 outColor : SV_Target0
						#if defined(_DEPTHOFFSET_ON) && !defined(SCENEPICKINGPASS)
						, out float outputDepth : SV_Depth
						#endif
						
					)
			{
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( packedInput );
				UNITY_SETUP_INSTANCE_ID( packedInput );

				float3 positionRWS = packedInput.positionRWS.xyz;

				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);

				input.tangentToWorld = k_identity3x3;
				input.positionSS = packedInput.positionCS;

				input.positionRWS = positionRWS;

				#if _DOUBLESIDED_ON && SHADER_STAGE_FRAGMENT
				input.isFrontFace = IS_FRONT_VFACE( packedInput.cullFace, true, false);
				#elif SHADER_STAGE_FRAGMENT
				#if defined(ASE_NEED_CULLFACE)
				input.isFrontFace = IS_FRONT_VFACE( packedInput.cullFace, true, false );
				#endif
				#endif
				half isFrontFace = input.isFrontFace;

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS);

				float3 V = GetWorldSpaceNormalizeViewDir(input.positionRWS);

				SceneSurfaceDescription surfaceDescription = (SceneSurfaceDescription)0;
				float localCustomAlphaClip9_g70962 = ( 0.0 );
				float vertexToFrag11_g70951 = packedInput.ase_texcoord1.x;
				half Fade_Camera_Mask5149_g70929 = 1.0;
				float lerpResult5141_g70929 = lerp( 1.0 , vertexToFrag11_g70951 , Fade_Camera_Mask5149_g70929);
				half Fade_Camera3743_g70929 = lerpResult5141_g70929;
				float temp_output_41_0_g70948 = ( 1.0 * Fade_Camera3743_g70929 );
				float3 vertexToFrag3890_g70929 = packedInput.ase_texcoord1.yzw;
				float3 WorldPosition3905_g70929 = vertexToFrag3890_g70929;
				half Final_AlphaFade3727_g70929 = saturate( ( temp_output_41_0_g70948 + ( temp_output_41_0_g70948 * tex3D( TVE_ScreenTex3D, ( TVE_ScreenTexCoord * WorldPosition3905_g70929 ) ).r ) ) );
				half2 Main_UVs15_g70929 = ( ( packedInput.ase_texcoord2.xy * (_MainUVs).xy ) + (_MainUVs).zw );
				float4 tex2DNode29_g70929 = tex2D( _MainAlbedoTex, Main_UVs15_g70929 );
				float Main_Alpha316_g70929 = ( _MainColor.a * tex2DNode29_g70929.a );
				half AlphaTreshold2132_g70929 = _AlphaClipValue;
				half Final_Alpha3754_g70929 = ( Main_Alpha316_g70929 - ( AlphaTreshold2132_g70929 - 0.5 ) );
				float temp_output_661_0_g70929 = ( Final_AlphaFade3727_g70929 * Final_Alpha3754_g70929 );
				float temp_output_3_0_g70949 = temp_output_661_0_g70929;
				half Offest27_g70949 = 0.5;
				half Feather30_g70949 = 0.5;
				float temp_output_3_0_g70962 = ( ( ( temp_output_3_0_g70949 - Offest27_g70949 ) / ( max( fwidth( temp_output_3_0_g70949 ) , 0.001 ) + Feather30_g70949 ) ) + Offest27_g70949 );
				float Alpha9_g70962 = temp_output_3_0_g70962;
				float temp_output_15_0_g70962 = 0.5;
				float Treshold9_g70962 = temp_output_15_0_g70962;
				{
				#if TVE_FEATURE_CLIP
				clip(Alpha9_g70962 - Treshold9_g70962);
				#endif
				}
				half Final_Clip914_g70929 = Alpha9_g70962;
				
				surfaceDescription.Alpha = Final_Clip914_g70929;

				#ifdef _ALPHATEST_ON
				surfaceDescription.AlphaClipThreshold = _AlphaCutoff;
				#endif

				#ifdef _DEPTHOFFSET_ON
				surfaceDescription.DepthOffset = 0;
				#endif

				SurfaceData surfaceData;
				BuiltinData builtinData;
				GetSurfaceAndBuiltinData(surfaceDescription, input, V, posInput, surfaceData, builtinData);

				#ifdef _DEPTHOFFSET_ON
				outputDepth = posInput.deviceDepth;
				#endif

				outColor = float4( _ObjectId, _PassValue, 1.0, 1.0 );
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "DepthOnly"
			Tags { "LightMode"="DepthOnly" }
			Cull [_CullMode]

			ZWrite On

			Stencil
			{
				Ref [_StencilRefDepth]
				WriteMask [_StencilWriteMaskDepth]
				Comp Always
				Pass Replace
				Fail Keep
				ZFail Keep
			}


			HLSLPROGRAM

			#define _MATERIAL_FEATURE_SPECULAR_COLOR 1
			#define _ENERGY_CONSERVING_SPECULAR 1
			#pragma multi_compile _ DOTS_INSTANCING_ON
			#pragma multi_compile_instancing
			#pragma instancing_options renderinglayer
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#define ASE_ABSOLUTE_VERTEX_POS 1
			#define _AMBIENT_OCCLUSION 1
			#define HAVE_MESH_MODIFICATION
			#define ASE_SRP_VERSION 120100
			#if !defined(ASE_NEED_CULLFACE)
			#define ASE_NEED_CULLFACE 1
			#endif //ASE_NEED_CULLFACE


			// Keyword for transparent
			#pragma shader_feature _SURFACE_TYPE_TRANSPARENT
			#pragma shader_feature_local_fragment _ _ENABLE_FOG_ON_TRANSPARENT
			#pragma shader_feature_local _ _TRANSPARENT_WRITES_MOTION_VEC

			#define SHADERPASS SHADERPASS_DEPTH_ONLY
			#pragma multi_compile _ WRITE_NORMAL_BUFFER
			#pragma multi_compile_fragment _ WRITE_MSAA_DEPTH
			#pragma multi_compile _ WRITE_DECAL_BUFFER

			#pragma vertex Vert
			#pragma fragment Frag

			//-------------------------------------------------------------------------------------
			// Define
			//-------------------------------------------------------------------------------------

			#if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define OUTPUT_SPLIT_LIGHTING
			#endif

            #if defined(_TRANSPARENT_WRITES_MOTION_VEC) && defined(_SURFACE_TYPE_TRANSPARENT)
            #define _WRITE_TRANSPARENT_MOTION_VECTOR
            #endif

			#if defined(SHADER_LIT) && !defined(_SURFACE_TYPE_TRANSPARENT)
            #define _DEFERRED_CAPABLE_MATERIAL
            #endif

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl" 
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl" 
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphHeader.hlsl" 
			
            #ifdef DEBUG_DISPLAY
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
			#endif
			
			CBUFFER_START( UnityPerMaterial )
			half4 _SecondColor;
			half4 _MainColor;
			half4 _MainUVs;
			half4 _ColorsMaskRemap;
			half4 _SecondUVs;
			half4 _OverlayMaskRemap;
			float4 _Color;
			float4 _SubsurfaceDiffusion_Asset;
			float4 _MaxBoundsInfo;
			float4 _SubsurfaceDiffusion_asset;
			float4 _GradientMaskRemap;
			half4 _VertexOcclusionColor;
			half4 _SubsurfaceMaskRemap;
			half4 _AlphaMaskRemap;
			half4 _DetailBlendRemap;
			float4 _EmissiveIntensityParams;
			float4 _NoiseMaskRemap;
			half4 _EmissiveUVs;
			half4 _EmissiveColor;
			half4 _VertexOcclusionRemap;
			half3 _render_normals;
			half _render_dst;
			half _MotionSpeed_20;
			half _RenderDirect;
			half _MotionVariation_20;
			half _IsStandardShader;
			half _MotionScale_20;
			half _InteractionMaskValue;
			half _MotionVariation_10;
			half _VertexDynamicMode;
			float _MotionSpeed_10;
			half _render_src;
			half _MotionAmplitude_20;
			float _MotionScale_10;
			half _MotionAmplitude_10;
			half _LayerMotionValue;
			half _VertexPivotMode;
			half _InteractionAmplitude;
			half _MotionValue_20;
			half _render_zw;
			half _VertexDataMode;
			half _MainOcclusionValue;
			half _GlobalWetness;
			half _SecondSmoothnessValue;
			half _MainSmoothnessValue;
			half _GlobalEmissive;
			half _EmissiveExposureValue;
			half _RenderSpecular;
			half _SecondNormalValue;
			half _DetailNormalValue;
			half _MainNormalValue;
			half _VertexOcclusionMaxValue;
			half _VertexOcclusionMinValue;
			half _OverlayMaskMaxValue;
			half _OverlayMaskMinValue;
			half _LayerExtrasValue;
			half _ExtrasPositionMode;
			half _GlobalOverlay;
			half _DetailBlendMaxValue;
			half _DetailBlendMinValue;
			half _DetailMaskInvertMode;
			half _DetailMaskMode;
			half _DetailMeshValue;
			half _DetailCoordMode;
			half _GlobalSize;
			half _LayerVertexValue;
			half _MotionFacingValue;
			half _CategoryRender;
			half _SubsurfaceDirectValue;
			half _RenderSSR;
			half _CategoryOcclusion;
			half _MessageSizeFade;
			half _DetailTypeMode;
			half _CategoryGlobal;
			half _CategorySizeFade;
			half _CategoryPerspective;
			half _IsVersion;
			half _CategoryNoise;
			half _RenderMode;
			half _HasOcclusion;
			half _CategoryDetail;
			half _HasEmissive;
			half _CategoryMotion;
			half _SubsurfaceNormalValue;
			half _EmissiveFlagMode;
			half _SpaceMotionGlobals;
			half _SubsurfaceShadowValue;
			half _RenderCoverage;
			half _RenderPriority;
			float _SubsurfaceDiffusion;
			half _VertexRollingMode;
			half _Cutoff;
			half _SubsurfaceScatteringValue;
			half _render_cull;
			half _IsBarkShader;
			half _CategorySubsurface;
			half _SpaceGlobalPosition;
			half _RenderClip;
			half _MessageMotionVariation;
			half _RenderCull;
			half _SecondOcclusionValue;
			half _RenderZWrite;
			half _SubsurfaceAmbientValue;
			half _RenderQueue;
			half _SubsurfaceAngleValue;
			half _AlphaClipValue;
			half _VertexMasksMode;
			half _LayerReactValue;
			half _DetailBlendMode;
			half _VertexVariationMode;
			half _RenderDecals;
			half _RenderShadow;
			half _DetailMode;
			half _SpaceRenderFade;
			half _IsTVEShader;
			half _CategoryEmissive;
			half _RenderAmbient;
			half _CategoryMain;
			half _CategoryGradient;
			half _SpaceGlobalLocals;
			half _SpaceMotionLocals;
			half _SpaceGlobalLayers;
			half _RenderNormals;
			half _HasGradient;
			half _MessageGlobalsVariation;
			half _FadeCameraValue;
			float4 _EmissionColor;
			float _AlphaCutoff;
			float _RenderQueueType;
			#ifdef _ADD_PRECOMPUTED_VELOCITY
			float _AddPrecomputedVelocity;
			#endif
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilRefDistortionVec;
			float _StencilWriteMaskDistortionVec;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
			float _SrcBlend;
			float _DstBlend;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _TransparentZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _EnableFogOnTransparent;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END
			sampler2D _BumpMap;
			half TVE_Enabled;
			sampler2D _MainTex;
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
			sampler2D _MainNormalTex;
			sampler2D _SecondNormalTex;
			sampler2D _MainMaskTex;
			sampler2D _SecondMaskTex;
			half TVE_OverlaySmoothness;
			sampler2D _MainAlbedoTex;
			sampler2D _SecondAlbedoTex;
			half4 TVE_ExtrasParams;
			TEXTURE2D_ARRAY(TVE_ExtrasTex);
			half4 TVE_ExtrasCoords;
			float TVE_ExtrasUsage[10];
			half TVE_CameraFadeStart;
			half TVE_CameraFadeEnd;
			sampler3D TVE_ScreenTex3D;
			half TVE_ScreenTexCoord;


			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_FRAG_VFACE
			#define ASE_NEEDS_VERT_NORMAL
			#pragma shader_feature_local TVE_FEATURE_CLIP
			#pragma shader_feature_local TVE_FEATURE_BATCHING
			#pragma shader_feature_local TVE_FEATURE_DETAIL
			//TVE Pipeline Defines
			#define THE_VEGETATION_ENGINE
			#define TVE_IS_HD_PIPELINE
			//TVE HD Pipeline Defines
			#pragma shader_feature_local _DISABLE_DECALS
			#pragma shader_feature_local _DISABLE_SSR
			//TVE Injection Defines
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END
			//TVE Shader Type Defines
			#define TVE_IS_VEGETATION_SHADER


			#if defined(_DOUBLESIDED_ON) && !defined(ASE_NEED_CULLFACE)
				#define ASE_NEED_CULLFACE 1
			#endif

			struct AttributesMesh
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryingsMeshToPS
			{
				float4 positionCS : SV_Position;
				float3 positionRWS : TEXCOORD0;
				float3 normalWS : TEXCOORD1;
				float4 tangentWS : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord6 : TEXCOORD6;
				float4 ase_texcoord7 : TEXCOORD7;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
				#if defined(SHADER_STAGE_FRAGMENT) && defined(ASE_NEED_CULLFACE)
				FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
				#endif
			};

			float3 ObjectPosition_UNITY_MATRIX_M(  )
			{
				return float3(UNITY_MATRIX_M[0].w, UNITY_MATRIX_M[1].w, UNITY_MATRIX_M[2].w );
			}
			
			float2 DecodeFloatToVector2( float enc )
			{
				float2 result ;
				result.y = enc % 2048;
				result.x = floor(enc / 2048);
				return result / (2048 - 1);
			}
			

			void BuildSurfaceData(FragInputs fragInputs, inout SmoothSurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData, out float3 bentNormalWS)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);

				surfaceData.specularOcclusion = 1.0;

				// surface data
				surfaceData.perceptualSmoothness =		surfaceDescription.Smoothness;

				// refraction
				#ifdef _HAS_REFRACTION
				if( _EnableSSRefraction )
				{
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


				// material features
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

				// others
				#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
				surfaceData.baseColor *= ( 1.0 - Max3( surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b ) );
				#endif
				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				// normals
				float3 normalTS = float3(0.0f, 0.0f, 1.0f);
				normalTS = surfaceDescription.Normal;
				GetNormalWS( fragInputs, normalTS, surfaceData.normalWS, doubleSidedConstants );

				surfaceData.geomNormalWS = fragInputs.tangentToWorld[2];
				surfaceData.tangentWS = normalize( fragInputs.tangentToWorld[ 0 ].xyz );
				
				// decals
				#if HAVE_DECALS
				if( _EnableDecals )
				{
					DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, surfaceDescription.Alpha);
					ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData);
				}
				#endif

				bentNormalWS = surfaceData.normalWS;
				surfaceData.tangentWS = Orthonormalize( surfaceData.tangentWS, surfaceData.normalWS );

				#if defined(_SPECULAR_OCCLUSION_CUSTOM)
				#elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO( V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness( surfaceData.perceptualSmoothness ) );
				#elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion( ClampNdotV( dot( surfaceData.normalWS, V ) ), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness( surfaceData.perceptualSmoothness ) );
				#endif

				// debug
				#if defined(DEBUG_DISPLAY)
				if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
				{
					surfaceData.metallic = 0;
				}
				ApplyDebugToSurfaceData(fragInputs.tangentToWorld, surfaceData);
				#endif
			}

			void GetSurfaceAndBuiltinData(SmoothSurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				#ifdef LOD_FADE_CROSSFADE
				LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
				#endif

				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				ApplyDoubleSidedFlipOrMirror( fragInputs, doubleSidedConstants );

				#ifdef _ALPHATEST_ON
				DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif

				#ifdef _DEPTHOFFSET_ON
				builtinData.depthOffset = surfaceDescription.DepthOffset;
				ApplyDepthOffsetPositionInput( V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput );
				#endif

				float3 bentNormalWS;
				BuildSurfaceData( fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS );

				InitBuiltinData( posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[ 2 ], fragInputs.texCoord1, fragInputs.texCoord2, builtinData );

				PostInitBuiltinData(V, posInput, surfaceData, builtinData);
			}

			#if defined(WRITE_DECAL_BUFFER) && !defined(_DISABLE_DECALS)
				#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalPrepassBuffer.hlsl"
			#endif
			PackedVaryingsMeshToPS VertexFunction(AttributesMesh inputMesh )
			{
				PackedVaryingsMeshToPS outputPackedVaryingsMeshToPS;

				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, outputPackedVaryingsMeshToPS);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( outputPackedVaryingsMeshToPS );

				float3 VertexPosition3588_g70929 = inputMesh.positionOS;
				half3 Mesh_PivotsOS2291_g70929 = half3(0,0,0);
				float3 temp_output_2283_0_g70929 = ( VertexPosition3588_g70929 - Mesh_PivotsOS2291_g70929 );
				half3 VertexPos40_g71005 = temp_output_2283_0_g70929;
				float3 appendResult74_g71005 = (float3(VertexPos40_g71005.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g71005 = appendResult74_g71005;
				float3 break84_g71005 = VertexPos40_g71005;
				float3 appendResult81_g71005 = (float3(0.0 , break84_g71005.y , break84_g71005.z));
				half3 VertexPosOtherAxis82_g71005 = appendResult81_g71005;
				float4 temp_output_91_19_g70965 = TVE_MotionCoords;
				float3 localObjectPosition_UNITY_MATRIX_M14_g70996 = ObjectPosition_UNITY_MATRIX_M();
				float3 appendResult60_g70954 = (float3(inputMesh.ase_texcoord3.x , inputMesh.ase_texcoord3.z , inputMesh.ase_texcoord3.y));
				half3 Mesh_PivotsData2831_g70929 = ( appendResult60_g70954 * _VertexPivotMode );
				float3 temp_output_122_0_g70996 = Mesh_PivotsData2831_g70929;
				float3 PivotsOnly105_g70996 = (mul( GetObjectToWorldMatrix(), float4( temp_output_122_0_g70996 , 0.0 ) ).xyz).xyz;
				#ifdef SHADEROPTIONS_CAMERA_RELATIVE_RENDERING
				float3 staticSwitch13_g70996 = ( ( localObjectPosition_UNITY_MATRIX_M14_g70996 + PivotsOnly105_g70996 ) + _WorldSpaceCameraPos );
				#else
				float3 staticSwitch13_g70996 = ( localObjectPosition_UNITY_MATRIX_M14_g70996 + PivotsOnly105_g70996 );
				#endif
				half3 ObjectData20_g70997 = staticSwitch13_g70996;
				float3 ase_worldPos = GetAbsolutePositionWS( TransformObjectToWorld( (inputMesh.positionOS).xyz ) );
				half3 WorldData19_g70997 = ase_worldPos;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g70997 = WorldData19_g70997;
				#else
				float3 staticSwitch14_g70997 = ObjectData20_g70997;
				#endif
				float3 temp_output_114_0_g70996 = staticSwitch14_g70997;
				float3 vertexToFrag4224_g70929 = temp_output_114_0_g70996;
				half3 ObjectData20_g70970 = vertexToFrag4224_g70929;
				float3 vertexToFrag3890_g70929 = ase_worldPos;
				half3 WorldData19_g70970 = vertexToFrag3890_g70929;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g70970 = WorldData19_g70970;
				#else
				float3 staticSwitch14_g70970 = ObjectData20_g70970;
				#endif
				float3 ObjectPosition4223_g70929 = staticSwitch14_g70970;
				half2 UV94_g70965 = ( (temp_output_91_19_g70965).zw + ( (temp_output_91_19_g70965).xy * (ObjectPosition4223_g70929).xz ) );
				float temp_output_84_0_g70965 = _LayerMotionValue;
				float4 lerpResult107_g70965 = lerp( TVE_MotionParams , saturate( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_MotionTex, sampler_linear_repeat, UV94_g70965,temp_output_84_0_g70965, 0.0 ) ) , TVE_MotionUsage[(int)temp_output_84_0_g70965]);
				half4 Global_Motion_Params3909_g70929 = lerpResult107_g70965;
				float4 break322_g70972 = Global_Motion_Params3909_g70929;
				float3 appendResult397_g70972 = (float3(break322_g70972.x , 0.0 , break322_g70972.y));
				float3 temp_output_398_0_g70972 = (appendResult397_g70972*2.0 + -1.0);
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				half2 Global_MotionDirectionOS39_g70929 = (( mul( GetWorldToObjectMatrix(), float4( temp_output_398_0_g70972 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_DirectionOS358_g71001 = Global_MotionDirectionOS39_g70929;
				half Mesh_Height1524_g70929 = inputMesh.ase_color.a;
				half Mesh_Height114_g70956 = Mesh_Height1524_g70929;
				half ObjectData20_g70957 = ( Mesh_Height114_g70956 * 2.0 );
				float enc62_g70955 = inputMesh.ase_texcoord.w;
				float2 localDecodeFloatToVector262_g70955 = DecodeFloatToVector2( enc62_g70955 );
				float2 break63_g70955 = ( localDecodeFloatToVector262_g70955 * 100.0 );
				float Bounds_Height5230_g70929 = break63_g70955.x;
				float Bounds_Height117_g70956 = Bounds_Height5230_g70929;
				half WorldData19_g70957 = ( ( Mesh_Height114_g70956 * Mesh_Height114_g70956 ) * Bounds_Height117_g70956 * 2.0 );
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g70957 = WorldData19_g70957;
				#else
				float staticSwitch14_g70957 = ObjectData20_g70957;
				#endif
				half Motion_10_Mask5242_g70929 = staticSwitch14_g70957;
				half Wind_Power369_g70972 = break322_g70972.z;
				half Global_MotionPower2223_g70929 = Wind_Power369_g70972;
				half3 Input_Position419_g70975 = -ObjectPosition4223_g70929;
				half2 Global_MotionDirectionWS4683_g70929 = (temp_output_398_0_g70972).xz;
				half2 Input_DirectionWS423_g70975 = Global_MotionDirectionWS4683_g70929;
				float Motion_Scale287_g70975 = ( _MotionScale_10 + 0.2 );
				half Global_Scale448_g70975 = TVE_NoiseParams.x;
				half Input_Speed62_g70975 = _MotionSpeed_10;
				half Global_Speed449_g70975 = TVE_NoiseParams.y;
				float mulTime426_g70975 = _TimeParameters.x * ( Input_Speed62_g70975 * Global_Speed449_g70975 );
				half Global_DistScale561_g70975 = TVE_NoiseParams.w;
				float3 break461_g70975 = ( Input_Position419_g70975 * Global_DistScale561_g70975 );
				half Global_DistAmplitude559_g70975 = TVE_NoiseParams.z;
				float Noise_Distortion469_g70975 = ( sin( ( break461_g70975.x + break461_g70975.z ) ) * Global_DistAmplitude559_g70975 );
				float3 break111_g70958 = ObjectPosition4223_g70929;
				half Global_DynamicMode5112_g70929 = _VertexDynamicMode;
				half Input_DynamicMode120_g70958 = Global_DynamicMode5112_g70929;
				float Mesh_Variation16_g70929 = inputMesh.ase_color.r;
				half Input_Variation124_g70958 = Mesh_Variation16_g70929;
				half ObjectData20_g70959 = frac( ( ( ( break111_g70958.x + break111_g70958.y + break111_g70958.z ) * ( 1.0 - Input_DynamicMode120_g70958 ) ) + Input_Variation124_g70958 ) );
				half WorldData19_g70959 = Input_Variation124_g70958;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g70959 = WorldData19_g70959;
				#else
				float staticSwitch14_g70959 = ObjectData20_g70959;
				#endif
				float clampResult129_g70958 = clamp( staticSwitch14_g70959 , 0.01 , 0.99 );
				half Global_MeshVariation5104_g70929 = clampResult129_g70958;
				half Motion_Variation284_g70975 = ( _MotionVariation_10 * Global_MeshVariation5104_g70929 );
				float2 temp_output_425_0_g70975 = ( ( (Input_Position419_g70975).xz * Input_DirectionWS423_g70975 * Motion_Scale287_g70975 * Global_Scale448_g70975 ) + ( mulTime426_g70975 + Noise_Distortion469_g70975 + Motion_Variation284_g70975 ) );
				float2 break500_g70975 = ( temp_output_425_0_g70975 * 0.1178 );
				float2 break494_g70975 = ( temp_output_425_0_g70975 * 0.1742 );
				half Input_WindPower327_g70975 = Global_MotionPower2223_g70929;
				float lerpResult430_g70975 = lerp( 1.4 , 0.4 , Input_WindPower327_g70975);
				half Global_MotionNoise34_g70929 = (pow( (( sin( ( break500_g70975.x + break500_g70975.y ) ) * sin( ( break494_g70975.x + break494_g70975.y ) ) )*0.4 + 0.6) , lerpResult430_g70975 )*1.2 + -0.2);
				half Motion_10_Amplitude2258_g70929 = ( _MotionAmplitude_10 * Motion_10_Mask5242_g70929 * Global_MotionPower2223_g70929 * Global_MotionNoise34_g70929 );
				half Input_BendingAmplitude376_g71001 = Motion_10_Amplitude2258_g70929;
				half Input_InteractionAmplitude58_g71001 = _InteractionAmplitude;
				half Input_MeshMotion_10321_g71001 = Motion_10_Mask5242_g70929;
				half Input_InteractionUseMask62_g71001 = _InteractionMaskValue;
				float lerpResult371_g71001 = lerp( 2.0 , Input_MeshMotion_10321_g71001 , Input_InteractionUseMask62_g71001);
				half ObjectData20_g71002 = lerpResult371_g71001;
				half WorldData19_g71002 = Input_MeshMotion_10321_g71001;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g71002 = WorldData19_g71002;
				#else
				float staticSwitch14_g71002 = ObjectData20_g71002;
				#endif
				half Motion_10_Interaction373_g71001 = ( Input_InteractionAmplitude58_g71001 * staticSwitch14_g71002 );
				half Global_InteractionMask66_g70929 = ( break322_g70972.w * break322_g70972.w );
				float Input_InteractionMask330_g71001 = Global_InteractionMask66_g70929;
				float lerpResult360_g71001 = lerp( Input_BendingAmplitude376_g71001 , Motion_10_Interaction373_g71001 , saturate( ( Input_InteractionAmplitude58_g71001 * Input_InteractionMask330_g71001 ) ));
				float2 break364_g71001 = ( Input_DirectionOS358_g71001 * lerpResult360_g71001 );
				half Motion_10_BendingZ190_g70929 = break364_g71001.y;
				half Angle44_g71005 = Motion_10_BendingZ190_g70929;
				half3 VertexPos40_g71004 = ( VertexPosRotationAxis50_g71005 + ( VertexPosOtherAxis82_g71005 * cos( Angle44_g71005 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g71005 ) * sin( Angle44_g71005 ) ) );
				float3 appendResult74_g71004 = (float3(0.0 , 0.0 , VertexPos40_g71004.z));
				half3 VertexPosRotationAxis50_g71004 = appendResult74_g71004;
				float3 break84_g71004 = VertexPos40_g71004;
				float3 appendResult81_g71004 = (float3(break84_g71004.x , break84_g71004.y , 0.0));
				half3 VertexPosOtherAxis82_g71004 = appendResult81_g71004;
				half Motion_10_BendingX216_g70929 = break364_g71001.x;
				half Angle44_g71004 = -Motion_10_BendingX216_g70929;
				half Input_Scale321_g70944 = _MotionScale_20;
				half Input_Variation330_g70944 = ( _MotionVariation_20 * Global_MeshVariation5104_g70929 );
				half Input_Speed62_g70944 = _MotionSpeed_20;
				float mulTime349_g70944 = _TimeParameters.x * Input_Speed62_g70944;
				float temp_output_302_0_g70944 = sin( ( ( ( ase_worldPos.x + ase_worldPos.y + ase_worldPos.z ) * Input_Scale321_g70944 ) + Input_Variation330_g70944 + mulTime349_g70944 ) );
				float enc59_g70955 = inputMesh.ase_texcoord.z;
				float2 localDecodeFloatToVector259_g70955 = DecodeFloatToVector2( enc59_g70955 );
				float2 break61_g70955 = localDecodeFloatToVector259_g70955;
				half Mesh_Motion_2060_g70929 = break61_g70955.x;
				half Mesh_Motion_20115_g70956 = Mesh_Motion_2060_g70929;
				float Bounds_Radius5231_g70929 = break63_g70955.y;
				float Bounds_Radius118_g70956 = Bounds_Radius5231_g70929;
				half Motion_20_Mask5243_g70929 = ( Mesh_Motion_20115_g70956 * Bounds_Radius118_g70956 );
				half3 Input_Position419_g70960 = VertexPosition3588_g70929;
				float3 normalizeResult518_g70960 = normalize( Input_Position419_g70960 );
				half2 Input_DirectionOS423_g70960 = Global_MotionDirectionOS39_g70929;
				float2 break521_g70960 = -Input_DirectionOS423_g70960;
				float3 appendResult522_g70960 = (float3(break521_g70960.x , 0.0 , break521_g70960.y));
				float dotResult519_g70960 = dot( normalizeResult518_g70960 , appendResult522_g70960 );
				half Input_Mask62_g70960 = _MotionFacingValue;
				float lerpResult524_g70960 = lerp( 1.0 , (dotResult519_g70960*0.5 + 0.5) , Input_Mask62_g70960);
				half ObjectData20_g70961 = lerpResult524_g70960;
				half WorldData19_g70961 = 1.0;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g70961 = WorldData19_g70961;
				#else
				float staticSwitch14_g70961 = ObjectData20_g70961;
				#endif
				half Motion_FacingMask5214_g70929 = staticSwitch14_g70961;
				half Motion_20_Amplitude4381_g70929 = ( _MotionAmplitude_20 * _MotionValue_20 * Motion_20_Mask5243_g70929 * Global_MotionPower2223_g70929 * Global_MotionNoise34_g70929 * Motion_FacingMask5214_g70929 );
				half Input_Amplitude58_g70944 = Motion_20_Amplitude4381_g70929;
				half2 Input_DirectionOS366_g70944 = Global_MotionDirectionOS39_g70929;
				float2 break371_g70944 = Input_DirectionOS366_g70944;
				float3 appendResult372_g70944 = (float3(break371_g70944.x , ( temp_output_302_0_g70944 * 0.1 ) , break371_g70944.y));
				half3 Motion_20_Squash4418_g70929 = ( ( (temp_output_302_0_g70944*0.2 + 1.0) * Input_Amplitude58_g70944 ) * appendResult372_g70944 );
				float3 Vertex_Motion_Object833_g70929 = ( ( VertexPosRotationAxis50_g71004 + ( VertexPosOtherAxis82_g71004 * cos( Angle44_g71004 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g71004 ) * sin( Angle44_g71004 ) ) ) + Motion_20_Squash4418_g70929 );
				float3 temp_output_3474_0_g70929 = ( VertexPosition3588_g70929 - Mesh_PivotsOS2291_g70929 );
				float3 appendResult2043_g70929 = (float3(Motion_10_BendingX216_g70929 , 0.0 , Motion_10_BendingZ190_g70929));
				float3 Vertex_Motion_World1118_g70929 = ( ( temp_output_3474_0_g70929 + appendResult2043_g70929 ) + Motion_20_Squash4418_g70929 );
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch4976_g70929 = Vertex_Motion_World1118_g70929;
				#else
				float3 staticSwitch4976_g70929 = ( Vertex_Motion_Object833_g70929 + ( _VertexDataMode * 0.0 ) );
				#endif
				float4 temp_output_94_19_g70988 = TVE_VertexCoords;
				half2 UV97_g70988 = ( (temp_output_94_19_g70988).zw + ( (temp_output_94_19_g70988).xy * (ObjectPosition4223_g70929).xz ) );
				float temp_output_84_0_g70988 = _LayerVertexValue;
				float4 lerpResult109_g70988 = lerp( TVE_VertexParams , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_VertexTex, sampler_linear_repeat, UV97_g70988,temp_output_84_0_g70988, 0.0 ) , TVE_VertexUsage[(int)temp_output_84_0_g70988]);
				half4 Global_Object_Params4173_g70929 = lerpResult109_g70988;
				half Global_VertexSize174_g70929 = saturate( Global_Object_Params4173_g70929.w );
				float lerpResult346_g70929 = lerp( 1.0 , Global_VertexSize174_g70929 , _GlobalSize);
				float3 appendResult3480_g70929 = (float3(lerpResult346_g70929 , lerpResult346_g70929 , lerpResult346_g70929));
				half3 ObjectData20_g70964 = appendResult3480_g70929;
				half3 _Vector11 = half3(1,1,1);
				half3 WorldData19_g70964 = _Vector11;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g70964 = WorldData19_g70964;
				#else
				float3 staticSwitch14_g70964 = ObjectData20_g70964;
				#endif
				half3 Vertex_Size1741_g70929 = staticSwitch14_g70964;
				half3 _Vector5 = half3(1,1,1);
				float3 Vertex_SizeFade1740_g70929 = _Vector5;
				half3 Grass_Perspective2661_g70929 = half3(0,0,0);
				float3 lerpResult16_g70963 = lerp( VertexPosition3588_g70929 , ( ( staticSwitch4976_g70929 * Vertex_Size1741_g70929 * Vertex_SizeFade1740_g70929 ) + Mesh_PivotsOS2291_g70929 + Grass_Perspective2661_g70929 ) , TVE_Enabled);
				float3 Final_VertexPosition890_g70929 = ( lerpResult16_g70963 + _DisableSRPBatcher );
				
				float2 appendResult21_g70955 = (float2(inputMesh.ase_texcoord1.z , inputMesh.ase_texcoord1.w));
				float2 Mesh_DetailCoord3_g70929 = appendResult21_g70955;
				float2 lerpResult1545_g70929 = lerp( inputMesh.ase_texcoord.xy , Mesh_DetailCoord3_g70929 , _DetailCoordMode);
				float2 vertexToFrag11_g71000 = ( ( lerpResult1545_g70929 * (_SecondUVs).xy ) + (_SecondUVs).zw );
				outputPackedVaryingsMeshToPS.ase_texcoord4.xy = vertexToFrag11_g71000;
				half Mesh_DetailMask90_g70929 = inputMesh.ase_color.b;
				float temp_output_990_0_g70929 = ( Mesh_DetailMask90_g70929 - 0.5 );
				float vertexToFrag11_g70931 = ( temp_output_990_0_g70929 + _DetailMeshValue );
				outputPackedVaryingsMeshToPS.ase_texcoord4.z = vertexToFrag11_g70931;
				
				float3 ase_worldNormal = TransformObjectToWorldNormal(inputMesh.normalOS);
				float3 vertexToFrag5058_g70929 = ase_worldNormal;
				outputPackedVaryingsMeshToPS.ase_texcoord5.xyz = vertexToFrag5058_g70929;
				outputPackedVaryingsMeshToPS.ase_texcoord6.xyz = vertexToFrag3890_g70929;
				outputPackedVaryingsMeshToPS.ase_texcoord7.xyz = vertexToFrag4224_g70929;
				
				float temp_output_7_0_g70945 = TVE_CameraFadeStart;
				float lerpResult4755_g70929 = lerp( 1.0 , saturate( ( ( distance( ase_worldPos , _WorldSpaceCameraPos ) - temp_output_7_0_g70945 ) / ( TVE_CameraFadeEnd - temp_output_7_0_g70945 ) ) ) , _FadeCameraValue);
				float vertexToFrag11_g70951 = lerpResult4755_g70929;
				outputPackedVaryingsMeshToPS.ase_texcoord4.w = vertexToFrag11_g70951;
				
				outputPackedVaryingsMeshToPS.ase_texcoord3 = inputMesh.ase_texcoord;
				outputPackedVaryingsMeshToPS.ase_normal = inputMesh.normalOS;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				outputPackedVaryingsMeshToPS.ase_texcoord5.w = 0;
				outputPackedVaryingsMeshToPS.ase_texcoord6.w = 0;
				outputPackedVaryingsMeshToPS.ase_texcoord7.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue = Final_VertexPosition890_g70929;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif

				inputMesh.normalOS =  inputMesh.normalOS ;
				inputMesh.tangentOS =  inputMesh.tangentOS ;

				float3 positionRWS = TransformObjectToWorld(inputMesh.positionOS);
				float3 normalWS = TransformObjectToWorldNormal(inputMesh.normalOS);
				float4 tangentWS = float4(TransformObjectToWorldDir(inputMesh.tangentOS.xyz), inputMesh.tangentOS.w);

				outputPackedVaryingsMeshToPS.positionCS = TransformWorldToHClip(positionRWS);
				outputPackedVaryingsMeshToPS.positionRWS.xyz = positionRWS;
				outputPackedVaryingsMeshToPS.normalWS.xyz = normalWS;
				outputPackedVaryingsMeshToPS.tangentWS.xyzw = tangentWS;
				return outputPackedVaryingsMeshToPS;
			}
			
			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float3 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl Vert ( AttributesMesh v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.positionOS = v.positionOS;
				o.normalOS = v.normalOS;
				o.tangentOS = v.tangentOS;
				o.ase_texcoord3 = v.ase_texcoord3;
				o.ase_color = v.ase_color;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_texcoord1 = v.ase_texcoord1;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				float3 cameraPos = 0;
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), cameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, GetObjectToWorldMatrix(), cameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), cameraPos, _ScreenParams, _FrustumPlanes );
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
			PackedVaryingsMeshToPS DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				AttributesMesh o = (AttributesMesh) 0;
				o.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_texcoord1 = patch[0].ase_texcoord1 * bary.x + patch[1].ase_texcoord1 * bary.y + patch[2].ase_texcoord1 * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			PackedVaryingsMeshToPS Vert ( AttributesMesh v )
			{
				return VertexFunction( v );
			}
			#endif

			#if defined(WRITE_NORMAL_BUFFER) && defined(WRITE_MSAA_DEPTH)
			#define SV_TARGET_DECAL SV_Target2
			#elif defined(WRITE_NORMAL_BUFFER) || defined(WRITE_MSAA_DEPTH)
			#define SV_TARGET_DECAL SV_Target1
			#else
			#define SV_TARGET_DECAL SV_Target0
			#endif

			void Frag( PackedVaryingsMeshToPS packedInput
						#if defined(SCENESELECTIONPASS) || defined(SCENEPICKINGPASS)
						, out float4 outColor : SV_Target0
						#else
							#ifdef WRITE_MSAA_DEPTH
							, out float4 depthColor : SV_Target0
								#ifdef WRITE_NORMAL_BUFFER
								, out float4 outNormalBuffer : SV_Target1
								#endif
							#else
								#ifdef WRITE_NORMAL_BUFFER
								, out float4 outNormalBuffer : SV_Target0
								#endif
							#endif

							#if defined(WRITE_DECAL_BUFFER) && !defined(_DISABLE_DECALS)
							, out float4 outDecalBuffer : SV_TARGET_DECAL
							#endif
						#endif

						#if defined(_DEPTHOFFSET_ON) && !defined(SCENEPICKINGPASS)
						, out float outputDepth : SV_Depth
						#endif
						
					)
			{
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( packedInput );
				UNITY_SETUP_INSTANCE_ID( packedInput );

				float3 positionRWS = packedInput.positionRWS.xyz;
				float3 normalWS = packedInput.normalWS.xyz;
				float4 tangentWS = packedInput.tangentWS.xyzw;

				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);

				input.tangentToWorld = k_identity3x3;
				input.positionSS = packedInput.positionCS;

				input.positionRWS = positionRWS;
				input.tangentToWorld = BuildTangentToWorld(tangentWS, normalWS);

				#if _DOUBLESIDED_ON && SHADER_STAGE_FRAGMENT
				input.isFrontFace = IS_FRONT_VFACE( packedInput.cullFace, true, false);
				#elif SHADER_STAGE_FRAGMENT
				#if defined(ASE_NEED_CULLFACE)
				input.isFrontFace = IS_FRONT_VFACE( packedInput.cullFace, true, false );
				#endif
				#endif
				half isFrontFace = input.isFrontFace;

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS);

				float3 V = GetWorldSpaceNormalizeViewDir(input.positionRWS);

				SmoothSurfaceDescription surfaceDescription = (SmoothSurfaceDescription)0;
				half2 Main_UVs15_g70929 = ( ( packedInput.ase_texcoord3.xy * (_MainUVs).xy ) + (_MainUVs).zw );
				float3 unpack4112_g70929 = UnpackNormalScale( tex2D( _MainNormalTex, Main_UVs15_g70929 ), _MainNormalValue );
				unpack4112_g70929.z = lerp( 1, unpack4112_g70929.z, saturate(_MainNormalValue) );
				half3 Main_Normal137_g70929 = unpack4112_g70929;
				float3 lerpResult3372_g70929 = lerp( float3( 0,0,1 ) , Main_Normal137_g70929 , _DetailNormalValue);
				float2 vertexToFrag11_g71000 = packedInput.ase_texcoord4.xy;
				half2 Second_UVs17_g70929 = vertexToFrag11_g71000;
				float3 unpack4114_g70929 = UnpackNormalScale( tex2D( _SecondNormalTex, Second_UVs17_g70929 ), _SecondNormalValue );
				unpack4114_g70929.z = lerp( 1, unpack4114_g70929.z, saturate(_SecondNormalValue) );
				half3 Second_Normal179_g70929 = unpack4114_g70929;
				float vertexToFrag11_g70931 = packedInput.ase_texcoord4.z;
				half Blend_Source1540_g70929 = vertexToFrag11_g70931;
				float4 tex2DNode35_g70929 = tex2D( _MainMaskTex, Main_UVs15_g70929 );
				half Main_Mask57_g70929 = tex2DNode35_g70929.b;
				float4 tex2DNode33_g70929 = tex2D( _SecondMaskTex, Second_UVs17_g70929 );
				half Second_Mask81_g70929 = tex2DNode33_g70929.b;
				float lerpResult1327_g70929 = lerp( Main_Mask57_g70929 , Second_Mask81_g70929 , _DetailMaskMode);
				float lerpResult4058_g70929 = lerp( lerpResult1327_g70929 , ( 1.0 - lerpResult1327_g70929 ) , _DetailMaskInvertMode);
				float temp_output_7_0_g71007 = _DetailBlendMinValue;
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch4838_g70929 = saturate( ( ( saturate( ( Blend_Source1540_g70929 + ( Blend_Source1540_g70929 * lerpResult4058_g70929 ) ) ) - temp_output_7_0_g71007 ) / ( _DetailBlendMaxValue - temp_output_7_0_g71007 ) ) );
				#else
				float staticSwitch4838_g70929 = 0.0;
				#endif
				half Mask_Detail147_g70929 = staticSwitch4838_g70929;
				float3 lerpResult3376_g70929 = lerp( Main_Normal137_g70929 , BlendNormal( lerpResult3372_g70929 , Second_Normal179_g70929 ) , Mask_Detail147_g70929);
				#ifdef TVE_FEATURE_DETAIL
				float3 staticSwitch267_g70929 = lerpResult3376_g70929;
				#else
				float3 staticSwitch267_g70929 = Main_Normal137_g70929;
				#endif
				float3 temp_output_13_0_g70940 = staticSwitch267_g70929;
				float3 switchResult12_g70940 = (((isFrontFace>0)?(temp_output_13_0_g70940):(( temp_output_13_0_g70940 * _render_normals ))));
				half3 Blend_Normal312_g70929 = switchResult12_g70940;
				half3 Final_Normal366_g70929 = Blend_Normal312_g70929;
				
				half Main_Smoothness227_g70929 = ( tex2DNode35_g70929.a * _MainSmoothnessValue );
				half Second_Smoothness236_g70929 = ( tex2DNode33_g70929.a * _SecondSmoothnessValue );
				float lerpResult266_g70929 = lerp( Main_Smoothness227_g70929 , Second_Smoothness236_g70929 , Mask_Detail147_g70929);
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch297_g70929 = lerpResult266_g70929;
				#else
				float staticSwitch297_g70929 = Main_Smoothness227_g70929;
				#endif
				half Blend_Smoothness314_g70929 = staticSwitch297_g70929;
				half Global_OverlaySmoothness311_g70929 = TVE_OverlaySmoothness;
				float3 vertexToFrag5058_g70929 = packedInput.ase_texcoord5.xyz;
				half3 World_Normal4101_g70929 = vertexToFrag5058_g70929;
				half Global_DynamicMode5112_g70929 = _VertexDynamicMode;
				float lerpResult4801_g70929 = lerp( World_Normal4101_g70929.y , packedInput.ase_normal.y , Global_DynamicMode5112_g70929);
				float lerpResult3567_g70929 = lerp( 0.5 , 1.0 , lerpResult4801_g70929);
				float4 tex2DNode29_g70929 = tex2D( _MainAlbedoTex, Main_UVs15_g70929 );
				half3 Main_Albedo99_g70929 = ( (_MainColor).rgb * (tex2DNode29_g70929).rgb );
				float4 tex2DNode89_g70929 = tex2D( _SecondAlbedoTex, Second_UVs17_g70929 );
				half3 Second_Albedo153_g70929 = (( _SecondColor * tex2DNode89_g70929 )).rgb;
				float3 lerpResult4834_g70929 = lerp( ( Main_Albedo99_g70929 * Second_Albedo153_g70929 * 4.594794 ) , Second_Albedo153_g70929 , _DetailBlendMode);
				float3 lerpResult235_g70929 = lerp( Main_Albedo99_g70929 , lerpResult4834_g70929 , Mask_Detail147_g70929);
				#ifdef TVE_FEATURE_DETAIL
				float3 staticSwitch255_g70929 = lerpResult235_g70929;
				#else
				float3 staticSwitch255_g70929 = Main_Albedo99_g70929;
				#endif
				half3 Blend_Albedo265_g70929 = staticSwitch255_g70929;
				float4 temp_output_93_19_g70934 = TVE_ExtrasCoords;
				float3 vertexToFrag3890_g70929 = packedInput.ase_texcoord6.xyz;
				float3 WorldPosition3905_g70929 = vertexToFrag3890_g70929;
				float3 vertexToFrag4224_g70929 = packedInput.ase_texcoord7.xyz;
				half3 ObjectData20_g70970 = vertexToFrag4224_g70929;
				half3 WorldData19_g70970 = vertexToFrag3890_g70929;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g70970 = WorldData19_g70970;
				#else
				float3 staticSwitch14_g70970 = ObjectData20_g70970;
				#endif
				float3 ObjectPosition4223_g70929 = staticSwitch14_g70970;
				float3 lerpResult4827_g70929 = lerp( WorldPosition3905_g70929 , ObjectPosition4223_g70929 , _ExtrasPositionMode);
				half2 UV96_g70934 = ( (temp_output_93_19_g70934).zw + ( (temp_output_93_19_g70934).xy * (lerpResult4827_g70929).xz ) );
				float temp_output_84_0_g70934 = _LayerExtrasValue;
				float4 lerpResult109_g70934 = lerp( TVE_ExtrasParams , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_ExtrasTex, sampler_linear_repeat, UV96_g70934,temp_output_84_0_g70934, 0.0 ) , TVE_ExtrasUsage[(int)temp_output_84_0_g70934]);
				float4 break89_g70934 = lerpResult109_g70934;
				half Global_Extras_Overlay156_g70929 = break89_g70934.b;
				half Overlay_Variation4560_g70929 = 1.0;
				half Overlay_Commons1365_g70929 = ( _GlobalOverlay * Global_Extras_Overlay156_g70929 * Overlay_Variation4560_g70929 );
				half Overlay_Mask_3D5122_g70929 = ( ( ( lerpResult3567_g70929 * 0.5 ) + Blend_Albedo265_g70929.y ) * Overlay_Commons1365_g70929 );
				float temp_output_7_0_g70971 = _OverlayMaskMinValue;
				half Overlay_Mask269_g70929 = saturate( ( ( Overlay_Mask_3D5122_g70929 - temp_output_7_0_g70971 ) / ( _OverlayMaskMaxValue - temp_output_7_0_g70971 ) ) );
				float lerpResult343_g70929 = lerp( Blend_Smoothness314_g70929 , Global_OverlaySmoothness311_g70929 , Overlay_Mask269_g70929);
				half Final_Smoothness371_g70929 = lerpResult343_g70929;
				half Global_Extras_Wetness305_g70929 = break89_g70934.g;
				float lerpResult3673_g70929 = lerp( 0.0 , Global_Extras_Wetness305_g70929 , _GlobalWetness);
				half Final_SmoothnessAndWetness4130_g70929 = saturate( ( Final_Smoothness371_g70929 + lerpResult3673_g70929 ) );
				
				float localCustomAlphaClip9_g70962 = ( 0.0 );
				float vertexToFrag11_g70951 = packedInput.ase_texcoord4.w;
				half Fade_Camera_Mask5149_g70929 = 1.0;
				float lerpResult5141_g70929 = lerp( 1.0 , vertexToFrag11_g70951 , Fade_Camera_Mask5149_g70929);
				half Fade_Camera3743_g70929 = lerpResult5141_g70929;
				float temp_output_41_0_g70948 = ( 1.0 * Fade_Camera3743_g70929 );
				half Final_AlphaFade3727_g70929 = saturate( ( temp_output_41_0_g70948 + ( temp_output_41_0_g70948 * tex3D( TVE_ScreenTex3D, ( TVE_ScreenTexCoord * WorldPosition3905_g70929 ) ).r ) ) );
				float Main_Alpha316_g70929 = ( _MainColor.a * tex2DNode29_g70929.a );
				half AlphaTreshold2132_g70929 = _AlphaClipValue;
				half Final_Alpha3754_g70929 = ( Main_Alpha316_g70929 - ( AlphaTreshold2132_g70929 - 0.5 ) );
				float temp_output_661_0_g70929 = ( Final_AlphaFade3727_g70929 * Final_Alpha3754_g70929 );
				float temp_output_3_0_g70949 = temp_output_661_0_g70929;
				half Offest27_g70949 = 0.5;
				half Feather30_g70949 = 0.5;
				float temp_output_3_0_g70962 = ( ( ( temp_output_3_0_g70949 - Offest27_g70949 ) / ( max( fwidth( temp_output_3_0_g70949 ) , 0.001 ) + Feather30_g70949 ) ) + Offest27_g70949 );
				float Alpha9_g70962 = temp_output_3_0_g70962;
				float temp_output_15_0_g70962 = 0.5;
				float Treshold9_g70962 = temp_output_15_0_g70962;
				{
				#if TVE_FEATURE_CLIP
				clip(Alpha9_g70962 - Treshold9_g70962);
				#endif
				}
				half Final_Clip914_g70929 = Alpha9_g70962;
				
				surfaceDescription.Normal = Final_Normal366_g70929;
				surfaceDescription.Smoothness = Final_SmoothnessAndWetness4130_g70929;
				surfaceDescription.Alpha = Final_Clip914_g70929;

				#ifdef _ALPHATEST_ON
				surfaceDescription.AlphaClipThreshold = _AlphaCutoff;
				#endif

				#ifdef _DEPTHOFFSET_ON
				surfaceDescription.DepthOffset = 0;
				#endif

				SurfaceData surfaceData;
				BuiltinData builtinData;
				GetSurfaceAndBuiltinData(surfaceDescription, input, V, posInput, surfaceData, builtinData);

				#ifdef _DEPTHOFFSET_ON
				outputDepth = posInput.deviceDepth;
				#endif

				#ifdef WRITE_MSAA_DEPTH	
					depthColor = packedInput.positionCS.z;
					#ifdef _ALPHATOMASK_ON
						depthColor.a = SharpenAlpha(builtinData.opacity, builtinData.alphaClipTreshold);
					#endif
				#endif

				#if defined(WRITE_NORMAL_BUFFER)
				EncodeIntoNormalBuffer(ConvertSurfaceDataToNormalData(surfaceData), outNormalBuffer);
				#endif

				#if defined(WRITE_DECAL_BUFFER) && !defined(_DISABLE_DECALS)
				DecalPrepassData decalPrepassData;
				decalPrepassData.geomNormalWS = surfaceData.geomNormalWS;
				decalPrepassData.decalLayerMask = GetMeshRenderingDecalLayer();
				EncodeIntoDecalPrepassBuffer(decalPrepassData, outDecalBuffer);
				#endif
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "Motion Vectors"
			Tags { "LightMode"="MotionVectors" }
			Cull [_CullMode]

			ZWrite On

			Stencil
			{
				Ref [_StencilRefMV]
				WriteMask [_StencilWriteMaskMV]
				Comp Always
				Pass Replace
				Fail Keep
				ZFail Keep
			}


			HLSLPROGRAM

			#define _MATERIAL_FEATURE_SPECULAR_COLOR 1
			#define _ENERGY_CONSERVING_SPECULAR 1
			#pragma multi_compile _ DOTS_INSTANCING_ON
			#pragma multi_compile_instancing
			#pragma instancing_options renderinglayer
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#define ASE_ABSOLUTE_VERTEX_POS 1
			#define _AMBIENT_OCCLUSION 1
			#define HAVE_MESH_MODIFICATION
			#define ASE_SRP_VERSION 120100


			// Keyword for transparent
			#pragma shader_feature _SURFACE_TYPE_TRANSPARENT
			#pragma shader_feature_local_fragment _ _ENABLE_FOG_ON_TRANSPARENT
			#pragma shader_feature_local _ _TRANSPARENT_WRITES_MOTION_VEC

			#define SHADERPASS SHADERPASS_MOTION_VECTORS
			#pragma multi_compile _ WRITE_NORMAL_BUFFER
			#pragma multi_compile_fragment _ WRITE_MSAA_DEPTH
			#pragma multi_compile _ WRITE_DECAL_BUFFER

			#pragma vertex Vert
			#pragma fragment Frag

			//-------------------------------------------------------------------------------------
			// Define
			//-------------------------------------------------------------------------------------

			#if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define OUTPUT_SPLIT_LIGHTING
			#endif

			#if defined(SHADER_LIT) && !defined(_SURFACE_TYPE_TRANSPARENT)
            #define _DEFERRED_CAPABLE_MATERIAL
            #endif
        
            #if defined(_TRANSPARENT_WRITES_MOTION_VEC) && defined(_SURFACE_TYPE_TRANSPARENT)
            #define _WRITE_TRANSPARENT_MOTION_VECTOR
            #endif

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl" 
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl" 
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphHeader.hlsl"

			#ifdef DEBUG_DISPLAY
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
			#endif
			
			CBUFFER_START( UnityPerMaterial )
			half4 _SecondColor;
			half4 _MainColor;
			half4 _MainUVs;
			half4 _ColorsMaskRemap;
			half4 _SecondUVs;
			half4 _OverlayMaskRemap;
			float4 _Color;
			float4 _SubsurfaceDiffusion_Asset;
			float4 _MaxBoundsInfo;
			float4 _SubsurfaceDiffusion_asset;
			float4 _GradientMaskRemap;
			half4 _VertexOcclusionColor;
			half4 _SubsurfaceMaskRemap;
			half4 _AlphaMaskRemap;
			half4 _DetailBlendRemap;
			float4 _EmissiveIntensityParams;
			float4 _NoiseMaskRemap;
			half4 _EmissiveUVs;
			half4 _EmissiveColor;
			half4 _VertexOcclusionRemap;
			half3 _render_normals;
			half _render_dst;
			half _MotionSpeed_20;
			half _RenderDirect;
			half _MotionVariation_20;
			half _IsStandardShader;
			half _MotionScale_20;
			half _InteractionMaskValue;
			half _MotionVariation_10;
			half _VertexDynamicMode;
			float _MotionSpeed_10;
			half _render_src;
			half _MotionAmplitude_20;
			float _MotionScale_10;
			half _MotionAmplitude_10;
			half _LayerMotionValue;
			half _VertexPivotMode;
			half _InteractionAmplitude;
			half _MotionValue_20;
			half _render_zw;
			half _VertexDataMode;
			half _MainOcclusionValue;
			half _GlobalWetness;
			half _SecondSmoothnessValue;
			half _MainSmoothnessValue;
			half _GlobalEmissive;
			half _EmissiveExposureValue;
			half _RenderSpecular;
			half _SecondNormalValue;
			half _DetailNormalValue;
			half _MainNormalValue;
			half _VertexOcclusionMaxValue;
			half _VertexOcclusionMinValue;
			half _OverlayMaskMaxValue;
			half _OverlayMaskMinValue;
			half _LayerExtrasValue;
			half _ExtrasPositionMode;
			half _GlobalOverlay;
			half _DetailBlendMaxValue;
			half _DetailBlendMinValue;
			half _DetailMaskInvertMode;
			half _DetailMaskMode;
			half _DetailMeshValue;
			half _DetailCoordMode;
			half _GlobalSize;
			half _LayerVertexValue;
			half _MotionFacingValue;
			half _CategoryRender;
			half _SubsurfaceDirectValue;
			half _RenderSSR;
			half _CategoryOcclusion;
			half _MessageSizeFade;
			half _DetailTypeMode;
			half _CategoryGlobal;
			half _CategorySizeFade;
			half _CategoryPerspective;
			half _IsVersion;
			half _CategoryNoise;
			half _RenderMode;
			half _HasOcclusion;
			half _CategoryDetail;
			half _HasEmissive;
			half _CategoryMotion;
			half _SubsurfaceNormalValue;
			half _EmissiveFlagMode;
			half _SpaceMotionGlobals;
			half _SubsurfaceShadowValue;
			half _RenderCoverage;
			half _RenderPriority;
			float _SubsurfaceDiffusion;
			half _VertexRollingMode;
			half _Cutoff;
			half _SubsurfaceScatteringValue;
			half _render_cull;
			half _IsBarkShader;
			half _CategorySubsurface;
			half _SpaceGlobalPosition;
			half _RenderClip;
			half _MessageMotionVariation;
			half _RenderCull;
			half _SecondOcclusionValue;
			half _RenderZWrite;
			half _SubsurfaceAmbientValue;
			half _RenderQueue;
			half _SubsurfaceAngleValue;
			half _AlphaClipValue;
			half _VertexMasksMode;
			half _LayerReactValue;
			half _DetailBlendMode;
			half _VertexVariationMode;
			half _RenderDecals;
			half _RenderShadow;
			half _DetailMode;
			half _SpaceRenderFade;
			half _IsTVEShader;
			half _CategoryEmissive;
			half _RenderAmbient;
			half _CategoryMain;
			half _CategoryGradient;
			half _SpaceGlobalLocals;
			half _SpaceMotionLocals;
			half _SpaceGlobalLayers;
			half _RenderNormals;
			half _HasGradient;
			half _MessageGlobalsVariation;
			half _FadeCameraValue;
			float4 _EmissionColor;
			float _AlphaCutoff;
			float _RenderQueueType;
			#ifdef _ADD_PRECOMPUTED_VELOCITY
			float _AddPrecomputedVelocity;
			#endif
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilRefDistortionVec;
			float _StencilWriteMaskDistortionVec;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
			float _SrcBlend;
			float _DstBlend;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _TransparentZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _EnableFogOnTransparent;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END
			sampler2D _BumpMap;
			half TVE_Enabled;
			sampler2D _MainTex;
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
			sampler2D _MainNormalTex;
			sampler2D _SecondNormalTex;
			sampler2D _MainMaskTex;
			sampler2D _SecondMaskTex;
			half TVE_OverlaySmoothness;
			sampler2D _MainAlbedoTex;
			sampler2D _SecondAlbedoTex;
			half4 TVE_ExtrasParams;
			TEXTURE2D_ARRAY(TVE_ExtrasTex);
			half4 TVE_ExtrasCoords;
			float TVE_ExtrasUsage[10];
			half TVE_CameraFadeStart;
			half TVE_CameraFadeEnd;
			sampler3D TVE_ScreenTex3D;
			half TVE_ScreenTexCoord;


			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#pragma shader_feature_local TVE_FEATURE_CLIP
			#pragma shader_feature_local TVE_FEATURE_BATCHING
			#pragma shader_feature_local TVE_FEATURE_DETAIL
			//TVE Pipeline Defines
			#define THE_VEGETATION_ENGINE
			#define TVE_IS_HD_PIPELINE
			//TVE HD Pipeline Defines
			#pragma shader_feature_local _DISABLE_DECALS
			#pragma shader_feature_local _DISABLE_SSR
			//TVE Injection Defines
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END
			//TVE Shader Type Defines
			#define TVE_IS_VEGETATION_SHADER


			#if defined(_DOUBLESIDED_ON) && !defined(ASE_NEED_CULLFACE)
			#define ASE_NEED_CULLFACE 1
			#endif


			struct AttributesMesh
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float3 previousPositionOS : TEXCOORD4;
				#if defined (_ADD_PRECOMPUTED_VELOCITY)
					float3 precomputedVelocity : TEXCOORD5;
				#endif
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryingsMeshToPS
			{
				float4 vmeshPositionCS : SV_Position;
				float3 vmeshInterp00 : TEXCOORD0;
				float3 vpassInterpolators0 : TEXCOORD1; //interpolators0
				float3 vpassInterpolators1 : TEXCOORD2; //interpolators1
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord6 : TEXCOORD6;
				float4 ase_texcoord7 : TEXCOORD7;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
				#if defined(SHADER_STAGE_FRAGMENT) && defined(ASE_NEED_CULLFACE)
				FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
				#endif
			};


			float3 ObjectPosition_UNITY_MATRIX_M(  )
			{
				return float3(UNITY_MATRIX_M[0].w, UNITY_MATRIX_M[1].w, UNITY_MATRIX_M[2].w );
			}
			
			float2 DecodeFloatToVector2( float enc )
			{
				float2 result ;
				result.y = enc % 2048;
				result.x = floor(enc / 2048);
				return result / (2048 - 1);
			}
			

			void BuildSurfaceData(FragInputs fragInputs, inout SmoothSurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData, out float3 bentNormalWS)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);

				surfaceData.specularOcclusion = 1.0;

				// surface data
				surfaceData.perceptualSmoothness =		surfaceDescription.Smoothness;

				// refraction
				#ifdef _HAS_REFRACTION
				if( _EnableSSRefraction )
				{
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


				// material features
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

				// others
				#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
				surfaceData.baseColor *= ( 1.0 - Max3( surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b ) );
				#endif
				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				// normals
				float3 normalTS = float3(0.0f, 0.0f, 1.0f);
				normalTS = surfaceDescription.Normal;
				GetNormalWS( fragInputs, normalTS, surfaceData.normalWS, doubleSidedConstants );

				surfaceData.geomNormalWS = fragInputs.tangentToWorld[2];
				surfaceData.tangentWS = normalize( fragInputs.tangentToWorld[ 0 ].xyz );

				// decals
				#if HAVE_DECALS
				if( _EnableDecals )
				{
					DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, surfaceDescription.Alpha);
					ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData);
				}
				#endif

				bentNormalWS = surfaceData.normalWS;
				surfaceData.tangentWS = Orthonormalize( surfaceData.tangentWS, surfaceData.normalWS );

				#if defined(_SPECULAR_OCCLUSION_CUSTOM)
				#elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO( V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness( surfaceData.perceptualSmoothness ) );
				#elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion( ClampNdotV( dot( surfaceData.normalWS, V ) ), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness( surfaceData.perceptualSmoothness ) );
				#endif

				// debug
				#if defined(DEBUG_DISPLAY)
				if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
				{
					surfaceData.metallic = 0;
				}
				ApplyDebugToSurfaceData(fragInputs.tangentToWorld, surfaceData);
				#endif
			}

			void GetSurfaceAndBuiltinData(SmoothSurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				#ifdef LOD_FADE_CROSSFADE
				LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
				#endif

				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				ApplyDoubleSidedFlipOrMirror( fragInputs, doubleSidedConstants );

				#ifdef _ALPHATEST_ON
				DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif

				#ifdef _DEPTHOFFSET_ON
				builtinData.depthOffset = surfaceDescription.DepthOffset;
				ApplyDepthOffsetPositionInput( V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput );
				#endif

				float3 bentNormalWS;
				BuildSurfaceData( fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS );

				InitBuiltinData( posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[ 2 ], fragInputs.texCoord1, fragInputs.texCoord2, builtinData );

				PostInitBuiltinData(V, posInput, surfaceData, builtinData);
			}

			AttributesMesh ApplyMeshModification(AttributesMesh inputMesh, float3 timeParameters, inout PackedVaryingsMeshToPS outputPackedVaryingsMeshToPS )
			{
				_TimeParameters.xyz = timeParameters;
				float3 VertexPosition3588_g70929 = inputMesh.positionOS;
				half3 Mesh_PivotsOS2291_g70929 = half3(0,0,0);
				float3 temp_output_2283_0_g70929 = ( VertexPosition3588_g70929 - Mesh_PivotsOS2291_g70929 );
				half3 VertexPos40_g71005 = temp_output_2283_0_g70929;
				float3 appendResult74_g71005 = (float3(VertexPos40_g71005.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g71005 = appendResult74_g71005;
				float3 break84_g71005 = VertexPos40_g71005;
				float3 appendResult81_g71005 = (float3(0.0 , break84_g71005.y , break84_g71005.z));
				half3 VertexPosOtherAxis82_g71005 = appendResult81_g71005;
				float4 temp_output_91_19_g70965 = TVE_MotionCoords;
				float3 localObjectPosition_UNITY_MATRIX_M14_g70996 = ObjectPosition_UNITY_MATRIX_M();
				float3 appendResult60_g70954 = (float3(inputMesh.ase_texcoord3.x , inputMesh.ase_texcoord3.z , inputMesh.ase_texcoord3.y));
				half3 Mesh_PivotsData2831_g70929 = ( appendResult60_g70954 * _VertexPivotMode );
				float3 temp_output_122_0_g70996 = Mesh_PivotsData2831_g70929;
				float3 PivotsOnly105_g70996 = (mul( GetObjectToWorldMatrix(), float4( temp_output_122_0_g70996 , 0.0 ) ).xyz).xyz;
				#ifdef SHADEROPTIONS_CAMERA_RELATIVE_RENDERING
				float3 staticSwitch13_g70996 = ( ( localObjectPosition_UNITY_MATRIX_M14_g70996 + PivotsOnly105_g70996 ) + _WorldSpaceCameraPos );
				#else
				float3 staticSwitch13_g70996 = ( localObjectPosition_UNITY_MATRIX_M14_g70996 + PivotsOnly105_g70996 );
				#endif
				half3 ObjectData20_g70997 = staticSwitch13_g70996;
				float3 ase_worldPos = GetAbsolutePositionWS( TransformObjectToWorld( (inputMesh.positionOS).xyz ) );
				half3 WorldData19_g70997 = ase_worldPos;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g70997 = WorldData19_g70997;
				#else
				float3 staticSwitch14_g70997 = ObjectData20_g70997;
				#endif
				float3 temp_output_114_0_g70996 = staticSwitch14_g70997;
				float3 vertexToFrag4224_g70929 = temp_output_114_0_g70996;
				half3 ObjectData20_g70970 = vertexToFrag4224_g70929;
				float3 vertexToFrag3890_g70929 = ase_worldPos;
				half3 WorldData19_g70970 = vertexToFrag3890_g70929;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g70970 = WorldData19_g70970;
				#else
				float3 staticSwitch14_g70970 = ObjectData20_g70970;
				#endif
				float3 ObjectPosition4223_g70929 = staticSwitch14_g70970;
				half2 UV94_g70965 = ( (temp_output_91_19_g70965).zw + ( (temp_output_91_19_g70965).xy * (ObjectPosition4223_g70929).xz ) );
				float temp_output_84_0_g70965 = _LayerMotionValue;
				float4 lerpResult107_g70965 = lerp( TVE_MotionParams , saturate( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_MotionTex, sampler_linear_repeat, UV94_g70965,temp_output_84_0_g70965, 0.0 ) ) , TVE_MotionUsage[(int)temp_output_84_0_g70965]);
				half4 Global_Motion_Params3909_g70929 = lerpResult107_g70965;
				float4 break322_g70972 = Global_Motion_Params3909_g70929;
				float3 appendResult397_g70972 = (float3(break322_g70972.x , 0.0 , break322_g70972.y));
				float3 temp_output_398_0_g70972 = (appendResult397_g70972*2.0 + -1.0);
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				half2 Global_MotionDirectionOS39_g70929 = (( mul( GetWorldToObjectMatrix(), float4( temp_output_398_0_g70972 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_DirectionOS358_g71001 = Global_MotionDirectionOS39_g70929;
				half Mesh_Height1524_g70929 = inputMesh.ase_color.a;
				half Mesh_Height114_g70956 = Mesh_Height1524_g70929;
				half ObjectData20_g70957 = ( Mesh_Height114_g70956 * 2.0 );
				float enc62_g70955 = inputMesh.ase_texcoord.w;
				float2 localDecodeFloatToVector262_g70955 = DecodeFloatToVector2( enc62_g70955 );
				float2 break63_g70955 = ( localDecodeFloatToVector262_g70955 * 100.0 );
				float Bounds_Height5230_g70929 = break63_g70955.x;
				float Bounds_Height117_g70956 = Bounds_Height5230_g70929;
				half WorldData19_g70957 = ( ( Mesh_Height114_g70956 * Mesh_Height114_g70956 ) * Bounds_Height117_g70956 * 2.0 );
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g70957 = WorldData19_g70957;
				#else
				float staticSwitch14_g70957 = ObjectData20_g70957;
				#endif
				half Motion_10_Mask5242_g70929 = staticSwitch14_g70957;
				half Wind_Power369_g70972 = break322_g70972.z;
				half Global_MotionPower2223_g70929 = Wind_Power369_g70972;
				half3 Input_Position419_g70975 = -ObjectPosition4223_g70929;
				half2 Global_MotionDirectionWS4683_g70929 = (temp_output_398_0_g70972).xz;
				half2 Input_DirectionWS423_g70975 = Global_MotionDirectionWS4683_g70929;
				float Motion_Scale287_g70975 = ( _MotionScale_10 + 0.2 );
				half Global_Scale448_g70975 = TVE_NoiseParams.x;
				half Input_Speed62_g70975 = _MotionSpeed_10;
				half Global_Speed449_g70975 = TVE_NoiseParams.y;
				float mulTime426_g70975 = _TimeParameters.x * ( Input_Speed62_g70975 * Global_Speed449_g70975 );
				half Global_DistScale561_g70975 = TVE_NoiseParams.w;
				float3 break461_g70975 = ( Input_Position419_g70975 * Global_DistScale561_g70975 );
				half Global_DistAmplitude559_g70975 = TVE_NoiseParams.z;
				float Noise_Distortion469_g70975 = ( sin( ( break461_g70975.x + break461_g70975.z ) ) * Global_DistAmplitude559_g70975 );
				float3 break111_g70958 = ObjectPosition4223_g70929;
				half Global_DynamicMode5112_g70929 = _VertexDynamicMode;
				half Input_DynamicMode120_g70958 = Global_DynamicMode5112_g70929;
				float Mesh_Variation16_g70929 = inputMesh.ase_color.r;
				half Input_Variation124_g70958 = Mesh_Variation16_g70929;
				half ObjectData20_g70959 = frac( ( ( ( break111_g70958.x + break111_g70958.y + break111_g70958.z ) * ( 1.0 - Input_DynamicMode120_g70958 ) ) + Input_Variation124_g70958 ) );
				half WorldData19_g70959 = Input_Variation124_g70958;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g70959 = WorldData19_g70959;
				#else
				float staticSwitch14_g70959 = ObjectData20_g70959;
				#endif
				float clampResult129_g70958 = clamp( staticSwitch14_g70959 , 0.01 , 0.99 );
				half Global_MeshVariation5104_g70929 = clampResult129_g70958;
				half Motion_Variation284_g70975 = ( _MotionVariation_10 * Global_MeshVariation5104_g70929 );
				float2 temp_output_425_0_g70975 = ( ( (Input_Position419_g70975).xz * Input_DirectionWS423_g70975 * Motion_Scale287_g70975 * Global_Scale448_g70975 ) + ( mulTime426_g70975 + Noise_Distortion469_g70975 + Motion_Variation284_g70975 ) );
				float2 break500_g70975 = ( temp_output_425_0_g70975 * 0.1178 );
				float2 break494_g70975 = ( temp_output_425_0_g70975 * 0.1742 );
				half Input_WindPower327_g70975 = Global_MotionPower2223_g70929;
				float lerpResult430_g70975 = lerp( 1.4 , 0.4 , Input_WindPower327_g70975);
				half Global_MotionNoise34_g70929 = (pow( (( sin( ( break500_g70975.x + break500_g70975.y ) ) * sin( ( break494_g70975.x + break494_g70975.y ) ) )*0.4 + 0.6) , lerpResult430_g70975 )*1.2 + -0.2);
				half Motion_10_Amplitude2258_g70929 = ( _MotionAmplitude_10 * Motion_10_Mask5242_g70929 * Global_MotionPower2223_g70929 * Global_MotionNoise34_g70929 );
				half Input_BendingAmplitude376_g71001 = Motion_10_Amplitude2258_g70929;
				half Input_InteractionAmplitude58_g71001 = _InteractionAmplitude;
				half Input_MeshMotion_10321_g71001 = Motion_10_Mask5242_g70929;
				half Input_InteractionUseMask62_g71001 = _InteractionMaskValue;
				float lerpResult371_g71001 = lerp( 2.0 , Input_MeshMotion_10321_g71001 , Input_InteractionUseMask62_g71001);
				half ObjectData20_g71002 = lerpResult371_g71001;
				half WorldData19_g71002 = Input_MeshMotion_10321_g71001;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g71002 = WorldData19_g71002;
				#else
				float staticSwitch14_g71002 = ObjectData20_g71002;
				#endif
				half Motion_10_Interaction373_g71001 = ( Input_InteractionAmplitude58_g71001 * staticSwitch14_g71002 );
				half Global_InteractionMask66_g70929 = ( break322_g70972.w * break322_g70972.w );
				float Input_InteractionMask330_g71001 = Global_InteractionMask66_g70929;
				float lerpResult360_g71001 = lerp( Input_BendingAmplitude376_g71001 , Motion_10_Interaction373_g71001 , saturate( ( Input_InteractionAmplitude58_g71001 * Input_InteractionMask330_g71001 ) ));
				float2 break364_g71001 = ( Input_DirectionOS358_g71001 * lerpResult360_g71001 );
				half Motion_10_BendingZ190_g70929 = break364_g71001.y;
				half Angle44_g71005 = Motion_10_BendingZ190_g70929;
				half3 VertexPos40_g71004 = ( VertexPosRotationAxis50_g71005 + ( VertexPosOtherAxis82_g71005 * cos( Angle44_g71005 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g71005 ) * sin( Angle44_g71005 ) ) );
				float3 appendResult74_g71004 = (float3(0.0 , 0.0 , VertexPos40_g71004.z));
				half3 VertexPosRotationAxis50_g71004 = appendResult74_g71004;
				float3 break84_g71004 = VertexPos40_g71004;
				float3 appendResult81_g71004 = (float3(break84_g71004.x , break84_g71004.y , 0.0));
				half3 VertexPosOtherAxis82_g71004 = appendResult81_g71004;
				half Motion_10_BendingX216_g70929 = break364_g71001.x;
				half Angle44_g71004 = -Motion_10_BendingX216_g70929;
				half Input_Scale321_g70944 = _MotionScale_20;
				half Input_Variation330_g70944 = ( _MotionVariation_20 * Global_MeshVariation5104_g70929 );
				half Input_Speed62_g70944 = _MotionSpeed_20;
				float mulTime349_g70944 = _TimeParameters.x * Input_Speed62_g70944;
				float temp_output_302_0_g70944 = sin( ( ( ( ase_worldPos.x + ase_worldPos.y + ase_worldPos.z ) * Input_Scale321_g70944 ) + Input_Variation330_g70944 + mulTime349_g70944 ) );
				float enc59_g70955 = inputMesh.ase_texcoord.z;
				float2 localDecodeFloatToVector259_g70955 = DecodeFloatToVector2( enc59_g70955 );
				float2 break61_g70955 = localDecodeFloatToVector259_g70955;
				half Mesh_Motion_2060_g70929 = break61_g70955.x;
				half Mesh_Motion_20115_g70956 = Mesh_Motion_2060_g70929;
				float Bounds_Radius5231_g70929 = break63_g70955.y;
				float Bounds_Radius118_g70956 = Bounds_Radius5231_g70929;
				half Motion_20_Mask5243_g70929 = ( Mesh_Motion_20115_g70956 * Bounds_Radius118_g70956 );
				half3 Input_Position419_g70960 = VertexPosition3588_g70929;
				float3 normalizeResult518_g70960 = normalize( Input_Position419_g70960 );
				half2 Input_DirectionOS423_g70960 = Global_MotionDirectionOS39_g70929;
				float2 break521_g70960 = -Input_DirectionOS423_g70960;
				float3 appendResult522_g70960 = (float3(break521_g70960.x , 0.0 , break521_g70960.y));
				float dotResult519_g70960 = dot( normalizeResult518_g70960 , appendResult522_g70960 );
				half Input_Mask62_g70960 = _MotionFacingValue;
				float lerpResult524_g70960 = lerp( 1.0 , (dotResult519_g70960*0.5 + 0.5) , Input_Mask62_g70960);
				half ObjectData20_g70961 = lerpResult524_g70960;
				half WorldData19_g70961 = 1.0;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g70961 = WorldData19_g70961;
				#else
				float staticSwitch14_g70961 = ObjectData20_g70961;
				#endif
				half Motion_FacingMask5214_g70929 = staticSwitch14_g70961;
				half Motion_20_Amplitude4381_g70929 = ( _MotionAmplitude_20 * _MotionValue_20 * Motion_20_Mask5243_g70929 * Global_MotionPower2223_g70929 * Global_MotionNoise34_g70929 * Motion_FacingMask5214_g70929 );
				half Input_Amplitude58_g70944 = Motion_20_Amplitude4381_g70929;
				half2 Input_DirectionOS366_g70944 = Global_MotionDirectionOS39_g70929;
				float2 break371_g70944 = Input_DirectionOS366_g70944;
				float3 appendResult372_g70944 = (float3(break371_g70944.x , ( temp_output_302_0_g70944 * 0.1 ) , break371_g70944.y));
				half3 Motion_20_Squash4418_g70929 = ( ( (temp_output_302_0_g70944*0.2 + 1.0) * Input_Amplitude58_g70944 ) * appendResult372_g70944 );
				float3 Vertex_Motion_Object833_g70929 = ( ( VertexPosRotationAxis50_g71004 + ( VertexPosOtherAxis82_g71004 * cos( Angle44_g71004 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g71004 ) * sin( Angle44_g71004 ) ) ) + Motion_20_Squash4418_g70929 );
				float3 temp_output_3474_0_g70929 = ( VertexPosition3588_g70929 - Mesh_PivotsOS2291_g70929 );
				float3 appendResult2043_g70929 = (float3(Motion_10_BendingX216_g70929 , 0.0 , Motion_10_BendingZ190_g70929));
				float3 Vertex_Motion_World1118_g70929 = ( ( temp_output_3474_0_g70929 + appendResult2043_g70929 ) + Motion_20_Squash4418_g70929 );
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch4976_g70929 = Vertex_Motion_World1118_g70929;
				#else
				float3 staticSwitch4976_g70929 = ( Vertex_Motion_Object833_g70929 + ( _VertexDataMode * 0.0 ) );
				#endif
				float4 temp_output_94_19_g70988 = TVE_VertexCoords;
				half2 UV97_g70988 = ( (temp_output_94_19_g70988).zw + ( (temp_output_94_19_g70988).xy * (ObjectPosition4223_g70929).xz ) );
				float temp_output_84_0_g70988 = _LayerVertexValue;
				float4 lerpResult109_g70988 = lerp( TVE_VertexParams , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_VertexTex, sampler_linear_repeat, UV97_g70988,temp_output_84_0_g70988, 0.0 ) , TVE_VertexUsage[(int)temp_output_84_0_g70988]);
				half4 Global_Object_Params4173_g70929 = lerpResult109_g70988;
				half Global_VertexSize174_g70929 = saturate( Global_Object_Params4173_g70929.w );
				float lerpResult346_g70929 = lerp( 1.0 , Global_VertexSize174_g70929 , _GlobalSize);
				float3 appendResult3480_g70929 = (float3(lerpResult346_g70929 , lerpResult346_g70929 , lerpResult346_g70929));
				half3 ObjectData20_g70964 = appendResult3480_g70929;
				half3 _Vector11 = half3(1,1,1);
				half3 WorldData19_g70964 = _Vector11;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g70964 = WorldData19_g70964;
				#else
				float3 staticSwitch14_g70964 = ObjectData20_g70964;
				#endif
				half3 Vertex_Size1741_g70929 = staticSwitch14_g70964;
				half3 _Vector5 = half3(1,1,1);
				float3 Vertex_SizeFade1740_g70929 = _Vector5;
				half3 Grass_Perspective2661_g70929 = half3(0,0,0);
				float3 lerpResult16_g70963 = lerp( VertexPosition3588_g70929 , ( ( staticSwitch4976_g70929 * Vertex_Size1741_g70929 * Vertex_SizeFade1740_g70929 ) + Mesh_PivotsOS2291_g70929 + Grass_Perspective2661_g70929 ) , TVE_Enabled);
				float3 Final_VertexPosition890_g70929 = ( lerpResult16_g70963 + _DisableSRPBatcher );
				
				float2 appendResult21_g70955 = (float2(inputMesh.ase_texcoord1.z , inputMesh.ase_texcoord1.w));
				float2 Mesh_DetailCoord3_g70929 = appendResult21_g70955;
				float2 lerpResult1545_g70929 = lerp( inputMesh.ase_texcoord.xy , Mesh_DetailCoord3_g70929 , _DetailCoordMode);
				float2 vertexToFrag11_g71000 = ( ( lerpResult1545_g70929 * (_SecondUVs).xy ) + (_SecondUVs).zw );
				outputPackedVaryingsMeshToPS.ase_texcoord4.xy = vertexToFrag11_g71000;
				half Mesh_DetailMask90_g70929 = inputMesh.ase_color.b;
				float temp_output_990_0_g70929 = ( Mesh_DetailMask90_g70929 - 0.5 );
				float vertexToFrag11_g70931 = ( temp_output_990_0_g70929 + _DetailMeshValue );
				outputPackedVaryingsMeshToPS.ase_texcoord4.z = vertexToFrag11_g70931;
				
				float3 ase_worldNormal = TransformObjectToWorldNormal(inputMesh.normalOS);
				float3 vertexToFrag5058_g70929 = ase_worldNormal;
				outputPackedVaryingsMeshToPS.ase_texcoord5.xyz = vertexToFrag5058_g70929;
				outputPackedVaryingsMeshToPS.ase_texcoord6.xyz = vertexToFrag3890_g70929;
				outputPackedVaryingsMeshToPS.ase_texcoord7.xyz = vertexToFrag4224_g70929;
				
				float temp_output_7_0_g70945 = TVE_CameraFadeStart;
				float lerpResult4755_g70929 = lerp( 1.0 , saturate( ( ( distance( ase_worldPos , _WorldSpaceCameraPos ) - temp_output_7_0_g70945 ) / ( TVE_CameraFadeEnd - temp_output_7_0_g70945 ) ) ) , _FadeCameraValue);
				float vertexToFrag11_g70951 = lerpResult4755_g70929;
				outputPackedVaryingsMeshToPS.ase_texcoord4.w = vertexToFrag11_g70951;
				
				outputPackedVaryingsMeshToPS.ase_texcoord3 = inputMesh.ase_texcoord;
				outputPackedVaryingsMeshToPS.ase_normal = inputMesh.normalOS;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				outputPackedVaryingsMeshToPS.ase_texcoord5.w = 0;
				outputPackedVaryingsMeshToPS.ase_texcoord6.w = 0;
				outputPackedVaryingsMeshToPS.ase_texcoord7.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue = Final_VertexPosition890_g70929;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif
				inputMesh.normalOS =  inputMesh.normalOS ;
				return inputMesh;
			}

			PackedVaryingsMeshToPS VertexFunction(AttributesMesh inputMesh)
			{
				PackedVaryingsMeshToPS outputPackedVaryingsMeshToPS = (PackedVaryingsMeshToPS)0;
				AttributesMesh defaultMesh = inputMesh;

				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, outputPackedVaryingsMeshToPS);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( outputPackedVaryingsMeshToPS );

				inputMesh = ApplyMeshModification( inputMesh, _TimeParameters.xyz, outputPackedVaryingsMeshToPS);

				float3 positionRWS = TransformObjectToWorld(inputMesh.positionOS);
				float3 normalWS = TransformObjectToWorldNormal(inputMesh.normalOS);

				float3 VMESHpositionRWS = positionRWS;
				float4 VMESHpositionCS = TransformWorldToHClip(positionRWS);

				#if UNITY_REVERSED_Z
				VMESHpositionCS.z += unity_MotionVectorsParams.z * VMESHpositionCS.w;
				#else
				VMESHpositionCS.z -= unity_MotionVectorsParams.z * VMESHpositionCS.w;
				#endif

				float4 VPASSpreviousPositionCS;
				float4 VPASSpositionCS = mul(UNITY_MATRIX_UNJITTERED_VP, float4(VMESHpositionRWS, 1.0));

				bool forceNoMotion = unity_MotionVectorsParams.y == 0.0;
				if (forceNoMotion)
				{
					VPASSpreviousPositionCS = float4(0.0, 0.0, 0.0, 1.0);
				}
				else
				{
					bool hasDeformation = unity_MotionVectorsParams.x > 0.0;
					float3 effectivePositionOS = (hasDeformation ? inputMesh.previousPositionOS : defaultMesh.positionOS);
					#if defined(_ADD_PRECOMPUTED_VELOCITY)
					effectivePositionOS -= inputMesh.precomputedVelocity;
					#endif

					#if defined(HAVE_MESH_MODIFICATION)
						AttributesMesh previousMesh = defaultMesh;
						previousMesh.positionOS = effectivePositionOS ;
						PackedVaryingsMeshToPS test = (PackedVaryingsMeshToPS)0;
						float3 curTime = _TimeParameters.xyz;
						previousMesh = ApplyMeshModification(previousMesh, _LastTimeParameters.xyz, test);
						_TimeParameters.xyz = curTime;
						float3 previousPositionRWS = TransformPreviousObjectToWorld(previousMesh.positionOS);
					#else
						float3 previousPositionRWS = TransformPreviousObjectToWorld(effectivePositionOS);
					#endif

					#ifdef ATTRIBUTES_NEED_NORMAL
						float3 normalWS = TransformPreviousObjectToWorldNormal(defaultMesh.normalOS);
					#else
						float3 normalWS = float3(0.0, 0.0, 0.0);
					#endif

					#if defined(HAVE_VERTEX_MODIFICATION)
						//ApplyVertexModification(inputMesh, normalWS, previousPositionRWS, _LastTimeParameters.xyz);
					#endif

					#ifdef _WRITE_TRANSPARENT_MOTION_VECTOR
						if (_TransparentCameraOnlyMotionVectors > 0)
						{
							previousPositionRWS = VMESHpositionRWS.xyz;
						}
					#endif

					VPASSpreviousPositionCS = mul(UNITY_MATRIX_PREV_VP, float4(previousPositionRWS, 1.0));
				}

				outputPackedVaryingsMeshToPS.vmeshPositionCS = VMESHpositionCS;
				outputPackedVaryingsMeshToPS.vmeshInterp00.xyz = VMESHpositionRWS;

				outputPackedVaryingsMeshToPS.vpassInterpolators0 = float3(VPASSpositionCS.xyw);
				outputPackedVaryingsMeshToPS.vpassInterpolators1 = float3(VPASSpreviousPositionCS.xyw);
				return outputPackedVaryingsMeshToPS;
			}

			#if defined(WRITE_DECAL_BUFFER) && !defined(_DISABLE_DECALS)
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalPrepassBuffer.hlsl"
			#endif


			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float3 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float3 previousPositionOS : TEXCOORD4;
				#if defined (_ADD_PRECOMPUTED_VELOCITY)
					float3 precomputedVelocity : TEXCOORD5;
				#endif
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl Vert ( AttributesMesh v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.positionOS = v.positionOS;
				o.normalOS = v.normalOS;
				o.previousPositionOS = v.previousPositionOS;
				#if defined (_ADD_PRECOMPUTED_VELOCITY)
				o.precomputedVelocity = v.precomputedVelocity;
				#endif
				o.ase_texcoord3 = v.ase_texcoord3;
				o.ase_color = v.ase_color;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_texcoord1 = v.ase_texcoord1;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				float3 cameraPos = 0;
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), cameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, GetObjectToWorldMatrix(), cameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), cameraPos, _ScreenParams, _FrustumPlanes );
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
			PackedVaryingsMeshToPS DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				AttributesMesh o = (AttributesMesh) 0;
				o.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.previousPositionOS = patch[0].previousPositionOS * bary.x + patch[1].previousPositionOS * bary.y + patch[2].previousPositionOS * bary.z;
				#if defined (_ADD_PRECOMPUTED_VELOCITY)
					o.precomputedVelocity = patch[0].precomputedVelocity * bary.x + patch[1].precomputedVelocity * bary.y + patch[2].precomputedVelocity * bary.z;
				#endif
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_texcoord1 = patch[0].ase_texcoord1 * bary.x + patch[1].ase_texcoord1 * bary.y + patch[2].ase_texcoord1 * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			PackedVaryingsMeshToPS Vert ( AttributesMesh v )
			{
				return VertexFunction( v );
			}
			#endif

			#if defined(WRITE_DECAL_BUFFER) && defined(WRITE_MSAA_DEPTH)
			#define SV_TARGET_NORMAL SV_Target3
			#elif defined(WRITE_DECAL_BUFFER) || defined(WRITE_MSAA_DEPTH)
			#define SV_TARGET_NORMAL SV_Target2
			#else
			#define SV_TARGET_NORMAL SV_Target1
			#endif

			void Frag( PackedVaryingsMeshToPS packedInput
				#ifdef WRITE_MSAA_DEPTH
					, out float4 depthColor : SV_Target0
					, out float4 outMotionVector : SV_Target1
						#ifdef WRITE_DECAL_BUFFER
						, out float4 outDecalBuffer : SV_Target2
						#endif
					#else
					, out float4 outMotionVector : SV_Target0
						#ifdef WRITE_DECAL_BUFFER
						, out float4 outDecalBuffer : SV_Target1
						#endif
					#endif

					#ifdef WRITE_NORMAL_BUFFER
					, out float4 outNormalBuffer : SV_TARGET_NORMAL
					#endif

					#ifdef _DEPTHOFFSET_ON
					, out float outputDepth : SV_Depth
					#endif
				, FRONT_FACE_TYPE ase_vface : FRONT_FACE_SEMANTIC
				)
			{
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( packedInput );
				UNITY_SETUP_INSTANCE_ID( packedInput );
				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);
				input.tangentToWorld = k_identity3x3;
				input.positionSS = packedInput.vmeshPositionCS;
				input.positionRWS = packedInput.vmeshInterp00.xyz;

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS);

				float3 V = GetWorldSpaceNormalizeViewDir(input.positionRWS);

				SurfaceData surfaceData;
				BuiltinData builtinData;

				SmoothSurfaceDescription surfaceDescription = (SmoothSurfaceDescription)0;
				half2 Main_UVs15_g70929 = ( ( packedInput.ase_texcoord3.xy * (_MainUVs).xy ) + (_MainUVs).zw );
				float3 unpack4112_g70929 = UnpackNormalScale( tex2D( _MainNormalTex, Main_UVs15_g70929 ), _MainNormalValue );
				unpack4112_g70929.z = lerp( 1, unpack4112_g70929.z, saturate(_MainNormalValue) );
				half3 Main_Normal137_g70929 = unpack4112_g70929;
				float3 lerpResult3372_g70929 = lerp( float3( 0,0,1 ) , Main_Normal137_g70929 , _DetailNormalValue);
				float2 vertexToFrag11_g71000 = packedInput.ase_texcoord4.xy;
				half2 Second_UVs17_g70929 = vertexToFrag11_g71000;
				float3 unpack4114_g70929 = UnpackNormalScale( tex2D( _SecondNormalTex, Second_UVs17_g70929 ), _SecondNormalValue );
				unpack4114_g70929.z = lerp( 1, unpack4114_g70929.z, saturate(_SecondNormalValue) );
				half3 Second_Normal179_g70929 = unpack4114_g70929;
				float vertexToFrag11_g70931 = packedInput.ase_texcoord4.z;
				half Blend_Source1540_g70929 = vertexToFrag11_g70931;
				float4 tex2DNode35_g70929 = tex2D( _MainMaskTex, Main_UVs15_g70929 );
				half Main_Mask57_g70929 = tex2DNode35_g70929.b;
				float4 tex2DNode33_g70929 = tex2D( _SecondMaskTex, Second_UVs17_g70929 );
				half Second_Mask81_g70929 = tex2DNode33_g70929.b;
				float lerpResult1327_g70929 = lerp( Main_Mask57_g70929 , Second_Mask81_g70929 , _DetailMaskMode);
				float lerpResult4058_g70929 = lerp( lerpResult1327_g70929 , ( 1.0 - lerpResult1327_g70929 ) , _DetailMaskInvertMode);
				float temp_output_7_0_g71007 = _DetailBlendMinValue;
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch4838_g70929 = saturate( ( ( saturate( ( Blend_Source1540_g70929 + ( Blend_Source1540_g70929 * lerpResult4058_g70929 ) ) ) - temp_output_7_0_g71007 ) / ( _DetailBlendMaxValue - temp_output_7_0_g71007 ) ) );
				#else
				float staticSwitch4838_g70929 = 0.0;
				#endif
				half Mask_Detail147_g70929 = staticSwitch4838_g70929;
				float3 lerpResult3376_g70929 = lerp( Main_Normal137_g70929 , BlendNormal( lerpResult3372_g70929 , Second_Normal179_g70929 ) , Mask_Detail147_g70929);
				#ifdef TVE_FEATURE_DETAIL
				float3 staticSwitch267_g70929 = lerpResult3376_g70929;
				#else
				float3 staticSwitch267_g70929 = Main_Normal137_g70929;
				#endif
				float3 temp_output_13_0_g70940 = staticSwitch267_g70929;
				float3 switchResult12_g70940 = (((ase_vface>0)?(temp_output_13_0_g70940):(( temp_output_13_0_g70940 * _render_normals ))));
				half3 Blend_Normal312_g70929 = switchResult12_g70940;
				half3 Final_Normal366_g70929 = Blend_Normal312_g70929;
				
				half Main_Smoothness227_g70929 = ( tex2DNode35_g70929.a * _MainSmoothnessValue );
				half Second_Smoothness236_g70929 = ( tex2DNode33_g70929.a * _SecondSmoothnessValue );
				float lerpResult266_g70929 = lerp( Main_Smoothness227_g70929 , Second_Smoothness236_g70929 , Mask_Detail147_g70929);
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch297_g70929 = lerpResult266_g70929;
				#else
				float staticSwitch297_g70929 = Main_Smoothness227_g70929;
				#endif
				half Blend_Smoothness314_g70929 = staticSwitch297_g70929;
				half Global_OverlaySmoothness311_g70929 = TVE_OverlaySmoothness;
				float3 vertexToFrag5058_g70929 = packedInput.ase_texcoord5.xyz;
				half3 World_Normal4101_g70929 = vertexToFrag5058_g70929;
				half Global_DynamicMode5112_g70929 = _VertexDynamicMode;
				float lerpResult4801_g70929 = lerp( World_Normal4101_g70929.y , packedInput.ase_normal.y , Global_DynamicMode5112_g70929);
				float lerpResult3567_g70929 = lerp( 0.5 , 1.0 , lerpResult4801_g70929);
				float4 tex2DNode29_g70929 = tex2D( _MainAlbedoTex, Main_UVs15_g70929 );
				half3 Main_Albedo99_g70929 = ( (_MainColor).rgb * (tex2DNode29_g70929).rgb );
				float4 tex2DNode89_g70929 = tex2D( _SecondAlbedoTex, Second_UVs17_g70929 );
				half3 Second_Albedo153_g70929 = (( _SecondColor * tex2DNode89_g70929 )).rgb;
				float3 lerpResult4834_g70929 = lerp( ( Main_Albedo99_g70929 * Second_Albedo153_g70929 * 4.594794 ) , Second_Albedo153_g70929 , _DetailBlendMode);
				float3 lerpResult235_g70929 = lerp( Main_Albedo99_g70929 , lerpResult4834_g70929 , Mask_Detail147_g70929);
				#ifdef TVE_FEATURE_DETAIL
				float3 staticSwitch255_g70929 = lerpResult235_g70929;
				#else
				float3 staticSwitch255_g70929 = Main_Albedo99_g70929;
				#endif
				half3 Blend_Albedo265_g70929 = staticSwitch255_g70929;
				float4 temp_output_93_19_g70934 = TVE_ExtrasCoords;
				float3 vertexToFrag3890_g70929 = packedInput.ase_texcoord6.xyz;
				float3 WorldPosition3905_g70929 = vertexToFrag3890_g70929;
				float3 vertexToFrag4224_g70929 = packedInput.ase_texcoord7.xyz;
				half3 ObjectData20_g70970 = vertexToFrag4224_g70929;
				half3 WorldData19_g70970 = vertexToFrag3890_g70929;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g70970 = WorldData19_g70970;
				#else
				float3 staticSwitch14_g70970 = ObjectData20_g70970;
				#endif
				float3 ObjectPosition4223_g70929 = staticSwitch14_g70970;
				float3 lerpResult4827_g70929 = lerp( WorldPosition3905_g70929 , ObjectPosition4223_g70929 , _ExtrasPositionMode);
				half2 UV96_g70934 = ( (temp_output_93_19_g70934).zw + ( (temp_output_93_19_g70934).xy * (lerpResult4827_g70929).xz ) );
				float temp_output_84_0_g70934 = _LayerExtrasValue;
				float4 lerpResult109_g70934 = lerp( TVE_ExtrasParams , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_ExtrasTex, sampler_linear_repeat, UV96_g70934,temp_output_84_0_g70934, 0.0 ) , TVE_ExtrasUsage[(int)temp_output_84_0_g70934]);
				float4 break89_g70934 = lerpResult109_g70934;
				half Global_Extras_Overlay156_g70929 = break89_g70934.b;
				half Overlay_Variation4560_g70929 = 1.0;
				half Overlay_Commons1365_g70929 = ( _GlobalOverlay * Global_Extras_Overlay156_g70929 * Overlay_Variation4560_g70929 );
				half Overlay_Mask_3D5122_g70929 = ( ( ( lerpResult3567_g70929 * 0.5 ) + Blend_Albedo265_g70929.y ) * Overlay_Commons1365_g70929 );
				float temp_output_7_0_g70971 = _OverlayMaskMinValue;
				half Overlay_Mask269_g70929 = saturate( ( ( Overlay_Mask_3D5122_g70929 - temp_output_7_0_g70971 ) / ( _OverlayMaskMaxValue - temp_output_7_0_g70971 ) ) );
				float lerpResult343_g70929 = lerp( Blend_Smoothness314_g70929 , Global_OverlaySmoothness311_g70929 , Overlay_Mask269_g70929);
				half Final_Smoothness371_g70929 = lerpResult343_g70929;
				half Global_Extras_Wetness305_g70929 = break89_g70934.g;
				float lerpResult3673_g70929 = lerp( 0.0 , Global_Extras_Wetness305_g70929 , _GlobalWetness);
				half Final_SmoothnessAndWetness4130_g70929 = saturate( ( Final_Smoothness371_g70929 + lerpResult3673_g70929 ) );
				
				float localCustomAlphaClip9_g70962 = ( 0.0 );
				float vertexToFrag11_g70951 = packedInput.ase_texcoord4.w;
				half Fade_Camera_Mask5149_g70929 = 1.0;
				float lerpResult5141_g70929 = lerp( 1.0 , vertexToFrag11_g70951 , Fade_Camera_Mask5149_g70929);
				half Fade_Camera3743_g70929 = lerpResult5141_g70929;
				float temp_output_41_0_g70948 = ( 1.0 * Fade_Camera3743_g70929 );
				half Final_AlphaFade3727_g70929 = saturate( ( temp_output_41_0_g70948 + ( temp_output_41_0_g70948 * tex3D( TVE_ScreenTex3D, ( TVE_ScreenTexCoord * WorldPosition3905_g70929 ) ).r ) ) );
				float Main_Alpha316_g70929 = ( _MainColor.a * tex2DNode29_g70929.a );
				half AlphaTreshold2132_g70929 = _AlphaClipValue;
				half Final_Alpha3754_g70929 = ( Main_Alpha316_g70929 - ( AlphaTreshold2132_g70929 - 0.5 ) );
				float temp_output_661_0_g70929 = ( Final_AlphaFade3727_g70929 * Final_Alpha3754_g70929 );
				float temp_output_3_0_g70949 = temp_output_661_0_g70929;
				half Offest27_g70949 = 0.5;
				half Feather30_g70949 = 0.5;
				float temp_output_3_0_g70962 = ( ( ( temp_output_3_0_g70949 - Offest27_g70949 ) / ( max( fwidth( temp_output_3_0_g70949 ) , 0.001 ) + Feather30_g70949 ) ) + Offest27_g70949 );
				float Alpha9_g70962 = temp_output_3_0_g70962;
				float temp_output_15_0_g70962 = 0.5;
				float Treshold9_g70962 = temp_output_15_0_g70962;
				{
				#if TVE_FEATURE_CLIP
				clip(Alpha9_g70962 - Treshold9_g70962);
				#endif
				}
				half Final_Clip914_g70929 = Alpha9_g70962;
				
				surfaceDescription.Normal = Final_Normal366_g70929;
				surfaceDescription.Smoothness = Final_SmoothnessAndWetness4130_g70929;
				surfaceDescription.Alpha = Final_Clip914_g70929;

				#ifdef _ALPHATEST_ON
				surfaceDescription.AlphaClipThreshold = _AlphaCutoff;
				#endif

				#ifdef _DEPTHOFFSET_ON
				surfaceDescription.DepthOffset = 0;
				#endif

				GetSurfaceAndBuiltinData( surfaceDescription, input, V, posInput, surfaceData, builtinData );

				float4 VPASSpositionCS = float4(packedInput.vpassInterpolators0.xy, 0.0, packedInput.vpassInterpolators0.z);
				float4 VPASSpreviousPositionCS = float4(packedInput.vpassInterpolators1.xy, 0.0, packedInput.vpassInterpolators1.z);

				#ifdef _DEPTHOFFSET_ON
				VPASSpositionCS.w += builtinData.depthOffset;
				VPASSpreviousPositionCS.w += builtinData.depthOffset;
				#endif

				float2 motionVector = CalculateMotionVector( VPASSpositionCS, VPASSpreviousPositionCS );
				EncodeMotionVector( motionVector * 0.5, outMotionVector );

				bool forceNoMotion = unity_MotionVectorsParams.y == 0.0;
				if( forceNoMotion )
					outMotionVector = float4( 2.0, 0.0, 0.0, 0.0 );

		
				#ifdef WRITE_MSAA_DEPTH
					depthColor = packedInput.vmeshPositionCS.z;
					#ifdef _ALPHATOMASK_ON
					depthColor.a = SharpenAlpha(builtinData.opacity, builtinData.alphaClipTreshold);
					#endif
				#endif

			
				#ifdef WRITE_NORMAL_BUFFER
					EncodeIntoNormalBuffer(ConvertSurfaceDataToNormalData(surfaceData), outNormalBuffer);
				#endif

				#if defined(WRITE_DECAL_BUFFER)
					DecalPrepassData decalPrepassData;
					#ifdef _DISABLE_DECALS
					ZERO_INITIALIZE(DecalPrepassData, decalPrepassData);
					#else
					decalPrepassData.geomNormalWS = surfaceData.geomNormalWS;
					decalPrepassData.decalLayerMask = GetMeshRenderingDecalLayer();
					#endif
					EncodeIntoDecalPrepassBuffer(decalPrepassData, outDecalBuffer);
				#endif

				#ifdef _DEPTHOFFSET_ON
				outputDepth = posInput.deviceDepth;
				#endif
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "Forward"
			Tags { "LightMode"="Forward" }
			Blend [_SrcBlend] [_DstBlend], [_AlphaSrcBlend] [_AlphaDstBlend]
			Cull [_CullModeForward]
			ZTest [_ZTestDepthEqualForOpaque]
			ZWrite [_ZWrite]

			Stencil
			{
				Ref [_StencilRef]
				WriteMask [_StencilWriteMask]
				Comp Always
				Pass Replace
				Fail Keep
				ZFail Keep
			}


			ColorMask[_ColorMaskTransparentVelOne] 1
			ColorMask[_ColorMaskTransparentVelTwo] 2

			HLSLPROGRAM

			#define _MATERIAL_FEATURE_SPECULAR_COLOR 1
			#define _ENERGY_CONSERVING_SPECULAR 1
			#pragma multi_compile _ DOTS_INSTANCING_ON
			#pragma multi_compile_instancing
			#pragma instancing_options renderinglayer
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#define ASE_ABSOLUTE_VERTEX_POS 1
			#define _AMBIENT_OCCLUSION 1
			#define HAVE_MESH_MODIFICATION
			#define ASE_SRP_VERSION 120100
			#if !defined(ASE_NEED_CULLFACE)
			#define ASE_NEED_CULLFACE 1
			#endif //ASE_NEED_CULLFACE


			// Keyword for transparent
			#pragma shader_feature _SURFACE_TYPE_TRANSPARENT
			#pragma shader_feature_local_fragment _ _ENABLE_FOG_ON_TRANSPARENT
			#pragma shader_feature_local _ _TRANSPARENT_WRITES_MOTION_VEC

			#pragma multi_compile _ DEBUG_DISPLAY
			#pragma multi_compile _ LIGHTMAP_ON
			#pragma multi_compile _ DIRLIGHTMAP_COMBINED
			#pragma multi_compile _ DYNAMICLIGHTMAP_ON
			#pragma multi_compile_fragment _ SHADOWS_SHADOWMASK
			#pragma multi_compile_fragment PROBE_VOLUMES_OFF PROBE_VOLUMES_L1 PROBE_VOLUMES_L2
			#pragma multi_compile_fragment SCREEN_SPACE_SHADOWS_OFF SCREEN_SPACE_SHADOWS_ON
			
			// Setup DECALS_OFF so the shader stripper can remove variants
            #pragma multi_compile_fragment DECALS_OFF DECALS_3RT DECALS_4RT
            #pragma multi_compile_fragment _ DECAL_SURFACE_GRADIENT
			
			// Supported shadow modes per light type api 12x
			#pragma multi_compile_fragment SHADOW_LOW SHADOW_MEDIUM SHADOW_HIGH SHADOW_VERY_HIGH

            #pragma multi_compile_fragment USE_FPTL_LIGHTLIST USE_CLUSTERED_LIGHTLIST

			#ifndef SHADER_STAGE_FRAGMENT
			#define SHADOW_LOW
			#define USE_FPTL_LIGHTLIST
			#endif

            #define SHADERPASS SHADERPASS_FORWARD

			#if !defined(DEBUG_DISPLAY) && defined(_ALPHATEST_ON)
			#define SHADERPASS_FORWARD_BYPASS_ALPHA_TEST
			#endif

			#pragma vertex Vert
			#pragma fragment Frag
			
			//-------------------------------------------------------------------------------------
			// Define
			//-------------------------------------------------------------------------------------

            #if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define OUTPUT_SPLIT_LIGHTING
			#endif

            #if defined(_TRANSPARENT_WRITES_MOTION_VEC) && defined(_SURFACE_TYPE_TRANSPARENT)
            #define _WRITE_TRANSPARENT_MOTION_VECTOR
            #endif

			#if defined(SHADER_LIT) && !defined(_SURFACE_TYPE_TRANSPARENT)
            #define _DEFERRED_CAPABLE_MATERIAL
            #endif
        

            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl" 
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl" 
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphHeader.hlsl" 

			#ifdef DEBUG_DISPLAY
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
			#endif

			// CBuffer must be declared before Material.hlsl since it internaly uses _BlendMode now
			CBUFFER_START( UnityPerMaterial )
			half4 _SecondColor;
			half4 _MainColor;
			half4 _MainUVs;
			half4 _ColorsMaskRemap;
			half4 _SecondUVs;
			half4 _OverlayMaskRemap;
			float4 _Color;
			float4 _SubsurfaceDiffusion_Asset;
			float4 _MaxBoundsInfo;
			float4 _SubsurfaceDiffusion_asset;
			float4 _GradientMaskRemap;
			half4 _VertexOcclusionColor;
			half4 _SubsurfaceMaskRemap;
			half4 _AlphaMaskRemap;
			half4 _DetailBlendRemap;
			float4 _EmissiveIntensityParams;
			float4 _NoiseMaskRemap;
			half4 _EmissiveUVs;
			half4 _EmissiveColor;
			half4 _VertexOcclusionRemap;
			half3 _render_normals;
			half _render_dst;
			half _MotionSpeed_20;
			half _RenderDirect;
			half _MotionVariation_20;
			half _IsStandardShader;
			half _MotionScale_20;
			half _InteractionMaskValue;
			half _MotionVariation_10;
			half _VertexDynamicMode;
			float _MotionSpeed_10;
			half _render_src;
			half _MotionAmplitude_20;
			float _MotionScale_10;
			half _MotionAmplitude_10;
			half _LayerMotionValue;
			half _VertexPivotMode;
			half _InteractionAmplitude;
			half _MotionValue_20;
			half _render_zw;
			half _VertexDataMode;
			half _MainOcclusionValue;
			half _GlobalWetness;
			half _SecondSmoothnessValue;
			half _MainSmoothnessValue;
			half _GlobalEmissive;
			half _EmissiveExposureValue;
			half _RenderSpecular;
			half _SecondNormalValue;
			half _DetailNormalValue;
			half _MainNormalValue;
			half _VertexOcclusionMaxValue;
			half _VertexOcclusionMinValue;
			half _OverlayMaskMaxValue;
			half _OverlayMaskMinValue;
			half _LayerExtrasValue;
			half _ExtrasPositionMode;
			half _GlobalOverlay;
			half _DetailBlendMaxValue;
			half _DetailBlendMinValue;
			half _DetailMaskInvertMode;
			half _DetailMaskMode;
			half _DetailMeshValue;
			half _DetailCoordMode;
			half _GlobalSize;
			half _LayerVertexValue;
			half _MotionFacingValue;
			half _CategoryRender;
			half _SubsurfaceDirectValue;
			half _RenderSSR;
			half _CategoryOcclusion;
			half _MessageSizeFade;
			half _DetailTypeMode;
			half _CategoryGlobal;
			half _CategorySizeFade;
			half _CategoryPerspective;
			half _IsVersion;
			half _CategoryNoise;
			half _RenderMode;
			half _HasOcclusion;
			half _CategoryDetail;
			half _HasEmissive;
			half _CategoryMotion;
			half _SubsurfaceNormalValue;
			half _EmissiveFlagMode;
			half _SpaceMotionGlobals;
			half _SubsurfaceShadowValue;
			half _RenderCoverage;
			half _RenderPriority;
			float _SubsurfaceDiffusion;
			half _VertexRollingMode;
			half _Cutoff;
			half _SubsurfaceScatteringValue;
			half _render_cull;
			half _IsBarkShader;
			half _CategorySubsurface;
			half _SpaceGlobalPosition;
			half _RenderClip;
			half _MessageMotionVariation;
			half _RenderCull;
			half _SecondOcclusionValue;
			half _RenderZWrite;
			half _SubsurfaceAmbientValue;
			half _RenderQueue;
			half _SubsurfaceAngleValue;
			half _AlphaClipValue;
			half _VertexMasksMode;
			half _LayerReactValue;
			half _DetailBlendMode;
			half _VertexVariationMode;
			half _RenderDecals;
			half _RenderShadow;
			half _DetailMode;
			half _SpaceRenderFade;
			half _IsTVEShader;
			half _CategoryEmissive;
			half _RenderAmbient;
			half _CategoryMain;
			half _CategoryGradient;
			half _SpaceGlobalLocals;
			half _SpaceMotionLocals;
			half _SpaceGlobalLayers;
			half _RenderNormals;
			half _HasGradient;
			half _MessageGlobalsVariation;
			half _FadeCameraValue;
			float4 _EmissionColor;
			float _AlphaCutoff;
			float _RenderQueueType;
			#ifdef _ADD_PRECOMPUTED_VELOCITY
			float _AddPrecomputedVelocity;
			#endif
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilRefDistortionVec;
			float _StencilWriteMaskDistortionVec;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
			float _SrcBlend;
			float _DstBlend;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _TransparentZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _EnableFogOnTransparent;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END
			sampler2D _BumpMap;
			half TVE_Enabled;
			sampler2D _MainTex;
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
			sampler2D _MainAlbedoTex;
			sampler2D _SecondAlbedoTex;
			sampler2D _MainMaskTex;
			sampler2D _SecondMaskTex;
			half4 TVE_OverlayColor;
			half4 TVE_ExtrasParams;
			TEXTURE2D_ARRAY(TVE_ExtrasTex);
			half4 TVE_ExtrasCoords;
			float TVE_ExtrasUsage[10];
			sampler2D _MainNormalTex;
			sampler2D _SecondNormalTex;
			sampler2D _EmissiveTex;
			half TVE_OverlaySmoothness;
			half TVE_CameraFadeStart;
			half TVE_CameraFadeEnd;
			sampler3D TVE_ScreenTex3D;
			half TVE_ScreenTexCoord;


			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Lighting/Lighting.hlsl"
			#define HAS_LIGHTLOOP
			#define SHADER_LIT 1
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Lighting/LightLoop/LightLoopDef.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Lighting/LightLoop/LightLoop.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/CommonLighting.hlsl"
			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_VFACE
			#pragma shader_feature_local TVE_FEATURE_CLIP
			#pragma shader_feature_local TVE_FEATURE_BATCHING
			#pragma shader_feature_local TVE_FEATURE_DETAIL
			//TVE Pipeline Defines
			#define THE_VEGETATION_ENGINE
			#define TVE_IS_HD_PIPELINE
			//TVE HD Pipeline Defines
			#pragma shader_feature_local _DISABLE_DECALS
			#pragma shader_feature_local _DISABLE_SSR
			//TVE Injection Defines
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END
			//TVE Shader Type Defines
			#define TVE_IS_VEGETATION_SHADER


			#if defined(_DOUBLESIDED_ON) && !defined(ASE_NEED_CULLFACE)
				#define ASE_NEED_CULLFACE 1
			#endif

			struct AttributesMesh
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 uv1 : TEXCOORD1;
				float4 uv2 : TEXCOORD2;
				#ifdef _WRITE_TRANSPARENT_MOTION_VECTOR
					float3 previousPositionOS : TEXCOORD4;
					#if defined (_ADD_PRECOMPUTED_VELOCITY)
						float3 precomputedVelocity : TEXCOORD5;
					#endif
				#endif
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryingsMeshToPS
			{
				float4 positionCS : SV_Position;
				float3 positionRWS : TEXCOORD0;
				float3 normalWS : TEXCOORD1;
				float4 tangentWS : TEXCOORD2;
				float4 uv1 : TEXCOORD3;
				float4 uv2 : TEXCOORD4;
				#ifdef _WRITE_TRANSPARENT_MOTION_VECTOR
					float3 vpassPositionCS : TEXCOORD5;
					float3 vpassPreviousPositionCS : TEXCOORD6;
				#endif
				float4 ase_texcoord7 : TEXCOORD7;
				float4 ase_texcoord8 : TEXCOORD8;
				float4 ase_texcoord9 : TEXCOORD9;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord10 : TEXCOORD10;
				float4 ase_texcoord11 : TEXCOORD11;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
				#if defined(SHADER_STAGE_FRAGMENT) && defined(ASE_NEED_CULLFACE)
				FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
				#endif
			};

			float3 ObjectPosition_UNITY_MATRIX_M(  )
			{
				return float3(UNITY_MATRIX_M[0].w, UNITY_MATRIX_M[1].w, UNITY_MATRIX_M[2].w );
			}
			
			float2 DecodeFloatToVector2( float enc )
			{
				float2 result ;
				result.y = enc % 2048;
				result.x = floor(enc / 2048);
				return result / (2048 - 1);
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

				surfaceData.specularOcclusion = 1.0;

				// surface data
				surfaceData.baseColor =					surfaceDescription.Albedo;
				surfaceData.perceptualSmoothness =		surfaceDescription.Smoothness;
				surfaceData.ambientOcclusion =			surfaceDescription.Occlusion;
				surfaceData.metallic =					surfaceDescription.Metallic;
				surfaceData.coatMask =					surfaceDescription.CoatMask;

				#ifdef _SPECULAR_OCCLUSION_CUSTOM
				surfaceData.specularOcclusion =			surfaceDescription.SpecularOcclusion;
				#endif
				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceData.subsurfaceMask =			surfaceDescription.SubsurfaceMask;
				#endif
				#if defined(_HAS_REFRACTION) || defined(_MATERIAL_FEATURE_TRANSMISSION)
				surfaceData.thickness =					surfaceDescription.Thickness;
				#endif
				#if defined( _MATERIAL_FEATURE_SUBSURFACE_SCATTERING ) || defined( _MATERIAL_FEATURE_TRANSMISSION )
				surfaceData.diffusionProfileHash =		asuint(surfaceDescription.DiffusionProfile);
				#endif
				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceData.specularColor =				surfaceDescription.Specular;
				#endif
				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.anisotropy =				surfaceDescription.Anisotropy;
				#endif
				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceData.iridescenceMask =			surfaceDescription.IridescenceMask;
				surfaceData.iridescenceThickness =		surfaceDescription.IridescenceThickness;
				#endif

				// refraction
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


				// material features
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

				// others
				#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
				surfaceData.baseColor *= ( 1.0 - Max3( surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b ) );
				#endif
				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				// normals
				float3 normalTS = float3(0.0f, 0.0f, 1.0f);
				normalTS = surfaceDescription.Normal;
				GetNormalWS( fragInputs, normalTS, surfaceData.normalWS, doubleSidedConstants );

				surfaceData.geomNormalWS = fragInputs.tangentToWorld[2];
				surfaceData.tangentWS = normalize( fragInputs.tangentToWorld[ 0 ].xyz );

				// decals
				#if HAVE_DECALS
				if( _EnableDecals )
				{
					DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, surfaceDescription.Alpha);
					ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData);
				}
				#endif // DECAL_SURFACE_GRADIENT

				bentNormalWS = surfaceData.normalWS;
				
				#ifdef ASE_BENT_NORMAL
				GetNormalWS( fragInputs, surfaceDescription.BentNormal, bentNormalWS, doubleSidedConstants );
				#endif

				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.tangentWS = TransformTangentToWorld( surfaceDescription.Tangent, fragInputs.tangentToWorld );
				#endif
				surfaceData.tangentWS = Orthonormalize( surfaceData.tangentWS, surfaceData.normalWS );


				#if defined(_SPECULAR_OCCLUSION_CUSTOM)
				#elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO( V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness( surfaceData.perceptualSmoothness ) );
				#elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion( ClampNdotV( dot( surfaceData.normalWS, V ) ), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness( surfaceData.perceptualSmoothness ) );
				#endif

				#ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
				surfaceData.perceptualSmoothness = GeometricNormalFiltering( surfaceData.perceptualSmoothness, fragInputs.tangentToWorld[ 2 ], surfaceDescription.SpecularAAScreenSpaceVariance, surfaceDescription.SpecularAAThreshold );
				#endif

				// debug
				#if defined(DEBUG_DISPLAY)
				if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
				{
					surfaceData.metallic = 0;
				}
				ApplyDebugToSurfaceData(fragInputs.tangentToWorld, surfaceData);
				#endif
			}

			void GetSurfaceAndBuiltinData(GlobalSurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				#ifdef LOD_FADE_CROSSFADE
				LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
				#endif

				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				ApplyDoubleSidedFlipOrMirror( fragInputs, doubleSidedConstants );

				#ifdef _ALPHATEST_ON
				DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif

				#ifdef _DEPTHOFFSET_ON
				ApplyDepthOffsetPositionInput( V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput );
				#endif

				float3 bentNormalWS;
				BuildSurfaceData( fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS );

				InitBuiltinData( posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[ 2 ], fragInputs.texCoord1, fragInputs.texCoord2, builtinData );

				#ifdef _DEPTHOFFSET_ON
				builtinData.depthOffset = surfaceDescription.DepthOffset;
				#endif

				#ifdef _ALPHATEST_ON    
                    builtinData.alphaClipTreshold = surfaceDescription.AlphaClipThreshold;
                #endif

				#ifdef UNITY_VIRTUAL_TEXTURING
                builtinData.vtPackedFeedback = surfaceDescription.VTPackedFeedback;
                #endif

				#ifdef _ASE_BAKEDGI
				builtinData.bakeDiffuseLighting = surfaceDescription.BakedGI;
				#endif

				#ifdef _ASE_BAKEDBACKGI
				builtinData.backBakeDiffuseLighting = surfaceDescription.BakedBackGI;
				#endif

				builtinData.emissiveColor = surfaceDescription.Emission;

				PostInitBuiltinData(V, posInput, surfaceData, builtinData);
			}

			AttributesMesh ApplyMeshModification(AttributesMesh inputMesh, float3 timeParameters, inout PackedVaryingsMeshToPS outputPackedVaryingsMeshToPS )
			{
				_TimeParameters.xyz = timeParameters;
				float3 VertexPosition3588_g70929 = inputMesh.positionOS;
				half3 Mesh_PivotsOS2291_g70929 = half3(0,0,0);
				float3 temp_output_2283_0_g70929 = ( VertexPosition3588_g70929 - Mesh_PivotsOS2291_g70929 );
				half3 VertexPos40_g71005 = temp_output_2283_0_g70929;
				float3 appendResult74_g71005 = (float3(VertexPos40_g71005.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g71005 = appendResult74_g71005;
				float3 break84_g71005 = VertexPos40_g71005;
				float3 appendResult81_g71005 = (float3(0.0 , break84_g71005.y , break84_g71005.z));
				half3 VertexPosOtherAxis82_g71005 = appendResult81_g71005;
				float4 temp_output_91_19_g70965 = TVE_MotionCoords;
				float3 localObjectPosition_UNITY_MATRIX_M14_g70996 = ObjectPosition_UNITY_MATRIX_M();
				float3 appendResult60_g70954 = (float3(inputMesh.ase_texcoord3.x , inputMesh.ase_texcoord3.z , inputMesh.ase_texcoord3.y));
				half3 Mesh_PivotsData2831_g70929 = ( appendResult60_g70954 * _VertexPivotMode );
				float3 temp_output_122_0_g70996 = Mesh_PivotsData2831_g70929;
				float3 PivotsOnly105_g70996 = (mul( GetObjectToWorldMatrix(), float4( temp_output_122_0_g70996 , 0.0 ) ).xyz).xyz;
				#ifdef SHADEROPTIONS_CAMERA_RELATIVE_RENDERING
				float3 staticSwitch13_g70996 = ( ( localObjectPosition_UNITY_MATRIX_M14_g70996 + PivotsOnly105_g70996 ) + _WorldSpaceCameraPos );
				#else
				float3 staticSwitch13_g70996 = ( localObjectPosition_UNITY_MATRIX_M14_g70996 + PivotsOnly105_g70996 );
				#endif
				half3 ObjectData20_g70997 = staticSwitch13_g70996;
				float3 ase_worldPos = GetAbsolutePositionWS( TransformObjectToWorld( (inputMesh.positionOS).xyz ) );
				half3 WorldData19_g70997 = ase_worldPos;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g70997 = WorldData19_g70997;
				#else
				float3 staticSwitch14_g70997 = ObjectData20_g70997;
				#endif
				float3 temp_output_114_0_g70996 = staticSwitch14_g70997;
				float3 vertexToFrag4224_g70929 = temp_output_114_0_g70996;
				half3 ObjectData20_g70970 = vertexToFrag4224_g70929;
				float3 vertexToFrag3890_g70929 = ase_worldPos;
				half3 WorldData19_g70970 = vertexToFrag3890_g70929;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g70970 = WorldData19_g70970;
				#else
				float3 staticSwitch14_g70970 = ObjectData20_g70970;
				#endif
				float3 ObjectPosition4223_g70929 = staticSwitch14_g70970;
				half2 UV94_g70965 = ( (temp_output_91_19_g70965).zw + ( (temp_output_91_19_g70965).xy * (ObjectPosition4223_g70929).xz ) );
				float temp_output_84_0_g70965 = _LayerMotionValue;
				float4 lerpResult107_g70965 = lerp( TVE_MotionParams , saturate( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_MotionTex, sampler_linear_repeat, UV94_g70965,temp_output_84_0_g70965, 0.0 ) ) , TVE_MotionUsage[(int)temp_output_84_0_g70965]);
				half4 Global_Motion_Params3909_g70929 = lerpResult107_g70965;
				float4 break322_g70972 = Global_Motion_Params3909_g70929;
				float3 appendResult397_g70972 = (float3(break322_g70972.x , 0.0 , break322_g70972.y));
				float3 temp_output_398_0_g70972 = (appendResult397_g70972*2.0 + -1.0);
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				half2 Global_MotionDirectionOS39_g70929 = (( mul( GetWorldToObjectMatrix(), float4( temp_output_398_0_g70972 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_DirectionOS358_g71001 = Global_MotionDirectionOS39_g70929;
				half Mesh_Height1524_g70929 = inputMesh.ase_color.a;
				half Mesh_Height114_g70956 = Mesh_Height1524_g70929;
				half ObjectData20_g70957 = ( Mesh_Height114_g70956 * 2.0 );
				float enc62_g70955 = inputMesh.ase_texcoord.w;
				float2 localDecodeFloatToVector262_g70955 = DecodeFloatToVector2( enc62_g70955 );
				float2 break63_g70955 = ( localDecodeFloatToVector262_g70955 * 100.0 );
				float Bounds_Height5230_g70929 = break63_g70955.x;
				float Bounds_Height117_g70956 = Bounds_Height5230_g70929;
				half WorldData19_g70957 = ( ( Mesh_Height114_g70956 * Mesh_Height114_g70956 ) * Bounds_Height117_g70956 * 2.0 );
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g70957 = WorldData19_g70957;
				#else
				float staticSwitch14_g70957 = ObjectData20_g70957;
				#endif
				half Motion_10_Mask5242_g70929 = staticSwitch14_g70957;
				half Wind_Power369_g70972 = break322_g70972.z;
				half Global_MotionPower2223_g70929 = Wind_Power369_g70972;
				half3 Input_Position419_g70975 = -ObjectPosition4223_g70929;
				half2 Global_MotionDirectionWS4683_g70929 = (temp_output_398_0_g70972).xz;
				half2 Input_DirectionWS423_g70975 = Global_MotionDirectionWS4683_g70929;
				float Motion_Scale287_g70975 = ( _MotionScale_10 + 0.2 );
				half Global_Scale448_g70975 = TVE_NoiseParams.x;
				half Input_Speed62_g70975 = _MotionSpeed_10;
				half Global_Speed449_g70975 = TVE_NoiseParams.y;
				float mulTime426_g70975 = _TimeParameters.x * ( Input_Speed62_g70975 * Global_Speed449_g70975 );
				half Global_DistScale561_g70975 = TVE_NoiseParams.w;
				float3 break461_g70975 = ( Input_Position419_g70975 * Global_DistScale561_g70975 );
				half Global_DistAmplitude559_g70975 = TVE_NoiseParams.z;
				float Noise_Distortion469_g70975 = ( sin( ( break461_g70975.x + break461_g70975.z ) ) * Global_DistAmplitude559_g70975 );
				float3 break111_g70958 = ObjectPosition4223_g70929;
				half Global_DynamicMode5112_g70929 = _VertexDynamicMode;
				half Input_DynamicMode120_g70958 = Global_DynamicMode5112_g70929;
				float Mesh_Variation16_g70929 = inputMesh.ase_color.r;
				half Input_Variation124_g70958 = Mesh_Variation16_g70929;
				half ObjectData20_g70959 = frac( ( ( ( break111_g70958.x + break111_g70958.y + break111_g70958.z ) * ( 1.0 - Input_DynamicMode120_g70958 ) ) + Input_Variation124_g70958 ) );
				half WorldData19_g70959 = Input_Variation124_g70958;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g70959 = WorldData19_g70959;
				#else
				float staticSwitch14_g70959 = ObjectData20_g70959;
				#endif
				float clampResult129_g70958 = clamp( staticSwitch14_g70959 , 0.01 , 0.99 );
				half Global_MeshVariation5104_g70929 = clampResult129_g70958;
				half Motion_Variation284_g70975 = ( _MotionVariation_10 * Global_MeshVariation5104_g70929 );
				float2 temp_output_425_0_g70975 = ( ( (Input_Position419_g70975).xz * Input_DirectionWS423_g70975 * Motion_Scale287_g70975 * Global_Scale448_g70975 ) + ( mulTime426_g70975 + Noise_Distortion469_g70975 + Motion_Variation284_g70975 ) );
				float2 break500_g70975 = ( temp_output_425_0_g70975 * 0.1178 );
				float2 break494_g70975 = ( temp_output_425_0_g70975 * 0.1742 );
				half Input_WindPower327_g70975 = Global_MotionPower2223_g70929;
				float lerpResult430_g70975 = lerp( 1.4 , 0.4 , Input_WindPower327_g70975);
				half Global_MotionNoise34_g70929 = (pow( (( sin( ( break500_g70975.x + break500_g70975.y ) ) * sin( ( break494_g70975.x + break494_g70975.y ) ) )*0.4 + 0.6) , lerpResult430_g70975 )*1.2 + -0.2);
				half Motion_10_Amplitude2258_g70929 = ( _MotionAmplitude_10 * Motion_10_Mask5242_g70929 * Global_MotionPower2223_g70929 * Global_MotionNoise34_g70929 );
				half Input_BendingAmplitude376_g71001 = Motion_10_Amplitude2258_g70929;
				half Input_InteractionAmplitude58_g71001 = _InteractionAmplitude;
				half Input_MeshMotion_10321_g71001 = Motion_10_Mask5242_g70929;
				half Input_InteractionUseMask62_g71001 = _InteractionMaskValue;
				float lerpResult371_g71001 = lerp( 2.0 , Input_MeshMotion_10321_g71001 , Input_InteractionUseMask62_g71001);
				half ObjectData20_g71002 = lerpResult371_g71001;
				half WorldData19_g71002 = Input_MeshMotion_10321_g71001;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g71002 = WorldData19_g71002;
				#else
				float staticSwitch14_g71002 = ObjectData20_g71002;
				#endif
				half Motion_10_Interaction373_g71001 = ( Input_InteractionAmplitude58_g71001 * staticSwitch14_g71002 );
				half Global_InteractionMask66_g70929 = ( break322_g70972.w * break322_g70972.w );
				float Input_InteractionMask330_g71001 = Global_InteractionMask66_g70929;
				float lerpResult360_g71001 = lerp( Input_BendingAmplitude376_g71001 , Motion_10_Interaction373_g71001 , saturate( ( Input_InteractionAmplitude58_g71001 * Input_InteractionMask330_g71001 ) ));
				float2 break364_g71001 = ( Input_DirectionOS358_g71001 * lerpResult360_g71001 );
				half Motion_10_BendingZ190_g70929 = break364_g71001.y;
				half Angle44_g71005 = Motion_10_BendingZ190_g70929;
				half3 VertexPos40_g71004 = ( VertexPosRotationAxis50_g71005 + ( VertexPosOtherAxis82_g71005 * cos( Angle44_g71005 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g71005 ) * sin( Angle44_g71005 ) ) );
				float3 appendResult74_g71004 = (float3(0.0 , 0.0 , VertexPos40_g71004.z));
				half3 VertexPosRotationAxis50_g71004 = appendResult74_g71004;
				float3 break84_g71004 = VertexPos40_g71004;
				float3 appendResult81_g71004 = (float3(break84_g71004.x , break84_g71004.y , 0.0));
				half3 VertexPosOtherAxis82_g71004 = appendResult81_g71004;
				half Motion_10_BendingX216_g70929 = break364_g71001.x;
				half Angle44_g71004 = -Motion_10_BendingX216_g70929;
				half Input_Scale321_g70944 = _MotionScale_20;
				half Input_Variation330_g70944 = ( _MotionVariation_20 * Global_MeshVariation5104_g70929 );
				half Input_Speed62_g70944 = _MotionSpeed_20;
				float mulTime349_g70944 = _TimeParameters.x * Input_Speed62_g70944;
				float temp_output_302_0_g70944 = sin( ( ( ( ase_worldPos.x + ase_worldPos.y + ase_worldPos.z ) * Input_Scale321_g70944 ) + Input_Variation330_g70944 + mulTime349_g70944 ) );
				float enc59_g70955 = inputMesh.ase_texcoord.z;
				float2 localDecodeFloatToVector259_g70955 = DecodeFloatToVector2( enc59_g70955 );
				float2 break61_g70955 = localDecodeFloatToVector259_g70955;
				half Mesh_Motion_2060_g70929 = break61_g70955.x;
				half Mesh_Motion_20115_g70956 = Mesh_Motion_2060_g70929;
				float Bounds_Radius5231_g70929 = break63_g70955.y;
				float Bounds_Radius118_g70956 = Bounds_Radius5231_g70929;
				half Motion_20_Mask5243_g70929 = ( Mesh_Motion_20115_g70956 * Bounds_Radius118_g70956 );
				half3 Input_Position419_g70960 = VertexPosition3588_g70929;
				float3 normalizeResult518_g70960 = normalize( Input_Position419_g70960 );
				half2 Input_DirectionOS423_g70960 = Global_MotionDirectionOS39_g70929;
				float2 break521_g70960 = -Input_DirectionOS423_g70960;
				float3 appendResult522_g70960 = (float3(break521_g70960.x , 0.0 , break521_g70960.y));
				float dotResult519_g70960 = dot( normalizeResult518_g70960 , appendResult522_g70960 );
				half Input_Mask62_g70960 = _MotionFacingValue;
				float lerpResult524_g70960 = lerp( 1.0 , (dotResult519_g70960*0.5 + 0.5) , Input_Mask62_g70960);
				half ObjectData20_g70961 = lerpResult524_g70960;
				half WorldData19_g70961 = 1.0;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g70961 = WorldData19_g70961;
				#else
				float staticSwitch14_g70961 = ObjectData20_g70961;
				#endif
				half Motion_FacingMask5214_g70929 = staticSwitch14_g70961;
				half Motion_20_Amplitude4381_g70929 = ( _MotionAmplitude_20 * _MotionValue_20 * Motion_20_Mask5243_g70929 * Global_MotionPower2223_g70929 * Global_MotionNoise34_g70929 * Motion_FacingMask5214_g70929 );
				half Input_Amplitude58_g70944 = Motion_20_Amplitude4381_g70929;
				half2 Input_DirectionOS366_g70944 = Global_MotionDirectionOS39_g70929;
				float2 break371_g70944 = Input_DirectionOS366_g70944;
				float3 appendResult372_g70944 = (float3(break371_g70944.x , ( temp_output_302_0_g70944 * 0.1 ) , break371_g70944.y));
				half3 Motion_20_Squash4418_g70929 = ( ( (temp_output_302_0_g70944*0.2 + 1.0) * Input_Amplitude58_g70944 ) * appendResult372_g70944 );
				float3 Vertex_Motion_Object833_g70929 = ( ( VertexPosRotationAxis50_g71004 + ( VertexPosOtherAxis82_g71004 * cos( Angle44_g71004 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g71004 ) * sin( Angle44_g71004 ) ) ) + Motion_20_Squash4418_g70929 );
				float3 temp_output_3474_0_g70929 = ( VertexPosition3588_g70929 - Mesh_PivotsOS2291_g70929 );
				float3 appendResult2043_g70929 = (float3(Motion_10_BendingX216_g70929 , 0.0 , Motion_10_BendingZ190_g70929));
				float3 Vertex_Motion_World1118_g70929 = ( ( temp_output_3474_0_g70929 + appendResult2043_g70929 ) + Motion_20_Squash4418_g70929 );
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch4976_g70929 = Vertex_Motion_World1118_g70929;
				#else
				float3 staticSwitch4976_g70929 = ( Vertex_Motion_Object833_g70929 + ( _VertexDataMode * 0.0 ) );
				#endif
				float4 temp_output_94_19_g70988 = TVE_VertexCoords;
				half2 UV97_g70988 = ( (temp_output_94_19_g70988).zw + ( (temp_output_94_19_g70988).xy * (ObjectPosition4223_g70929).xz ) );
				float temp_output_84_0_g70988 = _LayerVertexValue;
				float4 lerpResult109_g70988 = lerp( TVE_VertexParams , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_VertexTex, sampler_linear_repeat, UV97_g70988,temp_output_84_0_g70988, 0.0 ) , TVE_VertexUsage[(int)temp_output_84_0_g70988]);
				half4 Global_Object_Params4173_g70929 = lerpResult109_g70988;
				half Global_VertexSize174_g70929 = saturate( Global_Object_Params4173_g70929.w );
				float lerpResult346_g70929 = lerp( 1.0 , Global_VertexSize174_g70929 , _GlobalSize);
				float3 appendResult3480_g70929 = (float3(lerpResult346_g70929 , lerpResult346_g70929 , lerpResult346_g70929));
				half3 ObjectData20_g70964 = appendResult3480_g70929;
				half3 _Vector11 = half3(1,1,1);
				half3 WorldData19_g70964 = _Vector11;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g70964 = WorldData19_g70964;
				#else
				float3 staticSwitch14_g70964 = ObjectData20_g70964;
				#endif
				half3 Vertex_Size1741_g70929 = staticSwitch14_g70964;
				half3 _Vector5 = half3(1,1,1);
				float3 Vertex_SizeFade1740_g70929 = _Vector5;
				half3 Grass_Perspective2661_g70929 = half3(0,0,0);
				float3 lerpResult16_g70963 = lerp( VertexPosition3588_g70929 , ( ( staticSwitch4976_g70929 * Vertex_Size1741_g70929 * Vertex_SizeFade1740_g70929 ) + Mesh_PivotsOS2291_g70929 + Grass_Perspective2661_g70929 ) , TVE_Enabled);
				float3 Final_VertexPosition890_g70929 = ( lerpResult16_g70963 + _DisableSRPBatcher );
				
				float2 appendResult21_g70955 = (float2(inputMesh.uv1.z , inputMesh.uv1.w));
				float2 Mesh_DetailCoord3_g70929 = appendResult21_g70955;
				float2 lerpResult1545_g70929 = lerp( inputMesh.ase_texcoord.xy , Mesh_DetailCoord3_g70929 , _DetailCoordMode);
				float2 vertexToFrag11_g71000 = ( ( lerpResult1545_g70929 * (_SecondUVs).xy ) + (_SecondUVs).zw );
				outputPackedVaryingsMeshToPS.ase_texcoord8.xy = vertexToFrag11_g71000;
				half Mesh_DetailMask90_g70929 = inputMesh.ase_color.b;
				float temp_output_990_0_g70929 = ( Mesh_DetailMask90_g70929 - 0.5 );
				float vertexToFrag11_g70931 = ( temp_output_990_0_g70929 + _DetailMeshValue );
				outputPackedVaryingsMeshToPS.ase_texcoord8.z = vertexToFrag11_g70931;
				float3 ase_worldNormal = TransformObjectToWorldNormal(inputMesh.normalOS);
				float3 vertexToFrag5058_g70929 = ase_worldNormal;
				outputPackedVaryingsMeshToPS.ase_texcoord9.xyz = vertexToFrag5058_g70929;
				outputPackedVaryingsMeshToPS.ase_texcoord10.xyz = vertexToFrag3890_g70929;
				outputPackedVaryingsMeshToPS.ase_texcoord11.xyz = vertexToFrag4224_g70929;
				float Mesh_Occlusion318_g70929 = inputMesh.ase_color.g;
				float temp_output_7_0_g70969 = _VertexOcclusionMinValue;
				float temp_output_3377_0_g70929 = saturate( ( ( Mesh_Occlusion318_g70929 - temp_output_7_0_g70969 ) / ( _VertexOcclusionMaxValue - temp_output_7_0_g70969 ) ) );
				float vertexToFrag11_g70973 = temp_output_3377_0_g70929;
				outputPackedVaryingsMeshToPS.ase_texcoord8.w = vertexToFrag11_g70973;
				
				float temp_output_7_0_g70945 = TVE_CameraFadeStart;
				float lerpResult4755_g70929 = lerp( 1.0 , saturate( ( ( distance( ase_worldPos , _WorldSpaceCameraPos ) - temp_output_7_0_g70945 ) / ( TVE_CameraFadeEnd - temp_output_7_0_g70945 ) ) ) , _FadeCameraValue);
				float vertexToFrag11_g70951 = lerpResult4755_g70929;
				outputPackedVaryingsMeshToPS.ase_texcoord9.w = vertexToFrag11_g70951;
				
				outputPackedVaryingsMeshToPS.ase_texcoord7 = inputMesh.ase_texcoord;
				outputPackedVaryingsMeshToPS.ase_normal = inputMesh.normalOS;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				outputPackedVaryingsMeshToPS.ase_texcoord10.w = 0;
				outputPackedVaryingsMeshToPS.ase_texcoord11.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue = Final_VertexPosition890_g70929;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif
				inputMesh.normalOS = inputMesh.normalOS;
				inputMesh.tangentOS = inputMesh.tangentOS;
				return inputMesh;
			}

			PackedVaryingsMeshToPS VertexFunction(AttributesMesh inputMesh)
			{
				PackedVaryingsMeshToPS outputPackedVaryingsMeshToPS = (PackedVaryingsMeshToPS)0;
				AttributesMesh defaultMesh = inputMesh;

				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, outputPackedVaryingsMeshToPS);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( outputPackedVaryingsMeshToPS );

				inputMesh = ApplyMeshModification( inputMesh, _TimeParameters.xyz, outputPackedVaryingsMeshToPS);

				float3 positionRWS = TransformObjectToWorld(inputMesh.positionOS);
				float3 normalWS = TransformObjectToWorldNormal(inputMesh.normalOS);
				float4 tangentWS = float4(TransformObjectToWorldDir(inputMesh.tangentOS.xyz), inputMesh.tangentOS.w);

				#ifdef _WRITE_TRANSPARENT_MOTION_VECTOR
				float4 VPASSpreviousPositionCS;
				float4 VPASSpositionCS = mul(UNITY_MATRIX_UNJITTERED_VP, float4(positionRWS, 1.0));

				bool forceNoMotion = unity_MotionVectorsParams.y == 0.0;
				if (forceNoMotion)
				{
					VPASSpreviousPositionCS = float4(0.0, 0.0, 0.0, 1.0);
				}
				else
				{
					bool hasDeformation = unity_MotionVectorsParams.x > 0.0;
					float3 effectivePositionOS = (hasDeformation ? inputMesh.previousPositionOS : defaultMesh.positionOS);
					#if defined(_ADD_PRECOMPUTED_VELOCITY)
					effectivePositionOS -= inputMesh.precomputedVelocity;
					#endif

					#if defined(HAVE_MESH_MODIFICATION)
						AttributesMesh previousMesh = defaultMesh;
						previousMesh.positionOS = effectivePositionOS ;
						PackedVaryingsMeshToPS test = (PackedVaryingsMeshToPS)0;
						float3 curTime = _TimeParameters.xyz;
						previousMesh = ApplyMeshModification(previousMesh, _LastTimeParameters.xyz, test);
						_TimeParameters.xyz = curTime;
						float3 previousPositionRWS = TransformPreviousObjectToWorld(previousMesh.positionOS);
					#else
						float3 previousPositionRWS = TransformPreviousObjectToWorld(effectivePositionOS);
					#endif

					#ifdef ATTRIBUTES_NEED_NORMAL
						float3 normalWS = TransformPreviousObjectToWorldNormal(defaultMesh.normalOS);
					#else
						float3 normalWS = float3(0.0, 0.0, 0.0);
					#endif

					#if defined(HAVE_VERTEX_MODIFICATION)
						//ApplyVertexModification(inputMesh, normalWS, previousPositionRWS, _LastTimeParameters.xyz);
					#endif

					VPASSpreviousPositionCS = mul(UNITY_MATRIX_PREV_VP, float4(previousPositionRWS, 1.0));
				}
				#endif

				outputPackedVaryingsMeshToPS.positionCS = TransformWorldToHClip(positionRWS);
				outputPackedVaryingsMeshToPS.positionRWS.xyz = positionRWS;
				outputPackedVaryingsMeshToPS.normalWS.xyz = normalWS;
				outputPackedVaryingsMeshToPS.tangentWS.xyzw = tangentWS;
				outputPackedVaryingsMeshToPS.uv1.xyzw = inputMesh.uv1;
				outputPackedVaryingsMeshToPS.uv2.xyzw = inputMesh.uv2;

				#ifdef _WRITE_TRANSPARENT_MOTION_VECTOR
					outputPackedVaryingsMeshToPS.vpassPositionCS = float3(VPASSpositionCS.xyw);
					outputPackedVaryingsMeshToPS.vpassPreviousPositionCS = float3(VPASSpreviousPositionCS.xyw);
				#endif
				return outputPackedVaryingsMeshToPS;
			}

			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float3 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 uv1 : TEXCOORD1;
				float4 uv2 : TEXCOORD2;
				#ifdef _WRITE_TRANSPARENT_MOTION_VECTOR
					float3 previousPositionOS : TEXCOORD4;
					#if defined (_ADD_PRECOMPUTED_VELOCITY)
						float3 precomputedVelocity : TEXCOORD5;
					#endif
				#endif
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl Vert ( AttributesMesh v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.positionOS = v.positionOS;
				o.normalOS = v.normalOS;
				o.tangentOS = v.tangentOS;
				o.uv1 = v.uv1;
				o.uv2 = v.uv2;
				#ifdef _WRITE_TRANSPARENT_MOTION_VECTOR
					o.previousPositionOS = v.previousPositionOS;
					#if defined (_ADD_PRECOMPUTED_VELOCITY)
						o.precomputedVelocity = v.precomputedVelocity;
					#endif
				#endif
				o.ase_texcoord3 = v.ase_texcoord3;
				o.ase_color = v.ase_color;
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				float3 cameraPos = 0;
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), cameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, GetObjectToWorldMatrix(), cameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), cameraPos, _ScreenParams, _FrustumPlanes );
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
			PackedVaryingsMeshToPS DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				AttributesMesh o = (AttributesMesh) 0;
				o.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				o.uv1 = patch[0].uv1 * bary.x + patch[1].uv1 * bary.y + patch[2].uv1 * bary.z;
				o.uv2 = patch[0].uv2 * bary.x + patch[1].uv2 * bary.y + patch[2].uv2 * bary.z;
				#ifdef _WRITE_TRANSPARENT_MOTION_VECTOR
					o.previousPositionOS = patch[0].previousPositionOS * bary.x + patch[1].previousPositionOS * bary.y + patch[2].previousPositionOS * bary.z;
					#if defined (_ADD_PRECOMPUTED_VELOCITY)
						o.precomputedVelocity = patch[0].precomputedVelocity * bary.x + patch[1].precomputedVelocity * bary.y + patch[2].precomputedVelocity * bary.z;
					#endif
				#endif
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			PackedVaryingsMeshToPS Vert ( AttributesMesh v )
			{
				return VertexFunction( v );
			}
			#endif

			#ifdef UNITY_VIRTUAL_TEXTURING
			#define VT_BUFFER_TARGET SV_Target1
			#define EXTRA_BUFFER_TARGET SV_Target2
			#else
			#define EXTRA_BUFFER_TARGET SV_Target1
			#endif

			void Frag(PackedVaryingsMeshToPS packedInput,
					#ifdef OUTPUT_SPLIT_LIGHTING
						out float4 outColor : SV_Target0,
						#ifdef UNITY_VIRTUAL_TEXTURING
							out float4 outVTFeedback : VT_BUFFER_TARGET,
						#endif
						out float4 outDiffuseLighting : EXTRA_BUFFER_TARGET,
						OUTPUT_SSSBUFFER(outSSSBuffer)
					#else
						out float4 outColor : SV_Target0
						#ifdef UNITY_VIRTUAL_TEXTURING
							,out float4 outVTFeedback : VT_BUFFER_TARGET
						#endif
					#ifdef _WRITE_TRANSPARENT_MOTION_VECTOR
						, out float4 outMotionVec : SV_Target1
					#endif
					#endif
					#ifdef _DEPTHOFFSET_ON
						, out float outputDepth : SV_Depth
					#endif
					
						)
			{
				#ifdef _WRITE_TRANSPARENT_MOTION_VECTOR
					outMotionVec = float4(2.0, 0.0, 0.0, 0.0);
				#endif

				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( packedInput );
				UNITY_SETUP_INSTANCE_ID( packedInput );
				float3 positionRWS = packedInput.positionRWS.xyz;
				float3 normalWS = packedInput.normalWS.xyz;
				float4 tangentWS = packedInput.tangentWS.xyzw;

				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);
				input.tangentToWorld = k_identity3x3;
				input.positionSS = packedInput.positionCS;
				input.positionRWS = positionRWS;
				input.tangentToWorld = BuildTangentToWorld(tangentWS, normalWS);
				input.texCoord1 = packedInput.uv1.xyzw;
				input.texCoord2 = packedInput.uv2.xyzw;

				#if _DOUBLESIDED_ON && SHADER_STAGE_FRAGMENT
				input.isFrontFace = IS_FRONT_VFACE( packedInput.cullFace, true, false);
				#elif SHADER_STAGE_FRAGMENT
				#if defined(ASE_NEED_CULLFACE)
				input.isFrontFace = IS_FRONT_VFACE(packedInput.cullFace, true, false);
				#endif
				#endif
				half isFrontFace = input.isFrontFace;

				input.positionSS.xy = _OffScreenRendering > 0 ? (input.positionSS.xy * _OffScreenDownsampleFactor) : input.positionSS.xy;
				uint2 tileIndex = uint2(input.positionSS.xy) / GetTileSize ();

				PositionInputs posInput = GetPositionInput( input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS.xyz, tileIndex );

				float3 V = GetWorldSpaceNormalizeViewDir(input.positionRWS);

				GlobalSurfaceDescription surfaceDescription = (GlobalSurfaceDescription)0;
				half2 Main_UVs15_g70929 = ( ( packedInput.ase_texcoord7.xy * (_MainUVs).xy ) + (_MainUVs).zw );
				float4 tex2DNode29_g70929 = tex2D( _MainAlbedoTex, Main_UVs15_g70929 );
				half3 Main_Albedo99_g70929 = ( (_MainColor).rgb * (tex2DNode29_g70929).rgb );
				float2 vertexToFrag11_g71000 = packedInput.ase_texcoord8.xy;
				half2 Second_UVs17_g70929 = vertexToFrag11_g71000;
				float4 tex2DNode89_g70929 = tex2D( _SecondAlbedoTex, Second_UVs17_g70929 );
				half3 Second_Albedo153_g70929 = (( _SecondColor * tex2DNode89_g70929 )).rgb;
				float3 lerpResult4834_g70929 = lerp( ( Main_Albedo99_g70929 * Second_Albedo153_g70929 * 4.594794 ) , Second_Albedo153_g70929 , _DetailBlendMode);
				float vertexToFrag11_g70931 = packedInput.ase_texcoord8.z;
				half Blend_Source1540_g70929 = vertexToFrag11_g70931;
				float4 tex2DNode35_g70929 = tex2D( _MainMaskTex, Main_UVs15_g70929 );
				half Main_Mask57_g70929 = tex2DNode35_g70929.b;
				float4 tex2DNode33_g70929 = tex2D( _SecondMaskTex, Second_UVs17_g70929 );
				half Second_Mask81_g70929 = tex2DNode33_g70929.b;
				float lerpResult1327_g70929 = lerp( Main_Mask57_g70929 , Second_Mask81_g70929 , _DetailMaskMode);
				float lerpResult4058_g70929 = lerp( lerpResult1327_g70929 , ( 1.0 - lerpResult1327_g70929 ) , _DetailMaskInvertMode);
				float temp_output_7_0_g71007 = _DetailBlendMinValue;
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch4838_g70929 = saturate( ( ( saturate( ( Blend_Source1540_g70929 + ( Blend_Source1540_g70929 * lerpResult4058_g70929 ) ) ) - temp_output_7_0_g71007 ) / ( _DetailBlendMaxValue - temp_output_7_0_g71007 ) ) );
				#else
				float staticSwitch4838_g70929 = 0.0;
				#endif
				half Mask_Detail147_g70929 = staticSwitch4838_g70929;
				float3 lerpResult235_g70929 = lerp( Main_Albedo99_g70929 , lerpResult4834_g70929 , Mask_Detail147_g70929);
				#ifdef TVE_FEATURE_DETAIL
				float3 staticSwitch255_g70929 = lerpResult235_g70929;
				#else
				float3 staticSwitch255_g70929 = Main_Albedo99_g70929;
				#endif
				half3 Blend_Albedo265_g70929 = staticSwitch255_g70929;
				half3 Blend_AlbedoTinted2808_g70929 = ( ( float3(1,1,1) * float3(1,1,1) * float3(1,1,1) ) * Blend_Albedo265_g70929 );
				half3 Blend_AlbedoColored863_g70929 = Blend_AlbedoTinted2808_g70929;
				half3 Blend_AlbedoAndSubsurface149_g70929 = Blend_AlbedoColored863_g70929;
				half3 Global_OverlayColor1758_g70929 = (TVE_OverlayColor).rgb;
				float3 vertexToFrag5058_g70929 = packedInput.ase_texcoord9.xyz;
				half3 World_Normal4101_g70929 = vertexToFrag5058_g70929;
				half Global_DynamicMode5112_g70929 = _VertexDynamicMode;
				float lerpResult4801_g70929 = lerp( World_Normal4101_g70929.y , packedInput.ase_normal.y , Global_DynamicMode5112_g70929);
				float lerpResult3567_g70929 = lerp( 0.5 , 1.0 , lerpResult4801_g70929);
				float4 temp_output_93_19_g70934 = TVE_ExtrasCoords;
				float3 vertexToFrag3890_g70929 = packedInput.ase_texcoord10.xyz;
				float3 WorldPosition3905_g70929 = vertexToFrag3890_g70929;
				float3 vertexToFrag4224_g70929 = packedInput.ase_texcoord11.xyz;
				half3 ObjectData20_g70970 = vertexToFrag4224_g70929;
				half3 WorldData19_g70970 = vertexToFrag3890_g70929;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g70970 = WorldData19_g70970;
				#else
				float3 staticSwitch14_g70970 = ObjectData20_g70970;
				#endif
				float3 ObjectPosition4223_g70929 = staticSwitch14_g70970;
				float3 lerpResult4827_g70929 = lerp( WorldPosition3905_g70929 , ObjectPosition4223_g70929 , _ExtrasPositionMode);
				half2 UV96_g70934 = ( (temp_output_93_19_g70934).zw + ( (temp_output_93_19_g70934).xy * (lerpResult4827_g70929).xz ) );
				float temp_output_84_0_g70934 = _LayerExtrasValue;
				float4 lerpResult109_g70934 = lerp( TVE_ExtrasParams , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_ExtrasTex, sampler_linear_repeat, UV96_g70934,temp_output_84_0_g70934, 0.0 ) , TVE_ExtrasUsage[(int)temp_output_84_0_g70934]);
				float4 break89_g70934 = lerpResult109_g70934;
				half Global_Extras_Overlay156_g70929 = break89_g70934.b;
				half Overlay_Variation4560_g70929 = 1.0;
				half Overlay_Commons1365_g70929 = ( _GlobalOverlay * Global_Extras_Overlay156_g70929 * Overlay_Variation4560_g70929 );
				half Overlay_Mask_3D5122_g70929 = ( ( ( lerpResult3567_g70929 * 0.5 ) + Blend_Albedo265_g70929.y ) * Overlay_Commons1365_g70929 );
				float temp_output_7_0_g70971 = _OverlayMaskMinValue;
				half Overlay_Mask269_g70929 = saturate( ( ( Overlay_Mask_3D5122_g70929 - temp_output_7_0_g70971 ) / ( _OverlayMaskMaxValue - temp_output_7_0_g70971 ) ) );
				float3 lerpResult336_g70929 = lerp( Blend_AlbedoAndSubsurface149_g70929 , Global_OverlayColor1758_g70929 , Overlay_Mask269_g70929);
				half3 Final_Albedo359_g70929 = lerpResult336_g70929;
				float3 temp_cast_2 = (1.0).xxx;
				float vertexToFrag11_g70973 = packedInput.ase_texcoord8.w;
				float3 lerpResult2945_g70929 = lerp( (_VertexOcclusionColor).rgb , temp_cast_2 , vertexToFrag11_g70973);
				float3 Vertex_Occlusion648_g70929 = lerpResult2945_g70929;
				
				float3 unpack4112_g70929 = UnpackNormalScale( tex2D( _MainNormalTex, Main_UVs15_g70929 ), _MainNormalValue );
				unpack4112_g70929.z = lerp( 1, unpack4112_g70929.z, saturate(_MainNormalValue) );
				half3 Main_Normal137_g70929 = unpack4112_g70929;
				float3 lerpResult3372_g70929 = lerp( float3( 0,0,1 ) , Main_Normal137_g70929 , _DetailNormalValue);
				float3 unpack4114_g70929 = UnpackNormalScale( tex2D( _SecondNormalTex, Second_UVs17_g70929 ), _SecondNormalValue );
				unpack4114_g70929.z = lerp( 1, unpack4114_g70929.z, saturate(_SecondNormalValue) );
				half3 Second_Normal179_g70929 = unpack4114_g70929;
				float3 lerpResult3376_g70929 = lerp( Main_Normal137_g70929 , BlendNormal( lerpResult3372_g70929 , Second_Normal179_g70929 ) , Mask_Detail147_g70929);
				#ifdef TVE_FEATURE_DETAIL
				float3 staticSwitch267_g70929 = lerpResult3376_g70929;
				#else
				float3 staticSwitch267_g70929 = Main_Normal137_g70929;
				#endif
				float3 temp_output_13_0_g70940 = staticSwitch267_g70929;
				float3 switchResult12_g70940 = (((isFrontFace>0)?(temp_output_13_0_g70940):(( temp_output_13_0_g70940 * _render_normals ))));
				half3 Blend_Normal312_g70929 = switchResult12_g70940;
				half3 Final_Normal366_g70929 = Blend_Normal312_g70929;
				
				half Render_Specular4861_g70929 = _RenderSpecular;
				float3 temp_cast_5 = (( 0.04 * Render_Specular4861_g70929 )).xxx;
				
				float3 hdEmission4189_g70929 = ASEGetEmissionHDRColor(_EmissiveColor.rgb,_EmissiveIntensityParams.x,_EmissiveExposureValue,GetInverseCurrentExposureMultiplier());
				half2 Emissive_UVs2468_g70929 = ( ( packedInput.ase_texcoord7.xy * (_EmissiveUVs).xy ) + (_EmissiveUVs).zw );
				half Global_Extras_Emissive4203_g70929 = break89_g70934.r;
				float lerpResult4206_g70929 = lerp( 1.0 , Global_Extras_Emissive4203_g70929 , _GlobalEmissive);
				half3 Final_Emissive2476_g70929 = ( (( hdEmission4189_g70929 * tex2D( _EmissiveTex, Emissive_UVs2468_g70929 ) )).rgb * lerpResult4206_g70929 );
				
				half Main_Smoothness227_g70929 = ( tex2DNode35_g70929.a * _MainSmoothnessValue );
				half Second_Smoothness236_g70929 = ( tex2DNode33_g70929.a * _SecondSmoothnessValue );
				float lerpResult266_g70929 = lerp( Main_Smoothness227_g70929 , Second_Smoothness236_g70929 , Mask_Detail147_g70929);
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch297_g70929 = lerpResult266_g70929;
				#else
				float staticSwitch297_g70929 = Main_Smoothness227_g70929;
				#endif
				half Blend_Smoothness314_g70929 = staticSwitch297_g70929;
				half Global_OverlaySmoothness311_g70929 = TVE_OverlaySmoothness;
				float lerpResult343_g70929 = lerp( Blend_Smoothness314_g70929 , Global_OverlaySmoothness311_g70929 , Overlay_Mask269_g70929);
				half Final_Smoothness371_g70929 = lerpResult343_g70929;
				half Global_Extras_Wetness305_g70929 = break89_g70934.g;
				float lerpResult3673_g70929 = lerp( 0.0 , Global_Extras_Wetness305_g70929 , _GlobalWetness);
				half Final_SmoothnessAndWetness4130_g70929 = saturate( ( Final_Smoothness371_g70929 + lerpResult3673_g70929 ) );
				
				float lerpResult240_g70929 = lerp( 1.0 , tex2DNode35_g70929.g , _MainOcclusionValue);
				half Main_Occlusion247_g70929 = lerpResult240_g70929;
				float lerpResult239_g70929 = lerp( 1.0 , tex2DNode33_g70929.g , _SecondOcclusionValue);
				half Second_Occlusion251_g70929 = lerpResult239_g70929;
				float lerpResult294_g70929 = lerp( Main_Occlusion247_g70929 , Second_Occlusion251_g70929 , Mask_Detail147_g70929);
				#ifdef TVE_FEATURE_DETAIL
				float staticSwitch310_g70929 = lerpResult294_g70929;
				#else
				float staticSwitch310_g70929 = Main_Occlusion247_g70929;
				#endif
				half Blend_Occlusion323_g70929 = staticSwitch310_g70929;
				
				float localCustomAlphaClip9_g70962 = ( 0.0 );
				float vertexToFrag11_g70951 = packedInput.ase_texcoord9.w;
				half Fade_Camera_Mask5149_g70929 = 1.0;
				float lerpResult5141_g70929 = lerp( 1.0 , vertexToFrag11_g70951 , Fade_Camera_Mask5149_g70929);
				half Fade_Camera3743_g70929 = lerpResult5141_g70929;
				float temp_output_41_0_g70948 = ( 1.0 * Fade_Camera3743_g70929 );
				half Final_AlphaFade3727_g70929 = saturate( ( temp_output_41_0_g70948 + ( temp_output_41_0_g70948 * tex3D( TVE_ScreenTex3D, ( TVE_ScreenTexCoord * WorldPosition3905_g70929 ) ).r ) ) );
				float Main_Alpha316_g70929 = ( _MainColor.a * tex2DNode29_g70929.a );
				half AlphaTreshold2132_g70929 = _AlphaClipValue;
				half Final_Alpha3754_g70929 = ( Main_Alpha316_g70929 - ( AlphaTreshold2132_g70929 - 0.5 ) );
				float temp_output_661_0_g70929 = ( Final_AlphaFade3727_g70929 * Final_Alpha3754_g70929 );
				float temp_output_3_0_g70949 = temp_output_661_0_g70929;
				half Offest27_g70949 = 0.5;
				half Feather30_g70949 = 0.5;
				float temp_output_3_0_g70962 = ( ( ( temp_output_3_0_g70949 - Offest27_g70949 ) / ( max( fwidth( temp_output_3_0_g70949 ) , 0.001 ) + Feather30_g70949 ) ) + Offest27_g70949 );
				float Alpha9_g70962 = temp_output_3_0_g70962;
				float temp_output_15_0_g70962 = 0.5;
				float Treshold9_g70962 = temp_output_15_0_g70962;
				{
				#if TVE_FEATURE_CLIP
				clip(Alpha9_g70962 - Treshold9_g70962);
				#endif
				}
				half Final_Clip914_g70929 = Alpha9_g70962;
				
				surfaceDescription.Albedo = ( Final_Albedo359_g70929 * Vertex_Occlusion648_g70929 );
				surfaceDescription.Normal = Final_Normal366_g70929;
				surfaceDescription.BentNormal = float3( 0, 0, 1 );
				surfaceDescription.CoatMask = 0;
				surfaceDescription.Metallic = 0;

				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceDescription.Specular = temp_cast_5;
				#endif

				surfaceDescription.Emission = Final_Emissive2476_g70929;
				surfaceDescription.Smoothness = Final_SmoothnessAndWetness4130_g70929;
				surfaceDescription.Occlusion = Blend_Occlusion323_g70929;
				surfaceDescription.Alpha = Final_Clip914_g70929;

				#ifdef _ALPHATEST_ON
				surfaceDescription.AlphaClipThreshold = _AlphaCutoff;
				#endif

				#ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
				surfaceDescription.SpecularAAScreenSpaceVariance = 0;
				surfaceDescription.SpecularAAThreshold = 0;
				#endif

				#ifdef _SPECULAR_OCCLUSION_CUSTOM
				surfaceDescription.SpecularOcclusion = 0;
				#endif

				#if defined(_HAS_REFRACTION) || defined(_MATERIAL_FEATURE_TRANSMISSION)
				surfaceDescription.Thickness = 1;
				#endif

				#ifdef _HAS_REFRACTION
				surfaceDescription.RefractionIndex = 1;
				surfaceDescription.RefractionColor = float3( 1, 1, 1 );
				surfaceDescription.RefractionDistance = 0;
				#endif

				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceDescription.SubsurfaceMask = 1;
				#endif

				#if defined( _MATERIAL_FEATURE_SUBSURFACE_SCATTERING ) || defined( _MATERIAL_FEATURE_TRANSMISSION )
				surfaceDescription.DiffusionProfile = 0;
				#endif

				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceDescription.Anisotropy = 1;
				surfaceDescription.Tangent = float3( 1, 0, 0 );
				#endif

				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceDescription.IridescenceMask = 0;
				surfaceDescription.IridescenceThickness = 0;
				#endif

				#ifdef _ASE_BAKEDGI
				surfaceDescription.BakedGI = 0;
				#endif
				#ifdef _ASE_BAKEDBACKGI
				surfaceDescription.BakedBackGI = 0;
				#endif

				#ifdef _DEPTHOFFSET_ON
				surfaceDescription.DepthOffset = 0;
				#endif

				#ifdef UNITY_VIRTUAL_TEXTURING
				surfaceDescription.VTPackedFeedback = float4(1.0f,1.0f,1.0f,1.0f);
				#endif

				SurfaceData surfaceData;
				BuiltinData builtinData;
				GetSurfaceAndBuiltinData(surfaceDescription,input, V, posInput, surfaceData, builtinData);

				BSDFData bsdfData = ConvertSurfaceDataToBSDFData(input.positionSS.xy, surfaceData);

				PreLightData preLightData = GetPreLightData(V, posInput, bsdfData);

				outColor = float4(0.0, 0.0, 0.0, 0.0);
				#ifdef DEBUG_DISPLAY
				#ifdef OUTPUT_SPLIT_LIGHTING
					outDiffuseLighting = 0;
					ENCODE_INTO_SSSBUFFER(surfaceData, posInput.positionSS, outSSSBuffer);
				#endif

				bool viewMaterial = false;
				int bufferSize = _DebugViewMaterialArray[0].x;
				if (bufferSize != 0)
				{
					bool needLinearToSRGB = false;
					float3 result = float3(1.0, 0.0, 1.0);

					for (int index = 1; index <= bufferSize; index++)
					{
						int indexMaterialProperty = _DebugViewMaterialArray[index].x;

						if (indexMaterialProperty != 0)
						{
							viewMaterial = true;

							GetPropertiesDataDebug(indexMaterialProperty, result, needLinearToSRGB);
							GetVaryingsDataDebug(indexMaterialProperty, input, result, needLinearToSRGB);
							GetBuiltinDataDebug(indexMaterialProperty, builtinData, posInput, result, needLinearToSRGB);
							GetSurfaceDataDebug(indexMaterialProperty, surfaceData, result, needLinearToSRGB);
							GetBSDFDataDebug(indexMaterialProperty, bsdfData, result, needLinearToSRGB);
						}
					}

					if (!needLinearToSRGB)
						result = SRGBToLinear(max(0, result));

					outColor = float4(result, 1.0);
				}

				if (!viewMaterial)
				{
					if (_DebugFullScreenMode == FULLSCREENDEBUGMODE_VALIDATE_DIFFUSE_COLOR || _DebugFullScreenMode == FULLSCREENDEBUGMODE_VALIDATE_SPECULAR_COLOR)
					{
						float3 result = float3(0.0, 0.0, 0.0);

						GetPBRValidatorDebug(surfaceData, result);

						outColor = float4(result, 1.0f);
					}
					else if (_DebugFullScreenMode == FULLSCREENDEBUGMODE_TRANSPARENCY_OVERDRAW)
					{
						float4 result = _DebugTransparencyOverdrawWeight * float4(TRANSPARENCY_OVERDRAW_COST, TRANSPARENCY_OVERDRAW_COST, TRANSPARENCY_OVERDRAW_COST, TRANSPARENCY_OVERDRAW_A);
						outColor = result;
					}
					else
				#endif
					{
				#ifdef _SURFACE_TYPE_TRANSPARENT
						uint featureFlags = LIGHT_FEATURE_MASK_FLAGS_TRANSPARENT;
				#else
						uint featureFlags = LIGHT_FEATURE_MASK_FLAGS_OPAQUE;
				#endif
					
						LightLoopOutput lightLoopOutput;
						LightLoop(V, posInput, preLightData, bsdfData, builtinData, featureFlags, lightLoopOutput);

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
						outColor = EvaluateAtmosphericScattering(posInput, V, outColor);

                        #else

						if (_BlendMode == BLENDMODE_ALPHA || _BlendMode == BLENDMODE_ADDITIVE)
							return float4(diffuseLighting * opacity + specularLighting * (
                        #ifdef SUPPORT_BLENDMODE_PRESERVE_SPECULAR_LIGHTING
							   _EnableBlendModePreserveSpecularLighting ? 1.0f :
                        #endif
								opacity), opacity);
						else
							return float4(diffuseLighting + specularLighting, opacity);

                #endif

				#ifdef _WRITE_TRANSPARENT_MOTION_VECTOR
						float4 VPASSpositionCS = float4(packedInput.vpassPositionCS.xy, 0.0, packedInput.vpassPositionCS.z);
						float4 VPASSpreviousPositionCS = float4(packedInput.vpassPreviousPositionCS.xy, 0.0, packedInput.vpassPreviousPositionCS.z);

						bool forceNoMotion = any(unity_MotionVectorsParams.yw == 0.0);
						if (!forceNoMotion)
						{
							float2 motionVec = CalculateMotionVector(VPASSpositionCS, VPASSpreviousPositionCS);
							EncodeMotionVector(motionVec * 0.5, outMotionVec);
							outMotionVec.zw = 1.0;
						}
				#endif
					}

				#ifdef DEBUG_DISPLAY
				}
				#endif

				#ifdef _DEPTHOFFSET_ON
				outputDepth = posInput.deviceDepth;
				#endif

				#ifdef UNITY_VIRTUAL_TEXTURING
					outVTFeedback = builtinData.vtPackedFeedback;
				#endif
			}
			ENDHLSL
		}
				
		
        Pass
        {
			
            Name "ScenePickingPass"
            Tags { "LightMode"="Picking" }
            
            Cull [_CullMode]
        
            HLSLPROGRAM
        
			#define _MATERIAL_FEATURE_SPECULAR_COLOR 1
			#define _ENERGY_CONSERVING_SPECULAR 1
			#pragma multi_compile _ DOTS_INSTANCING_ON
			#pragma multi_compile_instancing
			#pragma instancing_options renderinglayer
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#define ASE_ABSOLUTE_VERTEX_POS 1
			#define _AMBIENT_OCCLUSION 1
			#define HAVE_MESH_MODIFICATION
			#define ASE_SRP_VERSION 120100

        
			#pragma editor_sync_compilation	
			#pragma vertex Vert
			#pragma fragment Frag
		
			// Keyword for transparent
			#pragma shader_feature _SURFACE_TYPE_TRANSPARENT
			#pragma shader_feature_local_fragment _ _ENABLE_FOG_ON_TRANSPARENT
			#pragma shader_feature_local _ _TRANSPARENT_WRITES_MOTION_VEC

            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl" 
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl" 
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphHeader.hlsl" 
            
			#ifdef DEBUG_DISPLAY
				#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
			#endif
            #define ATTRIBUTES_NEED_NORMAL
            #define ATTRIBUTES_NEED_TANGENT
            #define VARYINGS_NEED_TANGENT_TO_WORLD
        
        
            #define SHADERPASS SHADERPASS_DEPTH_ONLY
			#define SCENEPICKINGPASS 1
            
        
			#define SHADER_UNLIT

            #if defined(_TRANSPARENT_WRITES_MOTION_VEC) && defined(_SURFACE_TYPE_TRANSPARENT)
                #define _WRITE_TRANSPARENT_MOTION_VECTOR
            #endif
        
			float4 _SelectionID;
            
            CBUFFER_START( UnityPerMaterial )
			half4 _SecondColor;
			half4 _MainColor;
			half4 _MainUVs;
			half4 _ColorsMaskRemap;
			half4 _SecondUVs;
			half4 _OverlayMaskRemap;
			float4 _Color;
			float4 _SubsurfaceDiffusion_Asset;
			float4 _MaxBoundsInfo;
			float4 _SubsurfaceDiffusion_asset;
			float4 _GradientMaskRemap;
			half4 _VertexOcclusionColor;
			half4 _SubsurfaceMaskRemap;
			half4 _AlphaMaskRemap;
			half4 _DetailBlendRemap;
			float4 _EmissiveIntensityParams;
			float4 _NoiseMaskRemap;
			half4 _EmissiveUVs;
			half4 _EmissiveColor;
			half4 _VertexOcclusionRemap;
			half3 _render_normals;
			half _render_dst;
			half _MotionSpeed_20;
			half _RenderDirect;
			half _MotionVariation_20;
			half _IsStandardShader;
			half _MotionScale_20;
			half _InteractionMaskValue;
			half _MotionVariation_10;
			half _VertexDynamicMode;
			float _MotionSpeed_10;
			half _render_src;
			half _MotionAmplitude_20;
			float _MotionScale_10;
			half _MotionAmplitude_10;
			half _LayerMotionValue;
			half _VertexPivotMode;
			half _InteractionAmplitude;
			half _MotionValue_20;
			half _render_zw;
			half _VertexDataMode;
			half _MainOcclusionValue;
			half _GlobalWetness;
			half _SecondSmoothnessValue;
			half _MainSmoothnessValue;
			half _GlobalEmissive;
			half _EmissiveExposureValue;
			half _RenderSpecular;
			half _SecondNormalValue;
			half _DetailNormalValue;
			half _MainNormalValue;
			half _VertexOcclusionMaxValue;
			half _VertexOcclusionMinValue;
			half _OverlayMaskMaxValue;
			half _OverlayMaskMinValue;
			half _LayerExtrasValue;
			half _ExtrasPositionMode;
			half _GlobalOverlay;
			half _DetailBlendMaxValue;
			half _DetailBlendMinValue;
			half _DetailMaskInvertMode;
			half _DetailMaskMode;
			half _DetailMeshValue;
			half _DetailCoordMode;
			half _GlobalSize;
			half _LayerVertexValue;
			half _MotionFacingValue;
			half _CategoryRender;
			half _SubsurfaceDirectValue;
			half _RenderSSR;
			half _CategoryOcclusion;
			half _MessageSizeFade;
			half _DetailTypeMode;
			half _CategoryGlobal;
			half _CategorySizeFade;
			half _CategoryPerspective;
			half _IsVersion;
			half _CategoryNoise;
			half _RenderMode;
			half _HasOcclusion;
			half _CategoryDetail;
			half _HasEmissive;
			half _CategoryMotion;
			half _SubsurfaceNormalValue;
			half _EmissiveFlagMode;
			half _SpaceMotionGlobals;
			half _SubsurfaceShadowValue;
			half _RenderCoverage;
			half _RenderPriority;
			float _SubsurfaceDiffusion;
			half _VertexRollingMode;
			half _Cutoff;
			half _SubsurfaceScatteringValue;
			half _render_cull;
			half _IsBarkShader;
			half _CategorySubsurface;
			half _SpaceGlobalPosition;
			half _RenderClip;
			half _MessageMotionVariation;
			half _RenderCull;
			half _SecondOcclusionValue;
			half _RenderZWrite;
			half _SubsurfaceAmbientValue;
			half _RenderQueue;
			half _SubsurfaceAngleValue;
			half _AlphaClipValue;
			half _VertexMasksMode;
			half _LayerReactValue;
			half _DetailBlendMode;
			half _VertexVariationMode;
			half _RenderDecals;
			half _RenderShadow;
			half _DetailMode;
			half _SpaceRenderFade;
			half _IsTVEShader;
			half _CategoryEmissive;
			half _RenderAmbient;
			half _CategoryMain;
			half _CategoryGradient;
			half _SpaceGlobalLocals;
			half _SpaceMotionLocals;
			half _SpaceGlobalLayers;
			half _RenderNormals;
			half _HasGradient;
			half _MessageGlobalsVariation;
			half _FadeCameraValue;
			float4 _EmissionColor;
			float _AlphaCutoff;
			float _RenderQueueType;
			#ifdef _ADD_PRECOMPUTED_VELOCITY
			float _AddPrecomputedVelocity;
			#endif
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilRefDistortionVec;
			float _StencilWriteMaskDistortionVec;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
			float _SrcBlend;
			float _DstBlend;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _TransparentZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _EnableFogOnTransparent;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END
			sampler2D _BumpMap;
			half TVE_Enabled;
			sampler2D _MainTex;
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
			half TVE_CameraFadeStart;
			half TVE_CameraFadeEnd;
			sampler3D TVE_ScreenTex3D;
			half TVE_ScreenTexCoord;
			sampler2D _MainAlbedoTex;

        
            
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/PickingSpaceTransforms.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Unlit/Unlit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"
        

			#define ASE_NEEDS_VERT_POSITION
			#pragma shader_feature_local TVE_FEATURE_CLIP
			#pragma shader_feature_local TVE_FEATURE_BATCHING
			//TVE Pipeline Defines
			#define THE_VEGETATION_ENGINE
			#define TVE_IS_HD_PIPELINE
			//TVE HD Pipeline Defines
			#pragma shader_feature_local _DISABLE_DECALS
			#pragma shader_feature_local _DISABLE_SSR
			//TVE Injection Defines
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END
			//TVE Shader Type Defines
			#define TVE_IS_VEGETATION_SHADER


			struct VertexInput
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 positionCS : SV_POSITION;
				float3 normalWS : TEXCOORD0;
				float4 tangentWS : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			float3 ObjectPosition_UNITY_MATRIX_M(  )
			{
				return float3(UNITY_MATRIX_M[0].w, UNITY_MATRIX_M[1].w, UNITY_MATRIX_M[2].w );
			}
			
			float2 DecodeFloatToVector2( float enc )
			{
				float2 result ;
				result.y = enc % 2048;
				result.x = floor(enc / 2048);
				return result / (2048 - 1);
			}
			

            struct SurfaceDescription
			{
				float Alpha;
				float AlphaClipThreshold;
			};
        
        
            void GetSurfaceAndBuiltinData(SurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData RAY_TRACING_OPTIONAL_PARAMETERS)
            {    
                #ifdef LOD_FADE_CROSSFADE 
			        LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
                #endif
        
                #ifdef _ALPHATEST_ON
                    float alphaCutoff = surfaceDescription.AlphaClipThreshold;
                    GENERIC_ALPHA_TEST(surfaceDescription.Alpha, alphaCutoff);
                #endif
        
                //#if !defined(SHADER_STAGE_RAY_TRACING) && _DEPTHOFFSET_ON
                //ApplyDepthOffsetPositionInput(V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput);
                //#endif
        
                
				ZERO_INITIALIZE(SurfaceData, surfaceData);
        
				ZERO_BUILTIN_INITIALIZE(builtinData); 
				builtinData.opacity = surfaceDescription.Alpha;
        
				#if defined(DEBUG_DISPLAY)
					builtinData.renderingLayers = GetMeshRenderingLightLayer();
				#endif
        
                #ifdef _ALPHATEST_ON
                    builtinData.alphaClipTreshold = alphaCutoff;
                #endif
        
                //#if _DEPTHOFFSET_ON
                //builtinData.depthOffset = surfaceDescription.DepthOffset;
                //#endif

        
                ApplyDebugToBuiltinData(builtinData);
                
            }
        

			VertexOutput VertexFunction(VertexInput inputMesh  )
			{

				VertexOutput o;
				ZERO_INITIALIZE(VertexOutput, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, o );

				float3 VertexPosition3588_g70929 = inputMesh.positionOS;
				half3 Mesh_PivotsOS2291_g70929 = half3(0,0,0);
				float3 temp_output_2283_0_g70929 = ( VertexPosition3588_g70929 - Mesh_PivotsOS2291_g70929 );
				half3 VertexPos40_g71005 = temp_output_2283_0_g70929;
				float3 appendResult74_g71005 = (float3(VertexPos40_g71005.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g71005 = appendResult74_g71005;
				float3 break84_g71005 = VertexPos40_g71005;
				float3 appendResult81_g71005 = (float3(0.0 , break84_g71005.y , break84_g71005.z));
				half3 VertexPosOtherAxis82_g71005 = appendResult81_g71005;
				float4 temp_output_91_19_g70965 = TVE_MotionCoords;
				float3 localObjectPosition_UNITY_MATRIX_M14_g70996 = ObjectPosition_UNITY_MATRIX_M();
				float3 appendResult60_g70954 = (float3(inputMesh.ase_texcoord3.x , inputMesh.ase_texcoord3.z , inputMesh.ase_texcoord3.y));
				half3 Mesh_PivotsData2831_g70929 = ( appendResult60_g70954 * _VertexPivotMode );
				float3 temp_output_122_0_g70996 = Mesh_PivotsData2831_g70929;
				float3 PivotsOnly105_g70996 = (mul( GetObjectToWorldMatrix(), float4( temp_output_122_0_g70996 , 0.0 ) ).xyz).xyz;
				#ifdef SHADEROPTIONS_CAMERA_RELATIVE_RENDERING
				float3 staticSwitch13_g70996 = ( ( localObjectPosition_UNITY_MATRIX_M14_g70996 + PivotsOnly105_g70996 ) + _WorldSpaceCameraPos );
				#else
				float3 staticSwitch13_g70996 = ( localObjectPosition_UNITY_MATRIX_M14_g70996 + PivotsOnly105_g70996 );
				#endif
				half3 ObjectData20_g70997 = staticSwitch13_g70996;
				float3 ase_worldPos = GetAbsolutePositionWS( TransformObjectToWorld( (inputMesh.positionOS).xyz ) );
				half3 WorldData19_g70997 = ase_worldPos;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g70997 = WorldData19_g70997;
				#else
				float3 staticSwitch14_g70997 = ObjectData20_g70997;
				#endif
				float3 temp_output_114_0_g70996 = staticSwitch14_g70997;
				float3 vertexToFrag4224_g70929 = temp_output_114_0_g70996;
				half3 ObjectData20_g70970 = vertexToFrag4224_g70929;
				float3 vertexToFrag3890_g70929 = ase_worldPos;
				half3 WorldData19_g70970 = vertexToFrag3890_g70929;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g70970 = WorldData19_g70970;
				#else
				float3 staticSwitch14_g70970 = ObjectData20_g70970;
				#endif
				float3 ObjectPosition4223_g70929 = staticSwitch14_g70970;
				half2 UV94_g70965 = ( (temp_output_91_19_g70965).zw + ( (temp_output_91_19_g70965).xy * (ObjectPosition4223_g70929).xz ) );
				float temp_output_84_0_g70965 = _LayerMotionValue;
				float4 lerpResult107_g70965 = lerp( TVE_MotionParams , saturate( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_MotionTex, sampler_linear_repeat, UV94_g70965,temp_output_84_0_g70965, 0.0 ) ) , TVE_MotionUsage[(int)temp_output_84_0_g70965]);
				half4 Global_Motion_Params3909_g70929 = lerpResult107_g70965;
				float4 break322_g70972 = Global_Motion_Params3909_g70929;
				float3 appendResult397_g70972 = (float3(break322_g70972.x , 0.0 , break322_g70972.y));
				float3 temp_output_398_0_g70972 = (appendResult397_g70972*2.0 + -1.0);
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				half2 Global_MotionDirectionOS39_g70929 = (( mul( GetWorldToObjectMatrix(), float4( temp_output_398_0_g70972 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_DirectionOS358_g71001 = Global_MotionDirectionOS39_g70929;
				half Mesh_Height1524_g70929 = inputMesh.ase_color.a;
				half Mesh_Height114_g70956 = Mesh_Height1524_g70929;
				half ObjectData20_g70957 = ( Mesh_Height114_g70956 * 2.0 );
				float enc62_g70955 = inputMesh.ase_texcoord.w;
				float2 localDecodeFloatToVector262_g70955 = DecodeFloatToVector2( enc62_g70955 );
				float2 break63_g70955 = ( localDecodeFloatToVector262_g70955 * 100.0 );
				float Bounds_Height5230_g70929 = break63_g70955.x;
				float Bounds_Height117_g70956 = Bounds_Height5230_g70929;
				half WorldData19_g70957 = ( ( Mesh_Height114_g70956 * Mesh_Height114_g70956 ) * Bounds_Height117_g70956 * 2.0 );
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g70957 = WorldData19_g70957;
				#else
				float staticSwitch14_g70957 = ObjectData20_g70957;
				#endif
				half Motion_10_Mask5242_g70929 = staticSwitch14_g70957;
				half Wind_Power369_g70972 = break322_g70972.z;
				half Global_MotionPower2223_g70929 = Wind_Power369_g70972;
				half3 Input_Position419_g70975 = -ObjectPosition4223_g70929;
				half2 Global_MotionDirectionWS4683_g70929 = (temp_output_398_0_g70972).xz;
				half2 Input_DirectionWS423_g70975 = Global_MotionDirectionWS4683_g70929;
				float Motion_Scale287_g70975 = ( _MotionScale_10 + 0.2 );
				half Global_Scale448_g70975 = TVE_NoiseParams.x;
				half Input_Speed62_g70975 = _MotionSpeed_10;
				half Global_Speed449_g70975 = TVE_NoiseParams.y;
				float mulTime426_g70975 = _TimeParameters.x * ( Input_Speed62_g70975 * Global_Speed449_g70975 );
				half Global_DistScale561_g70975 = TVE_NoiseParams.w;
				float3 break461_g70975 = ( Input_Position419_g70975 * Global_DistScale561_g70975 );
				half Global_DistAmplitude559_g70975 = TVE_NoiseParams.z;
				float Noise_Distortion469_g70975 = ( sin( ( break461_g70975.x + break461_g70975.z ) ) * Global_DistAmplitude559_g70975 );
				float3 break111_g70958 = ObjectPosition4223_g70929;
				half Global_DynamicMode5112_g70929 = _VertexDynamicMode;
				half Input_DynamicMode120_g70958 = Global_DynamicMode5112_g70929;
				float Mesh_Variation16_g70929 = inputMesh.ase_color.r;
				half Input_Variation124_g70958 = Mesh_Variation16_g70929;
				half ObjectData20_g70959 = frac( ( ( ( break111_g70958.x + break111_g70958.y + break111_g70958.z ) * ( 1.0 - Input_DynamicMode120_g70958 ) ) + Input_Variation124_g70958 ) );
				half WorldData19_g70959 = Input_Variation124_g70958;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g70959 = WorldData19_g70959;
				#else
				float staticSwitch14_g70959 = ObjectData20_g70959;
				#endif
				float clampResult129_g70958 = clamp( staticSwitch14_g70959 , 0.01 , 0.99 );
				half Global_MeshVariation5104_g70929 = clampResult129_g70958;
				half Motion_Variation284_g70975 = ( _MotionVariation_10 * Global_MeshVariation5104_g70929 );
				float2 temp_output_425_0_g70975 = ( ( (Input_Position419_g70975).xz * Input_DirectionWS423_g70975 * Motion_Scale287_g70975 * Global_Scale448_g70975 ) + ( mulTime426_g70975 + Noise_Distortion469_g70975 + Motion_Variation284_g70975 ) );
				float2 break500_g70975 = ( temp_output_425_0_g70975 * 0.1178 );
				float2 break494_g70975 = ( temp_output_425_0_g70975 * 0.1742 );
				half Input_WindPower327_g70975 = Global_MotionPower2223_g70929;
				float lerpResult430_g70975 = lerp( 1.4 , 0.4 , Input_WindPower327_g70975);
				half Global_MotionNoise34_g70929 = (pow( (( sin( ( break500_g70975.x + break500_g70975.y ) ) * sin( ( break494_g70975.x + break494_g70975.y ) ) )*0.4 + 0.6) , lerpResult430_g70975 )*1.2 + -0.2);
				half Motion_10_Amplitude2258_g70929 = ( _MotionAmplitude_10 * Motion_10_Mask5242_g70929 * Global_MotionPower2223_g70929 * Global_MotionNoise34_g70929 );
				half Input_BendingAmplitude376_g71001 = Motion_10_Amplitude2258_g70929;
				half Input_InteractionAmplitude58_g71001 = _InteractionAmplitude;
				half Input_MeshMotion_10321_g71001 = Motion_10_Mask5242_g70929;
				half Input_InteractionUseMask62_g71001 = _InteractionMaskValue;
				float lerpResult371_g71001 = lerp( 2.0 , Input_MeshMotion_10321_g71001 , Input_InteractionUseMask62_g71001);
				half ObjectData20_g71002 = lerpResult371_g71001;
				half WorldData19_g71002 = Input_MeshMotion_10321_g71001;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g71002 = WorldData19_g71002;
				#else
				float staticSwitch14_g71002 = ObjectData20_g71002;
				#endif
				half Motion_10_Interaction373_g71001 = ( Input_InteractionAmplitude58_g71001 * staticSwitch14_g71002 );
				half Global_InteractionMask66_g70929 = ( break322_g70972.w * break322_g70972.w );
				float Input_InteractionMask330_g71001 = Global_InteractionMask66_g70929;
				float lerpResult360_g71001 = lerp( Input_BendingAmplitude376_g71001 , Motion_10_Interaction373_g71001 , saturate( ( Input_InteractionAmplitude58_g71001 * Input_InteractionMask330_g71001 ) ));
				float2 break364_g71001 = ( Input_DirectionOS358_g71001 * lerpResult360_g71001 );
				half Motion_10_BendingZ190_g70929 = break364_g71001.y;
				half Angle44_g71005 = Motion_10_BendingZ190_g70929;
				half3 VertexPos40_g71004 = ( VertexPosRotationAxis50_g71005 + ( VertexPosOtherAxis82_g71005 * cos( Angle44_g71005 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g71005 ) * sin( Angle44_g71005 ) ) );
				float3 appendResult74_g71004 = (float3(0.0 , 0.0 , VertexPos40_g71004.z));
				half3 VertexPosRotationAxis50_g71004 = appendResult74_g71004;
				float3 break84_g71004 = VertexPos40_g71004;
				float3 appendResult81_g71004 = (float3(break84_g71004.x , break84_g71004.y , 0.0));
				half3 VertexPosOtherAxis82_g71004 = appendResult81_g71004;
				half Motion_10_BendingX216_g70929 = break364_g71001.x;
				half Angle44_g71004 = -Motion_10_BendingX216_g70929;
				half Input_Scale321_g70944 = _MotionScale_20;
				half Input_Variation330_g70944 = ( _MotionVariation_20 * Global_MeshVariation5104_g70929 );
				half Input_Speed62_g70944 = _MotionSpeed_20;
				float mulTime349_g70944 = _TimeParameters.x * Input_Speed62_g70944;
				float temp_output_302_0_g70944 = sin( ( ( ( ase_worldPos.x + ase_worldPos.y + ase_worldPos.z ) * Input_Scale321_g70944 ) + Input_Variation330_g70944 + mulTime349_g70944 ) );
				float enc59_g70955 = inputMesh.ase_texcoord.z;
				float2 localDecodeFloatToVector259_g70955 = DecodeFloatToVector2( enc59_g70955 );
				float2 break61_g70955 = localDecodeFloatToVector259_g70955;
				half Mesh_Motion_2060_g70929 = break61_g70955.x;
				half Mesh_Motion_20115_g70956 = Mesh_Motion_2060_g70929;
				float Bounds_Radius5231_g70929 = break63_g70955.y;
				float Bounds_Radius118_g70956 = Bounds_Radius5231_g70929;
				half Motion_20_Mask5243_g70929 = ( Mesh_Motion_20115_g70956 * Bounds_Radius118_g70956 );
				half3 Input_Position419_g70960 = VertexPosition3588_g70929;
				float3 normalizeResult518_g70960 = normalize( Input_Position419_g70960 );
				half2 Input_DirectionOS423_g70960 = Global_MotionDirectionOS39_g70929;
				float2 break521_g70960 = -Input_DirectionOS423_g70960;
				float3 appendResult522_g70960 = (float3(break521_g70960.x , 0.0 , break521_g70960.y));
				float dotResult519_g70960 = dot( normalizeResult518_g70960 , appendResult522_g70960 );
				half Input_Mask62_g70960 = _MotionFacingValue;
				float lerpResult524_g70960 = lerp( 1.0 , (dotResult519_g70960*0.5 + 0.5) , Input_Mask62_g70960);
				half ObjectData20_g70961 = lerpResult524_g70960;
				half WorldData19_g70961 = 1.0;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g70961 = WorldData19_g70961;
				#else
				float staticSwitch14_g70961 = ObjectData20_g70961;
				#endif
				half Motion_FacingMask5214_g70929 = staticSwitch14_g70961;
				half Motion_20_Amplitude4381_g70929 = ( _MotionAmplitude_20 * _MotionValue_20 * Motion_20_Mask5243_g70929 * Global_MotionPower2223_g70929 * Global_MotionNoise34_g70929 * Motion_FacingMask5214_g70929 );
				half Input_Amplitude58_g70944 = Motion_20_Amplitude4381_g70929;
				half2 Input_DirectionOS366_g70944 = Global_MotionDirectionOS39_g70929;
				float2 break371_g70944 = Input_DirectionOS366_g70944;
				float3 appendResult372_g70944 = (float3(break371_g70944.x , ( temp_output_302_0_g70944 * 0.1 ) , break371_g70944.y));
				half3 Motion_20_Squash4418_g70929 = ( ( (temp_output_302_0_g70944*0.2 + 1.0) * Input_Amplitude58_g70944 ) * appendResult372_g70944 );
				float3 Vertex_Motion_Object833_g70929 = ( ( VertexPosRotationAxis50_g71004 + ( VertexPosOtherAxis82_g71004 * cos( Angle44_g71004 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g71004 ) * sin( Angle44_g71004 ) ) ) + Motion_20_Squash4418_g70929 );
				float3 temp_output_3474_0_g70929 = ( VertexPosition3588_g70929 - Mesh_PivotsOS2291_g70929 );
				float3 appendResult2043_g70929 = (float3(Motion_10_BendingX216_g70929 , 0.0 , Motion_10_BendingZ190_g70929));
				float3 Vertex_Motion_World1118_g70929 = ( ( temp_output_3474_0_g70929 + appendResult2043_g70929 ) + Motion_20_Squash4418_g70929 );
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch4976_g70929 = Vertex_Motion_World1118_g70929;
				#else
				float3 staticSwitch4976_g70929 = ( Vertex_Motion_Object833_g70929 + ( _VertexDataMode * 0.0 ) );
				#endif
				float4 temp_output_94_19_g70988 = TVE_VertexCoords;
				half2 UV97_g70988 = ( (temp_output_94_19_g70988).zw + ( (temp_output_94_19_g70988).xy * (ObjectPosition4223_g70929).xz ) );
				float temp_output_84_0_g70988 = _LayerVertexValue;
				float4 lerpResult109_g70988 = lerp( TVE_VertexParams , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_VertexTex, sampler_linear_repeat, UV97_g70988,temp_output_84_0_g70988, 0.0 ) , TVE_VertexUsage[(int)temp_output_84_0_g70988]);
				half4 Global_Object_Params4173_g70929 = lerpResult109_g70988;
				half Global_VertexSize174_g70929 = saturate( Global_Object_Params4173_g70929.w );
				float lerpResult346_g70929 = lerp( 1.0 , Global_VertexSize174_g70929 , _GlobalSize);
				float3 appendResult3480_g70929 = (float3(lerpResult346_g70929 , lerpResult346_g70929 , lerpResult346_g70929));
				half3 ObjectData20_g70964 = appendResult3480_g70929;
				half3 _Vector11 = half3(1,1,1);
				half3 WorldData19_g70964 = _Vector11;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g70964 = WorldData19_g70964;
				#else
				float3 staticSwitch14_g70964 = ObjectData20_g70964;
				#endif
				half3 Vertex_Size1741_g70929 = staticSwitch14_g70964;
				half3 _Vector5 = half3(1,1,1);
				float3 Vertex_SizeFade1740_g70929 = _Vector5;
				half3 Grass_Perspective2661_g70929 = half3(0,0,0);
				float3 lerpResult16_g70963 = lerp( VertexPosition3588_g70929 , ( ( staticSwitch4976_g70929 * Vertex_Size1741_g70929 * Vertex_SizeFade1740_g70929 ) + Mesh_PivotsOS2291_g70929 + Grass_Perspective2661_g70929 ) , TVE_Enabled);
				float3 Final_VertexPosition890_g70929 = ( lerpResult16_g70963 + _DisableSRPBatcher );
				
				float temp_output_7_0_g70945 = TVE_CameraFadeStart;
				float lerpResult4755_g70929 = lerp( 1.0 , saturate( ( ( distance( ase_worldPos , _WorldSpaceCameraPos ) - temp_output_7_0_g70945 ) / ( TVE_CameraFadeEnd - temp_output_7_0_g70945 ) ) ) , _FadeCameraValue);
				float vertexToFrag11_g70951 = lerpResult4755_g70929;
				o.ase_texcoord2.x = vertexToFrag11_g70951;
				o.ase_texcoord2.yzw = vertexToFrag3890_g70929;
				
				o.ase_texcoord3 = inputMesh.ase_texcoord;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue =  Final_VertexPosition890_g70929;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif

				inputMesh.normalOS =  inputMesh.normalOS ;

				float3 positionRWS = TransformObjectToWorld(inputMesh.positionOS);
				float3 normalWS = TransformObjectToWorldNormal(inputMesh.normalOS);
				float4 tangentWS = float4(TransformObjectToWorldDir(inputMesh.tangentOS.xyz), inputMesh.tangentOS.w);
				
				o.positionCS = TransformWorldToHClip(positionRWS);
				o.normalWS.xyz =  normalWS;
				o.tangentWS.xyzw =  tangentWS;
		
				return o;
			}

			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float3 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl Vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.positionOS = v.positionOS;
				o.normalOS = v.normalOS;
				o.tangentOS = v.tangentOS;
				o.ase_texcoord3 = v.ase_texcoord3;
				o.ase_color = v.ase_color;
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				float3 cameraPos = 0;
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), cameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, GetObjectToWorldMatrix(), cameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), cameraPos, _ScreenParams, _FrustumPlanes );
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
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput Vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			void Frag(	VertexOutput packedInput
						, out float4 outColor : SV_Target0	
						
					)
			{
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(packedInput);
				UNITY_SETUP_INSTANCE_ID(packedInput);
								
				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);
				input.tangentToWorld = k_identity3x3;
				input.positionSS = packedInput.positionCS;       
        
				input.tangentToWorld = BuildTangentToWorld(packedInput.tangentWS.xyzw, packedInput.normalWS.xyz);

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS);
				
				SurfaceDescription surfaceDescription = (SurfaceDescription)0;
				float localCustomAlphaClip9_g70962 = ( 0.0 );
				float vertexToFrag11_g70951 = packedInput.ase_texcoord2.x;
				half Fade_Camera_Mask5149_g70929 = 1.0;
				float lerpResult5141_g70929 = lerp( 1.0 , vertexToFrag11_g70951 , Fade_Camera_Mask5149_g70929);
				half Fade_Camera3743_g70929 = lerpResult5141_g70929;
				float temp_output_41_0_g70948 = ( 1.0 * Fade_Camera3743_g70929 );
				float3 vertexToFrag3890_g70929 = packedInput.ase_texcoord2.yzw;
				float3 WorldPosition3905_g70929 = vertexToFrag3890_g70929;
				half Final_AlphaFade3727_g70929 = saturate( ( temp_output_41_0_g70948 + ( temp_output_41_0_g70948 * tex3D( TVE_ScreenTex3D, ( TVE_ScreenTexCoord * WorldPosition3905_g70929 ) ).r ) ) );
				half2 Main_UVs15_g70929 = ( ( packedInput.ase_texcoord3.xy * (_MainUVs).xy ) + (_MainUVs).zw );
				float4 tex2DNode29_g70929 = tex2D( _MainAlbedoTex, Main_UVs15_g70929 );
				float Main_Alpha316_g70929 = ( _MainColor.a * tex2DNode29_g70929.a );
				half AlphaTreshold2132_g70929 = _AlphaClipValue;
				half Final_Alpha3754_g70929 = ( Main_Alpha316_g70929 - ( AlphaTreshold2132_g70929 - 0.5 ) );
				float temp_output_661_0_g70929 = ( Final_AlphaFade3727_g70929 * Final_Alpha3754_g70929 );
				float temp_output_3_0_g70949 = temp_output_661_0_g70929;
				half Offest27_g70949 = 0.5;
				half Feather30_g70949 = 0.5;
				float temp_output_3_0_g70962 = ( ( ( temp_output_3_0_g70949 - Offest27_g70949 ) / ( max( fwidth( temp_output_3_0_g70949 ) , 0.001 ) + Feather30_g70949 ) ) + Offest27_g70949 );
				float Alpha9_g70962 = temp_output_3_0_g70962;
				float temp_output_15_0_g70962 = 0.5;
				float Treshold9_g70962 = temp_output_15_0_g70962;
				{
				#if TVE_FEATURE_CLIP
				clip(Alpha9_g70962 - Treshold9_g70962);
				#endif
				}
				half Final_Clip914_g70929 = Alpha9_g70962;
				
				surfaceDescription.Alpha = Final_Clip914_g70929;
				surfaceDescription.AlphaClipThreshold =  _AlphaCutoff;
				

				float3 V = float3(1.0, 1.0, 1.0); 
			
				SurfaceData surfaceData;
				BuiltinData builtinData;
				GetSurfaceAndBuiltinData(surfaceDescription, input, V, posInput, surfaceData, builtinData);
				outColor = _SelectionID;
			}

            ENDHLSL
        }

        Pass
        {
            Name "FullScreenDebug"
            Tags
            {
                "LightMode" = "FullScreenDebug"
            }
            
            Cull [_CullMode]
			ZTest LEqual
			ZWrite Off
        
            HLSLPROGRAM
        
			/*ase_pragma_before*/
        
			#pragma vertex Vert
			#pragma fragment Frag
			
			// Keyword for transparent
			#pragma shader_feature _SURFACE_TYPE_TRANSPARENT
			#pragma shader_feature_local_fragment _ _ENABLE_FOG_ON_TRANSPARENT
			#pragma shader_feature_local _ _TRANSPARENT_WRITES_MOTION_VEC
            
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl" 
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl" 
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphHeader.hlsl" 
            
            #define ATTRIBUTES_NEED_NORMAL
            #define ATTRIBUTES_NEED_TANGENT
        
            #define SHADERPASS SHADERPASS_FULL_SCREEN_DEBUG
        
			#define _SPECULAR_OCCLUSION_FROM_AO 1
			#define _ENERGY_CONSERVING_SPECULAR 1
        
			#if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
				#define OUTPUT_SPLIT_LIGHTING
			#endif
        
			#define HAVE_RECURSIVE_RENDERING

            #if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
            #if !defined(_DISABLE_SSR_TRANSPARENT) && !defined(SHADER_UNLIT)
                #define WRITE_NORMAL_BUFFER
            #endif
            #endif
        
            #ifndef DEBUG_DISPLAY
                
                #if !defined(_SURFACE_TYPE_TRANSPARENT)
                    #if SHADERPASS == SHADERPASS_FORWARD
                    #define SHADERPASS_FORWARD_BYPASS_ALPHA_TEST
                    #elif SHADERPASS == SHADERPASS_GBUFFER
                    #define SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST
                    #endif
                #endif
            #endif
        
            #if defined(SHADER_LIT) && !defined(_SURFACE_TYPE_TRANSPARENT)
                #define _DEFERRED_CAPABLE_MATERIAL
            #endif
        
            #if defined(_TRANSPARENT_WRITES_MOTION_VEC) && defined(_SURFACE_TYPE_TRANSPARENT)
                #define _WRITE_TRANSPARENT_MOTION_VECTOR
            #endif
        
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"
        	
            struct AttributesMesh
			{
				 float3 positionOS : POSITION;
				 float3 normalOS : NORMAL;
				 float4 tangentOS : TANGENT;
				#if UNITY_ANY_INSTANCING_ENABLED
				 uint instanceID : INSTANCEID_SEMANTIC;
				#endif
			};

			struct VaryingsMeshToPS
			{
				SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
				#if UNITY_ANY_INSTANCING_ENABLED
				 uint instanceID : CUSTOM_INSTANCE_ID;
				#endif
			};

			struct VertexDescriptionInputs
			{
				 float3 ObjectSpaceNormal;
				 float3 ObjectSpaceTangent;
				 float3 ObjectSpacePosition;
			};

			struct SurfaceDescriptionInputs
			{
				 float3 TangentSpaceNormal;
			};

			struct PackedVaryingsMeshToPS
			{
				SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
				#if UNITY_ANY_INSTANCING_ENABLED
				 uint instanceID : CUSTOM_INSTANCE_ID;
				#endif
			};
        
            PackedVaryingsMeshToPS PackVaryingsMeshToPS (VaryingsMeshToPS input)
			{
				PackedVaryingsMeshToPS output;
				ZERO_INITIALIZE(PackedVaryingsMeshToPS, output);
				output.positionCS = input.positionCS;
				#if UNITY_ANY_INSTANCING_ENABLED
				output.instanceID = input.instanceID;
				#endif
				return output;
			}
        
			VaryingsMeshToPS UnpackVaryingsMeshToPS (PackedVaryingsMeshToPS input)
			{
				VaryingsMeshToPS output;
				output.positionCS = input.positionCS;
				#if UNITY_ANY_INSTANCING_ENABLED
				output.instanceID = input.instanceID;
				#endif
				return output;
			}
        
            struct VertexDescription
			{
				float3 Position;
				float3 Normal;
				float3 Tangent;
			};
        
			VertexDescription VertexDescriptionFunction(VertexDescriptionInputs IN)
			{
				VertexDescription description = (VertexDescription)0;
				description.Position = IN.ObjectSpacePosition;
				description.Normal = IN.ObjectSpaceNormal;
				description.Tangent = IN.ObjectSpaceTangent;
				return description;
			}
        
            struct SurfaceDescription
			{
				float3 BaseColor;
				float3 Emission;
				float Alpha;
				float3 BentNormal;
				float Smoothness;
				float Occlusion;
				float3 NormalTS;
				float Metallic;
			};
        
			SurfaceDescription SurfaceDescriptionFunction(SurfaceDescriptionInputs IN)
			{
				SurfaceDescription surface = (SurfaceDescription)0;
				surface.BaseColor = IsGammaSpace() ? float3(0.5, 0.5, 0.5) : SRGBToLinear(float3(0.5, 0.5, 0.5));
				surface.Emission = float3(0, 0, 0);
				surface.Alpha = 1;
				surface.BentNormal = IN.TangentSpaceNormal;
				surface.Smoothness = 0.5;
				surface.Occlusion = 1;
				surface.NormalTS = IN.TangentSpaceNormal;
				surface.Metallic = 0;
				return surface;
			}

			VertexDescriptionInputs AttributesMeshToVertexDescriptionInputs(AttributesMesh input)
			{
				VertexDescriptionInputs output;
				ZERO_INITIALIZE(VertexDescriptionInputs, output);
        
				output.ObjectSpaceNormal =                          input.normalOS;
				output.ObjectSpaceTangent =                         input.tangentOS.xyz;
				output.ObjectSpacePosition =                        input.positionOS;
        
				return output;
			}
        
			AttributesMesh ApplyMeshModification(AttributesMesh input, float3 timeParameters  )
			{
				VertexDescriptionInputs vertexDescriptionInputs = AttributesMeshToVertexDescriptionInputs(input);
           
				VertexDescription vertexDescription = VertexDescriptionFunction(vertexDescriptionInputs);

				input.positionOS = vertexDescription.Position;
				input.normalOS = vertexDescription.Normal;
				input.tangentOS.xyz = vertexDescription.Tangent;
				return input;
			}
        
			FragInputs BuildFragInputs(VaryingsMeshToPS input)
			{
				FragInputs output;
				ZERO_INITIALIZE(FragInputs, output);
        
				output.tangentToWorld = k_identity3x3;
				output.positionSS = input.positionCS;       
        
				return output;
			}
        
        
			FragInputs UnpackVaryingsMeshToFragInputs(PackedVaryingsMeshToPS input)
			{
				UNITY_SETUP_INSTANCE_ID(input);
				VaryingsMeshToPS unpacked = UnpackVaryingsMeshToPS(input);
				return BuildFragInputs(unpacked);
			}


            SurfaceDescriptionInputs FragInputsToSurfaceDescriptionInputs(FragInputs input, float3 viewWS)
			{
				SurfaceDescriptionInputs output;
				ZERO_INITIALIZE(SurfaceDescriptionInputs, output);
        
				#if defined(SHADER_STAGE_RAY_TRACING)
				#else
				#endif
				output.TangentSpaceNormal =                         float3(0.0f, 0.0f, 1.0f);        
				return output;
			}
        
			void BuildSurfaceData(FragInputs fragInputs, inout SurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData, out float3 bentNormalWS)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);
        
				surfaceData.specularOcclusion = 1.0;
        
				surfaceData.baseColor =                 surfaceDescription.BaseColor;
				surfaceData.perceptualSmoothness =      surfaceDescription.Smoothness;
				surfaceData.ambientOcclusion =          surfaceDescription.Occlusion;
				surfaceData.metallic =                  surfaceDescription.Metallic;
        
				#if defined(_REFRACTION_PLANE) || defined(_REFRACTION_SPHERE) || defined(_REFRACTION_THIN)
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
        
            
				surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;
				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
					surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
				#endif
        
				#ifdef _MATERIAL_FEATURE_TRANSMISSION
					surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
				#endif
        
				#ifdef _MATERIAL_FEATURE_ANISOTROPY
					surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;
        
                
					surfaceData.normalWS = float3(0, 1, 0);
				#endif
        
				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
					surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
				#endif
        
				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
					surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
				#endif
        
				#ifdef _MATERIAL_FEATURE_CLEAR_COAT
					surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
				#endif
        
				#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
                
                
					surfaceData.baseColor *= (1.0 - Max3(surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b));
				#endif
        
				#ifdef _DOUBLESIDED_ON
					float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
					float3 doubleSidedConstants = float3(1.0, 1.0, 1.0);
				#endif
        
            
				GetNormalWS(fragInputs, surfaceDescription.NormalTS, surfaceData.normalWS, doubleSidedConstants);
        
				surfaceData.geomNormalWS = fragInputs.tangentToWorld[2];
        
				surfaceData.tangentWS = normalize(fragInputs.tangentToWorld[0].xyz);    
        
        
				#if HAVE_DECALS
					if (_EnableDecals)
					{
						DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, surfaceDescription.Alpha);
						ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData);
					}
				#endif // DECAL_SURFACE_GRADIENT
        
				bentNormalWS = surfaceData.normalWS;
        
				surfaceData.tangentWS = Orthonormalize(surfaceData.tangentWS, surfaceData.normalWS);
        
				#ifdef DEBUG_DISPLAY
					if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
					{
                    
						surfaceData.metallic = 0;
					}
        
					ApplyDebugToSurfaceData(fragInputs.tangentToWorld, surfaceData);
				#endif
            
				#if defined(_SPECULAR_OCCLUSION_CUSTOM)
                
				#elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
                
					surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO(V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness(surfaceData.perceptualSmoothness));
				#elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
					surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion(ClampNdotV(dot(surfaceData.normalWS, V)), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness(surfaceData.perceptualSmoothness));
				#endif
        
				#if defined(_ENABLE_GEOMETRIC_SPECULAR_AA) && !defined(SHADER_STAGE_RAY_TRACING)
					surfaceData.perceptualSmoothness = GeometricNormalFiltering(surfaceData.perceptualSmoothness, fragInputs.tangentToWorld[2], surfaceDescription.SpecularAAScreenSpaceVariance, surfaceDescription.SpecularAAThreshold);
				#endif
			}
        
            void GetSurfaceAndBuiltinData(FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData RAY_TRACING_OPTIONAL_PARAMETERS)
            {
                
                #if !defined(SHADER_STAGE_RAY_TRACING) && !defined(_TESSELLATION_DISPLACEMENT)
                #ifdef LOD_FADE_CROSSFADE 
                LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
                #endif
                #endif
        
                #ifndef SHADER_UNLIT
                #ifdef _DOUBLESIDED_ON
                    float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
                #else
                    float3 doubleSidedConstants = float3(1.0, 1.0, 1.0);
                #endif
        
                ApplyDoubleSidedFlipOrMirror(fragInputs, doubleSidedConstants); 
                #endif 
        
                SurfaceDescriptionInputs surfaceDescriptionInputs = FragInputsToSurfaceDescriptionInputs(fragInputs, V);
        
                SurfaceDescription surfaceDescription = SurfaceDescriptionFunction(surfaceDescriptionInputs);

                #ifdef _ALPHATEST_ON
                    float alphaCutoff = surfaceDescription.AlphaClipThreshold;
                    #if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
                    
                    #elif SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_POSTPASS
                    
                    alphaCutoff = surfaceDescription.AlphaClipThresholdDepthPostpass;
                    #elif (SHADERPASS == SHADERPASS_SHADOWS) || (SHADERPASS == SHADERPASS_RAYTRACING_VISIBILITY)
                    
                    #endif
        
                    GENERIC_ALPHA_TEST(surfaceDescription.Alpha, alphaCutoff);
                #endif
        
                #if !defined(SHADER_STAGE_RAY_TRACING) && _DEPTHOFFSET_ON
                ApplyDepthOffsetPositionInput(V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput);
                #endif
        
                #ifndef SHADER_UNLIT
                float3 bentNormalWS;
                BuildSurfaceData(fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS);
        
                InitBuiltinData(posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[2], fragInputs.texCoord1, fragInputs.texCoord2, builtinData);
        
                #else
                BuildSurfaceData(fragInputs, surfaceDescription, V, posInput, surfaceData);
        
                ZERO_BUILTIN_INITIALIZE(builtinData); 
                builtinData.opacity = surfaceDescription.Alpha;
        
                #if defined(DEBUG_DISPLAY)
                    builtinData.renderingLayers = GetMeshRenderingLightLayer();
                #endif
        
                #endif 
        
                #ifdef _ALPHATEST_ON
                    
                    builtinData.alphaClipTreshold = alphaCutoff;
                #endif
        
        
                builtinData.emissiveColor = surfaceDescription.Emission;

                #if _DEPTHOFFSET_ON
                builtinData.depthOffset = surfaceDescription.DepthOffset;
                #endif
        
                
                #if (SHADERPASS == SHADERPASS_DISTORTION)
                builtinData.distortion = surfaceDescription.Distortion;
                builtinData.distortionBlur = surfaceDescription.DistortionBlur;
                #endif
        
                #ifndef SHADER_UNLIT
                
                PostInitBuiltinData(V, posInput, surfaceData, builtinData);
                #else
                ApplyDebugToBuiltinData(builtinData);
                #endif
        
            }
        
			#define DEBUG_DISPLAY
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/FullScreenDebug.hlsl"

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/VertMesh.hlsl"

			PackedVaryingsType Vert(AttributesMesh inputMesh)
			{
				VaryingsType varyingsType;
				varyingsType.vmesh = VertMesh(inputMesh);
				return PackVaryingsType(varyingsType);
			}

			#if !defined(_DEPTHOFFSET_ON)
			[earlydepthstencil] 
			#endif
			void Frag(PackedVaryingsToPS packedInput)
			{
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(packedInput);
				FragInputs input = UnpackVaryingsToFragInputs(packedInput);

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS.xyz);

			#ifdef PLATFORM_SUPPORTS_PRIMITIVE_ID_IN_PIXEL_SHADER
				if (_DebugFullScreenMode == FULLSCREENDEBUGMODE_QUAD_OVERDRAW)
				{
					IncrementQuadOverdrawCounter(posInput.positionSS.xy, input.primitiveID);
				}
			#endif
			}

            ENDHLSL
        }
		
	}
	
	CustomEditor "TVEShaderCoreGUI"
	
	Fallback "Hidden/BOXOPHOBIC/The Vegetation Engine/Fallback"
}
/*ASEBEGIN
Version=18934
1920;6;1920;1023;3091.704;706.52;1;True;False
Node;AmplifyShaderEditor.RangedFloatNode;17;-1600,-768;Half;False;Property;_render_zw;_render_zw;197;1;[HideInInspector];Create;True;0;2;Opaque;0;Transparent;1;0;True;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;7;-1792,-768;Half;False;Property;_render_dst;_render_dst;196;1;[HideInInspector];Create;True;0;2;Opaque;0;Transparent;1;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;384;-1536,-896;Inherit;False;Compile Core;-1;;71009;634b02fd1f32e6a4c875d8fc2c450956;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;134;-1984,-896;Half;False;Property;_IsStandardShader;_IsStandardShader;193;1;[HideInInspector];Create;True;0;0;0;True;0;False;1;1;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;307;-2176,384;Inherit;False;Define Shader Vegetation;-1;;71008;b458122dd75182d488380bd0f592b9e6;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;20;-1984,-768;Half;False;Property;_render_src;_render_src;195;1;[HideInInspector];Create;True;0;0;0;True;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;10;-2176,-768;Half;False;Property;_render_cull;_render_cull;194;1;[HideInInspector];Create;True;0;3;Both;0;Back;1;Front;2;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;383;-1344,-896;Inherit;False;Compile All Shaders;-1;;70928;e67c8238031dbf04ab79a5d4d63d1b4f;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;127;-2176,-896;Half;False;Property;_IsBarkShader;_IsBarkShader;192;1;[HideInInspector];Create;True;0;0;0;True;0;False;1;1;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;382;-1856,384;Inherit;False;Define Pipeline HD;-1;;70927;7af1bc24c286d754db63fb6a44aba77b;0;0;1;FLOAT;529
Node;AmplifyShaderEditor.FunctionNode;350;-2176,-384;Inherit;False;Base Shader;0;;70929;856f7164d1c579d43a5cf4968a75ca43;79,3880,1,4028,1,4029,1,3903,1,3900,1,4204,1,3904,1,3908,1,4172,1,1300,1,1298,1,4179,1,4995,1,3586,0,4499,1,1708,0,3658,0,3509,1,5151,1,3873,1,893,0,5196,0,5128,1,5156,1,1717,1,1715,1,1714,1,1718,1,5075,1,916,1,1763,0,1762,0,3568,1,5118,1,1776,0,3475,1,4210,1,1745,1,3479,0,3501,1,5152,1,1646,0,1271,1,3889,0,2807,0,3886,0,4999,0,3887,0,3957,1,2172,0,3883,0,3728,1,3949,0,5147,0,5146,1,2658,0,1742,0,3484,0,1736,1,4837,1,1735,1,1733,1,5079,1,1737,1,1734,1,878,0,1550,0,860,1,2261,1,2260,1,2054,1,2032,1,2039,0,2062,0,3243,0,5220,1,4217,1,5090,1,4242,0;5;5115;FLOAT;1;False;5127;FLOAT;1;False;5143;FLOAT;1;False;5119;FLOAT;1;False;5117;FLOAT;1;False;21;FLOAT3;0;FLOAT3;528;FLOAT3;2489;FLOAT;531;FLOAT;4842;FLOAT;529;FLOAT;3678;FLOAT;530;FLOAT;4122;FLOAT;4134;FLOAT;1235;FLOAT3;1230;FLOAT;1461;FLOAT;1290;FLOAT;721;FLOAT;532;FLOAT;629;FLOAT3;534;FLOAT;4867;FLOAT4;5246;FLOAT4;4841
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;379;-1376,-384;Float;False;False;-1;2;Rendering.HighDefinition.LitShaderGraphGUI;0;14;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;TransparentDepthPrepass;0;8;TransparentDepthPrepass;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;True;1;1;False;-1;0;False;-1;0;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;True;0;True;-25;False;False;False;False;False;False;False;False;False;True;True;0;False;-1;255;False;-1;255;False;-1;7;False;-1;3;False;-1;1;False;-1;1;False;-1;7;False;-1;3;False;-1;1;False;-1;1;False;-1;False;True;1;False;-1;False;False;True;1;LightMode=TransparentDepthPrepass;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;373;-1376,-384;Float;False;False;-1;2;Rendering.HighDefinition.LitShaderGraphGUI;0;14;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;ShadowCaster;0;2;ShadowCaster;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;0;True;-25;False;True;False;False;False;False;0;False;-1;False;False;False;False;False;False;False;False;False;True;1;False;-1;True;3;False;-1;False;True;1;LightMode=ShadowCaster;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;378;-1376,-384;Float;False;False;-1;2;Rendering.HighDefinition.LitShaderGraphGUI;0;14;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;TransparentBackface;0;7;TransparentBackface;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;True;1;0;True;-19;0;True;-20;1;0;True;-21;0;True;-22;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;True;0;True;-31;False;True;1;LightMode=TransparentBackface;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;385;-1376,-274;Float;False;False;-1;2;Rendering.HighDefinition.LightingShaderGraphGUI;0;1;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;ScenePickingPass;0;11;ScenePickingPass;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;0;True;-30;False;False;False;False;False;False;False;False;False;False;False;True;2;False;-1;True;3;False;-1;False;True;1;LightMode=Picking;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;372;-1376,-384;Float;False;False;-1;2;Rendering.HighDefinition.LitShaderGraphGUI;0;14;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;META;0;1;META;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;371;-1376,-384;Float;False;True;-1;2;TVEShaderCoreGUI;0;20;BOXOPHOBIC/The Vegetation Engine/Default/Bark Standard Lit;28cd5599e02859647ae1798e4fcaef6c;True;GBuffer;0;0;GBuffer;35;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;0;True;-30;False;False;False;False;False;False;False;False;True;True;True;0;True;-15;255;False;-1;255;True;-14;7;False;-1;3;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;True;False;True;0;True;-16;False;True;1;LightMode=GBuffer;False;False;0;Hidden/BOXOPHOBIC/The Vegetation Engine/Fallback;0;0;Standard;43;Surface Type;0;0;  Rendering Pass;1;0;  Refraction Model;0;0;    Blending Mode;0;0;    Blend Preserves Specular;1;0;  Receive Fog;1;0;  Back Then Front Rendering;0;0;  Transparent Depth Prepass;0;0;  Transparent Depth Postpass;0;0;  Transparent Writes Motion Vector;0;0;  Distortion;0;0;    Distortion Mode;0;0;    Distortion Depth Test;1;0;  ZWrite;0;0;  Z Test;4;0;Double-Sided;0;637921061174210627;Alpha Clipping;0;0;  Use Shadow Threshold;0;0;Material Type,InvertActionOnDeselection;4;0;  Energy Conserving Specular;1;0;  Transmission;1;0;Receive Decals;1;0;Receives SSR;1;0;Receive SSR Transparent;0;0;Motion Vectors;1;0;  Add Precomputed Velocity;0;0;Specular AA;0;0;Specular Occlusion Mode;0;0;Override Baked GI;0;0;Depth Offset;0;0;DOTS Instancing;1;0;GPU Instancing;1;0;LOD CrossFade;1;0;Tessellation;0;0;  Phong;0;0;  Strength;0.5,False,-1;0;  Type;0;0;  Tess;16,False,-1;0;  Min;10,False,-1;0;  Max;25,False,-1;0;  Edge Length;16,False,-1;0;  Max Displacement;25,False,-1;0;Vertex Position;0;0;0;12;True;True;True;True;True;True;False;False;False;False;True;True;False;;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;381;-1376,-384;Float;False;False;-1;2;Rendering.HighDefinition.LitShaderGraphGUI;0;14;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;Forward;0;10;Forward;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;True;1;0;True;-19;0;True;-20;1;0;True;-21;0;True;-22;False;False;False;False;False;False;False;False;False;False;False;False;True;0;True;-28;False;False;False;False;False;False;False;False;False;True;True;0;True;-4;255;False;-1;255;True;-5;7;False;-1;3;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;True;0;True;-23;True;0;True;-30;False;True;1;LightMode=Forward;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;374;-1376,-384;Float;False;False;-1;2;Rendering.HighDefinition.LitShaderGraphGUI;0;14;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;SceneSelectionPass;0;3;SceneSelectionPass;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=SceneSelectionPass;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;375;-1376,-384;Float;False;False;-1;2;Rendering.HighDefinition.LitShaderGraphGUI;0;14;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;DepthOnly;0;4;DepthOnly;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;0;True;-25;False;False;False;False;False;False;False;False;False;True;True;0;True;-6;255;False;-1;255;True;-7;7;False;-1;3;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;True;1;False;-1;False;False;True;1;LightMode=DepthOnly;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;377;-1376,-384;Float;False;False;-1;2;Rendering.HighDefinition.LitShaderGraphGUI;0;14;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;Distortion;0;6;Distortion;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;True;4;1;False;-1;1;False;-1;4;1;False;-1;1;False;-1;True;1;False;-1;1;False;-1;False;False;False;False;False;False;False;False;False;False;False;True;0;True;-30;False;False;False;False;False;False;False;False;False;True;True;0;True;-10;255;False;-1;255;True;-11;7;False;-1;3;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;True;2;False;-1;True;3;False;-1;False;True;1;LightMode=DistortionVectors;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;376;-1376,-384;Float;False;False;-1;2;Rendering.HighDefinition.LitShaderGraphGUI;0;14;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;Motion Vectors;0;5;Motion Vectors;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;0;True;-25;False;False;False;False;False;False;False;False;False;True;True;0;True;-8;255;False;-1;255;True;-9;7;False;-1;3;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;True;1;False;-1;False;False;True;1;LightMode=MotionVectors;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;380;-1376,-384;Float;False;False;-1;2;Rendering.HighDefinition.LitShaderGraphGUI;0;14;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;TransparentDepthPostpass;0;9;TransparentDepthPostpass;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;True;1;1;False;-1;0;False;-1;0;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;True;0;True;-25;False;True;False;False;False;False;0;False;-1;False;False;False;False;False;False;False;False;False;True;1;False;-1;False;False;True;1;LightMode=TransparentDepthPostpass;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.CommentaryNode;37;-2176,-1024;Inherit;False;1026.438;100;Internal;0;;1,0.252,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;285;-2176,256;Inherit;False;1026.438;100;Features;0;;0,1,0.5,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;33;-2176,-512;Inherit;False;1022.896;100;Final;0;;0,1,0.5,1;0;0
WireConnection;371;0;350;0
WireConnection;371;1;350;528
WireConnection;371;5;350;3678
WireConnection;371;6;350;2489
WireConnection;371;7;350;530
WireConnection;371;8;350;531
WireConnection;371;9;350;532
WireConnection;371;11;350;534
ASEEND*/
//CHKSM=E46F78CCDA92B36D6C13FF2DE4A577E558CC0EA6