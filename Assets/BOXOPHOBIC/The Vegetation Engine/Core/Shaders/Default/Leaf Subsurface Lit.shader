// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "BOXOPHOBIC/The Vegetation Engine/Default/Leaf Subsurface Lit"
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
		[Enum(Off,0,On,1)]_RenderDecals("Render Decals", Float) = 0
		[Enum(Off,0,On,1)]_RenderSSR("Render SSR", Float) = 0
		[Space(10)]_RenderDirect("Render Direct", Range( 0 , 1)) = 1
		_RenderShadow("Render Shadow", Range( 0 , 1)) = 1
		_RenderAmbient("Render Ambient", Range( 0 , 1)) = 1
		[Enum(Off,0,On,1)][Space(10)]_RenderClip("Alpha Clipping", Float) = 1
		[Enum(Off,0,On,1)]_RenderCoverage("Alpha To Mask", Float) = 0
		_AlphaClipValue("Alpha Treshold", Range( 0 , 1)) = 0.5
		[StyledSpace(10)]_SpaceRenderFade("# Space Render Fade", Float) = 0
		_FadeGlancingValue("Fade by Glancing Angle", Range( 0 , 1)) = 0
		_FadeCameraValue("Fade by Camera Distance", Range( 0 , 1)) = 1
		[StyledCategory(Global Settings)]_CategoryGlobal("[ Category Global ]", Float) = 0
		[StyledEnum(TVELayers, Default 0 Layer_1 1 Layer_2 2 Layer_3 3 Layer_4 4 Layer_5 5 Layer_6 6 Layer_7 7 Layer_8 8, 0, 0)]_LayerColorsValue("Layer Colors", Float) = 0
		[StyledEnum(TVELayers, Default 0 Layer_1 1 Layer_2 2 Layer_3 3 Layer_4 4 Layer_5 5 Layer_6 6 Layer_7 7 Layer_8 8, 0, 0)]_LayerExtrasValue("Layer Extras", Float) = 0
		[StyledEnum(TVELayers, Default 0 Layer_1 1 Layer_2 2 Layer_3 3 Layer_4 4 Layer_5 5 Layer_6 6 Layer_7 7 Layer_8 8, 0, 0)]_LayerMotionValue("Layer Motion", Float) = 0
		[StyledEnum(TVELayers, Default 0 Layer_1 1 Layer_2 2 Layer_3 3 Layer_4 4 Layer_5 5 Layer_6 6 Layer_7 7 Layer_8 8, 0, 0)]_LayerVertexValue("Layer Vertex", Float) = 0
		[StyledSpace(10)]_SpaceGlobalLayers("# Space Global Layers", Float) = 0
		[StyledMessage(Info, Procedural Variation in use. The Variation might not work as expected when switching from one LOD to another., _VertexVariationMode, 1 , 0, 10)]_MessageGlobalsVariation("# Message Globals Variation", Float) = 0
		_GlobalColors("Global Color", Range( 0 , 1)) = 1
		_GlobalAlpha("Global Alpha", Range( 0 , 1)) = 1
		_GlobalOverlay("Global Overlay", Range( 0 , 1)) = 1
		_GlobalWetness("Global Wetness", Range( 0 , 1)) = 1
		_GlobalEmissive("Global Emissive", Range( 0 , 1)) = 1
		_GlobalSize("Global Size Fade", Range( 0 , 1)) = 1
		[StyledSpace(10)]_SpaceGlobalLocals("# Space Global Locals", Float) = 0
		[StyledRemapSlider(_ColorsMaskMinValue, _ColorsMaskMaxValue, 0, 1)]_ColorsMaskRemap("Color Mask", Vector) = (0,0,0,0)
		[HideInInspector]_ColorsMaskMinValue("Color Mask Min Value", Range( 0 , 1)) = 0
		[HideInInspector]_ColorsMaskMaxValue("Color Mask Max Value", Range( 0 , 1)) = 0
		_ColorsVariationValue("Color Variation", Range( 0 , 1)) = 0
		[StyledRemapSlider(_AlphaMaskMinValue, _AlphaMaskMaxValue, 0, 1, 10, 0)]_AlphaMaskRemap("Alpha Mask", Vector) = (0,0,0,0)
		_AlphaVariationValue("Alpha Variation", Range( 0 , 1)) = 0
		[StyledRemapSlider(_OverlayMaskMinValue, _OverlayMaskMaxValue, 0, 1)]_OverlayMaskRemap("Overlay Mask", Vector) = (0,0,0,0)
		[HideInInspector]_OverlayMaskMinValue("Overlay Mask Min Value", Range( 0 , 1)) = 0.45
		[HideInInspector]_OverlayMaskMaxValue("Overlay Mask Max Value", Range( 0 , 1)) = 0.55
		_OverlayVariationValue("Overlay Variation", Range( 0 , 1)) = 0
		[StyledSpace(10)]_SpaceGlobalPosition("# Space Global Position", Float) = 0
		[StyledToggle]_ColorsPositionMode("Use Pivot Position for Colors", Float) = 0
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
		[StyledRemapSlider(_DetailBlendMinValue, _DetailBlendMaxValue,0,1)]_DetailBlendRemap("Detail Blending", Vector) = (0,0,0,0)
		[StyledCategory(Occlusion Settings)]_CategoryOcclusion("[ Category Occlusion ]", Float) = 0
		[HDR]_VertexOcclusionColor("Vertex Occlusion Color", Color) = (1,1,1,1)
		[StyledRemapSlider(_VertexOcclusionMinValue, _VertexOcclusionMaxValue, 0, 1)]_VertexOcclusionRemap("Vertex Occlusion Mask", Vector) = (0,0,0,0)
		[HideInInspector]_VertexOcclusionMinValue("Vertex Occlusion Min Value", Range( 0 , 1)) = 0
		[HideInInspector]_VertexOcclusionMaxValue("Vertex Occlusion Max Value", Range( 0 , 1)) = 1
		[StyledCategory(Subsurface Settings)]_CategorySubsurface("[ Category Subsurface ]", Float) = 0
		_SubsurfaceValue("Subsurface Intensity", Range( 0 , 1)) = 1
		[HDR]_SubsurfaceColor("Subsurface Color", Color) = (0.4,0.4,0.1,1)
		[StyledRemapSlider(_SubsurfaceMaskMinValue, _SubsurfaceMaskMaxValue,0,1)]_SubsurfaceMaskRemap("Subsurface Mask", Vector) = (0,0,0,0)
		[HideInInspector]_SubsurfaceMaskMinValue("Subsurface Mask Min Value", Range( 0 , 1)) = 0
		[HideInInspector]_SubsurfaceMaskMaxValue("Subsurface Mask Max Value", Range( 0 , 1)) = 1
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
		[HDR]_GradientColorOne("Gradient Color One", Color) = (1,1,1,1)
		[HDR]_GradientColorTwo("Gradient Color Two", Color) = (1,1,1,1)
		[StyledRemapSlider(_GradientMinValue, _GradientMaxValue, 0, 1)]_GradientMaskRemap("Gradient Mask", Vector) = (0,0,0,0)
		[HideInInspector]_GradientMinValue("Gradient Mask Min", Range( 0 , 1)) = 0
		[HideInInspector]_GradientMaxValue("Gradient Mask Max ", Range( 0 , 1)) = 1
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
		_MotionNormalValue("Motion Normal Direction", Range( 0 , 1)) = 1
		[StyledSpace(10)]_SpaceMotionGlobals("# SpaceMotionGlobals", Float) = 0
		_MotionAmplitude_10("Bending Amplitude", Range( 0 , 2)) = 0.2
		[IntRange]_MotionSpeed_10("Bending Speed", Range( 0 , 40)) = 2
		_MotionScale_10("Bending Scale", Range( 0 , 20)) = 0
		_MotionVariation_10("Bending Variation", Range( 0 , 20)) = 0
		[Space(10)]_MotionAmplitude_20("Squash Amplitude", Range( 0 , 2)) = 0.2
		[IntRange]_MotionSpeed_20("Squash Speed", Range( 0 , 40)) = 6
		_MotionScale_20("Squash Scale", Range( 0 , 20)) = 0.5
		_MotionVariation_20("Squash Variation", Range( 0 , 20)) = 0
		[Space(10)]_MotionAmplitude_32("Flutter Amplitude", Range( 0 , 2)) = 0.2
		[IntRange]_MotionSpeed_32("Flutter Speed", Range( 0 , 40)) = 20
		_MotionScale_32("Flutter Scale", Range( 0 , 20)) = 10
		_MotionVariation_32("Flutter Variation", Range( 0 , 20)) = 10
		[Space(10)]_InteractionAmplitude("Interaction Amplitude", Range( 0 , 2)) = 1
		_InteractionMaskValue("Interaction Use Mask", Range( 0 , 1)) = 1
		[StyledSpace(10)]_SpaceMotionLocals("# SpaceMotionLocals", Float) = 0
		[StyledToggle]_MotionValue_20("Use Squash Motion Settings", Float) = 1
		[ASEEnd][StyledToggle]_MotionValue_30("Use Flutter Motion Settings", Float) = 1
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
		[HideInInspector]_subsurface_shadow("_subsurface_shadow", Float) = 1
		[HideInInspector]_IsLeafShader("_IsLeafShader", Float) = 1
		[HideInInspector]_IsSubsurfaceShader("_IsSubsurfaceShader", Float) = 1
		[HideInInspector]_render_cull("_render_cull", Float) = 0
		[HideInInspector]_render_src("_render_src", Float) = 5
		[HideInInspector]_render_dst("_render_dst", Float) = 10
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

			#define _MATERIAL_FEATURE_TRANSMISSION 1
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
			half4 _MainColor;
			half4 _ColorsMaskRemap;
			half4 _SubsurfaceMaskRemap;
			half4 _VertexOcclusionRemap;
			float4 _GradientMaskRemap;
			float4 _SubsurfaceDiffusion_asset;
			float4 _MaxBoundsInfo;
			float4 _SubsurfaceDiffusion_Asset;
			float4 _Color;
			half4 _GradientColorTwo;
			half4 _GradientColorOne;
			half4 _MainUVs;
			half4 _OverlayMaskRemap;
			half4 _SubsurfaceColor;
			half4 _VertexOcclusionColor;
			half4 _AlphaMaskRemap;
			float4 _EmissiveIntensityParams;
			half4 _EmissiveColor;
			half4 _EmissiveUVs;
			float4 _NoiseMaskRemap;
			half4 _DetailBlendRemap;
			half3 _render_normals;
			half _VertexOcclusionMinValue;
			float _MotionScale_32;
			half _MotionFacingValue;
			half _MotionValue_20;
			half _EmissiveExposureValue;
			half _MotionAmplitude_20;
			half _GlobalEmissive;
			half _MainSmoothnessValue;
			half _GlobalWetness;
			half _MotionSpeed_20;
			half _MotionVariation_20;
			half _MotionScale_20;
			half _InteractionMaskValue;
			half _InteractionAmplitude;
			half _VertexDynamicMode;
			half _MainOcclusionValue;
			half _MotionVariation_10;
			float _MotionSpeed_10;
			half _FadeGlancingValue;
			float _MotionScale_10;
			half _FadeCameraValue;
			half _MotionAmplitude_10;
			half _LayerMotionValue;
			float _MotionVariation_32;
			float _MotionSpeed_32;
			half _MotionNormalValue;
			half _MotionValue_30;
			half _MainNormalValue;
			half _OverlayMaskMaxValue;
			half _OverlayMaskMinValue;
			half _OverlayVariationValue;
			half _LayerExtrasValue;
			half _ExtrasPositionMode;
			half _GlobalOverlay;
			half _SubsurfaceMaskMaxValue;
			half _SubsurfaceMaskMinValue;
			half _SubsurfaceValue;
			half _ColorsMaskMaxValue;
			half _ColorsMaskMinValue;
			half _ColorsVariationValue;
			half _GlobalColors;
			half _LayerColorsValue;
			half _ColorsPositionMode;
			half _VertexPivotMode;
			half _GradientMaxValue;
			half _GradientMinValue;
			half _GlobalSize;
			half _LayerVertexValue;
			half _VertexDataMode;
			half _VertexOcclusionMaxValue;
			half _MotionAmplitude_32;
			half _render_cull;
			half _RenderSSR;
			half _RenderDirect;
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
			half _CategorySubsurface;
			half _SubsurfaceNormalValue;
			half _SpaceMotionGlobals;
			half _SubsurfaceShadowValue;
			half _RenderCoverage;
			half _RenderPriority;
			float _SubsurfaceDiffusion;
			half _VertexRollingMode;
			half _Cutoff;
			half _SubsurfaceScatteringValue;
			half _render_dst;
			half _IsSubsurfaceShader;
			half _render_zw;
			half _render_src;
			half _IsLeafShader;
			half _EmissiveFlagMode;
			half _subsurface_shadow;
			half _RenderClip;
			half _MessageMotionVariation;
			half _CategoryRender;
			half _SpaceGlobalPosition;
			half _AlphaVariationValue;
			half _RenderCull;
			half _SubsurfaceDirectValue;
			half _RenderZWrite;
			half _SubsurfaceAmbientValue;
			half _RenderQueue;
			half _SubsurfaceAngleValue;
			half _AlphaClipValue;
			half _VertexMasksMode;
			half _LayerReactValue;
			half _DetailBlendMode;
			half _MessageGlobalsVariation;
			half _VertexVariationMode;
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
			half _RenderDecals;
			half _GlobalAlpha;
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
			half4 TVE_FlutterParams;
			half TVE_MotionFadeEnd;
			half TVE_MotionFadeStart;
			half4 TVE_VertexParams;
			TEXTURE2D_ARRAY(TVE_VertexTex);
			half4 TVE_VertexCoords;
			float TVE_VertexUsage[10];
			half _DisableSRPBatcher;
			sampler2D _MainAlbedoTex;
			half4 TVE_ColorsParams;
			TEXTURE2D_ARRAY(TVE_ColorsTex);
			half4 TVE_ColorsCoords;
			float TVE_ColorsUsage[10];
			sampler2D _MainMaskTex;
			half TVE_SubsurfaceValue;
			half3 TVE_MainLightDirection;
			half4 TVE_OverlayColor;
			half4 TVE_ExtrasParams;
			TEXTURE2D_ARRAY(TVE_ExtrasTex);
			half4 TVE_ExtrasCoords;
			float TVE_ExtrasUsage[10];
			sampler2D _MainNormalTex;
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
			#define ASE_NEEDS_FRAG_WORLD_VIEW_DIR
			#define ASE_NEEDS_FRAG_VFACE
			#define ASE_NEEDS_FRAG_RELATIVE_WORLD_POS
			#pragma shader_feature_local TVE_FEATURE_CLIP
			#pragma shader_feature_local TVE_FEATURE_BATCHING
			//TVE Pipeline Defines
			#define THE_VEGETATION_ENGINE
			#define TVE_IS_HD_PIPELINE
			//TVE HD Pipeline Defines
			#pragma shader_feature_local _DISABLE_DECALS
			#pragma shader_feature_local _DISABLE_SSR
			//TVE Shader Type Defines
			#define TVE_IS_VEGETATION_SHADER
			//TVE Injection Defines
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END


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
				float4 ase_color : COLOR;
				float4 ase_texcoord8 : TEXCOORD8;
				float3 ase_normal : NORMAL;
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

				float3 VertexPosition3588_g70845 = inputMesh.positionOS;
				half3 Mesh_PivotsOS2291_g70845 = half3(0,0,0);
				float3 temp_output_2283_0_g70845 = ( VertexPosition3588_g70845 - Mesh_PivotsOS2291_g70845 );
				half3 VertexPos40_g70921 = temp_output_2283_0_g70845;
				float3 appendResult74_g70921 = (float3(VertexPos40_g70921.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g70921 = appendResult74_g70921;
				float3 break84_g70921 = VertexPos40_g70921;
				float3 appendResult81_g70921 = (float3(0.0 , break84_g70921.y , break84_g70921.z));
				half3 VertexPosOtherAxis82_g70921 = appendResult81_g70921;
				float4 temp_output_91_19_g70881 = TVE_MotionCoords;
				float3 localObjectPosition_UNITY_MATRIX_M14_g70912 = ObjectPosition_UNITY_MATRIX_M();
				float3 appendResult60_g70870 = (float3(inputMesh.ase_texcoord3.x , inputMesh.ase_texcoord3.z , inputMesh.ase_texcoord3.y));
				half3 Mesh_PivotsData2831_g70845 = ( appendResult60_g70870 * _VertexPivotMode );
				float3 temp_output_122_0_g70912 = Mesh_PivotsData2831_g70845;
				float3 PivotsOnly105_g70912 = (mul( GetObjectToWorldMatrix(), float4( temp_output_122_0_g70912 , 0.0 ) ).xyz).xyz;
				#ifdef SHADEROPTIONS_CAMERA_RELATIVE_RENDERING
				float3 staticSwitch13_g70912 = ( ( localObjectPosition_UNITY_MATRIX_M14_g70912 + PivotsOnly105_g70912 ) + _WorldSpaceCameraPos );
				#else
				float3 staticSwitch13_g70912 = ( localObjectPosition_UNITY_MATRIX_M14_g70912 + PivotsOnly105_g70912 );
				#endif
				half3 ObjectData20_g70913 = staticSwitch13_g70912;
				float3 ase_worldPos = GetAbsolutePositionWS( TransformObjectToWorld( (inputMesh.positionOS).xyz ) );
				half3 WorldData19_g70913 = ase_worldPos;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g70913 = WorldData19_g70913;
				#else
				float3 staticSwitch14_g70913 = ObjectData20_g70913;
				#endif
				float3 temp_output_114_0_g70912 = staticSwitch14_g70913;
				float3 vertexToFrag4224_g70845 = temp_output_114_0_g70912;
				half3 ObjectData20_g70886 = vertexToFrag4224_g70845;
				float3 vertexToFrag3890_g70845 = ase_worldPos;
				half3 WorldData19_g70886 = vertexToFrag3890_g70845;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g70886 = WorldData19_g70886;
				#else
				float3 staticSwitch14_g70886 = ObjectData20_g70886;
				#endif
				float3 ObjectPosition4223_g70845 = staticSwitch14_g70886;
				half2 UV94_g70881 = ( (temp_output_91_19_g70881).zw + ( (temp_output_91_19_g70881).xy * (ObjectPosition4223_g70845).xz ) );
				float temp_output_84_0_g70881 = _LayerMotionValue;
				float4 lerpResult107_g70881 = lerp( TVE_MotionParams , saturate( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_MotionTex, sampler_linear_repeat, UV94_g70881,temp_output_84_0_g70881, 0.0 ) ) , TVE_MotionUsage[(int)temp_output_84_0_g70881]);
				half4 Global_Motion_Params3909_g70845 = lerpResult107_g70881;
				float4 break322_g70888 = Global_Motion_Params3909_g70845;
				float3 appendResult397_g70888 = (float3(break322_g70888.x , 0.0 , break322_g70888.y));
				float3 temp_output_398_0_g70888 = (appendResult397_g70888*2.0 + -1.0);
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				half2 Global_MotionDirectionOS39_g70845 = (( mul( GetWorldToObjectMatrix(), float4( temp_output_398_0_g70888 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_DirectionOS358_g70917 = Global_MotionDirectionOS39_g70845;
				half Mesh_Height1524_g70845 = inputMesh.ase_color.a;
				half Mesh_Height114_g70872 = Mesh_Height1524_g70845;
				half ObjectData20_g70873 = ( Mesh_Height114_g70872 * 2.0 );
				float enc62_g70871 = inputMesh.ase_texcoord.w;
				float2 localDecodeFloatToVector262_g70871 = DecodeFloatToVector2( enc62_g70871 );
				float2 break63_g70871 = ( localDecodeFloatToVector262_g70871 * 100.0 );
				float Bounds_Height5230_g70845 = break63_g70871.x;
				float Bounds_Height117_g70872 = Bounds_Height5230_g70845;
				half WorldData19_g70873 = ( ( Mesh_Height114_g70872 * Mesh_Height114_g70872 ) * Bounds_Height117_g70872 * 2.0 );
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g70873 = WorldData19_g70873;
				#else
				float staticSwitch14_g70873 = ObjectData20_g70873;
				#endif
				half Motion_10_Mask5242_g70845 = staticSwitch14_g70873;
				half Wind_Power369_g70888 = break322_g70888.z;
				half Global_MotionPower2223_g70845 = Wind_Power369_g70888;
				half3 Input_Position419_g70891 = -ObjectPosition4223_g70845;
				half2 Global_MotionDirectionWS4683_g70845 = (temp_output_398_0_g70888).xz;
				half2 Input_DirectionWS423_g70891 = Global_MotionDirectionWS4683_g70845;
				float Motion_Scale287_g70891 = ( _MotionScale_10 + 0.2 );
				half Global_Scale448_g70891 = TVE_NoiseParams.x;
				half Input_Speed62_g70891 = _MotionSpeed_10;
				half Global_Speed449_g70891 = TVE_NoiseParams.y;
				float mulTime426_g70891 = _TimeParameters.x * ( Input_Speed62_g70891 * Global_Speed449_g70891 );
				half Global_DistScale561_g70891 = TVE_NoiseParams.w;
				float3 break461_g70891 = ( Input_Position419_g70891 * Global_DistScale561_g70891 );
				half Global_DistAmplitude559_g70891 = TVE_NoiseParams.z;
				float Noise_Distortion469_g70891 = ( sin( ( break461_g70891.x + break461_g70891.z ) ) * Global_DistAmplitude559_g70891 );
				float3 break111_g70874 = ObjectPosition4223_g70845;
				half Global_DynamicMode5112_g70845 = _VertexDynamicMode;
				half Input_DynamicMode120_g70874 = Global_DynamicMode5112_g70845;
				float Mesh_Variation16_g70845 = inputMesh.ase_color.r;
				half Input_Variation124_g70874 = Mesh_Variation16_g70845;
				half ObjectData20_g70875 = frac( ( ( ( break111_g70874.x + break111_g70874.y + break111_g70874.z ) * ( 1.0 - Input_DynamicMode120_g70874 ) ) + Input_Variation124_g70874 ) );
				half WorldData19_g70875 = Input_Variation124_g70874;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g70875 = WorldData19_g70875;
				#else
				float staticSwitch14_g70875 = ObjectData20_g70875;
				#endif
				float clampResult129_g70874 = clamp( staticSwitch14_g70875 , 0.01 , 0.99 );
				half Global_MeshVariation5104_g70845 = clampResult129_g70874;
				half Motion_Variation284_g70891 = ( _MotionVariation_10 * Global_MeshVariation5104_g70845 );
				float2 temp_output_425_0_g70891 = ( ( (Input_Position419_g70891).xz * Input_DirectionWS423_g70891 * Motion_Scale287_g70891 * Global_Scale448_g70891 ) + ( mulTime426_g70891 + Noise_Distortion469_g70891 + Motion_Variation284_g70891 ) );
				float2 break500_g70891 = ( temp_output_425_0_g70891 * 0.1178 );
				float2 break494_g70891 = ( temp_output_425_0_g70891 * 0.1742 );
				half Input_WindPower327_g70891 = Global_MotionPower2223_g70845;
				float lerpResult430_g70891 = lerp( 1.4 , 0.4 , Input_WindPower327_g70891);
				half Global_MotionNoise34_g70845 = (pow( (( sin( ( break500_g70891.x + break500_g70891.y ) ) * sin( ( break494_g70891.x + break494_g70891.y ) ) )*0.4 + 0.6) , lerpResult430_g70891 )*1.2 + -0.2);
				half Motion_10_Amplitude2258_g70845 = ( _MotionAmplitude_10 * Motion_10_Mask5242_g70845 * Global_MotionPower2223_g70845 * Global_MotionNoise34_g70845 );
				half Input_BendingAmplitude376_g70917 = Motion_10_Amplitude2258_g70845;
				half Input_InteractionAmplitude58_g70917 = _InteractionAmplitude;
				half Input_MeshMotion_10321_g70917 = Motion_10_Mask5242_g70845;
				half Input_InteractionUseMask62_g70917 = _InteractionMaskValue;
				float lerpResult371_g70917 = lerp( 2.0 , Input_MeshMotion_10321_g70917 , Input_InteractionUseMask62_g70917);
				half ObjectData20_g70918 = lerpResult371_g70917;
				half WorldData19_g70918 = Input_MeshMotion_10321_g70917;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g70918 = WorldData19_g70918;
				#else
				float staticSwitch14_g70918 = ObjectData20_g70918;
				#endif
				half Motion_10_Interaction373_g70917 = ( Input_InteractionAmplitude58_g70917 * staticSwitch14_g70918 );
				half Global_InteractionMask66_g70845 = ( break322_g70888.w * break322_g70888.w );
				float Input_InteractionMask330_g70917 = Global_InteractionMask66_g70845;
				float lerpResult360_g70917 = lerp( Input_BendingAmplitude376_g70917 , Motion_10_Interaction373_g70917 , saturate( ( Input_InteractionAmplitude58_g70917 * Input_InteractionMask330_g70917 ) ));
				float2 break364_g70917 = ( Input_DirectionOS358_g70917 * lerpResult360_g70917 );
				half Motion_10_BendingZ190_g70845 = break364_g70917.y;
				half Angle44_g70921 = Motion_10_BendingZ190_g70845;
				half3 VertexPos40_g70920 = ( VertexPosRotationAxis50_g70921 + ( VertexPosOtherAxis82_g70921 * cos( Angle44_g70921 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g70921 ) * sin( Angle44_g70921 ) ) );
				float3 appendResult74_g70920 = (float3(0.0 , 0.0 , VertexPos40_g70920.z));
				half3 VertexPosRotationAxis50_g70920 = appendResult74_g70920;
				float3 break84_g70920 = VertexPos40_g70920;
				float3 appendResult81_g70920 = (float3(break84_g70920.x , break84_g70920.y , 0.0));
				half3 VertexPosOtherAxis82_g70920 = appendResult81_g70920;
				half Motion_10_BendingX216_g70845 = break364_g70917.x;
				half Angle44_g70920 = -Motion_10_BendingX216_g70845;
				half Input_Scale321_g70860 = _MotionScale_20;
				half Input_Variation330_g70860 = ( _MotionVariation_20 * Global_MeshVariation5104_g70845 );
				half Input_Speed62_g70860 = _MotionSpeed_20;
				float mulTime349_g70860 = _TimeParameters.x * Input_Speed62_g70860;
				float temp_output_302_0_g70860 = sin( ( ( ( ase_worldPos.x + ase_worldPos.y + ase_worldPos.z ) * Input_Scale321_g70860 ) + Input_Variation330_g70860 + mulTime349_g70860 ) );
				float enc59_g70871 = inputMesh.ase_texcoord.z;
				float2 localDecodeFloatToVector259_g70871 = DecodeFloatToVector2( enc59_g70871 );
				float2 break61_g70871 = localDecodeFloatToVector259_g70871;
				half Mesh_Motion_2060_g70845 = break61_g70871.x;
				half Mesh_Motion_20115_g70872 = Mesh_Motion_2060_g70845;
				float Bounds_Radius5231_g70845 = break63_g70871.y;
				float Bounds_Radius118_g70872 = Bounds_Radius5231_g70845;
				half Motion_20_Mask5243_g70845 = ( Mesh_Motion_20115_g70872 * Bounds_Radius118_g70872 );
				half3 Input_Position419_g70876 = VertexPosition3588_g70845;
				float3 normalizeResult518_g70876 = normalize( Input_Position419_g70876 );
				half2 Input_DirectionOS423_g70876 = Global_MotionDirectionOS39_g70845;
				float2 break521_g70876 = -Input_DirectionOS423_g70876;
				float3 appendResult522_g70876 = (float3(break521_g70876.x , 0.0 , break521_g70876.y));
				float dotResult519_g70876 = dot( normalizeResult518_g70876 , appendResult522_g70876 );
				half Input_Mask62_g70876 = _MotionFacingValue;
				float lerpResult524_g70876 = lerp( 1.0 , (dotResult519_g70876*0.5 + 0.5) , Input_Mask62_g70876);
				half ObjectData20_g70877 = lerpResult524_g70876;
				half WorldData19_g70877 = 1.0;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g70877 = WorldData19_g70877;
				#else
				float staticSwitch14_g70877 = ObjectData20_g70877;
				#endif
				half Motion_FacingMask5214_g70845 = staticSwitch14_g70877;
				half Motion_20_Amplitude4381_g70845 = ( _MotionAmplitude_20 * _MotionValue_20 * Motion_20_Mask5243_g70845 * Global_MotionPower2223_g70845 * Global_MotionNoise34_g70845 * Motion_FacingMask5214_g70845 );
				half Input_Amplitude58_g70860 = Motion_20_Amplitude4381_g70845;
				half2 Input_DirectionOS366_g70860 = Global_MotionDirectionOS39_g70845;
				float2 break371_g70860 = Input_DirectionOS366_g70860;
				float3 appendResult372_g70860 = (float3(break371_g70860.x , ( temp_output_302_0_g70860 * 0.1 ) , break371_g70860.y));
				half3 Motion_20_Squash4418_g70845 = ( ( (temp_output_302_0_g70860*0.2 + 1.0) * Input_Amplitude58_g70860 ) * appendResult372_g70860 );
				half Motion_Scale321_g70908 = _MotionScale_32;
				half Motion_Variation330_g70908 = ( _MotionVariation_32 * Global_MeshVariation5104_g70845 );
				half Input_Speed62_g70908 = _MotionSpeed_32;
				half Global_Speed350_g70908 = TVE_FlutterParams.y;
				float mulTime349_g70908 = _TimeParameters.x * ( Input_Speed62_g70908 * Global_Speed350_g70908 );
				half Mesh_Motion_30144_g70845 = break61_g70871.y;
				half Mesh_Motion_30116_g70872 = Mesh_Motion_30144_g70845;
				half Motion_30_Mask5244_g70845 = ( Mesh_Motion_30116_g70872 * 0.4 );
				float temp_output_7_0_g70869 = TVE_MotionFadeEnd;
				half Motion_FadeOut4005_g70845 = saturate( ( ( distance( ase_worldPos , _WorldSpaceCameraPos ) - temp_output_7_0_g70869 ) / ( TVE_MotionFadeStart - temp_output_7_0_g70869 ) ) );
				half Motion_30_Amplitude4960_g70845 = ( _MotionAmplitude_32 * _MotionValue_30 * Motion_30_Mask5244_g70845 * Global_MotionPower2223_g70845 * Global_MotionNoise34_g70845 * Motion_FacingMask5214_g70845 * Motion_FadeOut4005_g70845 );
				half Input_Amplitude58_g70908 = Motion_30_Amplitude4960_g70845;
				half Global_Power354_g70908 = TVE_FlutterParams.x;
				half Motion_Normal364_g70908 = _MotionNormalValue;
				float3 lerpResult370_g70908 = lerp( float3( 1,1,1 ) , inputMesh.normalOS , Motion_Normal364_g70908);
				half3 Motion_30_Details263_g70845 = ( ( sin( ( ( ( ase_worldPos.x + ase_worldPos.y + ase_worldPos.z ) * Motion_Scale321_g70908 ) + Motion_Variation330_g70908 + mulTime349_g70908 ) ) * Input_Amplitude58_g70908 * Global_Power354_g70908 ) * lerpResult370_g70908 );
				float3 Vertex_Motion_Object833_g70845 = ( ( ( VertexPosRotationAxis50_g70920 + ( VertexPosOtherAxis82_g70920 * cos( Angle44_g70920 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g70920 ) * sin( Angle44_g70920 ) ) ) + Motion_20_Squash4418_g70845 ) + Motion_30_Details263_g70845 );
				float3 temp_output_3474_0_g70845 = ( VertexPosition3588_g70845 - Mesh_PivotsOS2291_g70845 );
				float3 appendResult2043_g70845 = (float3(Motion_10_BendingX216_g70845 , 0.0 , Motion_10_BendingZ190_g70845));
				float3 Vertex_Motion_World1118_g70845 = ( ( ( temp_output_3474_0_g70845 + appendResult2043_g70845 ) + Motion_20_Squash4418_g70845 ) + Motion_30_Details263_g70845 );
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch4976_g70845 = Vertex_Motion_World1118_g70845;
				#else
				float3 staticSwitch4976_g70845 = ( Vertex_Motion_Object833_g70845 + ( _VertexDataMode * 0.0 ) );
				#endif
				float4 temp_output_94_19_g70904 = TVE_VertexCoords;
				half2 UV97_g70904 = ( (temp_output_94_19_g70904).zw + ( (temp_output_94_19_g70904).xy * (ObjectPosition4223_g70845).xz ) );
				float temp_output_84_0_g70904 = _LayerVertexValue;
				float4 lerpResult109_g70904 = lerp( TVE_VertexParams , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_VertexTex, sampler_linear_repeat, UV97_g70904,temp_output_84_0_g70904, 0.0 ) , TVE_VertexUsage[(int)temp_output_84_0_g70904]);
				half4 Global_Object_Params4173_g70845 = lerpResult109_g70904;
				half Global_VertexSize174_g70845 = saturate( Global_Object_Params4173_g70845.w );
				float lerpResult346_g70845 = lerp( 1.0 , Global_VertexSize174_g70845 , _GlobalSize);
				float3 appendResult3480_g70845 = (float3(lerpResult346_g70845 , lerpResult346_g70845 , lerpResult346_g70845));
				half3 ObjectData20_g70880 = appendResult3480_g70845;
				half3 _Vector11 = half3(1,1,1);
				half3 WorldData19_g70880 = _Vector11;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g70880 = WorldData19_g70880;
				#else
				float3 staticSwitch14_g70880 = ObjectData20_g70880;
				#endif
				half3 Vertex_Size1741_g70845 = staticSwitch14_g70880;
				half3 _Vector5 = half3(1,1,1);
				float3 Vertex_SizeFade1740_g70845 = _Vector5;
				half3 Grass_Perspective2661_g70845 = half3(0,0,0);
				float3 lerpResult16_g70879 = lerp( VertexPosition3588_g70845 , ( ( staticSwitch4976_g70845 * Vertex_Size1741_g70845 * Vertex_SizeFade1740_g70845 ) + Mesh_PivotsOS2291_g70845 + Grass_Perspective2661_g70845 ) , TVE_Enabled);
				float3 Final_VertexPosition890_g70845 = ( lerpResult16_g70879 + _DisableSRPBatcher );
				
				float temp_output_7_0_g70898 = _GradientMinValue;
				half Gradient_Tint2784_g70845 = saturate( ( ( Mesh_Height1524_g70845 - temp_output_7_0_g70898 ) / ( _GradientMaxValue - temp_output_7_0_g70898 ) ) );
				float vertexToFrag11_g70849 = Gradient_Tint2784_g70845;
				outputPackedVaryingsMeshToPS.ase_texcoord5.x = vertexToFrag11_g70849;
				outputPackedVaryingsMeshToPS.ase_texcoord5.yzw = vertexToFrag3890_g70845;
				outputPackedVaryingsMeshToPS.ase_texcoord7.xyz = vertexToFrag4224_g70845;
				float3 ase_worldNormal = TransformObjectToWorldNormal(inputMesh.normalOS);
				float3 vertexToFrag5058_g70845 = ase_worldNormal;
				outputPackedVaryingsMeshToPS.ase_texcoord8.xyz = vertexToFrag5058_g70845;
				float Mesh_Occlusion318_g70845 = inputMesh.ase_color.g;
				float temp_output_7_0_g70885 = _VertexOcclusionMinValue;
				float temp_output_3377_0_g70845 = saturate( ( ( Mesh_Occlusion318_g70845 - temp_output_7_0_g70885 ) / ( _VertexOcclusionMaxValue - temp_output_7_0_g70885 ) ) );
				float vertexToFrag11_g70889 = temp_output_3377_0_g70845;
				outputPackedVaryingsMeshToPS.ase_texcoord7.w = vertexToFrag11_g70889;
				
				float temp_output_7_0_g70861 = TVE_CameraFadeStart;
				float lerpResult4755_g70845 = lerp( 1.0 , saturate( ( ( distance( ase_worldPos , _WorldSpaceCameraPos ) - temp_output_7_0_g70861 ) / ( TVE_CameraFadeEnd - temp_output_7_0_g70861 ) ) ) , _FadeCameraValue);
				float vertexToFrag11_g70867 = lerpResult4755_g70845;
				outputPackedVaryingsMeshToPS.ase_texcoord8.w = vertexToFrag11_g70867;
				
				outputPackedVaryingsMeshToPS.ase_texcoord6 = inputMesh.ase_texcoord;
				outputPackedVaryingsMeshToPS.ase_color = inputMesh.ase_color;
				outputPackedVaryingsMeshToPS.ase_normal = inputMesh.normalOS;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue = Final_VertexPosition890_g70845;

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
				float vertexToFrag11_g70849 = packedInput.ase_texcoord5.x;
				float3 lerpResult2779_g70845 = lerp( (_GradientColorTwo).rgb , (_GradientColorOne).rgb , vertexToFrag11_g70849);
				half2 Main_UVs15_g70845 = ( ( packedInput.ase_texcoord6.xy * (_MainUVs).xy ) + (_MainUVs).zw );
				float4 tex2DNode29_g70845 = tex2D( _MainAlbedoTex, Main_UVs15_g70845 );
				half3 Main_Albedo99_g70845 = ( (_MainColor).rgb * (tex2DNode29_g70845).rgb );
				half3 Blend_Albedo265_g70845 = Main_Albedo99_g70845;
				half3 Blend_AlbedoTinted2808_g70845 = ( ( lerpResult2779_g70845 * float3(1,1,1) * float3(1,1,1) ) * Blend_Albedo265_g70845 );
				float dotResult3616_g70845 = dot( Blend_AlbedoTinted2808_g70845 , float3(0.2126,0.7152,0.0722) );
				float3 temp_cast_0 = (dotResult3616_g70845).xxx;
				float4 temp_output_91_19_g70893 = TVE_ColorsCoords;
				float3 vertexToFrag3890_g70845 = packedInput.ase_texcoord5.yzw;
				float3 WorldPosition3905_g70845 = vertexToFrag3890_g70845;
				float3 vertexToFrag4224_g70845 = packedInput.ase_texcoord7.xyz;
				half3 ObjectData20_g70886 = vertexToFrag4224_g70845;
				half3 WorldData19_g70886 = vertexToFrag3890_g70845;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g70886 = WorldData19_g70886;
				#else
				float3 staticSwitch14_g70886 = ObjectData20_g70886;
				#endif
				float3 ObjectPosition4223_g70845 = staticSwitch14_g70886;
				float3 lerpResult4822_g70845 = lerp( WorldPosition3905_g70845 , ObjectPosition4223_g70845 , _ColorsPositionMode);
				half2 UV94_g70893 = ( (temp_output_91_19_g70893).zw + ( (temp_output_91_19_g70893).xy * (lerpResult4822_g70845).xz ) );
				float temp_output_82_0_g70893 = _LayerColorsValue;
				float4 lerpResult108_g70893 = lerp( TVE_ColorsParams , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_ColorsTex, sampler_linear_repeat, UV94_g70893,temp_output_82_0_g70893, 0.0 ) , TVE_ColorsUsage[(int)temp_output_82_0_g70893]);
				half Global_ColorsTex_A1701_g70845 = saturate( (lerpResult108_g70893).a );
				half Global_Colors_Influence3668_g70845 = Global_ColorsTex_A1701_g70845;
				float3 lerpResult3618_g70845 = lerp( Blend_AlbedoTinted2808_g70845 , temp_cast_0 , Global_Colors_Influence3668_g70845);
				half3 Global_ColorsTex_RGB1700_g70845 = (lerpResult108_g70893).rgb;
				half3 Global_Colors1954_g70845 = ( Global_ColorsTex_RGB1700_g70845 * 4.594794 );
				float3 break111_g70874 = ObjectPosition4223_g70845;
				half Global_DynamicMode5112_g70845 = _VertexDynamicMode;
				half Input_DynamicMode120_g70874 = Global_DynamicMode5112_g70845;
				float Mesh_Variation16_g70845 = packedInput.ase_color.r;
				half Input_Variation124_g70874 = Mesh_Variation16_g70845;
				half ObjectData20_g70875 = frac( ( ( ( break111_g70874.x + break111_g70874.y + break111_g70874.z ) * ( 1.0 - Input_DynamicMode120_g70874 ) ) + Input_Variation124_g70874 ) );
				half WorldData19_g70875 = Input_Variation124_g70874;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g70875 = WorldData19_g70875;
				#else
				float staticSwitch14_g70875 = ObjectData20_g70875;
				#endif
				float clampResult129_g70874 = clamp( staticSwitch14_g70875 , 0.01 , 0.99 );
				half Global_MeshVariation5104_g70845 = clampResult129_g70874;
				float lerpResult3870_g70845 = lerp( 1.0 , ( Global_MeshVariation5104_g70845 * Global_MeshVariation5104_g70845 ) , _ColorsVariationValue);
				half Global_Colors_Variation3650_g70845 = ( _GlobalColors * lerpResult3870_g70845 );
				float4 tex2DNode35_g70845 = tex2D( _MainMaskTex, Main_UVs15_g70845 );
				half Main_Mask57_g70845 = tex2DNode35_g70845.b;
				float temp_output_7_0_g70892 = _ColorsMaskMinValue;
				half Global_Colors_Mask3692_g70845 = saturate( ( ( Main_Mask57_g70845 - temp_output_7_0_g70892 ) / ( _ColorsMaskMaxValue - temp_output_7_0_g70892 ) ) );
				float lerpResult16_g70915 = lerp( 0.0 , ( Global_Colors_Variation3650_g70845 * Global_Colors_Mask3692_g70845 ) , TVE_Enabled);
				float3 lerpResult3628_g70845 = lerp( Blend_AlbedoTinted2808_g70845 , ( lerpResult3618_g70845 * Global_Colors1954_g70845 ) , lerpResult16_g70915);
				half3 Blend_AlbedoColored863_g70845 = lerpResult3628_g70845;
				float3 temp_output_799_0_g70845 = (_SubsurfaceColor).rgb;
				float dotResult3930_g70845 = dot( temp_output_799_0_g70845 , float3(0.2126,0.7152,0.0722) );
				float3 temp_cast_3 = (dotResult3930_g70845).xxx;
				float3 lerpResult3932_g70845 = lerp( temp_output_799_0_g70845 , temp_cast_3 , Global_Colors_Influence3668_g70845);
				float3 lerpResult3942_g70845 = lerp( temp_output_799_0_g70845 , ( lerpResult3932_g70845 * Global_Colors1954_g70845 ) , ( Global_Colors_Variation3650_g70845 * Global_Colors_Mask3692_g70845 ));
				half3 Subsurface_Color1722_g70845 = lerpResult3942_g70845;
				half Global_Subsurface4041_g70845 = TVE_SubsurfaceValue;
				half Subsurface_Intensity1752_g70845 = ( _SubsurfaceValue * Global_Subsurface4041_g70845 );
				float temp_output_7_0_g70890 = _SubsurfaceMaskMinValue;
				half Subsurface_Mask1557_g70845 = saturate( ( ( Main_Mask57_g70845 - temp_output_7_0_g70890 ) / ( _SubsurfaceMaskMaxValue - temp_output_7_0_g70890 ) ) );
				half3 Subsurface_Transmission884_g70845 = ( Subsurface_Color1722_g70845 * Subsurface_Intensity1752_g70845 * Subsurface_Mask1557_g70845 );
				half3 MainLight_Direction3926_g70845 = TVE_MainLightDirection;
				float3 normalizeResult2169_g70845 = normalize( V );
				float3 ViewDir_Normalized3963_g70845 = normalizeResult2169_g70845;
				float dotResult785_g70845 = dot( -MainLight_Direction3926_g70845 , ViewDir_Normalized3963_g70845 );
				float saferPower1624_g70845 = abs( saturate( dotResult785_g70845 ) );
				#ifdef UNITY_PASS_FORWARDADD
				float staticSwitch1602_g70845 = 0.0;
				#else
				float staticSwitch1602_g70845 = ( pow( saferPower1624_g70845 , _SubsurfaceAngleValue ) * _SubsurfaceScatteringValue );
				#endif
				half Mask_Subsurface_View782_g70845 = staticSwitch1602_g70845;
				half3 Subsurface_Approximation1693_g70845 = ( Subsurface_Transmission884_g70845 * Blend_AlbedoColored863_g70845 * Mask_Subsurface_View782_g70845 );
				half3 Blend_AlbedoAndSubsurface149_g70845 = ( Blend_AlbedoColored863_g70845 + Subsurface_Approximation1693_g70845 );
				half3 Global_OverlayColor1758_g70845 = (TVE_OverlayColor).rgb;
				float3 vertexToFrag5058_g70845 = packedInput.ase_texcoord8.xyz;
				half3 World_Normal4101_g70845 = vertexToFrag5058_g70845;
				float lerpResult4801_g70845 = lerp( World_Normal4101_g70845.y , packedInput.ase_normal.y , Global_DynamicMode5112_g70845);
				float lerpResult3567_g70845 = lerp( 0.5 , 1.0 , lerpResult4801_g70845);
				float4 temp_output_93_19_g70850 = TVE_ExtrasCoords;
				float3 lerpResult4827_g70845 = lerp( WorldPosition3905_g70845 , ObjectPosition4223_g70845 , _ExtrasPositionMode);
				half2 UV96_g70850 = ( (temp_output_93_19_g70850).zw + ( (temp_output_93_19_g70850).xy * (lerpResult4827_g70845).xz ) );
				float temp_output_84_0_g70850 = _LayerExtrasValue;
				float4 lerpResult109_g70850 = lerp( TVE_ExtrasParams , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_ExtrasTex, sampler_linear_repeat, UV96_g70850,temp_output_84_0_g70850, 0.0 ) , TVE_ExtrasUsage[(int)temp_output_84_0_g70850]);
				float4 break89_g70850 = lerpResult109_g70850;
				half Global_Extras_Overlay156_g70845 = break89_g70850.b;
				float lerpResult1065_g70845 = lerp( 1.0 , Global_MeshVariation5104_g70845 , _OverlayVariationValue);
				half Overlay_Variation4560_g70845 = lerpResult1065_g70845;
				half Overlay_Commons1365_g70845 = ( _GlobalOverlay * Global_Extras_Overlay156_g70845 * Overlay_Variation4560_g70845 );
				half Overlay_Mask_3D5122_g70845 = ( ( ( lerpResult3567_g70845 * 0.5 ) + Blend_Albedo265_g70845.y ) * Overlay_Commons1365_g70845 );
				float temp_output_7_0_g70887 = _OverlayMaskMinValue;
				half Overlay_Mask269_g70845 = saturate( ( ( Overlay_Mask_3D5122_g70845 - temp_output_7_0_g70887 ) / ( _OverlayMaskMaxValue - temp_output_7_0_g70887 ) ) );
				float3 lerpResult336_g70845 = lerp( Blend_AlbedoAndSubsurface149_g70845 , Global_OverlayColor1758_g70845 , Overlay_Mask269_g70845);
				half3 Final_Albedo359_g70845 = lerpResult336_g70845;
				float3 temp_cast_6 = (1.0).xxx;
				float vertexToFrag11_g70889 = packedInput.ase_texcoord7.w;
				float3 lerpResult2945_g70845 = lerp( (_VertexOcclusionColor).rgb , temp_cast_6 , vertexToFrag11_g70889);
				float3 Vertex_Occlusion648_g70845 = lerpResult2945_g70845;
				
				float3 unpack4112_g70845 = UnpackNormalScale( tex2D( _MainNormalTex, Main_UVs15_g70845 ), _MainNormalValue );
				unpack4112_g70845.z = lerp( 1, unpack4112_g70845.z, saturate(_MainNormalValue) );
				half3 Main_Normal137_g70845 = unpack4112_g70845;
				float3 temp_output_13_0_g70856 = Main_Normal137_g70845;
				float3 switchResult12_g70856 = (((isFrontFace>0)?(temp_output_13_0_g70856):(( temp_output_13_0_g70856 * _render_normals ))));
				half3 Blend_Normal312_g70845 = switchResult12_g70856;
				half3 Final_Normal366_g70845 = Blend_Normal312_g70845;
				
				float3 hdEmission4189_g70845 = ASEGetEmissionHDRColor(_EmissiveColor.rgb,_EmissiveIntensityParams.x,_EmissiveExposureValue,GetInverseCurrentExposureMultiplier());
				half2 Emissive_UVs2468_g70845 = ( ( packedInput.ase_texcoord6.xy * (_EmissiveUVs).xy ) + (_EmissiveUVs).zw );
				half Global_Extras_Emissive4203_g70845 = break89_g70850.r;
				float lerpResult4206_g70845 = lerp( 1.0 , Global_Extras_Emissive4203_g70845 , _GlobalEmissive);
				half3 Final_Emissive2476_g70845 = ( (( hdEmission4189_g70845 * tex2D( _EmissiveTex, Emissive_UVs2468_g70845 ) )).rgb * lerpResult4206_g70845 );
				
				half Main_Smoothness227_g70845 = ( tex2DNode35_g70845.a * _MainSmoothnessValue );
				half Blend_Smoothness314_g70845 = Main_Smoothness227_g70845;
				half Global_OverlaySmoothness311_g70845 = TVE_OverlaySmoothness;
				float lerpResult343_g70845 = lerp( Blend_Smoothness314_g70845 , Global_OverlaySmoothness311_g70845 , Overlay_Mask269_g70845);
				half Final_Smoothness371_g70845 = lerpResult343_g70845;
				half Global_Extras_Wetness305_g70845 = break89_g70850.g;
				float lerpResult3673_g70845 = lerp( 0.0 , Global_Extras_Wetness305_g70845 , _GlobalWetness);
				half Final_SmoothnessAndWetness4130_g70845 = saturate( ( Final_Smoothness371_g70845 + lerpResult3673_g70845 ) );
				
				float lerpResult240_g70845 = lerp( 1.0 , tex2DNode35_g70845.g , _MainOcclusionValue);
				half Main_Occlusion247_g70845 = lerpResult240_g70845;
				half Blend_Occlusion323_g70845 = Main_Occlusion247_g70845;
				
				float localCustomAlphaClip9_g70878 = ( 0.0 );
				float3 ase_worldPos = GetAbsolutePositionWS( positionRWS );
				float3 normalizeResult3971_g70845 = normalize( cross( ddy( ase_worldPos ) , ddx( ase_worldPos ) ) );
				float3 NormalsWS_Derivates3972_g70845 = normalizeResult3971_g70845;
				float dotResult3851_g70845 = dot( ViewDir_Normalized3963_g70845 , NormalsWS_Derivates3972_g70845 );
				float lerpResult3993_g70845 = lerp( 1.0 , saturate( abs( dotResult3851_g70845 ) ) , _FadeGlancingValue);
				half Fade_Glancing3853_g70845 = lerpResult3993_g70845;
				float vertexToFrag11_g70867 = packedInput.ase_texcoord8.w;
				half Fade_Camera_Mask5149_g70845 = 1.0;
				float lerpResult5141_g70845 = lerp( 1.0 , vertexToFrag11_g70867 , Fade_Camera_Mask5149_g70845);
				half Fade_Camera3743_g70845 = lerpResult5141_g70845;
				float temp_output_41_0_g70864 = ( Fade_Glancing3853_g70845 * Fade_Camera3743_g70845 );
				half Final_AlphaFade3727_g70845 = saturate( ( temp_output_41_0_g70864 + ( temp_output_41_0_g70864 * tex3D( TVE_ScreenTex3D, ( TVE_ScreenTexCoord * WorldPosition3905_g70845 ) ).r ) ) );
				float Main_Alpha316_g70845 = ( _MainColor.a * tex2DNode29_g70845.a );
				half Global_Extras_Alpha1033_g70845 = saturate( break89_g70850.a );
				float lerpResult5154_g70845 = lerp( 0.0 , Global_MeshVariation5104_g70845 , _AlphaVariationValue);
				half Global_Alpha_Variation5158_g70845 = lerpResult5154_g70845;
				half AlphaTreshold2132_g70845 = _AlphaClipValue;
				half Global_Alpha_Mask4546_g70845 = 1.0;
				float lerpResult5203_g70845 = lerp( 1.0 , ( ( Global_Extras_Alpha1033_g70845 - Global_Alpha_Variation5158_g70845 ) + AlphaTreshold2132_g70845 ) , ( Global_Alpha_Mask4546_g70845 * _GlobalAlpha ));
				float lerpResult16_g70919 = lerp( 1.0 , lerpResult5203_g70845 , TVE_Enabled);
				half Global_Alpha315_g70845 = lerpResult16_g70919;
				half Final_Alpha3754_g70845 = ( ( Main_Alpha316_g70845 * Global_Alpha315_g70845 ) - ( AlphaTreshold2132_g70845 - 0.5 ) );
				float temp_output_661_0_g70845 = ( Final_AlphaFade3727_g70845 * Final_Alpha3754_g70845 );
				float temp_output_3_0_g70865 = temp_output_661_0_g70845;
				half Offest27_g70865 = 0.5;
				half Feather30_g70865 = 0.5;
				float temp_output_3_0_g70878 = ( ( ( temp_output_3_0_g70865 - Offest27_g70865 ) / ( max( fwidth( temp_output_3_0_g70865 ) , 0.001 ) + Feather30_g70865 ) ) + Offest27_g70865 );
				float Alpha9_g70878 = temp_output_3_0_g70878;
				float temp_output_15_0_g70878 = 0.5;
				float Treshold9_g70878 = temp_output_15_0_g70878;
				{
				#if TVE_FEATURE_CLIP
				clip(Alpha9_g70878 - Treshold9_g70878);
				#endif
				}
				half Final_Clip914_g70845 = Alpha9_g70878;
				
				half Subsurface_HD1276_g70845 = ( 1.0 - ( Subsurface_Intensity1752_g70845 * Subsurface_Mask1557_g70845 ) );
				
				surfaceDescription.Albedo = ( Final_Albedo359_g70845 * Vertex_Occlusion648_g70845 );
				surfaceDescription.Normal = Final_Normal366_g70845;
				surfaceDescription.BentNormal = float3( 0, 0, 1 );
				surfaceDescription.CoatMask = 0;
				surfaceDescription.Metallic = 0;

				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceDescription.Specular = 0;
				#endif

				surfaceDescription.Emission = Final_Emissive2476_g70845;
				surfaceDescription.Smoothness = Final_SmoothnessAndWetness4130_g70845;
				surfaceDescription.Occlusion = Blend_Occlusion323_g70845;
				surfaceDescription.Alpha = Final_Clip914_g70845;

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
				surfaceDescription.Thickness = Subsurface_HD1276_g70845;
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
				surfaceDescription.DiffusionProfile = _SubsurfaceDiffusion;
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

			#define _MATERIAL_FEATURE_TRANSMISSION 1
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
			half4 _MainColor;
			half4 _ColorsMaskRemap;
			half4 _SubsurfaceMaskRemap;
			half4 _VertexOcclusionRemap;
			float4 _GradientMaskRemap;
			float4 _SubsurfaceDiffusion_asset;
			float4 _MaxBoundsInfo;
			float4 _SubsurfaceDiffusion_Asset;
			float4 _Color;
			half4 _GradientColorTwo;
			half4 _GradientColorOne;
			half4 _MainUVs;
			half4 _OverlayMaskRemap;
			half4 _SubsurfaceColor;
			half4 _VertexOcclusionColor;
			half4 _AlphaMaskRemap;
			float4 _EmissiveIntensityParams;
			half4 _EmissiveColor;
			half4 _EmissiveUVs;
			float4 _NoiseMaskRemap;
			half4 _DetailBlendRemap;
			half3 _render_normals;
			half _VertexOcclusionMinValue;
			float _MotionScale_32;
			half _MotionFacingValue;
			half _MotionValue_20;
			half _EmissiveExposureValue;
			half _MotionAmplitude_20;
			half _GlobalEmissive;
			half _MainSmoothnessValue;
			half _GlobalWetness;
			half _MotionSpeed_20;
			half _MotionVariation_20;
			half _MotionScale_20;
			half _InteractionMaskValue;
			half _InteractionAmplitude;
			half _VertexDynamicMode;
			half _MainOcclusionValue;
			half _MotionVariation_10;
			float _MotionSpeed_10;
			half _FadeGlancingValue;
			float _MotionScale_10;
			half _FadeCameraValue;
			half _MotionAmplitude_10;
			half _LayerMotionValue;
			float _MotionVariation_32;
			float _MotionSpeed_32;
			half _MotionNormalValue;
			half _MotionValue_30;
			half _MainNormalValue;
			half _OverlayMaskMaxValue;
			half _OverlayMaskMinValue;
			half _OverlayVariationValue;
			half _LayerExtrasValue;
			half _ExtrasPositionMode;
			half _GlobalOverlay;
			half _SubsurfaceMaskMaxValue;
			half _SubsurfaceMaskMinValue;
			half _SubsurfaceValue;
			half _ColorsMaskMaxValue;
			half _ColorsMaskMinValue;
			half _ColorsVariationValue;
			half _GlobalColors;
			half _LayerColorsValue;
			half _ColorsPositionMode;
			half _VertexPivotMode;
			half _GradientMaxValue;
			half _GradientMinValue;
			half _GlobalSize;
			half _LayerVertexValue;
			half _VertexDataMode;
			half _VertexOcclusionMaxValue;
			half _MotionAmplitude_32;
			half _render_cull;
			half _RenderSSR;
			half _RenderDirect;
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
			half _CategorySubsurface;
			half _SubsurfaceNormalValue;
			half _SpaceMotionGlobals;
			half _SubsurfaceShadowValue;
			half _RenderCoverage;
			half _RenderPriority;
			float _SubsurfaceDiffusion;
			half _VertexRollingMode;
			half _Cutoff;
			half _SubsurfaceScatteringValue;
			half _render_dst;
			half _IsSubsurfaceShader;
			half _render_zw;
			half _render_src;
			half _IsLeafShader;
			half _EmissiveFlagMode;
			half _subsurface_shadow;
			half _RenderClip;
			half _MessageMotionVariation;
			half _CategoryRender;
			half _SpaceGlobalPosition;
			half _AlphaVariationValue;
			half _RenderCull;
			half _SubsurfaceDirectValue;
			half _RenderZWrite;
			half _SubsurfaceAmbientValue;
			half _RenderQueue;
			half _SubsurfaceAngleValue;
			half _AlphaClipValue;
			half _VertexMasksMode;
			half _LayerReactValue;
			half _DetailBlendMode;
			half _MessageGlobalsVariation;
			half _VertexVariationMode;
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
			half _RenderDecals;
			half _GlobalAlpha;
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
			half4 TVE_FlutterParams;
			half TVE_MotionFadeEnd;
			half TVE_MotionFadeStart;
			half4 TVE_VertexParams;
			TEXTURE2D_ARRAY(TVE_VertexTex);
			half4 TVE_VertexCoords;
			float TVE_VertexUsage[10];
			half _DisableSRPBatcher;
			sampler2D _MainAlbedoTex;
			half4 TVE_ColorsParams;
			TEXTURE2D_ARRAY(TVE_ColorsTex);
			half4 TVE_ColorsCoords;
			float TVE_ColorsUsage[10];
			sampler2D _MainMaskTex;
			half TVE_SubsurfaceValue;
			half3 TVE_MainLightDirection;
			half4 TVE_OverlayColor;
			half4 TVE_ExtrasParams;
			TEXTURE2D_ARRAY(TVE_ExtrasTex);
			half4 TVE_ExtrasCoords;
			float TVE_ExtrasUsage[10];
			sampler2D _MainNormalTex;
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
			//TVE Pipeline Defines
			#define THE_VEGETATION_ENGINE
			#define TVE_IS_HD_PIPELINE
			//TVE HD Pipeline Defines
			#pragma shader_feature_local _DISABLE_DECALS
			#pragma shader_feature_local _DISABLE_SSR
			//TVE Shader Type Defines
			#define TVE_IS_VEGETATION_SHADER
			//TVE Injection Defines
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END


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
				float4 ase_color : COLOR;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_texcoord6 : TEXCOORD6;
				float3 ase_normal : NORMAL;
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

				float3 VertexPosition3588_g70845 = inputMesh.positionOS;
				half3 Mesh_PivotsOS2291_g70845 = half3(0,0,0);
				float3 temp_output_2283_0_g70845 = ( VertexPosition3588_g70845 - Mesh_PivotsOS2291_g70845 );
				half3 VertexPos40_g70921 = temp_output_2283_0_g70845;
				float3 appendResult74_g70921 = (float3(VertexPos40_g70921.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g70921 = appendResult74_g70921;
				float3 break84_g70921 = VertexPos40_g70921;
				float3 appendResult81_g70921 = (float3(0.0 , break84_g70921.y , break84_g70921.z));
				half3 VertexPosOtherAxis82_g70921 = appendResult81_g70921;
				float4 temp_output_91_19_g70881 = TVE_MotionCoords;
				float3 localObjectPosition_UNITY_MATRIX_M14_g70912 = ObjectPosition_UNITY_MATRIX_M();
				float3 appendResult60_g70870 = (float3(inputMesh.uv3.x , inputMesh.uv3.z , inputMesh.uv3.y));
				half3 Mesh_PivotsData2831_g70845 = ( appendResult60_g70870 * _VertexPivotMode );
				float3 temp_output_122_0_g70912 = Mesh_PivotsData2831_g70845;
				float3 PivotsOnly105_g70912 = (mul( GetObjectToWorldMatrix(), float4( temp_output_122_0_g70912 , 0.0 ) ).xyz).xyz;
				#ifdef SHADEROPTIONS_CAMERA_RELATIVE_RENDERING
				float3 staticSwitch13_g70912 = ( ( localObjectPosition_UNITY_MATRIX_M14_g70912 + PivotsOnly105_g70912 ) + _WorldSpaceCameraPos );
				#else
				float3 staticSwitch13_g70912 = ( localObjectPosition_UNITY_MATRIX_M14_g70912 + PivotsOnly105_g70912 );
				#endif
				half3 ObjectData20_g70913 = staticSwitch13_g70912;
				float3 ase_worldPos = GetAbsolutePositionWS( TransformObjectToWorld( (inputMesh.positionOS).xyz ) );
				half3 WorldData19_g70913 = ase_worldPos;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g70913 = WorldData19_g70913;
				#else
				float3 staticSwitch14_g70913 = ObjectData20_g70913;
				#endif
				float3 temp_output_114_0_g70912 = staticSwitch14_g70913;
				float3 vertexToFrag4224_g70845 = temp_output_114_0_g70912;
				half3 ObjectData20_g70886 = vertexToFrag4224_g70845;
				float3 vertexToFrag3890_g70845 = ase_worldPos;
				half3 WorldData19_g70886 = vertexToFrag3890_g70845;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g70886 = WorldData19_g70886;
				#else
				float3 staticSwitch14_g70886 = ObjectData20_g70886;
				#endif
				float3 ObjectPosition4223_g70845 = staticSwitch14_g70886;
				half2 UV94_g70881 = ( (temp_output_91_19_g70881).zw + ( (temp_output_91_19_g70881).xy * (ObjectPosition4223_g70845).xz ) );
				float temp_output_84_0_g70881 = _LayerMotionValue;
				float4 lerpResult107_g70881 = lerp( TVE_MotionParams , saturate( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_MotionTex, sampler_linear_repeat, UV94_g70881,temp_output_84_0_g70881, 0.0 ) ) , TVE_MotionUsage[(int)temp_output_84_0_g70881]);
				half4 Global_Motion_Params3909_g70845 = lerpResult107_g70881;
				float4 break322_g70888 = Global_Motion_Params3909_g70845;
				float3 appendResult397_g70888 = (float3(break322_g70888.x , 0.0 , break322_g70888.y));
				float3 temp_output_398_0_g70888 = (appendResult397_g70888*2.0 + -1.0);
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				half2 Global_MotionDirectionOS39_g70845 = (( mul( GetWorldToObjectMatrix(), float4( temp_output_398_0_g70888 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_DirectionOS358_g70917 = Global_MotionDirectionOS39_g70845;
				half Mesh_Height1524_g70845 = inputMesh.ase_color.a;
				half Mesh_Height114_g70872 = Mesh_Height1524_g70845;
				half ObjectData20_g70873 = ( Mesh_Height114_g70872 * 2.0 );
				float enc62_g70871 = inputMesh.uv0.w;
				float2 localDecodeFloatToVector262_g70871 = DecodeFloatToVector2( enc62_g70871 );
				float2 break63_g70871 = ( localDecodeFloatToVector262_g70871 * 100.0 );
				float Bounds_Height5230_g70845 = break63_g70871.x;
				float Bounds_Height117_g70872 = Bounds_Height5230_g70845;
				half WorldData19_g70873 = ( ( Mesh_Height114_g70872 * Mesh_Height114_g70872 ) * Bounds_Height117_g70872 * 2.0 );
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g70873 = WorldData19_g70873;
				#else
				float staticSwitch14_g70873 = ObjectData20_g70873;
				#endif
				half Motion_10_Mask5242_g70845 = staticSwitch14_g70873;
				half Wind_Power369_g70888 = break322_g70888.z;
				half Global_MotionPower2223_g70845 = Wind_Power369_g70888;
				half3 Input_Position419_g70891 = -ObjectPosition4223_g70845;
				half2 Global_MotionDirectionWS4683_g70845 = (temp_output_398_0_g70888).xz;
				half2 Input_DirectionWS423_g70891 = Global_MotionDirectionWS4683_g70845;
				float Motion_Scale287_g70891 = ( _MotionScale_10 + 0.2 );
				half Global_Scale448_g70891 = TVE_NoiseParams.x;
				half Input_Speed62_g70891 = _MotionSpeed_10;
				half Global_Speed449_g70891 = TVE_NoiseParams.y;
				float mulTime426_g70891 = _TimeParameters.x * ( Input_Speed62_g70891 * Global_Speed449_g70891 );
				half Global_DistScale561_g70891 = TVE_NoiseParams.w;
				float3 break461_g70891 = ( Input_Position419_g70891 * Global_DistScale561_g70891 );
				half Global_DistAmplitude559_g70891 = TVE_NoiseParams.z;
				float Noise_Distortion469_g70891 = ( sin( ( break461_g70891.x + break461_g70891.z ) ) * Global_DistAmplitude559_g70891 );
				float3 break111_g70874 = ObjectPosition4223_g70845;
				half Global_DynamicMode5112_g70845 = _VertexDynamicMode;
				half Input_DynamicMode120_g70874 = Global_DynamicMode5112_g70845;
				float Mesh_Variation16_g70845 = inputMesh.ase_color.r;
				half Input_Variation124_g70874 = Mesh_Variation16_g70845;
				half ObjectData20_g70875 = frac( ( ( ( break111_g70874.x + break111_g70874.y + break111_g70874.z ) * ( 1.0 - Input_DynamicMode120_g70874 ) ) + Input_Variation124_g70874 ) );
				half WorldData19_g70875 = Input_Variation124_g70874;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g70875 = WorldData19_g70875;
				#else
				float staticSwitch14_g70875 = ObjectData20_g70875;
				#endif
				float clampResult129_g70874 = clamp( staticSwitch14_g70875 , 0.01 , 0.99 );
				half Global_MeshVariation5104_g70845 = clampResult129_g70874;
				half Motion_Variation284_g70891 = ( _MotionVariation_10 * Global_MeshVariation5104_g70845 );
				float2 temp_output_425_0_g70891 = ( ( (Input_Position419_g70891).xz * Input_DirectionWS423_g70891 * Motion_Scale287_g70891 * Global_Scale448_g70891 ) + ( mulTime426_g70891 + Noise_Distortion469_g70891 + Motion_Variation284_g70891 ) );
				float2 break500_g70891 = ( temp_output_425_0_g70891 * 0.1178 );
				float2 break494_g70891 = ( temp_output_425_0_g70891 * 0.1742 );
				half Input_WindPower327_g70891 = Global_MotionPower2223_g70845;
				float lerpResult430_g70891 = lerp( 1.4 , 0.4 , Input_WindPower327_g70891);
				half Global_MotionNoise34_g70845 = (pow( (( sin( ( break500_g70891.x + break500_g70891.y ) ) * sin( ( break494_g70891.x + break494_g70891.y ) ) )*0.4 + 0.6) , lerpResult430_g70891 )*1.2 + -0.2);
				half Motion_10_Amplitude2258_g70845 = ( _MotionAmplitude_10 * Motion_10_Mask5242_g70845 * Global_MotionPower2223_g70845 * Global_MotionNoise34_g70845 );
				half Input_BendingAmplitude376_g70917 = Motion_10_Amplitude2258_g70845;
				half Input_InteractionAmplitude58_g70917 = _InteractionAmplitude;
				half Input_MeshMotion_10321_g70917 = Motion_10_Mask5242_g70845;
				half Input_InteractionUseMask62_g70917 = _InteractionMaskValue;
				float lerpResult371_g70917 = lerp( 2.0 , Input_MeshMotion_10321_g70917 , Input_InteractionUseMask62_g70917);
				half ObjectData20_g70918 = lerpResult371_g70917;
				half WorldData19_g70918 = Input_MeshMotion_10321_g70917;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g70918 = WorldData19_g70918;
				#else
				float staticSwitch14_g70918 = ObjectData20_g70918;
				#endif
				half Motion_10_Interaction373_g70917 = ( Input_InteractionAmplitude58_g70917 * staticSwitch14_g70918 );
				half Global_InteractionMask66_g70845 = ( break322_g70888.w * break322_g70888.w );
				float Input_InteractionMask330_g70917 = Global_InteractionMask66_g70845;
				float lerpResult360_g70917 = lerp( Input_BendingAmplitude376_g70917 , Motion_10_Interaction373_g70917 , saturate( ( Input_InteractionAmplitude58_g70917 * Input_InteractionMask330_g70917 ) ));
				float2 break364_g70917 = ( Input_DirectionOS358_g70917 * lerpResult360_g70917 );
				half Motion_10_BendingZ190_g70845 = break364_g70917.y;
				half Angle44_g70921 = Motion_10_BendingZ190_g70845;
				half3 VertexPos40_g70920 = ( VertexPosRotationAxis50_g70921 + ( VertexPosOtherAxis82_g70921 * cos( Angle44_g70921 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g70921 ) * sin( Angle44_g70921 ) ) );
				float3 appendResult74_g70920 = (float3(0.0 , 0.0 , VertexPos40_g70920.z));
				half3 VertexPosRotationAxis50_g70920 = appendResult74_g70920;
				float3 break84_g70920 = VertexPos40_g70920;
				float3 appendResult81_g70920 = (float3(break84_g70920.x , break84_g70920.y , 0.0));
				half3 VertexPosOtherAxis82_g70920 = appendResult81_g70920;
				half Motion_10_BendingX216_g70845 = break364_g70917.x;
				half Angle44_g70920 = -Motion_10_BendingX216_g70845;
				half Input_Scale321_g70860 = _MotionScale_20;
				half Input_Variation330_g70860 = ( _MotionVariation_20 * Global_MeshVariation5104_g70845 );
				half Input_Speed62_g70860 = _MotionSpeed_20;
				float mulTime349_g70860 = _TimeParameters.x * Input_Speed62_g70860;
				float temp_output_302_0_g70860 = sin( ( ( ( ase_worldPos.x + ase_worldPos.y + ase_worldPos.z ) * Input_Scale321_g70860 ) + Input_Variation330_g70860 + mulTime349_g70860 ) );
				float enc59_g70871 = inputMesh.uv0.z;
				float2 localDecodeFloatToVector259_g70871 = DecodeFloatToVector2( enc59_g70871 );
				float2 break61_g70871 = localDecodeFloatToVector259_g70871;
				half Mesh_Motion_2060_g70845 = break61_g70871.x;
				half Mesh_Motion_20115_g70872 = Mesh_Motion_2060_g70845;
				float Bounds_Radius5231_g70845 = break63_g70871.y;
				float Bounds_Radius118_g70872 = Bounds_Radius5231_g70845;
				half Motion_20_Mask5243_g70845 = ( Mesh_Motion_20115_g70872 * Bounds_Radius118_g70872 );
				half3 Input_Position419_g70876 = VertexPosition3588_g70845;
				float3 normalizeResult518_g70876 = normalize( Input_Position419_g70876 );
				half2 Input_DirectionOS423_g70876 = Global_MotionDirectionOS39_g70845;
				float2 break521_g70876 = -Input_DirectionOS423_g70876;
				float3 appendResult522_g70876 = (float3(break521_g70876.x , 0.0 , break521_g70876.y));
				float dotResult519_g70876 = dot( normalizeResult518_g70876 , appendResult522_g70876 );
				half Input_Mask62_g70876 = _MotionFacingValue;
				float lerpResult524_g70876 = lerp( 1.0 , (dotResult519_g70876*0.5 + 0.5) , Input_Mask62_g70876);
				half ObjectData20_g70877 = lerpResult524_g70876;
				half WorldData19_g70877 = 1.0;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g70877 = WorldData19_g70877;
				#else
				float staticSwitch14_g70877 = ObjectData20_g70877;
				#endif
				half Motion_FacingMask5214_g70845 = staticSwitch14_g70877;
				half Motion_20_Amplitude4381_g70845 = ( _MotionAmplitude_20 * _MotionValue_20 * Motion_20_Mask5243_g70845 * Global_MotionPower2223_g70845 * Global_MotionNoise34_g70845 * Motion_FacingMask5214_g70845 );
				half Input_Amplitude58_g70860 = Motion_20_Amplitude4381_g70845;
				half2 Input_DirectionOS366_g70860 = Global_MotionDirectionOS39_g70845;
				float2 break371_g70860 = Input_DirectionOS366_g70860;
				float3 appendResult372_g70860 = (float3(break371_g70860.x , ( temp_output_302_0_g70860 * 0.1 ) , break371_g70860.y));
				half3 Motion_20_Squash4418_g70845 = ( ( (temp_output_302_0_g70860*0.2 + 1.0) * Input_Amplitude58_g70860 ) * appendResult372_g70860 );
				half Motion_Scale321_g70908 = _MotionScale_32;
				half Motion_Variation330_g70908 = ( _MotionVariation_32 * Global_MeshVariation5104_g70845 );
				half Input_Speed62_g70908 = _MotionSpeed_32;
				half Global_Speed350_g70908 = TVE_FlutterParams.y;
				float mulTime349_g70908 = _TimeParameters.x * ( Input_Speed62_g70908 * Global_Speed350_g70908 );
				half Mesh_Motion_30144_g70845 = break61_g70871.y;
				half Mesh_Motion_30116_g70872 = Mesh_Motion_30144_g70845;
				half Motion_30_Mask5244_g70845 = ( Mesh_Motion_30116_g70872 * 0.4 );
				float temp_output_7_0_g70869 = TVE_MotionFadeEnd;
				half Motion_FadeOut4005_g70845 = saturate( ( ( distance( ase_worldPos , _WorldSpaceCameraPos ) - temp_output_7_0_g70869 ) / ( TVE_MotionFadeStart - temp_output_7_0_g70869 ) ) );
				half Motion_30_Amplitude4960_g70845 = ( _MotionAmplitude_32 * _MotionValue_30 * Motion_30_Mask5244_g70845 * Global_MotionPower2223_g70845 * Global_MotionNoise34_g70845 * Motion_FacingMask5214_g70845 * Motion_FadeOut4005_g70845 );
				half Input_Amplitude58_g70908 = Motion_30_Amplitude4960_g70845;
				half Global_Power354_g70908 = TVE_FlutterParams.x;
				half Motion_Normal364_g70908 = _MotionNormalValue;
				float3 lerpResult370_g70908 = lerp( float3( 1,1,1 ) , inputMesh.normalOS , Motion_Normal364_g70908);
				half3 Motion_30_Details263_g70845 = ( ( sin( ( ( ( ase_worldPos.x + ase_worldPos.y + ase_worldPos.z ) * Motion_Scale321_g70908 ) + Motion_Variation330_g70908 + mulTime349_g70908 ) ) * Input_Amplitude58_g70908 * Global_Power354_g70908 ) * lerpResult370_g70908 );
				float3 Vertex_Motion_Object833_g70845 = ( ( ( VertexPosRotationAxis50_g70920 + ( VertexPosOtherAxis82_g70920 * cos( Angle44_g70920 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g70920 ) * sin( Angle44_g70920 ) ) ) + Motion_20_Squash4418_g70845 ) + Motion_30_Details263_g70845 );
				float3 temp_output_3474_0_g70845 = ( VertexPosition3588_g70845 - Mesh_PivotsOS2291_g70845 );
				float3 appendResult2043_g70845 = (float3(Motion_10_BendingX216_g70845 , 0.0 , Motion_10_BendingZ190_g70845));
				float3 Vertex_Motion_World1118_g70845 = ( ( ( temp_output_3474_0_g70845 + appendResult2043_g70845 ) + Motion_20_Squash4418_g70845 ) + Motion_30_Details263_g70845 );
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch4976_g70845 = Vertex_Motion_World1118_g70845;
				#else
				float3 staticSwitch4976_g70845 = ( Vertex_Motion_Object833_g70845 + ( _VertexDataMode * 0.0 ) );
				#endif
				float4 temp_output_94_19_g70904 = TVE_VertexCoords;
				half2 UV97_g70904 = ( (temp_output_94_19_g70904).zw + ( (temp_output_94_19_g70904).xy * (ObjectPosition4223_g70845).xz ) );
				float temp_output_84_0_g70904 = _LayerVertexValue;
				float4 lerpResult109_g70904 = lerp( TVE_VertexParams , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_VertexTex, sampler_linear_repeat, UV97_g70904,temp_output_84_0_g70904, 0.0 ) , TVE_VertexUsage[(int)temp_output_84_0_g70904]);
				half4 Global_Object_Params4173_g70845 = lerpResult109_g70904;
				half Global_VertexSize174_g70845 = saturate( Global_Object_Params4173_g70845.w );
				float lerpResult346_g70845 = lerp( 1.0 , Global_VertexSize174_g70845 , _GlobalSize);
				float3 appendResult3480_g70845 = (float3(lerpResult346_g70845 , lerpResult346_g70845 , lerpResult346_g70845));
				half3 ObjectData20_g70880 = appendResult3480_g70845;
				half3 _Vector11 = half3(1,1,1);
				half3 WorldData19_g70880 = _Vector11;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g70880 = WorldData19_g70880;
				#else
				float3 staticSwitch14_g70880 = ObjectData20_g70880;
				#endif
				half3 Vertex_Size1741_g70845 = staticSwitch14_g70880;
				half3 _Vector5 = half3(1,1,1);
				float3 Vertex_SizeFade1740_g70845 = _Vector5;
				half3 Grass_Perspective2661_g70845 = half3(0,0,0);
				float3 lerpResult16_g70879 = lerp( VertexPosition3588_g70845 , ( ( staticSwitch4976_g70845 * Vertex_Size1741_g70845 * Vertex_SizeFade1740_g70845 ) + Mesh_PivotsOS2291_g70845 + Grass_Perspective2661_g70845 ) , TVE_Enabled);
				float3 Final_VertexPosition890_g70845 = ( lerpResult16_g70879 + _DisableSRPBatcher );
				
				float temp_output_7_0_g70898 = _GradientMinValue;
				half Gradient_Tint2784_g70845 = saturate( ( ( Mesh_Height1524_g70845 - temp_output_7_0_g70898 ) / ( _GradientMaxValue - temp_output_7_0_g70898 ) ) );
				float vertexToFrag11_g70849 = Gradient_Tint2784_g70845;
				outputPackedVaryingsMeshToPS.ase_texcoord2.x = vertexToFrag11_g70849;
				outputPackedVaryingsMeshToPS.ase_texcoord2.yzw = vertexToFrag3890_g70845;
				outputPackedVaryingsMeshToPS.ase_texcoord4.xyz = vertexToFrag4224_g70845;
				outputPackedVaryingsMeshToPS.ase_texcoord5.xyz = ase_worldPos;
				float3 ase_worldNormal = TransformObjectToWorldNormal(inputMesh.normalOS);
				float3 vertexToFrag5058_g70845 = ase_worldNormal;
				outputPackedVaryingsMeshToPS.ase_texcoord6.xyz = vertexToFrag5058_g70845;
				float Mesh_Occlusion318_g70845 = inputMesh.ase_color.g;
				float temp_output_7_0_g70885 = _VertexOcclusionMinValue;
				float temp_output_3377_0_g70845 = saturate( ( ( Mesh_Occlusion318_g70845 - temp_output_7_0_g70885 ) / ( _VertexOcclusionMaxValue - temp_output_7_0_g70885 ) ) );
				float vertexToFrag11_g70889 = temp_output_3377_0_g70845;
				outputPackedVaryingsMeshToPS.ase_texcoord4.w = vertexToFrag11_g70889;
				
				float temp_output_7_0_g70861 = TVE_CameraFadeStart;
				float lerpResult4755_g70845 = lerp( 1.0 , saturate( ( ( distance( ase_worldPos , _WorldSpaceCameraPos ) - temp_output_7_0_g70861 ) / ( TVE_CameraFadeEnd - temp_output_7_0_g70861 ) ) ) , _FadeCameraValue);
				float vertexToFrag11_g70867 = lerpResult4755_g70845;
				outputPackedVaryingsMeshToPS.ase_texcoord5.w = vertexToFrag11_g70867;
				
				outputPackedVaryingsMeshToPS.ase_texcoord3 = inputMesh.uv0;
				outputPackedVaryingsMeshToPS.ase_color = inputMesh.ase_color;
				outputPackedVaryingsMeshToPS.ase_normal = inputMesh.normalOS;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				outputPackedVaryingsMeshToPS.ase_texcoord6.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue = Final_VertexPosition890_g70845;

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
				float vertexToFrag11_g70849 = packedInput.ase_texcoord2.x;
				float3 lerpResult2779_g70845 = lerp( (_GradientColorTwo).rgb , (_GradientColorOne).rgb , vertexToFrag11_g70849);
				half2 Main_UVs15_g70845 = ( ( packedInput.ase_texcoord3.xy * (_MainUVs).xy ) + (_MainUVs).zw );
				float4 tex2DNode29_g70845 = tex2D( _MainAlbedoTex, Main_UVs15_g70845 );
				half3 Main_Albedo99_g70845 = ( (_MainColor).rgb * (tex2DNode29_g70845).rgb );
				half3 Blend_Albedo265_g70845 = Main_Albedo99_g70845;
				half3 Blend_AlbedoTinted2808_g70845 = ( ( lerpResult2779_g70845 * float3(1,1,1) * float3(1,1,1) ) * Blend_Albedo265_g70845 );
				float dotResult3616_g70845 = dot( Blend_AlbedoTinted2808_g70845 , float3(0.2126,0.7152,0.0722) );
				float3 temp_cast_0 = (dotResult3616_g70845).xxx;
				float4 temp_output_91_19_g70893 = TVE_ColorsCoords;
				float3 vertexToFrag3890_g70845 = packedInput.ase_texcoord2.yzw;
				float3 WorldPosition3905_g70845 = vertexToFrag3890_g70845;
				float3 vertexToFrag4224_g70845 = packedInput.ase_texcoord4.xyz;
				half3 ObjectData20_g70886 = vertexToFrag4224_g70845;
				half3 WorldData19_g70886 = vertexToFrag3890_g70845;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g70886 = WorldData19_g70886;
				#else
				float3 staticSwitch14_g70886 = ObjectData20_g70886;
				#endif
				float3 ObjectPosition4223_g70845 = staticSwitch14_g70886;
				float3 lerpResult4822_g70845 = lerp( WorldPosition3905_g70845 , ObjectPosition4223_g70845 , _ColorsPositionMode);
				half2 UV94_g70893 = ( (temp_output_91_19_g70893).zw + ( (temp_output_91_19_g70893).xy * (lerpResult4822_g70845).xz ) );
				float temp_output_82_0_g70893 = _LayerColorsValue;
				float4 lerpResult108_g70893 = lerp( TVE_ColorsParams , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_ColorsTex, sampler_linear_repeat, UV94_g70893,temp_output_82_0_g70893, 0.0 ) , TVE_ColorsUsage[(int)temp_output_82_0_g70893]);
				half Global_ColorsTex_A1701_g70845 = saturate( (lerpResult108_g70893).a );
				half Global_Colors_Influence3668_g70845 = Global_ColorsTex_A1701_g70845;
				float3 lerpResult3618_g70845 = lerp( Blend_AlbedoTinted2808_g70845 , temp_cast_0 , Global_Colors_Influence3668_g70845);
				half3 Global_ColorsTex_RGB1700_g70845 = (lerpResult108_g70893).rgb;
				half3 Global_Colors1954_g70845 = ( Global_ColorsTex_RGB1700_g70845 * 4.594794 );
				float3 break111_g70874 = ObjectPosition4223_g70845;
				half Global_DynamicMode5112_g70845 = _VertexDynamicMode;
				half Input_DynamicMode120_g70874 = Global_DynamicMode5112_g70845;
				float Mesh_Variation16_g70845 = packedInput.ase_color.r;
				half Input_Variation124_g70874 = Mesh_Variation16_g70845;
				half ObjectData20_g70875 = frac( ( ( ( break111_g70874.x + break111_g70874.y + break111_g70874.z ) * ( 1.0 - Input_DynamicMode120_g70874 ) ) + Input_Variation124_g70874 ) );
				half WorldData19_g70875 = Input_Variation124_g70874;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g70875 = WorldData19_g70875;
				#else
				float staticSwitch14_g70875 = ObjectData20_g70875;
				#endif
				float clampResult129_g70874 = clamp( staticSwitch14_g70875 , 0.01 , 0.99 );
				half Global_MeshVariation5104_g70845 = clampResult129_g70874;
				float lerpResult3870_g70845 = lerp( 1.0 , ( Global_MeshVariation5104_g70845 * Global_MeshVariation5104_g70845 ) , _ColorsVariationValue);
				half Global_Colors_Variation3650_g70845 = ( _GlobalColors * lerpResult3870_g70845 );
				float4 tex2DNode35_g70845 = tex2D( _MainMaskTex, Main_UVs15_g70845 );
				half Main_Mask57_g70845 = tex2DNode35_g70845.b;
				float temp_output_7_0_g70892 = _ColorsMaskMinValue;
				half Global_Colors_Mask3692_g70845 = saturate( ( ( Main_Mask57_g70845 - temp_output_7_0_g70892 ) / ( _ColorsMaskMaxValue - temp_output_7_0_g70892 ) ) );
				float lerpResult16_g70915 = lerp( 0.0 , ( Global_Colors_Variation3650_g70845 * Global_Colors_Mask3692_g70845 ) , TVE_Enabled);
				float3 lerpResult3628_g70845 = lerp( Blend_AlbedoTinted2808_g70845 , ( lerpResult3618_g70845 * Global_Colors1954_g70845 ) , lerpResult16_g70915);
				half3 Blend_AlbedoColored863_g70845 = lerpResult3628_g70845;
				float3 temp_output_799_0_g70845 = (_SubsurfaceColor).rgb;
				float dotResult3930_g70845 = dot( temp_output_799_0_g70845 , float3(0.2126,0.7152,0.0722) );
				float3 temp_cast_3 = (dotResult3930_g70845).xxx;
				float3 lerpResult3932_g70845 = lerp( temp_output_799_0_g70845 , temp_cast_3 , Global_Colors_Influence3668_g70845);
				float3 lerpResult3942_g70845 = lerp( temp_output_799_0_g70845 , ( lerpResult3932_g70845 * Global_Colors1954_g70845 ) , ( Global_Colors_Variation3650_g70845 * Global_Colors_Mask3692_g70845 ));
				half3 Subsurface_Color1722_g70845 = lerpResult3942_g70845;
				half Global_Subsurface4041_g70845 = TVE_SubsurfaceValue;
				half Subsurface_Intensity1752_g70845 = ( _SubsurfaceValue * Global_Subsurface4041_g70845 );
				float temp_output_7_0_g70890 = _SubsurfaceMaskMinValue;
				half Subsurface_Mask1557_g70845 = saturate( ( ( Main_Mask57_g70845 - temp_output_7_0_g70890 ) / ( _SubsurfaceMaskMaxValue - temp_output_7_0_g70890 ) ) );
				half3 Subsurface_Transmission884_g70845 = ( Subsurface_Color1722_g70845 * Subsurface_Intensity1752_g70845 * Subsurface_Mask1557_g70845 );
				half3 MainLight_Direction3926_g70845 = TVE_MainLightDirection;
				float3 ase_worldPos = packedInput.ase_texcoord5.xyz;
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 normalizeResult2169_g70845 = normalize( ase_worldViewDir );
				float3 ViewDir_Normalized3963_g70845 = normalizeResult2169_g70845;
				float dotResult785_g70845 = dot( -MainLight_Direction3926_g70845 , ViewDir_Normalized3963_g70845 );
				float saferPower1624_g70845 = abs( saturate( dotResult785_g70845 ) );
				#ifdef UNITY_PASS_FORWARDADD
				float staticSwitch1602_g70845 = 0.0;
				#else
				float staticSwitch1602_g70845 = ( pow( saferPower1624_g70845 , _SubsurfaceAngleValue ) * _SubsurfaceScatteringValue );
				#endif
				half Mask_Subsurface_View782_g70845 = staticSwitch1602_g70845;
				half3 Subsurface_Approximation1693_g70845 = ( Subsurface_Transmission884_g70845 * Blend_AlbedoColored863_g70845 * Mask_Subsurface_View782_g70845 );
				half3 Blend_AlbedoAndSubsurface149_g70845 = ( Blend_AlbedoColored863_g70845 + Subsurface_Approximation1693_g70845 );
				half3 Global_OverlayColor1758_g70845 = (TVE_OverlayColor).rgb;
				float3 vertexToFrag5058_g70845 = packedInput.ase_texcoord6.xyz;
				half3 World_Normal4101_g70845 = vertexToFrag5058_g70845;
				float lerpResult4801_g70845 = lerp( World_Normal4101_g70845.y , packedInput.ase_normal.y , Global_DynamicMode5112_g70845);
				float lerpResult3567_g70845 = lerp( 0.5 , 1.0 , lerpResult4801_g70845);
				float4 temp_output_93_19_g70850 = TVE_ExtrasCoords;
				float3 lerpResult4827_g70845 = lerp( WorldPosition3905_g70845 , ObjectPosition4223_g70845 , _ExtrasPositionMode);
				half2 UV96_g70850 = ( (temp_output_93_19_g70850).zw + ( (temp_output_93_19_g70850).xy * (lerpResult4827_g70845).xz ) );
				float temp_output_84_0_g70850 = _LayerExtrasValue;
				float4 lerpResult109_g70850 = lerp( TVE_ExtrasParams , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_ExtrasTex, sampler_linear_repeat, UV96_g70850,temp_output_84_0_g70850, 0.0 ) , TVE_ExtrasUsage[(int)temp_output_84_0_g70850]);
				float4 break89_g70850 = lerpResult109_g70850;
				half Global_Extras_Overlay156_g70845 = break89_g70850.b;
				float lerpResult1065_g70845 = lerp( 1.0 , Global_MeshVariation5104_g70845 , _OverlayVariationValue);
				half Overlay_Variation4560_g70845 = lerpResult1065_g70845;
				half Overlay_Commons1365_g70845 = ( _GlobalOverlay * Global_Extras_Overlay156_g70845 * Overlay_Variation4560_g70845 );
				half Overlay_Mask_3D5122_g70845 = ( ( ( lerpResult3567_g70845 * 0.5 ) + Blend_Albedo265_g70845.y ) * Overlay_Commons1365_g70845 );
				float temp_output_7_0_g70887 = _OverlayMaskMinValue;
				half Overlay_Mask269_g70845 = saturate( ( ( Overlay_Mask_3D5122_g70845 - temp_output_7_0_g70887 ) / ( _OverlayMaskMaxValue - temp_output_7_0_g70887 ) ) );
				float3 lerpResult336_g70845 = lerp( Blend_AlbedoAndSubsurface149_g70845 , Global_OverlayColor1758_g70845 , Overlay_Mask269_g70845);
				half3 Final_Albedo359_g70845 = lerpResult336_g70845;
				float3 temp_cast_6 = (1.0).xxx;
				float vertexToFrag11_g70889 = packedInput.ase_texcoord4.w;
				float3 lerpResult2945_g70845 = lerp( (_VertexOcclusionColor).rgb , temp_cast_6 , vertexToFrag11_g70889);
				float3 Vertex_Occlusion648_g70845 = lerpResult2945_g70845;
				
				float3 unpack4112_g70845 = UnpackNormalScale( tex2D( _MainNormalTex, Main_UVs15_g70845 ), _MainNormalValue );
				unpack4112_g70845.z = lerp( 1, unpack4112_g70845.z, saturate(_MainNormalValue) );
				half3 Main_Normal137_g70845 = unpack4112_g70845;
				float3 temp_output_13_0_g70856 = Main_Normal137_g70845;
				float3 switchResult12_g70856 = (((isFrontFace>0)?(temp_output_13_0_g70856):(( temp_output_13_0_g70856 * _render_normals ))));
				half3 Blend_Normal312_g70845 = switchResult12_g70856;
				half3 Final_Normal366_g70845 = Blend_Normal312_g70845;
				
				float3 hdEmission4189_g70845 = ASEGetEmissionHDRColor(_EmissiveColor.rgb,_EmissiveIntensityParams.x,_EmissiveExposureValue,GetInverseCurrentExposureMultiplier());
				half2 Emissive_UVs2468_g70845 = ( ( packedInput.ase_texcoord3.xy * (_EmissiveUVs).xy ) + (_EmissiveUVs).zw );
				half Global_Extras_Emissive4203_g70845 = break89_g70850.r;
				float lerpResult4206_g70845 = lerp( 1.0 , Global_Extras_Emissive4203_g70845 , _GlobalEmissive);
				half3 Final_Emissive2476_g70845 = ( (( hdEmission4189_g70845 * tex2D( _EmissiveTex, Emissive_UVs2468_g70845 ) )).rgb * lerpResult4206_g70845 );
				
				half Main_Smoothness227_g70845 = ( tex2DNode35_g70845.a * _MainSmoothnessValue );
				half Blend_Smoothness314_g70845 = Main_Smoothness227_g70845;
				half Global_OverlaySmoothness311_g70845 = TVE_OverlaySmoothness;
				float lerpResult343_g70845 = lerp( Blend_Smoothness314_g70845 , Global_OverlaySmoothness311_g70845 , Overlay_Mask269_g70845);
				half Final_Smoothness371_g70845 = lerpResult343_g70845;
				half Global_Extras_Wetness305_g70845 = break89_g70850.g;
				float lerpResult3673_g70845 = lerp( 0.0 , Global_Extras_Wetness305_g70845 , _GlobalWetness);
				half Final_SmoothnessAndWetness4130_g70845 = saturate( ( Final_Smoothness371_g70845 + lerpResult3673_g70845 ) );
				
				float lerpResult240_g70845 = lerp( 1.0 , tex2DNode35_g70845.g , _MainOcclusionValue);
				half Main_Occlusion247_g70845 = lerpResult240_g70845;
				half Blend_Occlusion323_g70845 = Main_Occlusion247_g70845;
				
				float localCustomAlphaClip9_g70878 = ( 0.0 );
				float3 normalizeResult3971_g70845 = normalize( cross( ddy( ase_worldPos ) , ddx( ase_worldPos ) ) );
				float3 NormalsWS_Derivates3972_g70845 = normalizeResult3971_g70845;
				float dotResult3851_g70845 = dot( ViewDir_Normalized3963_g70845 , NormalsWS_Derivates3972_g70845 );
				float lerpResult3993_g70845 = lerp( 1.0 , saturate( abs( dotResult3851_g70845 ) ) , _FadeGlancingValue);
				half Fade_Glancing3853_g70845 = lerpResult3993_g70845;
				float vertexToFrag11_g70867 = packedInput.ase_texcoord5.w;
				half Fade_Camera_Mask5149_g70845 = 1.0;
				float lerpResult5141_g70845 = lerp( 1.0 , vertexToFrag11_g70867 , Fade_Camera_Mask5149_g70845);
				half Fade_Camera3743_g70845 = lerpResult5141_g70845;
				float temp_output_41_0_g70864 = ( Fade_Glancing3853_g70845 * Fade_Camera3743_g70845 );
				half Final_AlphaFade3727_g70845 = saturate( ( temp_output_41_0_g70864 + ( temp_output_41_0_g70864 * tex3D( TVE_ScreenTex3D, ( TVE_ScreenTexCoord * WorldPosition3905_g70845 ) ).r ) ) );
				float Main_Alpha316_g70845 = ( _MainColor.a * tex2DNode29_g70845.a );
				half Global_Extras_Alpha1033_g70845 = saturate( break89_g70850.a );
				float lerpResult5154_g70845 = lerp( 0.0 , Global_MeshVariation5104_g70845 , _AlphaVariationValue);
				half Global_Alpha_Variation5158_g70845 = lerpResult5154_g70845;
				half AlphaTreshold2132_g70845 = _AlphaClipValue;
				half Global_Alpha_Mask4546_g70845 = 1.0;
				float lerpResult5203_g70845 = lerp( 1.0 , ( ( Global_Extras_Alpha1033_g70845 - Global_Alpha_Variation5158_g70845 ) + AlphaTreshold2132_g70845 ) , ( Global_Alpha_Mask4546_g70845 * _GlobalAlpha ));
				float lerpResult16_g70919 = lerp( 1.0 , lerpResult5203_g70845 , TVE_Enabled);
				half Global_Alpha315_g70845 = lerpResult16_g70919;
				half Final_Alpha3754_g70845 = ( ( Main_Alpha316_g70845 * Global_Alpha315_g70845 ) - ( AlphaTreshold2132_g70845 - 0.5 ) );
				float temp_output_661_0_g70845 = ( Final_AlphaFade3727_g70845 * Final_Alpha3754_g70845 );
				float temp_output_3_0_g70865 = temp_output_661_0_g70845;
				half Offest27_g70865 = 0.5;
				half Feather30_g70865 = 0.5;
				float temp_output_3_0_g70878 = ( ( ( temp_output_3_0_g70865 - Offest27_g70865 ) / ( max( fwidth( temp_output_3_0_g70865 ) , 0.001 ) + Feather30_g70865 ) ) + Offest27_g70865 );
				float Alpha9_g70878 = temp_output_3_0_g70878;
				float temp_output_15_0_g70878 = 0.5;
				float Treshold9_g70878 = temp_output_15_0_g70878;
				{
				#if TVE_FEATURE_CLIP
				clip(Alpha9_g70878 - Treshold9_g70878);
				#endif
				}
				half Final_Clip914_g70845 = Alpha9_g70878;
				
				half Subsurface_HD1276_g70845 = ( 1.0 - ( Subsurface_Intensity1752_g70845 * Subsurface_Mask1557_g70845 ) );
				
				surfaceDescription.Albedo = ( Final_Albedo359_g70845 * Vertex_Occlusion648_g70845 );
				surfaceDescription.Normal = Final_Normal366_g70845;
				surfaceDescription.BentNormal = float3( 0, 0, 1 );
				surfaceDescription.CoatMask = 0;
				surfaceDescription.Metallic = 0;

				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceDescription.Specular = 0;
				#endif

				surfaceDescription.Emission = Final_Emissive2476_g70845;
				surfaceDescription.Smoothness = Final_SmoothnessAndWetness4130_g70845;
				surfaceDescription.Occlusion = Blend_Occlusion323_g70845;
				surfaceDescription.Alpha = Final_Clip914_g70845;

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
				surfaceDescription.Thickness = Subsurface_HD1276_g70845;
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
				surfaceDescription.DiffusionProfile = _SubsurfaceDiffusion;
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

			#define _MATERIAL_FEATURE_TRANSMISSION 1
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
			half4 _MainColor;
			half4 _ColorsMaskRemap;
			half4 _SubsurfaceMaskRemap;
			half4 _VertexOcclusionRemap;
			float4 _GradientMaskRemap;
			float4 _SubsurfaceDiffusion_asset;
			float4 _MaxBoundsInfo;
			float4 _SubsurfaceDiffusion_Asset;
			float4 _Color;
			half4 _GradientColorTwo;
			half4 _GradientColorOne;
			half4 _MainUVs;
			half4 _OverlayMaskRemap;
			half4 _SubsurfaceColor;
			half4 _VertexOcclusionColor;
			half4 _AlphaMaskRemap;
			float4 _EmissiveIntensityParams;
			half4 _EmissiveColor;
			half4 _EmissiveUVs;
			float4 _NoiseMaskRemap;
			half4 _DetailBlendRemap;
			half3 _render_normals;
			half _VertexOcclusionMinValue;
			float _MotionScale_32;
			half _MotionFacingValue;
			half _MotionValue_20;
			half _EmissiveExposureValue;
			half _MotionAmplitude_20;
			half _GlobalEmissive;
			half _MainSmoothnessValue;
			half _GlobalWetness;
			half _MotionSpeed_20;
			half _MotionVariation_20;
			half _MotionScale_20;
			half _InteractionMaskValue;
			half _InteractionAmplitude;
			half _VertexDynamicMode;
			half _MainOcclusionValue;
			half _MotionVariation_10;
			float _MotionSpeed_10;
			half _FadeGlancingValue;
			float _MotionScale_10;
			half _FadeCameraValue;
			half _MotionAmplitude_10;
			half _LayerMotionValue;
			float _MotionVariation_32;
			float _MotionSpeed_32;
			half _MotionNormalValue;
			half _MotionValue_30;
			half _MainNormalValue;
			half _OverlayMaskMaxValue;
			half _OverlayMaskMinValue;
			half _OverlayVariationValue;
			half _LayerExtrasValue;
			half _ExtrasPositionMode;
			half _GlobalOverlay;
			half _SubsurfaceMaskMaxValue;
			half _SubsurfaceMaskMinValue;
			half _SubsurfaceValue;
			half _ColorsMaskMaxValue;
			half _ColorsMaskMinValue;
			half _ColorsVariationValue;
			half _GlobalColors;
			half _LayerColorsValue;
			half _ColorsPositionMode;
			half _VertexPivotMode;
			half _GradientMaxValue;
			half _GradientMinValue;
			half _GlobalSize;
			half _LayerVertexValue;
			half _VertexDataMode;
			half _VertexOcclusionMaxValue;
			half _MotionAmplitude_32;
			half _render_cull;
			half _RenderSSR;
			half _RenderDirect;
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
			half _CategorySubsurface;
			half _SubsurfaceNormalValue;
			half _SpaceMotionGlobals;
			half _SubsurfaceShadowValue;
			half _RenderCoverage;
			half _RenderPriority;
			float _SubsurfaceDiffusion;
			half _VertexRollingMode;
			half _Cutoff;
			half _SubsurfaceScatteringValue;
			half _render_dst;
			half _IsSubsurfaceShader;
			half _render_zw;
			half _render_src;
			half _IsLeafShader;
			half _EmissiveFlagMode;
			half _subsurface_shadow;
			half _RenderClip;
			half _MessageMotionVariation;
			half _CategoryRender;
			half _SpaceGlobalPosition;
			half _AlphaVariationValue;
			half _RenderCull;
			half _SubsurfaceDirectValue;
			half _RenderZWrite;
			half _SubsurfaceAmbientValue;
			half _RenderQueue;
			half _SubsurfaceAngleValue;
			half _AlphaClipValue;
			half _VertexMasksMode;
			half _LayerReactValue;
			half _DetailBlendMode;
			half _MessageGlobalsVariation;
			half _VertexVariationMode;
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
			half _RenderDecals;
			half _GlobalAlpha;
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
			half4 TVE_FlutterParams;
			half TVE_MotionFadeEnd;
			half TVE_MotionFadeStart;
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
			half4 TVE_ExtrasParams;
			TEXTURE2D_ARRAY(TVE_ExtrasTex);
			half4 TVE_ExtrasCoords;
			float TVE_ExtrasUsage[10];


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
			#define ASE_NEEDS_FRAG_WORLD_VIEW_DIR
			#define ASE_NEEDS_FRAG_RELATIVE_WORLD_POS
			#pragma shader_feature_local TVE_FEATURE_CLIP
			#pragma shader_feature_local TVE_FEATURE_BATCHING
			//TVE Pipeline Defines
			#define THE_VEGETATION_ENGINE
			#define TVE_IS_HD_PIPELINE
			//TVE HD Pipeline Defines
			#pragma shader_feature_local _DISABLE_DECALS
			#pragma shader_feature_local _DISABLE_SSR
			//TVE Shader Type Defines
			#define TVE_IS_VEGETATION_SHADER
			//TVE Injection Defines
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END


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
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
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

				float3 VertexPosition3588_g70845 = inputMesh.positionOS;
				half3 Mesh_PivotsOS2291_g70845 = half3(0,0,0);
				float3 temp_output_2283_0_g70845 = ( VertexPosition3588_g70845 - Mesh_PivotsOS2291_g70845 );
				half3 VertexPos40_g70921 = temp_output_2283_0_g70845;
				float3 appendResult74_g70921 = (float3(VertexPos40_g70921.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g70921 = appendResult74_g70921;
				float3 break84_g70921 = VertexPos40_g70921;
				float3 appendResult81_g70921 = (float3(0.0 , break84_g70921.y , break84_g70921.z));
				half3 VertexPosOtherAxis82_g70921 = appendResult81_g70921;
				float4 temp_output_91_19_g70881 = TVE_MotionCoords;
				float3 localObjectPosition_UNITY_MATRIX_M14_g70912 = ObjectPosition_UNITY_MATRIX_M();
				float3 appendResult60_g70870 = (float3(inputMesh.ase_texcoord3.x , inputMesh.ase_texcoord3.z , inputMesh.ase_texcoord3.y));
				half3 Mesh_PivotsData2831_g70845 = ( appendResult60_g70870 * _VertexPivotMode );
				float3 temp_output_122_0_g70912 = Mesh_PivotsData2831_g70845;
				float3 PivotsOnly105_g70912 = (mul( GetObjectToWorldMatrix(), float4( temp_output_122_0_g70912 , 0.0 ) ).xyz).xyz;
				#ifdef SHADEROPTIONS_CAMERA_RELATIVE_RENDERING
				float3 staticSwitch13_g70912 = ( ( localObjectPosition_UNITY_MATRIX_M14_g70912 + PivotsOnly105_g70912 ) + _WorldSpaceCameraPos );
				#else
				float3 staticSwitch13_g70912 = ( localObjectPosition_UNITY_MATRIX_M14_g70912 + PivotsOnly105_g70912 );
				#endif
				half3 ObjectData20_g70913 = staticSwitch13_g70912;
				float3 ase_worldPos = GetAbsolutePositionWS( TransformObjectToWorld( (inputMesh.positionOS).xyz ) );
				half3 WorldData19_g70913 = ase_worldPos;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g70913 = WorldData19_g70913;
				#else
				float3 staticSwitch14_g70913 = ObjectData20_g70913;
				#endif
				float3 temp_output_114_0_g70912 = staticSwitch14_g70913;
				float3 vertexToFrag4224_g70845 = temp_output_114_0_g70912;
				half3 ObjectData20_g70886 = vertexToFrag4224_g70845;
				float3 vertexToFrag3890_g70845 = ase_worldPos;
				half3 WorldData19_g70886 = vertexToFrag3890_g70845;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g70886 = WorldData19_g70886;
				#else
				float3 staticSwitch14_g70886 = ObjectData20_g70886;
				#endif
				float3 ObjectPosition4223_g70845 = staticSwitch14_g70886;
				half2 UV94_g70881 = ( (temp_output_91_19_g70881).zw + ( (temp_output_91_19_g70881).xy * (ObjectPosition4223_g70845).xz ) );
				float temp_output_84_0_g70881 = _LayerMotionValue;
				float4 lerpResult107_g70881 = lerp( TVE_MotionParams , saturate( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_MotionTex, sampler_linear_repeat, UV94_g70881,temp_output_84_0_g70881, 0.0 ) ) , TVE_MotionUsage[(int)temp_output_84_0_g70881]);
				half4 Global_Motion_Params3909_g70845 = lerpResult107_g70881;
				float4 break322_g70888 = Global_Motion_Params3909_g70845;
				float3 appendResult397_g70888 = (float3(break322_g70888.x , 0.0 , break322_g70888.y));
				float3 temp_output_398_0_g70888 = (appendResult397_g70888*2.0 + -1.0);
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				half2 Global_MotionDirectionOS39_g70845 = (( mul( GetWorldToObjectMatrix(), float4( temp_output_398_0_g70888 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_DirectionOS358_g70917 = Global_MotionDirectionOS39_g70845;
				half Mesh_Height1524_g70845 = inputMesh.ase_color.a;
				half Mesh_Height114_g70872 = Mesh_Height1524_g70845;
				half ObjectData20_g70873 = ( Mesh_Height114_g70872 * 2.0 );
				float enc62_g70871 = inputMesh.ase_texcoord.w;
				float2 localDecodeFloatToVector262_g70871 = DecodeFloatToVector2( enc62_g70871 );
				float2 break63_g70871 = ( localDecodeFloatToVector262_g70871 * 100.0 );
				float Bounds_Height5230_g70845 = break63_g70871.x;
				float Bounds_Height117_g70872 = Bounds_Height5230_g70845;
				half WorldData19_g70873 = ( ( Mesh_Height114_g70872 * Mesh_Height114_g70872 ) * Bounds_Height117_g70872 * 2.0 );
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g70873 = WorldData19_g70873;
				#else
				float staticSwitch14_g70873 = ObjectData20_g70873;
				#endif
				half Motion_10_Mask5242_g70845 = staticSwitch14_g70873;
				half Wind_Power369_g70888 = break322_g70888.z;
				half Global_MotionPower2223_g70845 = Wind_Power369_g70888;
				half3 Input_Position419_g70891 = -ObjectPosition4223_g70845;
				half2 Global_MotionDirectionWS4683_g70845 = (temp_output_398_0_g70888).xz;
				half2 Input_DirectionWS423_g70891 = Global_MotionDirectionWS4683_g70845;
				float Motion_Scale287_g70891 = ( _MotionScale_10 + 0.2 );
				half Global_Scale448_g70891 = TVE_NoiseParams.x;
				half Input_Speed62_g70891 = _MotionSpeed_10;
				half Global_Speed449_g70891 = TVE_NoiseParams.y;
				float mulTime426_g70891 = _TimeParameters.x * ( Input_Speed62_g70891 * Global_Speed449_g70891 );
				half Global_DistScale561_g70891 = TVE_NoiseParams.w;
				float3 break461_g70891 = ( Input_Position419_g70891 * Global_DistScale561_g70891 );
				half Global_DistAmplitude559_g70891 = TVE_NoiseParams.z;
				float Noise_Distortion469_g70891 = ( sin( ( break461_g70891.x + break461_g70891.z ) ) * Global_DistAmplitude559_g70891 );
				float3 break111_g70874 = ObjectPosition4223_g70845;
				half Global_DynamicMode5112_g70845 = _VertexDynamicMode;
				half Input_DynamicMode120_g70874 = Global_DynamicMode5112_g70845;
				float Mesh_Variation16_g70845 = inputMesh.ase_color.r;
				half Input_Variation124_g70874 = Mesh_Variation16_g70845;
				half ObjectData20_g70875 = frac( ( ( ( break111_g70874.x + break111_g70874.y + break111_g70874.z ) * ( 1.0 - Input_DynamicMode120_g70874 ) ) + Input_Variation124_g70874 ) );
				half WorldData19_g70875 = Input_Variation124_g70874;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g70875 = WorldData19_g70875;
				#else
				float staticSwitch14_g70875 = ObjectData20_g70875;
				#endif
				float clampResult129_g70874 = clamp( staticSwitch14_g70875 , 0.01 , 0.99 );
				half Global_MeshVariation5104_g70845 = clampResult129_g70874;
				half Motion_Variation284_g70891 = ( _MotionVariation_10 * Global_MeshVariation5104_g70845 );
				float2 temp_output_425_0_g70891 = ( ( (Input_Position419_g70891).xz * Input_DirectionWS423_g70891 * Motion_Scale287_g70891 * Global_Scale448_g70891 ) + ( mulTime426_g70891 + Noise_Distortion469_g70891 + Motion_Variation284_g70891 ) );
				float2 break500_g70891 = ( temp_output_425_0_g70891 * 0.1178 );
				float2 break494_g70891 = ( temp_output_425_0_g70891 * 0.1742 );
				half Input_WindPower327_g70891 = Global_MotionPower2223_g70845;
				float lerpResult430_g70891 = lerp( 1.4 , 0.4 , Input_WindPower327_g70891);
				half Global_MotionNoise34_g70845 = (pow( (( sin( ( break500_g70891.x + break500_g70891.y ) ) * sin( ( break494_g70891.x + break494_g70891.y ) ) )*0.4 + 0.6) , lerpResult430_g70891 )*1.2 + -0.2);
				half Motion_10_Amplitude2258_g70845 = ( _MotionAmplitude_10 * Motion_10_Mask5242_g70845 * Global_MotionPower2223_g70845 * Global_MotionNoise34_g70845 );
				half Input_BendingAmplitude376_g70917 = Motion_10_Amplitude2258_g70845;
				half Input_InteractionAmplitude58_g70917 = _InteractionAmplitude;
				half Input_MeshMotion_10321_g70917 = Motion_10_Mask5242_g70845;
				half Input_InteractionUseMask62_g70917 = _InteractionMaskValue;
				float lerpResult371_g70917 = lerp( 2.0 , Input_MeshMotion_10321_g70917 , Input_InteractionUseMask62_g70917);
				half ObjectData20_g70918 = lerpResult371_g70917;
				half WorldData19_g70918 = Input_MeshMotion_10321_g70917;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g70918 = WorldData19_g70918;
				#else
				float staticSwitch14_g70918 = ObjectData20_g70918;
				#endif
				half Motion_10_Interaction373_g70917 = ( Input_InteractionAmplitude58_g70917 * staticSwitch14_g70918 );
				half Global_InteractionMask66_g70845 = ( break322_g70888.w * break322_g70888.w );
				float Input_InteractionMask330_g70917 = Global_InteractionMask66_g70845;
				float lerpResult360_g70917 = lerp( Input_BendingAmplitude376_g70917 , Motion_10_Interaction373_g70917 , saturate( ( Input_InteractionAmplitude58_g70917 * Input_InteractionMask330_g70917 ) ));
				float2 break364_g70917 = ( Input_DirectionOS358_g70917 * lerpResult360_g70917 );
				half Motion_10_BendingZ190_g70845 = break364_g70917.y;
				half Angle44_g70921 = Motion_10_BendingZ190_g70845;
				half3 VertexPos40_g70920 = ( VertexPosRotationAxis50_g70921 + ( VertexPosOtherAxis82_g70921 * cos( Angle44_g70921 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g70921 ) * sin( Angle44_g70921 ) ) );
				float3 appendResult74_g70920 = (float3(0.0 , 0.0 , VertexPos40_g70920.z));
				half3 VertexPosRotationAxis50_g70920 = appendResult74_g70920;
				float3 break84_g70920 = VertexPos40_g70920;
				float3 appendResult81_g70920 = (float3(break84_g70920.x , break84_g70920.y , 0.0));
				half3 VertexPosOtherAxis82_g70920 = appendResult81_g70920;
				half Motion_10_BendingX216_g70845 = break364_g70917.x;
				half Angle44_g70920 = -Motion_10_BendingX216_g70845;
				half Input_Scale321_g70860 = _MotionScale_20;
				half Input_Variation330_g70860 = ( _MotionVariation_20 * Global_MeshVariation5104_g70845 );
				half Input_Speed62_g70860 = _MotionSpeed_20;
				float mulTime349_g70860 = _TimeParameters.x * Input_Speed62_g70860;
				float temp_output_302_0_g70860 = sin( ( ( ( ase_worldPos.x + ase_worldPos.y + ase_worldPos.z ) * Input_Scale321_g70860 ) + Input_Variation330_g70860 + mulTime349_g70860 ) );
				float enc59_g70871 = inputMesh.ase_texcoord.z;
				float2 localDecodeFloatToVector259_g70871 = DecodeFloatToVector2( enc59_g70871 );
				float2 break61_g70871 = localDecodeFloatToVector259_g70871;
				half Mesh_Motion_2060_g70845 = break61_g70871.x;
				half Mesh_Motion_20115_g70872 = Mesh_Motion_2060_g70845;
				float Bounds_Radius5231_g70845 = break63_g70871.y;
				float Bounds_Radius118_g70872 = Bounds_Radius5231_g70845;
				half Motion_20_Mask5243_g70845 = ( Mesh_Motion_20115_g70872 * Bounds_Radius118_g70872 );
				half3 Input_Position419_g70876 = VertexPosition3588_g70845;
				float3 normalizeResult518_g70876 = normalize( Input_Position419_g70876 );
				half2 Input_DirectionOS423_g70876 = Global_MotionDirectionOS39_g70845;
				float2 break521_g70876 = -Input_DirectionOS423_g70876;
				float3 appendResult522_g70876 = (float3(break521_g70876.x , 0.0 , break521_g70876.y));
				float dotResult519_g70876 = dot( normalizeResult518_g70876 , appendResult522_g70876 );
				half Input_Mask62_g70876 = _MotionFacingValue;
				float lerpResult524_g70876 = lerp( 1.0 , (dotResult519_g70876*0.5 + 0.5) , Input_Mask62_g70876);
				half ObjectData20_g70877 = lerpResult524_g70876;
				half WorldData19_g70877 = 1.0;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g70877 = WorldData19_g70877;
				#else
				float staticSwitch14_g70877 = ObjectData20_g70877;
				#endif
				half Motion_FacingMask5214_g70845 = staticSwitch14_g70877;
				half Motion_20_Amplitude4381_g70845 = ( _MotionAmplitude_20 * _MotionValue_20 * Motion_20_Mask5243_g70845 * Global_MotionPower2223_g70845 * Global_MotionNoise34_g70845 * Motion_FacingMask5214_g70845 );
				half Input_Amplitude58_g70860 = Motion_20_Amplitude4381_g70845;
				half2 Input_DirectionOS366_g70860 = Global_MotionDirectionOS39_g70845;
				float2 break371_g70860 = Input_DirectionOS366_g70860;
				float3 appendResult372_g70860 = (float3(break371_g70860.x , ( temp_output_302_0_g70860 * 0.1 ) , break371_g70860.y));
				half3 Motion_20_Squash4418_g70845 = ( ( (temp_output_302_0_g70860*0.2 + 1.0) * Input_Amplitude58_g70860 ) * appendResult372_g70860 );
				half Motion_Scale321_g70908 = _MotionScale_32;
				half Motion_Variation330_g70908 = ( _MotionVariation_32 * Global_MeshVariation5104_g70845 );
				half Input_Speed62_g70908 = _MotionSpeed_32;
				half Global_Speed350_g70908 = TVE_FlutterParams.y;
				float mulTime349_g70908 = _TimeParameters.x * ( Input_Speed62_g70908 * Global_Speed350_g70908 );
				half Mesh_Motion_30144_g70845 = break61_g70871.y;
				half Mesh_Motion_30116_g70872 = Mesh_Motion_30144_g70845;
				half Motion_30_Mask5244_g70845 = ( Mesh_Motion_30116_g70872 * 0.4 );
				float temp_output_7_0_g70869 = TVE_MotionFadeEnd;
				half Motion_FadeOut4005_g70845 = saturate( ( ( distance( ase_worldPos , _WorldSpaceCameraPos ) - temp_output_7_0_g70869 ) / ( TVE_MotionFadeStart - temp_output_7_0_g70869 ) ) );
				half Motion_30_Amplitude4960_g70845 = ( _MotionAmplitude_32 * _MotionValue_30 * Motion_30_Mask5244_g70845 * Global_MotionPower2223_g70845 * Global_MotionNoise34_g70845 * Motion_FacingMask5214_g70845 * Motion_FadeOut4005_g70845 );
				half Input_Amplitude58_g70908 = Motion_30_Amplitude4960_g70845;
				half Global_Power354_g70908 = TVE_FlutterParams.x;
				half Motion_Normal364_g70908 = _MotionNormalValue;
				float3 lerpResult370_g70908 = lerp( float3( 1,1,1 ) , inputMesh.normalOS , Motion_Normal364_g70908);
				half3 Motion_30_Details263_g70845 = ( ( sin( ( ( ( ase_worldPos.x + ase_worldPos.y + ase_worldPos.z ) * Motion_Scale321_g70908 ) + Motion_Variation330_g70908 + mulTime349_g70908 ) ) * Input_Amplitude58_g70908 * Global_Power354_g70908 ) * lerpResult370_g70908 );
				float3 Vertex_Motion_Object833_g70845 = ( ( ( VertexPosRotationAxis50_g70920 + ( VertexPosOtherAxis82_g70920 * cos( Angle44_g70920 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g70920 ) * sin( Angle44_g70920 ) ) ) + Motion_20_Squash4418_g70845 ) + Motion_30_Details263_g70845 );
				float3 temp_output_3474_0_g70845 = ( VertexPosition3588_g70845 - Mesh_PivotsOS2291_g70845 );
				float3 appendResult2043_g70845 = (float3(Motion_10_BendingX216_g70845 , 0.0 , Motion_10_BendingZ190_g70845));
				float3 Vertex_Motion_World1118_g70845 = ( ( ( temp_output_3474_0_g70845 + appendResult2043_g70845 ) + Motion_20_Squash4418_g70845 ) + Motion_30_Details263_g70845 );
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch4976_g70845 = Vertex_Motion_World1118_g70845;
				#else
				float3 staticSwitch4976_g70845 = ( Vertex_Motion_Object833_g70845 + ( _VertexDataMode * 0.0 ) );
				#endif
				float4 temp_output_94_19_g70904 = TVE_VertexCoords;
				half2 UV97_g70904 = ( (temp_output_94_19_g70904).zw + ( (temp_output_94_19_g70904).xy * (ObjectPosition4223_g70845).xz ) );
				float temp_output_84_0_g70904 = _LayerVertexValue;
				float4 lerpResult109_g70904 = lerp( TVE_VertexParams , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_VertexTex, sampler_linear_repeat, UV97_g70904,temp_output_84_0_g70904, 0.0 ) , TVE_VertexUsage[(int)temp_output_84_0_g70904]);
				half4 Global_Object_Params4173_g70845 = lerpResult109_g70904;
				half Global_VertexSize174_g70845 = saturate( Global_Object_Params4173_g70845.w );
				float lerpResult346_g70845 = lerp( 1.0 , Global_VertexSize174_g70845 , _GlobalSize);
				float3 appendResult3480_g70845 = (float3(lerpResult346_g70845 , lerpResult346_g70845 , lerpResult346_g70845));
				half3 ObjectData20_g70880 = appendResult3480_g70845;
				half3 _Vector11 = half3(1,1,1);
				half3 WorldData19_g70880 = _Vector11;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g70880 = WorldData19_g70880;
				#else
				float3 staticSwitch14_g70880 = ObjectData20_g70880;
				#endif
				half3 Vertex_Size1741_g70845 = staticSwitch14_g70880;
				half3 _Vector5 = half3(1,1,1);
				float3 Vertex_SizeFade1740_g70845 = _Vector5;
				half3 Grass_Perspective2661_g70845 = half3(0,0,0);
				float3 lerpResult16_g70879 = lerp( VertexPosition3588_g70845 , ( ( staticSwitch4976_g70845 * Vertex_Size1741_g70845 * Vertex_SizeFade1740_g70845 ) + Mesh_PivotsOS2291_g70845 + Grass_Perspective2661_g70845 ) , TVE_Enabled);
				float3 Final_VertexPosition890_g70845 = ( lerpResult16_g70879 + _DisableSRPBatcher );
				
				float temp_output_7_0_g70861 = TVE_CameraFadeStart;
				float lerpResult4755_g70845 = lerp( 1.0 , saturate( ( ( distance( ase_worldPos , _WorldSpaceCameraPos ) - temp_output_7_0_g70861 ) / ( TVE_CameraFadeEnd - temp_output_7_0_g70861 ) ) ) , _FadeCameraValue);
				float vertexToFrag11_g70867 = lerpResult4755_g70845;
				outputPackedVaryingsMeshToPS.ase_texcoord1.x = vertexToFrag11_g70867;
				outputPackedVaryingsMeshToPS.ase_texcoord1.yzw = vertexToFrag3890_g70845;
				outputPackedVaryingsMeshToPS.ase_texcoord3.xyz = vertexToFrag4224_g70845;
				
				outputPackedVaryingsMeshToPS.ase_texcoord2 = inputMesh.ase_texcoord;
				outputPackedVaryingsMeshToPS.ase_color = inputMesh.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				outputPackedVaryingsMeshToPS.ase_texcoord3.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue = Final_VertexPosition890_g70845;

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
				float localCustomAlphaClip9_g70878 = ( 0.0 );
				float3 normalizeResult2169_g70845 = normalize( V );
				float3 ViewDir_Normalized3963_g70845 = normalizeResult2169_g70845;
				float3 ase_worldPos = GetAbsolutePositionWS( positionRWS );
				float3 normalizeResult3971_g70845 = normalize( cross( ddy( ase_worldPos ) , ddx( ase_worldPos ) ) );
				float3 NormalsWS_Derivates3972_g70845 = normalizeResult3971_g70845;
				float dotResult3851_g70845 = dot( ViewDir_Normalized3963_g70845 , NormalsWS_Derivates3972_g70845 );
				float lerpResult3993_g70845 = lerp( 1.0 , saturate( abs( dotResult3851_g70845 ) ) , _FadeGlancingValue);
				half Fade_Glancing3853_g70845 = lerpResult3993_g70845;
				float vertexToFrag11_g70867 = packedInput.ase_texcoord1.x;
				half Fade_Camera_Mask5149_g70845 = 1.0;
				float lerpResult5141_g70845 = lerp( 1.0 , vertexToFrag11_g70867 , Fade_Camera_Mask5149_g70845);
				half Fade_Camera3743_g70845 = lerpResult5141_g70845;
				float temp_output_41_0_g70864 = ( Fade_Glancing3853_g70845 * Fade_Camera3743_g70845 );
				float3 vertexToFrag3890_g70845 = packedInput.ase_texcoord1.yzw;
				float3 WorldPosition3905_g70845 = vertexToFrag3890_g70845;
				half Final_AlphaFade3727_g70845 = saturate( ( temp_output_41_0_g70864 + ( temp_output_41_0_g70864 * tex3D( TVE_ScreenTex3D, ( TVE_ScreenTexCoord * WorldPosition3905_g70845 ) ).r ) ) );
				half2 Main_UVs15_g70845 = ( ( packedInput.ase_texcoord2.xy * (_MainUVs).xy ) + (_MainUVs).zw );
				float4 tex2DNode29_g70845 = tex2D( _MainAlbedoTex, Main_UVs15_g70845 );
				float Main_Alpha316_g70845 = ( _MainColor.a * tex2DNode29_g70845.a );
				float4 temp_output_93_19_g70850 = TVE_ExtrasCoords;
				float3 vertexToFrag4224_g70845 = packedInput.ase_texcoord3.xyz;
				half3 ObjectData20_g70886 = vertexToFrag4224_g70845;
				half3 WorldData19_g70886 = vertexToFrag3890_g70845;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g70886 = WorldData19_g70886;
				#else
				float3 staticSwitch14_g70886 = ObjectData20_g70886;
				#endif
				float3 ObjectPosition4223_g70845 = staticSwitch14_g70886;
				float3 lerpResult4827_g70845 = lerp( WorldPosition3905_g70845 , ObjectPosition4223_g70845 , _ExtrasPositionMode);
				half2 UV96_g70850 = ( (temp_output_93_19_g70850).zw + ( (temp_output_93_19_g70850).xy * (lerpResult4827_g70845).xz ) );
				float temp_output_84_0_g70850 = _LayerExtrasValue;
				float4 lerpResult109_g70850 = lerp( TVE_ExtrasParams , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_ExtrasTex, sampler_linear_repeat, UV96_g70850,temp_output_84_0_g70850, 0.0 ) , TVE_ExtrasUsage[(int)temp_output_84_0_g70850]);
				float4 break89_g70850 = lerpResult109_g70850;
				half Global_Extras_Alpha1033_g70845 = saturate( break89_g70850.a );
				float3 break111_g70874 = ObjectPosition4223_g70845;
				half Global_DynamicMode5112_g70845 = _VertexDynamicMode;
				half Input_DynamicMode120_g70874 = Global_DynamicMode5112_g70845;
				float Mesh_Variation16_g70845 = packedInput.ase_color.r;
				half Input_Variation124_g70874 = Mesh_Variation16_g70845;
				half ObjectData20_g70875 = frac( ( ( ( break111_g70874.x + break111_g70874.y + break111_g70874.z ) * ( 1.0 - Input_DynamicMode120_g70874 ) ) + Input_Variation124_g70874 ) );
				half WorldData19_g70875 = Input_Variation124_g70874;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g70875 = WorldData19_g70875;
				#else
				float staticSwitch14_g70875 = ObjectData20_g70875;
				#endif
				float clampResult129_g70874 = clamp( staticSwitch14_g70875 , 0.01 , 0.99 );
				half Global_MeshVariation5104_g70845 = clampResult129_g70874;
				float lerpResult5154_g70845 = lerp( 0.0 , Global_MeshVariation5104_g70845 , _AlphaVariationValue);
				half Global_Alpha_Variation5158_g70845 = lerpResult5154_g70845;
				half AlphaTreshold2132_g70845 = _AlphaClipValue;
				half Global_Alpha_Mask4546_g70845 = 1.0;
				float lerpResult5203_g70845 = lerp( 1.0 , ( ( Global_Extras_Alpha1033_g70845 - Global_Alpha_Variation5158_g70845 ) + AlphaTreshold2132_g70845 ) , ( Global_Alpha_Mask4546_g70845 * _GlobalAlpha ));
				float lerpResult16_g70919 = lerp( 1.0 , lerpResult5203_g70845 , TVE_Enabled);
				half Global_Alpha315_g70845 = lerpResult16_g70919;
				half Final_Alpha3754_g70845 = ( ( Main_Alpha316_g70845 * Global_Alpha315_g70845 ) - ( AlphaTreshold2132_g70845 - 0.5 ) );
				float temp_output_661_0_g70845 = ( Final_AlphaFade3727_g70845 * Final_Alpha3754_g70845 );
				float temp_output_3_0_g70865 = temp_output_661_0_g70845;
				half Offest27_g70865 = 0.5;
				half Feather30_g70865 = 0.5;
				float temp_output_3_0_g70878 = ( ( ( temp_output_3_0_g70865 - Offest27_g70865 ) / ( max( fwidth( temp_output_3_0_g70865 ) , 0.001 ) + Feather30_g70865 ) ) + Offest27_g70865 );
				float Alpha9_g70878 = temp_output_3_0_g70878;
				float temp_output_15_0_g70878 = 0.5;
				float Treshold9_g70878 = temp_output_15_0_g70878;
				{
				#if TVE_FEATURE_CLIP
				clip(Alpha9_g70878 - Treshold9_g70878);
				#endif
				}
				half Final_Clip914_g70845 = Alpha9_g70878;
				
				surfaceDescription.Alpha = Final_Clip914_g70845;

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

			#define _MATERIAL_FEATURE_TRANSMISSION 1
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
			half4 _MainColor;
			half4 _ColorsMaskRemap;
			half4 _SubsurfaceMaskRemap;
			half4 _VertexOcclusionRemap;
			float4 _GradientMaskRemap;
			float4 _SubsurfaceDiffusion_asset;
			float4 _MaxBoundsInfo;
			float4 _SubsurfaceDiffusion_Asset;
			float4 _Color;
			half4 _GradientColorTwo;
			half4 _GradientColorOne;
			half4 _MainUVs;
			half4 _OverlayMaskRemap;
			half4 _SubsurfaceColor;
			half4 _VertexOcclusionColor;
			half4 _AlphaMaskRemap;
			float4 _EmissiveIntensityParams;
			half4 _EmissiveColor;
			half4 _EmissiveUVs;
			float4 _NoiseMaskRemap;
			half4 _DetailBlendRemap;
			half3 _render_normals;
			half _VertexOcclusionMinValue;
			float _MotionScale_32;
			half _MotionFacingValue;
			half _MotionValue_20;
			half _EmissiveExposureValue;
			half _MotionAmplitude_20;
			half _GlobalEmissive;
			half _MainSmoothnessValue;
			half _GlobalWetness;
			half _MotionSpeed_20;
			half _MotionVariation_20;
			half _MotionScale_20;
			half _InteractionMaskValue;
			half _InteractionAmplitude;
			half _VertexDynamicMode;
			half _MainOcclusionValue;
			half _MotionVariation_10;
			float _MotionSpeed_10;
			half _FadeGlancingValue;
			float _MotionScale_10;
			half _FadeCameraValue;
			half _MotionAmplitude_10;
			half _LayerMotionValue;
			float _MotionVariation_32;
			float _MotionSpeed_32;
			half _MotionNormalValue;
			half _MotionValue_30;
			half _MainNormalValue;
			half _OverlayMaskMaxValue;
			half _OverlayMaskMinValue;
			half _OverlayVariationValue;
			half _LayerExtrasValue;
			half _ExtrasPositionMode;
			half _GlobalOverlay;
			half _SubsurfaceMaskMaxValue;
			half _SubsurfaceMaskMinValue;
			half _SubsurfaceValue;
			half _ColorsMaskMaxValue;
			half _ColorsMaskMinValue;
			half _ColorsVariationValue;
			half _GlobalColors;
			half _LayerColorsValue;
			half _ColorsPositionMode;
			half _VertexPivotMode;
			half _GradientMaxValue;
			half _GradientMinValue;
			half _GlobalSize;
			half _LayerVertexValue;
			half _VertexDataMode;
			half _VertexOcclusionMaxValue;
			half _MotionAmplitude_32;
			half _render_cull;
			half _RenderSSR;
			half _RenderDirect;
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
			half _CategorySubsurface;
			half _SubsurfaceNormalValue;
			half _SpaceMotionGlobals;
			half _SubsurfaceShadowValue;
			half _RenderCoverage;
			half _RenderPriority;
			float _SubsurfaceDiffusion;
			half _VertexRollingMode;
			half _Cutoff;
			half _SubsurfaceScatteringValue;
			half _render_dst;
			half _IsSubsurfaceShader;
			half _render_zw;
			half _render_src;
			half _IsLeafShader;
			half _EmissiveFlagMode;
			half _subsurface_shadow;
			half _RenderClip;
			half _MessageMotionVariation;
			half _CategoryRender;
			half _SpaceGlobalPosition;
			half _AlphaVariationValue;
			half _RenderCull;
			half _SubsurfaceDirectValue;
			half _RenderZWrite;
			half _SubsurfaceAmbientValue;
			half _RenderQueue;
			half _SubsurfaceAngleValue;
			half _AlphaClipValue;
			half _VertexMasksMode;
			half _LayerReactValue;
			half _DetailBlendMode;
			half _MessageGlobalsVariation;
			half _VertexVariationMode;
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
			half _RenderDecals;
			half _GlobalAlpha;
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
			half4 TVE_FlutterParams;
			half TVE_MotionFadeEnd;
			half TVE_MotionFadeStart;
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
			half4 TVE_ExtrasParams;
			TEXTURE2D_ARRAY(TVE_ExtrasTex);
			half4 TVE_ExtrasCoords;
			float TVE_ExtrasUsage[10];


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
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_VIEW_DIR
			#define ASE_NEEDS_FRAG_RELATIVE_WORLD_POS
			#pragma shader_feature_local TVE_FEATURE_CLIP
			#pragma shader_feature_local TVE_FEATURE_BATCHING
			//TVE Pipeline Defines
			#define THE_VEGETATION_ENGINE
			#define TVE_IS_HD_PIPELINE
			//TVE HD Pipeline Defines
			#pragma shader_feature_local _DISABLE_DECALS
			#pragma shader_feature_local _DISABLE_SSR
			//TVE Shader Type Defines
			#define TVE_IS_VEGETATION_SHADER
			//TVE Injection Defines
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END


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
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
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

				float3 VertexPosition3588_g70845 = inputMesh.positionOS;
				half3 Mesh_PivotsOS2291_g70845 = half3(0,0,0);
				float3 temp_output_2283_0_g70845 = ( VertexPosition3588_g70845 - Mesh_PivotsOS2291_g70845 );
				half3 VertexPos40_g70921 = temp_output_2283_0_g70845;
				float3 appendResult74_g70921 = (float3(VertexPos40_g70921.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g70921 = appendResult74_g70921;
				float3 break84_g70921 = VertexPos40_g70921;
				float3 appendResult81_g70921 = (float3(0.0 , break84_g70921.y , break84_g70921.z));
				half3 VertexPosOtherAxis82_g70921 = appendResult81_g70921;
				float4 temp_output_91_19_g70881 = TVE_MotionCoords;
				float3 localObjectPosition_UNITY_MATRIX_M14_g70912 = ObjectPosition_UNITY_MATRIX_M();
				float3 appendResult60_g70870 = (float3(inputMesh.ase_texcoord3.x , inputMesh.ase_texcoord3.z , inputMesh.ase_texcoord3.y));
				half3 Mesh_PivotsData2831_g70845 = ( appendResult60_g70870 * _VertexPivotMode );
				float3 temp_output_122_0_g70912 = Mesh_PivotsData2831_g70845;
				float3 PivotsOnly105_g70912 = (mul( GetObjectToWorldMatrix(), float4( temp_output_122_0_g70912 , 0.0 ) ).xyz).xyz;
				#ifdef SHADEROPTIONS_CAMERA_RELATIVE_RENDERING
				float3 staticSwitch13_g70912 = ( ( localObjectPosition_UNITY_MATRIX_M14_g70912 + PivotsOnly105_g70912 ) + _WorldSpaceCameraPos );
				#else
				float3 staticSwitch13_g70912 = ( localObjectPosition_UNITY_MATRIX_M14_g70912 + PivotsOnly105_g70912 );
				#endif
				half3 ObjectData20_g70913 = staticSwitch13_g70912;
				float3 ase_worldPos = GetAbsolutePositionWS( TransformObjectToWorld( (inputMesh.positionOS).xyz ) );
				half3 WorldData19_g70913 = ase_worldPos;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g70913 = WorldData19_g70913;
				#else
				float3 staticSwitch14_g70913 = ObjectData20_g70913;
				#endif
				float3 temp_output_114_0_g70912 = staticSwitch14_g70913;
				float3 vertexToFrag4224_g70845 = temp_output_114_0_g70912;
				half3 ObjectData20_g70886 = vertexToFrag4224_g70845;
				float3 vertexToFrag3890_g70845 = ase_worldPos;
				half3 WorldData19_g70886 = vertexToFrag3890_g70845;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g70886 = WorldData19_g70886;
				#else
				float3 staticSwitch14_g70886 = ObjectData20_g70886;
				#endif
				float3 ObjectPosition4223_g70845 = staticSwitch14_g70886;
				half2 UV94_g70881 = ( (temp_output_91_19_g70881).zw + ( (temp_output_91_19_g70881).xy * (ObjectPosition4223_g70845).xz ) );
				float temp_output_84_0_g70881 = _LayerMotionValue;
				float4 lerpResult107_g70881 = lerp( TVE_MotionParams , saturate( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_MotionTex, sampler_linear_repeat, UV94_g70881,temp_output_84_0_g70881, 0.0 ) ) , TVE_MotionUsage[(int)temp_output_84_0_g70881]);
				half4 Global_Motion_Params3909_g70845 = lerpResult107_g70881;
				float4 break322_g70888 = Global_Motion_Params3909_g70845;
				float3 appendResult397_g70888 = (float3(break322_g70888.x , 0.0 , break322_g70888.y));
				float3 temp_output_398_0_g70888 = (appendResult397_g70888*2.0 + -1.0);
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				half2 Global_MotionDirectionOS39_g70845 = (( mul( GetWorldToObjectMatrix(), float4( temp_output_398_0_g70888 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_DirectionOS358_g70917 = Global_MotionDirectionOS39_g70845;
				half Mesh_Height1524_g70845 = inputMesh.ase_color.a;
				half Mesh_Height114_g70872 = Mesh_Height1524_g70845;
				half ObjectData20_g70873 = ( Mesh_Height114_g70872 * 2.0 );
				float enc62_g70871 = inputMesh.ase_texcoord.w;
				float2 localDecodeFloatToVector262_g70871 = DecodeFloatToVector2( enc62_g70871 );
				float2 break63_g70871 = ( localDecodeFloatToVector262_g70871 * 100.0 );
				float Bounds_Height5230_g70845 = break63_g70871.x;
				float Bounds_Height117_g70872 = Bounds_Height5230_g70845;
				half WorldData19_g70873 = ( ( Mesh_Height114_g70872 * Mesh_Height114_g70872 ) * Bounds_Height117_g70872 * 2.0 );
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g70873 = WorldData19_g70873;
				#else
				float staticSwitch14_g70873 = ObjectData20_g70873;
				#endif
				half Motion_10_Mask5242_g70845 = staticSwitch14_g70873;
				half Wind_Power369_g70888 = break322_g70888.z;
				half Global_MotionPower2223_g70845 = Wind_Power369_g70888;
				half3 Input_Position419_g70891 = -ObjectPosition4223_g70845;
				half2 Global_MotionDirectionWS4683_g70845 = (temp_output_398_0_g70888).xz;
				half2 Input_DirectionWS423_g70891 = Global_MotionDirectionWS4683_g70845;
				float Motion_Scale287_g70891 = ( _MotionScale_10 + 0.2 );
				half Global_Scale448_g70891 = TVE_NoiseParams.x;
				half Input_Speed62_g70891 = _MotionSpeed_10;
				half Global_Speed449_g70891 = TVE_NoiseParams.y;
				float mulTime426_g70891 = _TimeParameters.x * ( Input_Speed62_g70891 * Global_Speed449_g70891 );
				half Global_DistScale561_g70891 = TVE_NoiseParams.w;
				float3 break461_g70891 = ( Input_Position419_g70891 * Global_DistScale561_g70891 );
				half Global_DistAmplitude559_g70891 = TVE_NoiseParams.z;
				float Noise_Distortion469_g70891 = ( sin( ( break461_g70891.x + break461_g70891.z ) ) * Global_DistAmplitude559_g70891 );
				float3 break111_g70874 = ObjectPosition4223_g70845;
				half Global_DynamicMode5112_g70845 = _VertexDynamicMode;
				half Input_DynamicMode120_g70874 = Global_DynamicMode5112_g70845;
				float Mesh_Variation16_g70845 = inputMesh.ase_color.r;
				half Input_Variation124_g70874 = Mesh_Variation16_g70845;
				half ObjectData20_g70875 = frac( ( ( ( break111_g70874.x + break111_g70874.y + break111_g70874.z ) * ( 1.0 - Input_DynamicMode120_g70874 ) ) + Input_Variation124_g70874 ) );
				half WorldData19_g70875 = Input_Variation124_g70874;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g70875 = WorldData19_g70875;
				#else
				float staticSwitch14_g70875 = ObjectData20_g70875;
				#endif
				float clampResult129_g70874 = clamp( staticSwitch14_g70875 , 0.01 , 0.99 );
				half Global_MeshVariation5104_g70845 = clampResult129_g70874;
				half Motion_Variation284_g70891 = ( _MotionVariation_10 * Global_MeshVariation5104_g70845 );
				float2 temp_output_425_0_g70891 = ( ( (Input_Position419_g70891).xz * Input_DirectionWS423_g70891 * Motion_Scale287_g70891 * Global_Scale448_g70891 ) + ( mulTime426_g70891 + Noise_Distortion469_g70891 + Motion_Variation284_g70891 ) );
				float2 break500_g70891 = ( temp_output_425_0_g70891 * 0.1178 );
				float2 break494_g70891 = ( temp_output_425_0_g70891 * 0.1742 );
				half Input_WindPower327_g70891 = Global_MotionPower2223_g70845;
				float lerpResult430_g70891 = lerp( 1.4 , 0.4 , Input_WindPower327_g70891);
				half Global_MotionNoise34_g70845 = (pow( (( sin( ( break500_g70891.x + break500_g70891.y ) ) * sin( ( break494_g70891.x + break494_g70891.y ) ) )*0.4 + 0.6) , lerpResult430_g70891 )*1.2 + -0.2);
				half Motion_10_Amplitude2258_g70845 = ( _MotionAmplitude_10 * Motion_10_Mask5242_g70845 * Global_MotionPower2223_g70845 * Global_MotionNoise34_g70845 );
				half Input_BendingAmplitude376_g70917 = Motion_10_Amplitude2258_g70845;
				half Input_InteractionAmplitude58_g70917 = _InteractionAmplitude;
				half Input_MeshMotion_10321_g70917 = Motion_10_Mask5242_g70845;
				half Input_InteractionUseMask62_g70917 = _InteractionMaskValue;
				float lerpResult371_g70917 = lerp( 2.0 , Input_MeshMotion_10321_g70917 , Input_InteractionUseMask62_g70917);
				half ObjectData20_g70918 = lerpResult371_g70917;
				half WorldData19_g70918 = Input_MeshMotion_10321_g70917;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g70918 = WorldData19_g70918;
				#else
				float staticSwitch14_g70918 = ObjectData20_g70918;
				#endif
				half Motion_10_Interaction373_g70917 = ( Input_InteractionAmplitude58_g70917 * staticSwitch14_g70918 );
				half Global_InteractionMask66_g70845 = ( break322_g70888.w * break322_g70888.w );
				float Input_InteractionMask330_g70917 = Global_InteractionMask66_g70845;
				float lerpResult360_g70917 = lerp( Input_BendingAmplitude376_g70917 , Motion_10_Interaction373_g70917 , saturate( ( Input_InteractionAmplitude58_g70917 * Input_InteractionMask330_g70917 ) ));
				float2 break364_g70917 = ( Input_DirectionOS358_g70917 * lerpResult360_g70917 );
				half Motion_10_BendingZ190_g70845 = break364_g70917.y;
				half Angle44_g70921 = Motion_10_BendingZ190_g70845;
				half3 VertexPos40_g70920 = ( VertexPosRotationAxis50_g70921 + ( VertexPosOtherAxis82_g70921 * cos( Angle44_g70921 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g70921 ) * sin( Angle44_g70921 ) ) );
				float3 appendResult74_g70920 = (float3(0.0 , 0.0 , VertexPos40_g70920.z));
				half3 VertexPosRotationAxis50_g70920 = appendResult74_g70920;
				float3 break84_g70920 = VertexPos40_g70920;
				float3 appendResult81_g70920 = (float3(break84_g70920.x , break84_g70920.y , 0.0));
				half3 VertexPosOtherAxis82_g70920 = appendResult81_g70920;
				half Motion_10_BendingX216_g70845 = break364_g70917.x;
				half Angle44_g70920 = -Motion_10_BendingX216_g70845;
				half Input_Scale321_g70860 = _MotionScale_20;
				half Input_Variation330_g70860 = ( _MotionVariation_20 * Global_MeshVariation5104_g70845 );
				half Input_Speed62_g70860 = _MotionSpeed_20;
				float mulTime349_g70860 = _TimeParameters.x * Input_Speed62_g70860;
				float temp_output_302_0_g70860 = sin( ( ( ( ase_worldPos.x + ase_worldPos.y + ase_worldPos.z ) * Input_Scale321_g70860 ) + Input_Variation330_g70860 + mulTime349_g70860 ) );
				float enc59_g70871 = inputMesh.ase_texcoord.z;
				float2 localDecodeFloatToVector259_g70871 = DecodeFloatToVector2( enc59_g70871 );
				float2 break61_g70871 = localDecodeFloatToVector259_g70871;
				half Mesh_Motion_2060_g70845 = break61_g70871.x;
				half Mesh_Motion_20115_g70872 = Mesh_Motion_2060_g70845;
				float Bounds_Radius5231_g70845 = break63_g70871.y;
				float Bounds_Radius118_g70872 = Bounds_Radius5231_g70845;
				half Motion_20_Mask5243_g70845 = ( Mesh_Motion_20115_g70872 * Bounds_Radius118_g70872 );
				half3 Input_Position419_g70876 = VertexPosition3588_g70845;
				float3 normalizeResult518_g70876 = normalize( Input_Position419_g70876 );
				half2 Input_DirectionOS423_g70876 = Global_MotionDirectionOS39_g70845;
				float2 break521_g70876 = -Input_DirectionOS423_g70876;
				float3 appendResult522_g70876 = (float3(break521_g70876.x , 0.0 , break521_g70876.y));
				float dotResult519_g70876 = dot( normalizeResult518_g70876 , appendResult522_g70876 );
				half Input_Mask62_g70876 = _MotionFacingValue;
				float lerpResult524_g70876 = lerp( 1.0 , (dotResult519_g70876*0.5 + 0.5) , Input_Mask62_g70876);
				half ObjectData20_g70877 = lerpResult524_g70876;
				half WorldData19_g70877 = 1.0;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g70877 = WorldData19_g70877;
				#else
				float staticSwitch14_g70877 = ObjectData20_g70877;
				#endif
				half Motion_FacingMask5214_g70845 = staticSwitch14_g70877;
				half Motion_20_Amplitude4381_g70845 = ( _MotionAmplitude_20 * _MotionValue_20 * Motion_20_Mask5243_g70845 * Global_MotionPower2223_g70845 * Global_MotionNoise34_g70845 * Motion_FacingMask5214_g70845 );
				half Input_Amplitude58_g70860 = Motion_20_Amplitude4381_g70845;
				half2 Input_DirectionOS366_g70860 = Global_MotionDirectionOS39_g70845;
				float2 break371_g70860 = Input_DirectionOS366_g70860;
				float3 appendResult372_g70860 = (float3(break371_g70860.x , ( temp_output_302_0_g70860 * 0.1 ) , break371_g70860.y));
				half3 Motion_20_Squash4418_g70845 = ( ( (temp_output_302_0_g70860*0.2 + 1.0) * Input_Amplitude58_g70860 ) * appendResult372_g70860 );
				half Motion_Scale321_g70908 = _MotionScale_32;
				half Motion_Variation330_g70908 = ( _MotionVariation_32 * Global_MeshVariation5104_g70845 );
				half Input_Speed62_g70908 = _MotionSpeed_32;
				half Global_Speed350_g70908 = TVE_FlutterParams.y;
				float mulTime349_g70908 = _TimeParameters.x * ( Input_Speed62_g70908 * Global_Speed350_g70908 );
				half Mesh_Motion_30144_g70845 = break61_g70871.y;
				half Mesh_Motion_30116_g70872 = Mesh_Motion_30144_g70845;
				half Motion_30_Mask5244_g70845 = ( Mesh_Motion_30116_g70872 * 0.4 );
				float temp_output_7_0_g70869 = TVE_MotionFadeEnd;
				half Motion_FadeOut4005_g70845 = saturate( ( ( distance( ase_worldPos , _WorldSpaceCameraPos ) - temp_output_7_0_g70869 ) / ( TVE_MotionFadeStart - temp_output_7_0_g70869 ) ) );
				half Motion_30_Amplitude4960_g70845 = ( _MotionAmplitude_32 * _MotionValue_30 * Motion_30_Mask5244_g70845 * Global_MotionPower2223_g70845 * Global_MotionNoise34_g70845 * Motion_FacingMask5214_g70845 * Motion_FadeOut4005_g70845 );
				half Input_Amplitude58_g70908 = Motion_30_Amplitude4960_g70845;
				half Global_Power354_g70908 = TVE_FlutterParams.x;
				half Motion_Normal364_g70908 = _MotionNormalValue;
				float3 lerpResult370_g70908 = lerp( float3( 1,1,1 ) , inputMesh.normalOS , Motion_Normal364_g70908);
				half3 Motion_30_Details263_g70845 = ( ( sin( ( ( ( ase_worldPos.x + ase_worldPos.y + ase_worldPos.z ) * Motion_Scale321_g70908 ) + Motion_Variation330_g70908 + mulTime349_g70908 ) ) * Input_Amplitude58_g70908 * Global_Power354_g70908 ) * lerpResult370_g70908 );
				float3 Vertex_Motion_Object833_g70845 = ( ( ( VertexPosRotationAxis50_g70920 + ( VertexPosOtherAxis82_g70920 * cos( Angle44_g70920 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g70920 ) * sin( Angle44_g70920 ) ) ) + Motion_20_Squash4418_g70845 ) + Motion_30_Details263_g70845 );
				float3 temp_output_3474_0_g70845 = ( VertexPosition3588_g70845 - Mesh_PivotsOS2291_g70845 );
				float3 appendResult2043_g70845 = (float3(Motion_10_BendingX216_g70845 , 0.0 , Motion_10_BendingZ190_g70845));
				float3 Vertex_Motion_World1118_g70845 = ( ( ( temp_output_3474_0_g70845 + appendResult2043_g70845 ) + Motion_20_Squash4418_g70845 ) + Motion_30_Details263_g70845 );
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch4976_g70845 = Vertex_Motion_World1118_g70845;
				#else
				float3 staticSwitch4976_g70845 = ( Vertex_Motion_Object833_g70845 + ( _VertexDataMode * 0.0 ) );
				#endif
				float4 temp_output_94_19_g70904 = TVE_VertexCoords;
				half2 UV97_g70904 = ( (temp_output_94_19_g70904).zw + ( (temp_output_94_19_g70904).xy * (ObjectPosition4223_g70845).xz ) );
				float temp_output_84_0_g70904 = _LayerVertexValue;
				float4 lerpResult109_g70904 = lerp( TVE_VertexParams , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_VertexTex, sampler_linear_repeat, UV97_g70904,temp_output_84_0_g70904, 0.0 ) , TVE_VertexUsage[(int)temp_output_84_0_g70904]);
				half4 Global_Object_Params4173_g70845 = lerpResult109_g70904;
				half Global_VertexSize174_g70845 = saturate( Global_Object_Params4173_g70845.w );
				float lerpResult346_g70845 = lerp( 1.0 , Global_VertexSize174_g70845 , _GlobalSize);
				float3 appendResult3480_g70845 = (float3(lerpResult346_g70845 , lerpResult346_g70845 , lerpResult346_g70845));
				half3 ObjectData20_g70880 = appendResult3480_g70845;
				half3 _Vector11 = half3(1,1,1);
				half3 WorldData19_g70880 = _Vector11;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g70880 = WorldData19_g70880;
				#else
				float3 staticSwitch14_g70880 = ObjectData20_g70880;
				#endif
				half3 Vertex_Size1741_g70845 = staticSwitch14_g70880;
				half3 _Vector5 = half3(1,1,1);
				float3 Vertex_SizeFade1740_g70845 = _Vector5;
				half3 Grass_Perspective2661_g70845 = half3(0,0,0);
				float3 lerpResult16_g70879 = lerp( VertexPosition3588_g70845 , ( ( staticSwitch4976_g70845 * Vertex_Size1741_g70845 * Vertex_SizeFade1740_g70845 ) + Mesh_PivotsOS2291_g70845 + Grass_Perspective2661_g70845 ) , TVE_Enabled);
				float3 Final_VertexPosition890_g70845 = ( lerpResult16_g70879 + _DisableSRPBatcher );
				
				float temp_output_7_0_g70861 = TVE_CameraFadeStart;
				float lerpResult4755_g70845 = lerp( 1.0 , saturate( ( ( distance( ase_worldPos , _WorldSpaceCameraPos ) - temp_output_7_0_g70861 ) / ( TVE_CameraFadeEnd - temp_output_7_0_g70861 ) ) ) , _FadeCameraValue);
				float vertexToFrag11_g70867 = lerpResult4755_g70845;
				outputPackedVaryingsMeshToPS.ase_texcoord1.x = vertexToFrag11_g70867;
				outputPackedVaryingsMeshToPS.ase_texcoord1.yzw = vertexToFrag3890_g70845;
				outputPackedVaryingsMeshToPS.ase_texcoord3.xyz = vertexToFrag4224_g70845;
				
				outputPackedVaryingsMeshToPS.ase_texcoord2 = inputMesh.ase_texcoord;
				outputPackedVaryingsMeshToPS.ase_color = inputMesh.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				outputPackedVaryingsMeshToPS.ase_texcoord3.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue = Final_VertexPosition890_g70845;

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
				float localCustomAlphaClip9_g70878 = ( 0.0 );
				float3 normalizeResult2169_g70845 = normalize( V );
				float3 ViewDir_Normalized3963_g70845 = normalizeResult2169_g70845;
				float3 ase_worldPos = GetAbsolutePositionWS( positionRWS );
				float3 normalizeResult3971_g70845 = normalize( cross( ddy( ase_worldPos ) , ddx( ase_worldPos ) ) );
				float3 NormalsWS_Derivates3972_g70845 = normalizeResult3971_g70845;
				float dotResult3851_g70845 = dot( ViewDir_Normalized3963_g70845 , NormalsWS_Derivates3972_g70845 );
				float lerpResult3993_g70845 = lerp( 1.0 , saturate( abs( dotResult3851_g70845 ) ) , _FadeGlancingValue);
				half Fade_Glancing3853_g70845 = lerpResult3993_g70845;
				float vertexToFrag11_g70867 = packedInput.ase_texcoord1.x;
				half Fade_Camera_Mask5149_g70845 = 1.0;
				float lerpResult5141_g70845 = lerp( 1.0 , vertexToFrag11_g70867 , Fade_Camera_Mask5149_g70845);
				half Fade_Camera3743_g70845 = lerpResult5141_g70845;
				float temp_output_41_0_g70864 = ( Fade_Glancing3853_g70845 * Fade_Camera3743_g70845 );
				float3 vertexToFrag3890_g70845 = packedInput.ase_texcoord1.yzw;
				float3 WorldPosition3905_g70845 = vertexToFrag3890_g70845;
				half Final_AlphaFade3727_g70845 = saturate( ( temp_output_41_0_g70864 + ( temp_output_41_0_g70864 * tex3D( TVE_ScreenTex3D, ( TVE_ScreenTexCoord * WorldPosition3905_g70845 ) ).r ) ) );
				half2 Main_UVs15_g70845 = ( ( packedInput.ase_texcoord2.xy * (_MainUVs).xy ) + (_MainUVs).zw );
				float4 tex2DNode29_g70845 = tex2D( _MainAlbedoTex, Main_UVs15_g70845 );
				float Main_Alpha316_g70845 = ( _MainColor.a * tex2DNode29_g70845.a );
				float4 temp_output_93_19_g70850 = TVE_ExtrasCoords;
				float3 vertexToFrag4224_g70845 = packedInput.ase_texcoord3.xyz;
				half3 ObjectData20_g70886 = vertexToFrag4224_g70845;
				half3 WorldData19_g70886 = vertexToFrag3890_g70845;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g70886 = WorldData19_g70886;
				#else
				float3 staticSwitch14_g70886 = ObjectData20_g70886;
				#endif
				float3 ObjectPosition4223_g70845 = staticSwitch14_g70886;
				float3 lerpResult4827_g70845 = lerp( WorldPosition3905_g70845 , ObjectPosition4223_g70845 , _ExtrasPositionMode);
				half2 UV96_g70850 = ( (temp_output_93_19_g70850).zw + ( (temp_output_93_19_g70850).xy * (lerpResult4827_g70845).xz ) );
				float temp_output_84_0_g70850 = _LayerExtrasValue;
				float4 lerpResult109_g70850 = lerp( TVE_ExtrasParams , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_ExtrasTex, sampler_linear_repeat, UV96_g70850,temp_output_84_0_g70850, 0.0 ) , TVE_ExtrasUsage[(int)temp_output_84_0_g70850]);
				float4 break89_g70850 = lerpResult109_g70850;
				half Global_Extras_Alpha1033_g70845 = saturate( break89_g70850.a );
				float3 break111_g70874 = ObjectPosition4223_g70845;
				half Global_DynamicMode5112_g70845 = _VertexDynamicMode;
				half Input_DynamicMode120_g70874 = Global_DynamicMode5112_g70845;
				float Mesh_Variation16_g70845 = packedInput.ase_color.r;
				half Input_Variation124_g70874 = Mesh_Variation16_g70845;
				half ObjectData20_g70875 = frac( ( ( ( break111_g70874.x + break111_g70874.y + break111_g70874.z ) * ( 1.0 - Input_DynamicMode120_g70874 ) ) + Input_Variation124_g70874 ) );
				half WorldData19_g70875 = Input_Variation124_g70874;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g70875 = WorldData19_g70875;
				#else
				float staticSwitch14_g70875 = ObjectData20_g70875;
				#endif
				float clampResult129_g70874 = clamp( staticSwitch14_g70875 , 0.01 , 0.99 );
				half Global_MeshVariation5104_g70845 = clampResult129_g70874;
				float lerpResult5154_g70845 = lerp( 0.0 , Global_MeshVariation5104_g70845 , _AlphaVariationValue);
				half Global_Alpha_Variation5158_g70845 = lerpResult5154_g70845;
				half AlphaTreshold2132_g70845 = _AlphaClipValue;
				half Global_Alpha_Mask4546_g70845 = 1.0;
				float lerpResult5203_g70845 = lerp( 1.0 , ( ( Global_Extras_Alpha1033_g70845 - Global_Alpha_Variation5158_g70845 ) + AlphaTreshold2132_g70845 ) , ( Global_Alpha_Mask4546_g70845 * _GlobalAlpha ));
				float lerpResult16_g70919 = lerp( 1.0 , lerpResult5203_g70845 , TVE_Enabled);
				half Global_Alpha315_g70845 = lerpResult16_g70919;
				half Final_Alpha3754_g70845 = ( ( Main_Alpha316_g70845 * Global_Alpha315_g70845 ) - ( AlphaTreshold2132_g70845 - 0.5 ) );
				float temp_output_661_0_g70845 = ( Final_AlphaFade3727_g70845 * Final_Alpha3754_g70845 );
				float temp_output_3_0_g70865 = temp_output_661_0_g70845;
				half Offest27_g70865 = 0.5;
				half Feather30_g70865 = 0.5;
				float temp_output_3_0_g70878 = ( ( ( temp_output_3_0_g70865 - Offest27_g70865 ) / ( max( fwidth( temp_output_3_0_g70865 ) , 0.001 ) + Feather30_g70865 ) ) + Offest27_g70865 );
				float Alpha9_g70878 = temp_output_3_0_g70878;
				float temp_output_15_0_g70878 = 0.5;
				float Treshold9_g70878 = temp_output_15_0_g70878;
				{
				#if TVE_FEATURE_CLIP
				clip(Alpha9_g70878 - Treshold9_g70878);
				#endif
				}
				half Final_Clip914_g70845 = Alpha9_g70878;
				
				surfaceDescription.Alpha = Final_Clip914_g70845;

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

			#define _MATERIAL_FEATURE_TRANSMISSION 1
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
			half4 _MainColor;
			half4 _ColorsMaskRemap;
			half4 _SubsurfaceMaskRemap;
			half4 _VertexOcclusionRemap;
			float4 _GradientMaskRemap;
			float4 _SubsurfaceDiffusion_asset;
			float4 _MaxBoundsInfo;
			float4 _SubsurfaceDiffusion_Asset;
			float4 _Color;
			half4 _GradientColorTwo;
			half4 _GradientColorOne;
			half4 _MainUVs;
			half4 _OverlayMaskRemap;
			half4 _SubsurfaceColor;
			half4 _VertexOcclusionColor;
			half4 _AlphaMaskRemap;
			float4 _EmissiveIntensityParams;
			half4 _EmissiveColor;
			half4 _EmissiveUVs;
			float4 _NoiseMaskRemap;
			half4 _DetailBlendRemap;
			half3 _render_normals;
			half _VertexOcclusionMinValue;
			float _MotionScale_32;
			half _MotionFacingValue;
			half _MotionValue_20;
			half _EmissiveExposureValue;
			half _MotionAmplitude_20;
			half _GlobalEmissive;
			half _MainSmoothnessValue;
			half _GlobalWetness;
			half _MotionSpeed_20;
			half _MotionVariation_20;
			half _MotionScale_20;
			half _InteractionMaskValue;
			half _InteractionAmplitude;
			half _VertexDynamicMode;
			half _MainOcclusionValue;
			half _MotionVariation_10;
			float _MotionSpeed_10;
			half _FadeGlancingValue;
			float _MotionScale_10;
			half _FadeCameraValue;
			half _MotionAmplitude_10;
			half _LayerMotionValue;
			float _MotionVariation_32;
			float _MotionSpeed_32;
			half _MotionNormalValue;
			half _MotionValue_30;
			half _MainNormalValue;
			half _OverlayMaskMaxValue;
			half _OverlayMaskMinValue;
			half _OverlayVariationValue;
			half _LayerExtrasValue;
			half _ExtrasPositionMode;
			half _GlobalOverlay;
			half _SubsurfaceMaskMaxValue;
			half _SubsurfaceMaskMinValue;
			half _SubsurfaceValue;
			half _ColorsMaskMaxValue;
			half _ColorsMaskMinValue;
			half _ColorsVariationValue;
			half _GlobalColors;
			half _LayerColorsValue;
			half _ColorsPositionMode;
			half _VertexPivotMode;
			half _GradientMaxValue;
			half _GradientMinValue;
			half _GlobalSize;
			half _LayerVertexValue;
			half _VertexDataMode;
			half _VertexOcclusionMaxValue;
			half _MotionAmplitude_32;
			half _render_cull;
			half _RenderSSR;
			half _RenderDirect;
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
			half _CategorySubsurface;
			half _SubsurfaceNormalValue;
			half _SpaceMotionGlobals;
			half _SubsurfaceShadowValue;
			half _RenderCoverage;
			half _RenderPriority;
			float _SubsurfaceDiffusion;
			half _VertexRollingMode;
			half _Cutoff;
			half _SubsurfaceScatteringValue;
			half _render_dst;
			half _IsSubsurfaceShader;
			half _render_zw;
			half _render_src;
			half _IsLeafShader;
			half _EmissiveFlagMode;
			half _subsurface_shadow;
			half _RenderClip;
			half _MessageMotionVariation;
			half _CategoryRender;
			half _SpaceGlobalPosition;
			half _AlphaVariationValue;
			half _RenderCull;
			half _SubsurfaceDirectValue;
			half _RenderZWrite;
			half _SubsurfaceAmbientValue;
			half _RenderQueue;
			half _SubsurfaceAngleValue;
			half _AlphaClipValue;
			half _VertexMasksMode;
			half _LayerReactValue;
			half _DetailBlendMode;
			half _MessageGlobalsVariation;
			half _VertexVariationMode;
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
			half _RenderDecals;
			half _GlobalAlpha;
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
			half4 TVE_FlutterParams;
			half TVE_MotionFadeEnd;
			half TVE_MotionFadeStart;
			half4 TVE_VertexParams;
			TEXTURE2D_ARRAY(TVE_VertexTex);
			half4 TVE_VertexCoords;
			float TVE_VertexUsage[10];
			half _DisableSRPBatcher;
			sampler2D _MainNormalTex;
			sampler2D _MainMaskTex;
			half TVE_OverlaySmoothness;
			sampler2D _MainAlbedoTex;
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
			#define ASE_NEEDS_FRAG_VFACE
			#define ASE_NEEDS_FRAG_WORLD_VIEW_DIR
			#define ASE_NEEDS_FRAG_RELATIVE_WORLD_POS
			#pragma shader_feature_local TVE_FEATURE_CLIP
			#pragma shader_feature_local TVE_FEATURE_BATCHING
			//TVE Pipeline Defines
			#define THE_VEGETATION_ENGINE
			#define TVE_IS_HD_PIPELINE
			//TVE HD Pipeline Defines
			#pragma shader_feature_local _DISABLE_DECALS
			#pragma shader_feature_local _DISABLE_SSR
			//TVE Shader Type Defines
			#define TVE_IS_VEGETATION_SHADER
			//TVE Injection Defines
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END


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
				float3 ase_normal : NORMAL;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_texcoord6 : TEXCOORD6;
				float4 ase_color : COLOR;
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

				float3 VertexPosition3588_g70845 = inputMesh.positionOS;
				half3 Mesh_PivotsOS2291_g70845 = half3(0,0,0);
				float3 temp_output_2283_0_g70845 = ( VertexPosition3588_g70845 - Mesh_PivotsOS2291_g70845 );
				half3 VertexPos40_g70921 = temp_output_2283_0_g70845;
				float3 appendResult74_g70921 = (float3(VertexPos40_g70921.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g70921 = appendResult74_g70921;
				float3 break84_g70921 = VertexPos40_g70921;
				float3 appendResult81_g70921 = (float3(0.0 , break84_g70921.y , break84_g70921.z));
				half3 VertexPosOtherAxis82_g70921 = appendResult81_g70921;
				float4 temp_output_91_19_g70881 = TVE_MotionCoords;
				float3 localObjectPosition_UNITY_MATRIX_M14_g70912 = ObjectPosition_UNITY_MATRIX_M();
				float3 appendResult60_g70870 = (float3(inputMesh.ase_texcoord3.x , inputMesh.ase_texcoord3.z , inputMesh.ase_texcoord3.y));
				half3 Mesh_PivotsData2831_g70845 = ( appendResult60_g70870 * _VertexPivotMode );
				float3 temp_output_122_0_g70912 = Mesh_PivotsData2831_g70845;
				float3 PivotsOnly105_g70912 = (mul( GetObjectToWorldMatrix(), float4( temp_output_122_0_g70912 , 0.0 ) ).xyz).xyz;
				#ifdef SHADEROPTIONS_CAMERA_RELATIVE_RENDERING
				float3 staticSwitch13_g70912 = ( ( localObjectPosition_UNITY_MATRIX_M14_g70912 + PivotsOnly105_g70912 ) + _WorldSpaceCameraPos );
				#else
				float3 staticSwitch13_g70912 = ( localObjectPosition_UNITY_MATRIX_M14_g70912 + PivotsOnly105_g70912 );
				#endif
				half3 ObjectData20_g70913 = staticSwitch13_g70912;
				float3 ase_worldPos = GetAbsolutePositionWS( TransformObjectToWorld( (inputMesh.positionOS).xyz ) );
				half3 WorldData19_g70913 = ase_worldPos;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g70913 = WorldData19_g70913;
				#else
				float3 staticSwitch14_g70913 = ObjectData20_g70913;
				#endif
				float3 temp_output_114_0_g70912 = staticSwitch14_g70913;
				float3 vertexToFrag4224_g70845 = temp_output_114_0_g70912;
				half3 ObjectData20_g70886 = vertexToFrag4224_g70845;
				float3 vertexToFrag3890_g70845 = ase_worldPos;
				half3 WorldData19_g70886 = vertexToFrag3890_g70845;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g70886 = WorldData19_g70886;
				#else
				float3 staticSwitch14_g70886 = ObjectData20_g70886;
				#endif
				float3 ObjectPosition4223_g70845 = staticSwitch14_g70886;
				half2 UV94_g70881 = ( (temp_output_91_19_g70881).zw + ( (temp_output_91_19_g70881).xy * (ObjectPosition4223_g70845).xz ) );
				float temp_output_84_0_g70881 = _LayerMotionValue;
				float4 lerpResult107_g70881 = lerp( TVE_MotionParams , saturate( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_MotionTex, sampler_linear_repeat, UV94_g70881,temp_output_84_0_g70881, 0.0 ) ) , TVE_MotionUsage[(int)temp_output_84_0_g70881]);
				half4 Global_Motion_Params3909_g70845 = lerpResult107_g70881;
				float4 break322_g70888 = Global_Motion_Params3909_g70845;
				float3 appendResult397_g70888 = (float3(break322_g70888.x , 0.0 , break322_g70888.y));
				float3 temp_output_398_0_g70888 = (appendResult397_g70888*2.0 + -1.0);
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				half2 Global_MotionDirectionOS39_g70845 = (( mul( GetWorldToObjectMatrix(), float4( temp_output_398_0_g70888 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_DirectionOS358_g70917 = Global_MotionDirectionOS39_g70845;
				half Mesh_Height1524_g70845 = inputMesh.ase_color.a;
				half Mesh_Height114_g70872 = Mesh_Height1524_g70845;
				half ObjectData20_g70873 = ( Mesh_Height114_g70872 * 2.0 );
				float enc62_g70871 = inputMesh.ase_texcoord.w;
				float2 localDecodeFloatToVector262_g70871 = DecodeFloatToVector2( enc62_g70871 );
				float2 break63_g70871 = ( localDecodeFloatToVector262_g70871 * 100.0 );
				float Bounds_Height5230_g70845 = break63_g70871.x;
				float Bounds_Height117_g70872 = Bounds_Height5230_g70845;
				half WorldData19_g70873 = ( ( Mesh_Height114_g70872 * Mesh_Height114_g70872 ) * Bounds_Height117_g70872 * 2.0 );
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g70873 = WorldData19_g70873;
				#else
				float staticSwitch14_g70873 = ObjectData20_g70873;
				#endif
				half Motion_10_Mask5242_g70845 = staticSwitch14_g70873;
				half Wind_Power369_g70888 = break322_g70888.z;
				half Global_MotionPower2223_g70845 = Wind_Power369_g70888;
				half3 Input_Position419_g70891 = -ObjectPosition4223_g70845;
				half2 Global_MotionDirectionWS4683_g70845 = (temp_output_398_0_g70888).xz;
				half2 Input_DirectionWS423_g70891 = Global_MotionDirectionWS4683_g70845;
				float Motion_Scale287_g70891 = ( _MotionScale_10 + 0.2 );
				half Global_Scale448_g70891 = TVE_NoiseParams.x;
				half Input_Speed62_g70891 = _MotionSpeed_10;
				half Global_Speed449_g70891 = TVE_NoiseParams.y;
				float mulTime426_g70891 = _TimeParameters.x * ( Input_Speed62_g70891 * Global_Speed449_g70891 );
				half Global_DistScale561_g70891 = TVE_NoiseParams.w;
				float3 break461_g70891 = ( Input_Position419_g70891 * Global_DistScale561_g70891 );
				half Global_DistAmplitude559_g70891 = TVE_NoiseParams.z;
				float Noise_Distortion469_g70891 = ( sin( ( break461_g70891.x + break461_g70891.z ) ) * Global_DistAmplitude559_g70891 );
				float3 break111_g70874 = ObjectPosition4223_g70845;
				half Global_DynamicMode5112_g70845 = _VertexDynamicMode;
				half Input_DynamicMode120_g70874 = Global_DynamicMode5112_g70845;
				float Mesh_Variation16_g70845 = inputMesh.ase_color.r;
				half Input_Variation124_g70874 = Mesh_Variation16_g70845;
				half ObjectData20_g70875 = frac( ( ( ( break111_g70874.x + break111_g70874.y + break111_g70874.z ) * ( 1.0 - Input_DynamicMode120_g70874 ) ) + Input_Variation124_g70874 ) );
				half WorldData19_g70875 = Input_Variation124_g70874;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g70875 = WorldData19_g70875;
				#else
				float staticSwitch14_g70875 = ObjectData20_g70875;
				#endif
				float clampResult129_g70874 = clamp( staticSwitch14_g70875 , 0.01 , 0.99 );
				half Global_MeshVariation5104_g70845 = clampResult129_g70874;
				half Motion_Variation284_g70891 = ( _MotionVariation_10 * Global_MeshVariation5104_g70845 );
				float2 temp_output_425_0_g70891 = ( ( (Input_Position419_g70891).xz * Input_DirectionWS423_g70891 * Motion_Scale287_g70891 * Global_Scale448_g70891 ) + ( mulTime426_g70891 + Noise_Distortion469_g70891 + Motion_Variation284_g70891 ) );
				float2 break500_g70891 = ( temp_output_425_0_g70891 * 0.1178 );
				float2 break494_g70891 = ( temp_output_425_0_g70891 * 0.1742 );
				half Input_WindPower327_g70891 = Global_MotionPower2223_g70845;
				float lerpResult430_g70891 = lerp( 1.4 , 0.4 , Input_WindPower327_g70891);
				half Global_MotionNoise34_g70845 = (pow( (( sin( ( break500_g70891.x + break500_g70891.y ) ) * sin( ( break494_g70891.x + break494_g70891.y ) ) )*0.4 + 0.6) , lerpResult430_g70891 )*1.2 + -0.2);
				half Motion_10_Amplitude2258_g70845 = ( _MotionAmplitude_10 * Motion_10_Mask5242_g70845 * Global_MotionPower2223_g70845 * Global_MotionNoise34_g70845 );
				half Input_BendingAmplitude376_g70917 = Motion_10_Amplitude2258_g70845;
				half Input_InteractionAmplitude58_g70917 = _InteractionAmplitude;
				half Input_MeshMotion_10321_g70917 = Motion_10_Mask5242_g70845;
				half Input_InteractionUseMask62_g70917 = _InteractionMaskValue;
				float lerpResult371_g70917 = lerp( 2.0 , Input_MeshMotion_10321_g70917 , Input_InteractionUseMask62_g70917);
				half ObjectData20_g70918 = lerpResult371_g70917;
				half WorldData19_g70918 = Input_MeshMotion_10321_g70917;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g70918 = WorldData19_g70918;
				#else
				float staticSwitch14_g70918 = ObjectData20_g70918;
				#endif
				half Motion_10_Interaction373_g70917 = ( Input_InteractionAmplitude58_g70917 * staticSwitch14_g70918 );
				half Global_InteractionMask66_g70845 = ( break322_g70888.w * break322_g70888.w );
				float Input_InteractionMask330_g70917 = Global_InteractionMask66_g70845;
				float lerpResult360_g70917 = lerp( Input_BendingAmplitude376_g70917 , Motion_10_Interaction373_g70917 , saturate( ( Input_InteractionAmplitude58_g70917 * Input_InteractionMask330_g70917 ) ));
				float2 break364_g70917 = ( Input_DirectionOS358_g70917 * lerpResult360_g70917 );
				half Motion_10_BendingZ190_g70845 = break364_g70917.y;
				half Angle44_g70921 = Motion_10_BendingZ190_g70845;
				half3 VertexPos40_g70920 = ( VertexPosRotationAxis50_g70921 + ( VertexPosOtherAxis82_g70921 * cos( Angle44_g70921 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g70921 ) * sin( Angle44_g70921 ) ) );
				float3 appendResult74_g70920 = (float3(0.0 , 0.0 , VertexPos40_g70920.z));
				half3 VertexPosRotationAxis50_g70920 = appendResult74_g70920;
				float3 break84_g70920 = VertexPos40_g70920;
				float3 appendResult81_g70920 = (float3(break84_g70920.x , break84_g70920.y , 0.0));
				half3 VertexPosOtherAxis82_g70920 = appendResult81_g70920;
				half Motion_10_BendingX216_g70845 = break364_g70917.x;
				half Angle44_g70920 = -Motion_10_BendingX216_g70845;
				half Input_Scale321_g70860 = _MotionScale_20;
				half Input_Variation330_g70860 = ( _MotionVariation_20 * Global_MeshVariation5104_g70845 );
				half Input_Speed62_g70860 = _MotionSpeed_20;
				float mulTime349_g70860 = _TimeParameters.x * Input_Speed62_g70860;
				float temp_output_302_0_g70860 = sin( ( ( ( ase_worldPos.x + ase_worldPos.y + ase_worldPos.z ) * Input_Scale321_g70860 ) + Input_Variation330_g70860 + mulTime349_g70860 ) );
				float enc59_g70871 = inputMesh.ase_texcoord.z;
				float2 localDecodeFloatToVector259_g70871 = DecodeFloatToVector2( enc59_g70871 );
				float2 break61_g70871 = localDecodeFloatToVector259_g70871;
				half Mesh_Motion_2060_g70845 = break61_g70871.x;
				half Mesh_Motion_20115_g70872 = Mesh_Motion_2060_g70845;
				float Bounds_Radius5231_g70845 = break63_g70871.y;
				float Bounds_Radius118_g70872 = Bounds_Radius5231_g70845;
				half Motion_20_Mask5243_g70845 = ( Mesh_Motion_20115_g70872 * Bounds_Radius118_g70872 );
				half3 Input_Position419_g70876 = VertexPosition3588_g70845;
				float3 normalizeResult518_g70876 = normalize( Input_Position419_g70876 );
				half2 Input_DirectionOS423_g70876 = Global_MotionDirectionOS39_g70845;
				float2 break521_g70876 = -Input_DirectionOS423_g70876;
				float3 appendResult522_g70876 = (float3(break521_g70876.x , 0.0 , break521_g70876.y));
				float dotResult519_g70876 = dot( normalizeResult518_g70876 , appendResult522_g70876 );
				half Input_Mask62_g70876 = _MotionFacingValue;
				float lerpResult524_g70876 = lerp( 1.0 , (dotResult519_g70876*0.5 + 0.5) , Input_Mask62_g70876);
				half ObjectData20_g70877 = lerpResult524_g70876;
				half WorldData19_g70877 = 1.0;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g70877 = WorldData19_g70877;
				#else
				float staticSwitch14_g70877 = ObjectData20_g70877;
				#endif
				half Motion_FacingMask5214_g70845 = staticSwitch14_g70877;
				half Motion_20_Amplitude4381_g70845 = ( _MotionAmplitude_20 * _MotionValue_20 * Motion_20_Mask5243_g70845 * Global_MotionPower2223_g70845 * Global_MotionNoise34_g70845 * Motion_FacingMask5214_g70845 );
				half Input_Amplitude58_g70860 = Motion_20_Amplitude4381_g70845;
				half2 Input_DirectionOS366_g70860 = Global_MotionDirectionOS39_g70845;
				float2 break371_g70860 = Input_DirectionOS366_g70860;
				float3 appendResult372_g70860 = (float3(break371_g70860.x , ( temp_output_302_0_g70860 * 0.1 ) , break371_g70860.y));
				half3 Motion_20_Squash4418_g70845 = ( ( (temp_output_302_0_g70860*0.2 + 1.0) * Input_Amplitude58_g70860 ) * appendResult372_g70860 );
				half Motion_Scale321_g70908 = _MotionScale_32;
				half Motion_Variation330_g70908 = ( _MotionVariation_32 * Global_MeshVariation5104_g70845 );
				half Input_Speed62_g70908 = _MotionSpeed_32;
				half Global_Speed350_g70908 = TVE_FlutterParams.y;
				float mulTime349_g70908 = _TimeParameters.x * ( Input_Speed62_g70908 * Global_Speed350_g70908 );
				half Mesh_Motion_30144_g70845 = break61_g70871.y;
				half Mesh_Motion_30116_g70872 = Mesh_Motion_30144_g70845;
				half Motion_30_Mask5244_g70845 = ( Mesh_Motion_30116_g70872 * 0.4 );
				float temp_output_7_0_g70869 = TVE_MotionFadeEnd;
				half Motion_FadeOut4005_g70845 = saturate( ( ( distance( ase_worldPos , _WorldSpaceCameraPos ) - temp_output_7_0_g70869 ) / ( TVE_MotionFadeStart - temp_output_7_0_g70869 ) ) );
				half Motion_30_Amplitude4960_g70845 = ( _MotionAmplitude_32 * _MotionValue_30 * Motion_30_Mask5244_g70845 * Global_MotionPower2223_g70845 * Global_MotionNoise34_g70845 * Motion_FacingMask5214_g70845 * Motion_FadeOut4005_g70845 );
				half Input_Amplitude58_g70908 = Motion_30_Amplitude4960_g70845;
				half Global_Power354_g70908 = TVE_FlutterParams.x;
				half Motion_Normal364_g70908 = _MotionNormalValue;
				float3 lerpResult370_g70908 = lerp( float3( 1,1,1 ) , inputMesh.normalOS , Motion_Normal364_g70908);
				half3 Motion_30_Details263_g70845 = ( ( sin( ( ( ( ase_worldPos.x + ase_worldPos.y + ase_worldPos.z ) * Motion_Scale321_g70908 ) + Motion_Variation330_g70908 + mulTime349_g70908 ) ) * Input_Amplitude58_g70908 * Global_Power354_g70908 ) * lerpResult370_g70908 );
				float3 Vertex_Motion_Object833_g70845 = ( ( ( VertexPosRotationAxis50_g70920 + ( VertexPosOtherAxis82_g70920 * cos( Angle44_g70920 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g70920 ) * sin( Angle44_g70920 ) ) ) + Motion_20_Squash4418_g70845 ) + Motion_30_Details263_g70845 );
				float3 temp_output_3474_0_g70845 = ( VertexPosition3588_g70845 - Mesh_PivotsOS2291_g70845 );
				float3 appendResult2043_g70845 = (float3(Motion_10_BendingX216_g70845 , 0.0 , Motion_10_BendingZ190_g70845));
				float3 Vertex_Motion_World1118_g70845 = ( ( ( temp_output_3474_0_g70845 + appendResult2043_g70845 ) + Motion_20_Squash4418_g70845 ) + Motion_30_Details263_g70845 );
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch4976_g70845 = Vertex_Motion_World1118_g70845;
				#else
				float3 staticSwitch4976_g70845 = ( Vertex_Motion_Object833_g70845 + ( _VertexDataMode * 0.0 ) );
				#endif
				float4 temp_output_94_19_g70904 = TVE_VertexCoords;
				half2 UV97_g70904 = ( (temp_output_94_19_g70904).zw + ( (temp_output_94_19_g70904).xy * (ObjectPosition4223_g70845).xz ) );
				float temp_output_84_0_g70904 = _LayerVertexValue;
				float4 lerpResult109_g70904 = lerp( TVE_VertexParams , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_VertexTex, sampler_linear_repeat, UV97_g70904,temp_output_84_0_g70904, 0.0 ) , TVE_VertexUsage[(int)temp_output_84_0_g70904]);
				half4 Global_Object_Params4173_g70845 = lerpResult109_g70904;
				half Global_VertexSize174_g70845 = saturate( Global_Object_Params4173_g70845.w );
				float lerpResult346_g70845 = lerp( 1.0 , Global_VertexSize174_g70845 , _GlobalSize);
				float3 appendResult3480_g70845 = (float3(lerpResult346_g70845 , lerpResult346_g70845 , lerpResult346_g70845));
				half3 ObjectData20_g70880 = appendResult3480_g70845;
				half3 _Vector11 = half3(1,1,1);
				half3 WorldData19_g70880 = _Vector11;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g70880 = WorldData19_g70880;
				#else
				float3 staticSwitch14_g70880 = ObjectData20_g70880;
				#endif
				half3 Vertex_Size1741_g70845 = staticSwitch14_g70880;
				half3 _Vector5 = half3(1,1,1);
				float3 Vertex_SizeFade1740_g70845 = _Vector5;
				half3 Grass_Perspective2661_g70845 = half3(0,0,0);
				float3 lerpResult16_g70879 = lerp( VertexPosition3588_g70845 , ( ( staticSwitch4976_g70845 * Vertex_Size1741_g70845 * Vertex_SizeFade1740_g70845 ) + Mesh_PivotsOS2291_g70845 + Grass_Perspective2661_g70845 ) , TVE_Enabled);
				float3 Final_VertexPosition890_g70845 = ( lerpResult16_g70879 + _DisableSRPBatcher );
				
				float3 ase_worldNormal = TransformObjectToWorldNormal(inputMesh.normalOS);
				float3 vertexToFrag5058_g70845 = ase_worldNormal;
				outputPackedVaryingsMeshToPS.ase_texcoord4.xyz = vertexToFrag5058_g70845;
				outputPackedVaryingsMeshToPS.ase_texcoord5.xyz = vertexToFrag3890_g70845;
				outputPackedVaryingsMeshToPS.ase_texcoord6.xyz = vertexToFrag4224_g70845;
				
				float temp_output_7_0_g70861 = TVE_CameraFadeStart;
				float lerpResult4755_g70845 = lerp( 1.0 , saturate( ( ( distance( ase_worldPos , _WorldSpaceCameraPos ) - temp_output_7_0_g70861 ) / ( TVE_CameraFadeEnd - temp_output_7_0_g70861 ) ) ) , _FadeCameraValue);
				float vertexToFrag11_g70867 = lerpResult4755_g70845;
				outputPackedVaryingsMeshToPS.ase_texcoord4.w = vertexToFrag11_g70867;
				
				outputPackedVaryingsMeshToPS.ase_texcoord3 = inputMesh.ase_texcoord;
				outputPackedVaryingsMeshToPS.ase_normal = inputMesh.normalOS;
				outputPackedVaryingsMeshToPS.ase_color = inputMesh.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				outputPackedVaryingsMeshToPS.ase_texcoord5.w = 0;
				outputPackedVaryingsMeshToPS.ase_texcoord6.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue = Final_VertexPosition890_g70845;

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
				half2 Main_UVs15_g70845 = ( ( packedInput.ase_texcoord3.xy * (_MainUVs).xy ) + (_MainUVs).zw );
				float3 unpack4112_g70845 = UnpackNormalScale( tex2D( _MainNormalTex, Main_UVs15_g70845 ), _MainNormalValue );
				unpack4112_g70845.z = lerp( 1, unpack4112_g70845.z, saturate(_MainNormalValue) );
				half3 Main_Normal137_g70845 = unpack4112_g70845;
				float3 temp_output_13_0_g70856 = Main_Normal137_g70845;
				float3 switchResult12_g70856 = (((isFrontFace>0)?(temp_output_13_0_g70856):(( temp_output_13_0_g70856 * _render_normals ))));
				half3 Blend_Normal312_g70845 = switchResult12_g70856;
				half3 Final_Normal366_g70845 = Blend_Normal312_g70845;
				
				float4 tex2DNode35_g70845 = tex2D( _MainMaskTex, Main_UVs15_g70845 );
				half Main_Smoothness227_g70845 = ( tex2DNode35_g70845.a * _MainSmoothnessValue );
				half Blend_Smoothness314_g70845 = Main_Smoothness227_g70845;
				half Global_OverlaySmoothness311_g70845 = TVE_OverlaySmoothness;
				float3 vertexToFrag5058_g70845 = packedInput.ase_texcoord4.xyz;
				half3 World_Normal4101_g70845 = vertexToFrag5058_g70845;
				half Global_DynamicMode5112_g70845 = _VertexDynamicMode;
				float lerpResult4801_g70845 = lerp( World_Normal4101_g70845.y , packedInput.ase_normal.y , Global_DynamicMode5112_g70845);
				float lerpResult3567_g70845 = lerp( 0.5 , 1.0 , lerpResult4801_g70845);
				float4 tex2DNode29_g70845 = tex2D( _MainAlbedoTex, Main_UVs15_g70845 );
				half3 Main_Albedo99_g70845 = ( (_MainColor).rgb * (tex2DNode29_g70845).rgb );
				half3 Blend_Albedo265_g70845 = Main_Albedo99_g70845;
				float4 temp_output_93_19_g70850 = TVE_ExtrasCoords;
				float3 vertexToFrag3890_g70845 = packedInput.ase_texcoord5.xyz;
				float3 WorldPosition3905_g70845 = vertexToFrag3890_g70845;
				float3 vertexToFrag4224_g70845 = packedInput.ase_texcoord6.xyz;
				half3 ObjectData20_g70886 = vertexToFrag4224_g70845;
				half3 WorldData19_g70886 = vertexToFrag3890_g70845;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g70886 = WorldData19_g70886;
				#else
				float3 staticSwitch14_g70886 = ObjectData20_g70886;
				#endif
				float3 ObjectPosition4223_g70845 = staticSwitch14_g70886;
				float3 lerpResult4827_g70845 = lerp( WorldPosition3905_g70845 , ObjectPosition4223_g70845 , _ExtrasPositionMode);
				half2 UV96_g70850 = ( (temp_output_93_19_g70850).zw + ( (temp_output_93_19_g70850).xy * (lerpResult4827_g70845).xz ) );
				float temp_output_84_0_g70850 = _LayerExtrasValue;
				float4 lerpResult109_g70850 = lerp( TVE_ExtrasParams , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_ExtrasTex, sampler_linear_repeat, UV96_g70850,temp_output_84_0_g70850, 0.0 ) , TVE_ExtrasUsage[(int)temp_output_84_0_g70850]);
				float4 break89_g70850 = lerpResult109_g70850;
				half Global_Extras_Overlay156_g70845 = break89_g70850.b;
				float3 break111_g70874 = ObjectPosition4223_g70845;
				half Input_DynamicMode120_g70874 = Global_DynamicMode5112_g70845;
				float Mesh_Variation16_g70845 = packedInput.ase_color.r;
				half Input_Variation124_g70874 = Mesh_Variation16_g70845;
				half ObjectData20_g70875 = frac( ( ( ( break111_g70874.x + break111_g70874.y + break111_g70874.z ) * ( 1.0 - Input_DynamicMode120_g70874 ) ) + Input_Variation124_g70874 ) );
				half WorldData19_g70875 = Input_Variation124_g70874;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g70875 = WorldData19_g70875;
				#else
				float staticSwitch14_g70875 = ObjectData20_g70875;
				#endif
				float clampResult129_g70874 = clamp( staticSwitch14_g70875 , 0.01 , 0.99 );
				half Global_MeshVariation5104_g70845 = clampResult129_g70874;
				float lerpResult1065_g70845 = lerp( 1.0 , Global_MeshVariation5104_g70845 , _OverlayVariationValue);
				half Overlay_Variation4560_g70845 = lerpResult1065_g70845;
				half Overlay_Commons1365_g70845 = ( _GlobalOverlay * Global_Extras_Overlay156_g70845 * Overlay_Variation4560_g70845 );
				half Overlay_Mask_3D5122_g70845 = ( ( ( lerpResult3567_g70845 * 0.5 ) + Blend_Albedo265_g70845.y ) * Overlay_Commons1365_g70845 );
				float temp_output_7_0_g70887 = _OverlayMaskMinValue;
				half Overlay_Mask269_g70845 = saturate( ( ( Overlay_Mask_3D5122_g70845 - temp_output_7_0_g70887 ) / ( _OverlayMaskMaxValue - temp_output_7_0_g70887 ) ) );
				float lerpResult343_g70845 = lerp( Blend_Smoothness314_g70845 , Global_OverlaySmoothness311_g70845 , Overlay_Mask269_g70845);
				half Final_Smoothness371_g70845 = lerpResult343_g70845;
				half Global_Extras_Wetness305_g70845 = break89_g70850.g;
				float lerpResult3673_g70845 = lerp( 0.0 , Global_Extras_Wetness305_g70845 , _GlobalWetness);
				half Final_SmoothnessAndWetness4130_g70845 = saturate( ( Final_Smoothness371_g70845 + lerpResult3673_g70845 ) );
				
				float localCustomAlphaClip9_g70878 = ( 0.0 );
				float3 normalizeResult2169_g70845 = normalize( V );
				float3 ViewDir_Normalized3963_g70845 = normalizeResult2169_g70845;
				float3 ase_worldPos = GetAbsolutePositionWS( positionRWS );
				float3 normalizeResult3971_g70845 = normalize( cross( ddy( ase_worldPos ) , ddx( ase_worldPos ) ) );
				float3 NormalsWS_Derivates3972_g70845 = normalizeResult3971_g70845;
				float dotResult3851_g70845 = dot( ViewDir_Normalized3963_g70845 , NormalsWS_Derivates3972_g70845 );
				float lerpResult3993_g70845 = lerp( 1.0 , saturate( abs( dotResult3851_g70845 ) ) , _FadeGlancingValue);
				half Fade_Glancing3853_g70845 = lerpResult3993_g70845;
				float vertexToFrag11_g70867 = packedInput.ase_texcoord4.w;
				half Fade_Camera_Mask5149_g70845 = 1.0;
				float lerpResult5141_g70845 = lerp( 1.0 , vertexToFrag11_g70867 , Fade_Camera_Mask5149_g70845);
				half Fade_Camera3743_g70845 = lerpResult5141_g70845;
				float temp_output_41_0_g70864 = ( Fade_Glancing3853_g70845 * Fade_Camera3743_g70845 );
				half Final_AlphaFade3727_g70845 = saturate( ( temp_output_41_0_g70864 + ( temp_output_41_0_g70864 * tex3D( TVE_ScreenTex3D, ( TVE_ScreenTexCoord * WorldPosition3905_g70845 ) ).r ) ) );
				float Main_Alpha316_g70845 = ( _MainColor.a * tex2DNode29_g70845.a );
				half Global_Extras_Alpha1033_g70845 = saturate( break89_g70850.a );
				float lerpResult5154_g70845 = lerp( 0.0 , Global_MeshVariation5104_g70845 , _AlphaVariationValue);
				half Global_Alpha_Variation5158_g70845 = lerpResult5154_g70845;
				half AlphaTreshold2132_g70845 = _AlphaClipValue;
				half Global_Alpha_Mask4546_g70845 = 1.0;
				float lerpResult5203_g70845 = lerp( 1.0 , ( ( Global_Extras_Alpha1033_g70845 - Global_Alpha_Variation5158_g70845 ) + AlphaTreshold2132_g70845 ) , ( Global_Alpha_Mask4546_g70845 * _GlobalAlpha ));
				float lerpResult16_g70919 = lerp( 1.0 , lerpResult5203_g70845 , TVE_Enabled);
				half Global_Alpha315_g70845 = lerpResult16_g70919;
				half Final_Alpha3754_g70845 = ( ( Main_Alpha316_g70845 * Global_Alpha315_g70845 ) - ( AlphaTreshold2132_g70845 - 0.5 ) );
				float temp_output_661_0_g70845 = ( Final_AlphaFade3727_g70845 * Final_Alpha3754_g70845 );
				float temp_output_3_0_g70865 = temp_output_661_0_g70845;
				half Offest27_g70865 = 0.5;
				half Feather30_g70865 = 0.5;
				float temp_output_3_0_g70878 = ( ( ( temp_output_3_0_g70865 - Offest27_g70865 ) / ( max( fwidth( temp_output_3_0_g70865 ) , 0.001 ) + Feather30_g70865 ) ) + Offest27_g70865 );
				float Alpha9_g70878 = temp_output_3_0_g70878;
				float temp_output_15_0_g70878 = 0.5;
				float Treshold9_g70878 = temp_output_15_0_g70878;
				{
				#if TVE_FEATURE_CLIP
				clip(Alpha9_g70878 - Treshold9_g70878);
				#endif
				}
				half Final_Clip914_g70845 = Alpha9_g70878;
				
				surfaceDescription.Normal = Final_Normal366_g70845;
				surfaceDescription.Smoothness = Final_SmoothnessAndWetness4130_g70845;
				surfaceDescription.Alpha = Final_Clip914_g70845;

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

			#define _MATERIAL_FEATURE_TRANSMISSION 1
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
			half4 _MainColor;
			half4 _ColorsMaskRemap;
			half4 _SubsurfaceMaskRemap;
			half4 _VertexOcclusionRemap;
			float4 _GradientMaskRemap;
			float4 _SubsurfaceDiffusion_asset;
			float4 _MaxBoundsInfo;
			float4 _SubsurfaceDiffusion_Asset;
			float4 _Color;
			half4 _GradientColorTwo;
			half4 _GradientColorOne;
			half4 _MainUVs;
			half4 _OverlayMaskRemap;
			half4 _SubsurfaceColor;
			half4 _VertexOcclusionColor;
			half4 _AlphaMaskRemap;
			float4 _EmissiveIntensityParams;
			half4 _EmissiveColor;
			half4 _EmissiveUVs;
			float4 _NoiseMaskRemap;
			half4 _DetailBlendRemap;
			half3 _render_normals;
			half _VertexOcclusionMinValue;
			float _MotionScale_32;
			half _MotionFacingValue;
			half _MotionValue_20;
			half _EmissiveExposureValue;
			half _MotionAmplitude_20;
			half _GlobalEmissive;
			half _MainSmoothnessValue;
			half _GlobalWetness;
			half _MotionSpeed_20;
			half _MotionVariation_20;
			half _MotionScale_20;
			half _InteractionMaskValue;
			half _InteractionAmplitude;
			half _VertexDynamicMode;
			half _MainOcclusionValue;
			half _MotionVariation_10;
			float _MotionSpeed_10;
			half _FadeGlancingValue;
			float _MotionScale_10;
			half _FadeCameraValue;
			half _MotionAmplitude_10;
			half _LayerMotionValue;
			float _MotionVariation_32;
			float _MotionSpeed_32;
			half _MotionNormalValue;
			half _MotionValue_30;
			half _MainNormalValue;
			half _OverlayMaskMaxValue;
			half _OverlayMaskMinValue;
			half _OverlayVariationValue;
			half _LayerExtrasValue;
			half _ExtrasPositionMode;
			half _GlobalOverlay;
			half _SubsurfaceMaskMaxValue;
			half _SubsurfaceMaskMinValue;
			half _SubsurfaceValue;
			half _ColorsMaskMaxValue;
			half _ColorsMaskMinValue;
			half _ColorsVariationValue;
			half _GlobalColors;
			half _LayerColorsValue;
			half _ColorsPositionMode;
			half _VertexPivotMode;
			half _GradientMaxValue;
			half _GradientMinValue;
			half _GlobalSize;
			half _LayerVertexValue;
			half _VertexDataMode;
			half _VertexOcclusionMaxValue;
			half _MotionAmplitude_32;
			half _render_cull;
			half _RenderSSR;
			half _RenderDirect;
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
			half _CategorySubsurface;
			half _SubsurfaceNormalValue;
			half _SpaceMotionGlobals;
			half _SubsurfaceShadowValue;
			half _RenderCoverage;
			half _RenderPriority;
			float _SubsurfaceDiffusion;
			half _VertexRollingMode;
			half _Cutoff;
			half _SubsurfaceScatteringValue;
			half _render_dst;
			half _IsSubsurfaceShader;
			half _render_zw;
			half _render_src;
			half _IsLeafShader;
			half _EmissiveFlagMode;
			half _subsurface_shadow;
			half _RenderClip;
			half _MessageMotionVariation;
			half _CategoryRender;
			half _SpaceGlobalPosition;
			half _AlphaVariationValue;
			half _RenderCull;
			half _SubsurfaceDirectValue;
			half _RenderZWrite;
			half _SubsurfaceAmbientValue;
			half _RenderQueue;
			half _SubsurfaceAngleValue;
			half _AlphaClipValue;
			half _VertexMasksMode;
			half _LayerReactValue;
			half _DetailBlendMode;
			half _MessageGlobalsVariation;
			half _VertexVariationMode;
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
			half _RenderDecals;
			half _GlobalAlpha;
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
			half4 TVE_FlutterParams;
			half TVE_MotionFadeEnd;
			half TVE_MotionFadeStart;
			half4 TVE_VertexParams;
			TEXTURE2D_ARRAY(TVE_VertexTex);
			half4 TVE_VertexCoords;
			float TVE_VertexUsage[10];
			half _DisableSRPBatcher;
			sampler2D _MainNormalTex;
			sampler2D _MainMaskTex;
			half TVE_OverlaySmoothness;
			sampler2D _MainAlbedoTex;
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
			#define ASE_NEEDS_FRAG_WORLD_VIEW_DIR
			#pragma shader_feature_local TVE_FEATURE_CLIP
			#pragma shader_feature_local TVE_FEATURE_BATCHING
			//TVE Pipeline Defines
			#define THE_VEGETATION_ENGINE
			#define TVE_IS_HD_PIPELINE
			//TVE HD Pipeline Defines
			#pragma shader_feature_local _DISABLE_DECALS
			#pragma shader_feature_local _DISABLE_SSR
			//TVE Shader Type Defines
			#define TVE_IS_VEGETATION_SHADER
			//TVE Injection Defines
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END


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
				float3 ase_normal : NORMAL;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_texcoord6 : TEXCOORD6;
				float4 ase_color : COLOR;
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
				float3 VertexPosition3588_g70845 = inputMesh.positionOS;
				half3 Mesh_PivotsOS2291_g70845 = half3(0,0,0);
				float3 temp_output_2283_0_g70845 = ( VertexPosition3588_g70845 - Mesh_PivotsOS2291_g70845 );
				half3 VertexPos40_g70921 = temp_output_2283_0_g70845;
				float3 appendResult74_g70921 = (float3(VertexPos40_g70921.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g70921 = appendResult74_g70921;
				float3 break84_g70921 = VertexPos40_g70921;
				float3 appendResult81_g70921 = (float3(0.0 , break84_g70921.y , break84_g70921.z));
				half3 VertexPosOtherAxis82_g70921 = appendResult81_g70921;
				float4 temp_output_91_19_g70881 = TVE_MotionCoords;
				float3 localObjectPosition_UNITY_MATRIX_M14_g70912 = ObjectPosition_UNITY_MATRIX_M();
				float3 appendResult60_g70870 = (float3(inputMesh.ase_texcoord3.x , inputMesh.ase_texcoord3.z , inputMesh.ase_texcoord3.y));
				half3 Mesh_PivotsData2831_g70845 = ( appendResult60_g70870 * _VertexPivotMode );
				float3 temp_output_122_0_g70912 = Mesh_PivotsData2831_g70845;
				float3 PivotsOnly105_g70912 = (mul( GetObjectToWorldMatrix(), float4( temp_output_122_0_g70912 , 0.0 ) ).xyz).xyz;
				#ifdef SHADEROPTIONS_CAMERA_RELATIVE_RENDERING
				float3 staticSwitch13_g70912 = ( ( localObjectPosition_UNITY_MATRIX_M14_g70912 + PivotsOnly105_g70912 ) + _WorldSpaceCameraPos );
				#else
				float3 staticSwitch13_g70912 = ( localObjectPosition_UNITY_MATRIX_M14_g70912 + PivotsOnly105_g70912 );
				#endif
				half3 ObjectData20_g70913 = staticSwitch13_g70912;
				float3 ase_worldPos = GetAbsolutePositionWS( TransformObjectToWorld( (inputMesh.positionOS).xyz ) );
				half3 WorldData19_g70913 = ase_worldPos;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g70913 = WorldData19_g70913;
				#else
				float3 staticSwitch14_g70913 = ObjectData20_g70913;
				#endif
				float3 temp_output_114_0_g70912 = staticSwitch14_g70913;
				float3 vertexToFrag4224_g70845 = temp_output_114_0_g70912;
				half3 ObjectData20_g70886 = vertexToFrag4224_g70845;
				float3 vertexToFrag3890_g70845 = ase_worldPos;
				half3 WorldData19_g70886 = vertexToFrag3890_g70845;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g70886 = WorldData19_g70886;
				#else
				float3 staticSwitch14_g70886 = ObjectData20_g70886;
				#endif
				float3 ObjectPosition4223_g70845 = staticSwitch14_g70886;
				half2 UV94_g70881 = ( (temp_output_91_19_g70881).zw + ( (temp_output_91_19_g70881).xy * (ObjectPosition4223_g70845).xz ) );
				float temp_output_84_0_g70881 = _LayerMotionValue;
				float4 lerpResult107_g70881 = lerp( TVE_MotionParams , saturate( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_MotionTex, sampler_linear_repeat, UV94_g70881,temp_output_84_0_g70881, 0.0 ) ) , TVE_MotionUsage[(int)temp_output_84_0_g70881]);
				half4 Global_Motion_Params3909_g70845 = lerpResult107_g70881;
				float4 break322_g70888 = Global_Motion_Params3909_g70845;
				float3 appendResult397_g70888 = (float3(break322_g70888.x , 0.0 , break322_g70888.y));
				float3 temp_output_398_0_g70888 = (appendResult397_g70888*2.0 + -1.0);
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				half2 Global_MotionDirectionOS39_g70845 = (( mul( GetWorldToObjectMatrix(), float4( temp_output_398_0_g70888 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_DirectionOS358_g70917 = Global_MotionDirectionOS39_g70845;
				half Mesh_Height1524_g70845 = inputMesh.ase_color.a;
				half Mesh_Height114_g70872 = Mesh_Height1524_g70845;
				half ObjectData20_g70873 = ( Mesh_Height114_g70872 * 2.0 );
				float enc62_g70871 = inputMesh.ase_texcoord.w;
				float2 localDecodeFloatToVector262_g70871 = DecodeFloatToVector2( enc62_g70871 );
				float2 break63_g70871 = ( localDecodeFloatToVector262_g70871 * 100.0 );
				float Bounds_Height5230_g70845 = break63_g70871.x;
				float Bounds_Height117_g70872 = Bounds_Height5230_g70845;
				half WorldData19_g70873 = ( ( Mesh_Height114_g70872 * Mesh_Height114_g70872 ) * Bounds_Height117_g70872 * 2.0 );
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g70873 = WorldData19_g70873;
				#else
				float staticSwitch14_g70873 = ObjectData20_g70873;
				#endif
				half Motion_10_Mask5242_g70845 = staticSwitch14_g70873;
				half Wind_Power369_g70888 = break322_g70888.z;
				half Global_MotionPower2223_g70845 = Wind_Power369_g70888;
				half3 Input_Position419_g70891 = -ObjectPosition4223_g70845;
				half2 Global_MotionDirectionWS4683_g70845 = (temp_output_398_0_g70888).xz;
				half2 Input_DirectionWS423_g70891 = Global_MotionDirectionWS4683_g70845;
				float Motion_Scale287_g70891 = ( _MotionScale_10 + 0.2 );
				half Global_Scale448_g70891 = TVE_NoiseParams.x;
				half Input_Speed62_g70891 = _MotionSpeed_10;
				half Global_Speed449_g70891 = TVE_NoiseParams.y;
				float mulTime426_g70891 = _TimeParameters.x * ( Input_Speed62_g70891 * Global_Speed449_g70891 );
				half Global_DistScale561_g70891 = TVE_NoiseParams.w;
				float3 break461_g70891 = ( Input_Position419_g70891 * Global_DistScale561_g70891 );
				half Global_DistAmplitude559_g70891 = TVE_NoiseParams.z;
				float Noise_Distortion469_g70891 = ( sin( ( break461_g70891.x + break461_g70891.z ) ) * Global_DistAmplitude559_g70891 );
				float3 break111_g70874 = ObjectPosition4223_g70845;
				half Global_DynamicMode5112_g70845 = _VertexDynamicMode;
				half Input_DynamicMode120_g70874 = Global_DynamicMode5112_g70845;
				float Mesh_Variation16_g70845 = inputMesh.ase_color.r;
				half Input_Variation124_g70874 = Mesh_Variation16_g70845;
				half ObjectData20_g70875 = frac( ( ( ( break111_g70874.x + break111_g70874.y + break111_g70874.z ) * ( 1.0 - Input_DynamicMode120_g70874 ) ) + Input_Variation124_g70874 ) );
				half WorldData19_g70875 = Input_Variation124_g70874;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g70875 = WorldData19_g70875;
				#else
				float staticSwitch14_g70875 = ObjectData20_g70875;
				#endif
				float clampResult129_g70874 = clamp( staticSwitch14_g70875 , 0.01 , 0.99 );
				half Global_MeshVariation5104_g70845 = clampResult129_g70874;
				half Motion_Variation284_g70891 = ( _MotionVariation_10 * Global_MeshVariation5104_g70845 );
				float2 temp_output_425_0_g70891 = ( ( (Input_Position419_g70891).xz * Input_DirectionWS423_g70891 * Motion_Scale287_g70891 * Global_Scale448_g70891 ) + ( mulTime426_g70891 + Noise_Distortion469_g70891 + Motion_Variation284_g70891 ) );
				float2 break500_g70891 = ( temp_output_425_0_g70891 * 0.1178 );
				float2 break494_g70891 = ( temp_output_425_0_g70891 * 0.1742 );
				half Input_WindPower327_g70891 = Global_MotionPower2223_g70845;
				float lerpResult430_g70891 = lerp( 1.4 , 0.4 , Input_WindPower327_g70891);
				half Global_MotionNoise34_g70845 = (pow( (( sin( ( break500_g70891.x + break500_g70891.y ) ) * sin( ( break494_g70891.x + break494_g70891.y ) ) )*0.4 + 0.6) , lerpResult430_g70891 )*1.2 + -0.2);
				half Motion_10_Amplitude2258_g70845 = ( _MotionAmplitude_10 * Motion_10_Mask5242_g70845 * Global_MotionPower2223_g70845 * Global_MotionNoise34_g70845 );
				half Input_BendingAmplitude376_g70917 = Motion_10_Amplitude2258_g70845;
				half Input_InteractionAmplitude58_g70917 = _InteractionAmplitude;
				half Input_MeshMotion_10321_g70917 = Motion_10_Mask5242_g70845;
				half Input_InteractionUseMask62_g70917 = _InteractionMaskValue;
				float lerpResult371_g70917 = lerp( 2.0 , Input_MeshMotion_10321_g70917 , Input_InteractionUseMask62_g70917);
				half ObjectData20_g70918 = lerpResult371_g70917;
				half WorldData19_g70918 = Input_MeshMotion_10321_g70917;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g70918 = WorldData19_g70918;
				#else
				float staticSwitch14_g70918 = ObjectData20_g70918;
				#endif
				half Motion_10_Interaction373_g70917 = ( Input_InteractionAmplitude58_g70917 * staticSwitch14_g70918 );
				half Global_InteractionMask66_g70845 = ( break322_g70888.w * break322_g70888.w );
				float Input_InteractionMask330_g70917 = Global_InteractionMask66_g70845;
				float lerpResult360_g70917 = lerp( Input_BendingAmplitude376_g70917 , Motion_10_Interaction373_g70917 , saturate( ( Input_InteractionAmplitude58_g70917 * Input_InteractionMask330_g70917 ) ));
				float2 break364_g70917 = ( Input_DirectionOS358_g70917 * lerpResult360_g70917 );
				half Motion_10_BendingZ190_g70845 = break364_g70917.y;
				half Angle44_g70921 = Motion_10_BendingZ190_g70845;
				half3 VertexPos40_g70920 = ( VertexPosRotationAxis50_g70921 + ( VertexPosOtherAxis82_g70921 * cos( Angle44_g70921 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g70921 ) * sin( Angle44_g70921 ) ) );
				float3 appendResult74_g70920 = (float3(0.0 , 0.0 , VertexPos40_g70920.z));
				half3 VertexPosRotationAxis50_g70920 = appendResult74_g70920;
				float3 break84_g70920 = VertexPos40_g70920;
				float3 appendResult81_g70920 = (float3(break84_g70920.x , break84_g70920.y , 0.0));
				half3 VertexPosOtherAxis82_g70920 = appendResult81_g70920;
				half Motion_10_BendingX216_g70845 = break364_g70917.x;
				half Angle44_g70920 = -Motion_10_BendingX216_g70845;
				half Input_Scale321_g70860 = _MotionScale_20;
				half Input_Variation330_g70860 = ( _MotionVariation_20 * Global_MeshVariation5104_g70845 );
				half Input_Speed62_g70860 = _MotionSpeed_20;
				float mulTime349_g70860 = _TimeParameters.x * Input_Speed62_g70860;
				float temp_output_302_0_g70860 = sin( ( ( ( ase_worldPos.x + ase_worldPos.y + ase_worldPos.z ) * Input_Scale321_g70860 ) + Input_Variation330_g70860 + mulTime349_g70860 ) );
				float enc59_g70871 = inputMesh.ase_texcoord.z;
				float2 localDecodeFloatToVector259_g70871 = DecodeFloatToVector2( enc59_g70871 );
				float2 break61_g70871 = localDecodeFloatToVector259_g70871;
				half Mesh_Motion_2060_g70845 = break61_g70871.x;
				half Mesh_Motion_20115_g70872 = Mesh_Motion_2060_g70845;
				float Bounds_Radius5231_g70845 = break63_g70871.y;
				float Bounds_Radius118_g70872 = Bounds_Radius5231_g70845;
				half Motion_20_Mask5243_g70845 = ( Mesh_Motion_20115_g70872 * Bounds_Radius118_g70872 );
				half3 Input_Position419_g70876 = VertexPosition3588_g70845;
				float3 normalizeResult518_g70876 = normalize( Input_Position419_g70876 );
				half2 Input_DirectionOS423_g70876 = Global_MotionDirectionOS39_g70845;
				float2 break521_g70876 = -Input_DirectionOS423_g70876;
				float3 appendResult522_g70876 = (float3(break521_g70876.x , 0.0 , break521_g70876.y));
				float dotResult519_g70876 = dot( normalizeResult518_g70876 , appendResult522_g70876 );
				half Input_Mask62_g70876 = _MotionFacingValue;
				float lerpResult524_g70876 = lerp( 1.0 , (dotResult519_g70876*0.5 + 0.5) , Input_Mask62_g70876);
				half ObjectData20_g70877 = lerpResult524_g70876;
				half WorldData19_g70877 = 1.0;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g70877 = WorldData19_g70877;
				#else
				float staticSwitch14_g70877 = ObjectData20_g70877;
				#endif
				half Motion_FacingMask5214_g70845 = staticSwitch14_g70877;
				half Motion_20_Amplitude4381_g70845 = ( _MotionAmplitude_20 * _MotionValue_20 * Motion_20_Mask5243_g70845 * Global_MotionPower2223_g70845 * Global_MotionNoise34_g70845 * Motion_FacingMask5214_g70845 );
				half Input_Amplitude58_g70860 = Motion_20_Amplitude4381_g70845;
				half2 Input_DirectionOS366_g70860 = Global_MotionDirectionOS39_g70845;
				float2 break371_g70860 = Input_DirectionOS366_g70860;
				float3 appendResult372_g70860 = (float3(break371_g70860.x , ( temp_output_302_0_g70860 * 0.1 ) , break371_g70860.y));
				half3 Motion_20_Squash4418_g70845 = ( ( (temp_output_302_0_g70860*0.2 + 1.0) * Input_Amplitude58_g70860 ) * appendResult372_g70860 );
				half Motion_Scale321_g70908 = _MotionScale_32;
				half Motion_Variation330_g70908 = ( _MotionVariation_32 * Global_MeshVariation5104_g70845 );
				half Input_Speed62_g70908 = _MotionSpeed_32;
				half Global_Speed350_g70908 = TVE_FlutterParams.y;
				float mulTime349_g70908 = _TimeParameters.x * ( Input_Speed62_g70908 * Global_Speed350_g70908 );
				half Mesh_Motion_30144_g70845 = break61_g70871.y;
				half Mesh_Motion_30116_g70872 = Mesh_Motion_30144_g70845;
				half Motion_30_Mask5244_g70845 = ( Mesh_Motion_30116_g70872 * 0.4 );
				float temp_output_7_0_g70869 = TVE_MotionFadeEnd;
				half Motion_FadeOut4005_g70845 = saturate( ( ( distance( ase_worldPos , _WorldSpaceCameraPos ) - temp_output_7_0_g70869 ) / ( TVE_MotionFadeStart - temp_output_7_0_g70869 ) ) );
				half Motion_30_Amplitude4960_g70845 = ( _MotionAmplitude_32 * _MotionValue_30 * Motion_30_Mask5244_g70845 * Global_MotionPower2223_g70845 * Global_MotionNoise34_g70845 * Motion_FacingMask5214_g70845 * Motion_FadeOut4005_g70845 );
				half Input_Amplitude58_g70908 = Motion_30_Amplitude4960_g70845;
				half Global_Power354_g70908 = TVE_FlutterParams.x;
				half Motion_Normal364_g70908 = _MotionNormalValue;
				float3 lerpResult370_g70908 = lerp( float3( 1,1,1 ) , inputMesh.normalOS , Motion_Normal364_g70908);
				half3 Motion_30_Details263_g70845 = ( ( sin( ( ( ( ase_worldPos.x + ase_worldPos.y + ase_worldPos.z ) * Motion_Scale321_g70908 ) + Motion_Variation330_g70908 + mulTime349_g70908 ) ) * Input_Amplitude58_g70908 * Global_Power354_g70908 ) * lerpResult370_g70908 );
				float3 Vertex_Motion_Object833_g70845 = ( ( ( VertexPosRotationAxis50_g70920 + ( VertexPosOtherAxis82_g70920 * cos( Angle44_g70920 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g70920 ) * sin( Angle44_g70920 ) ) ) + Motion_20_Squash4418_g70845 ) + Motion_30_Details263_g70845 );
				float3 temp_output_3474_0_g70845 = ( VertexPosition3588_g70845 - Mesh_PivotsOS2291_g70845 );
				float3 appendResult2043_g70845 = (float3(Motion_10_BendingX216_g70845 , 0.0 , Motion_10_BendingZ190_g70845));
				float3 Vertex_Motion_World1118_g70845 = ( ( ( temp_output_3474_0_g70845 + appendResult2043_g70845 ) + Motion_20_Squash4418_g70845 ) + Motion_30_Details263_g70845 );
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch4976_g70845 = Vertex_Motion_World1118_g70845;
				#else
				float3 staticSwitch4976_g70845 = ( Vertex_Motion_Object833_g70845 + ( _VertexDataMode * 0.0 ) );
				#endif
				float4 temp_output_94_19_g70904 = TVE_VertexCoords;
				half2 UV97_g70904 = ( (temp_output_94_19_g70904).zw + ( (temp_output_94_19_g70904).xy * (ObjectPosition4223_g70845).xz ) );
				float temp_output_84_0_g70904 = _LayerVertexValue;
				float4 lerpResult109_g70904 = lerp( TVE_VertexParams , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_VertexTex, sampler_linear_repeat, UV97_g70904,temp_output_84_0_g70904, 0.0 ) , TVE_VertexUsage[(int)temp_output_84_0_g70904]);
				half4 Global_Object_Params4173_g70845 = lerpResult109_g70904;
				half Global_VertexSize174_g70845 = saturate( Global_Object_Params4173_g70845.w );
				float lerpResult346_g70845 = lerp( 1.0 , Global_VertexSize174_g70845 , _GlobalSize);
				float3 appendResult3480_g70845 = (float3(lerpResult346_g70845 , lerpResult346_g70845 , lerpResult346_g70845));
				half3 ObjectData20_g70880 = appendResult3480_g70845;
				half3 _Vector11 = half3(1,1,1);
				half3 WorldData19_g70880 = _Vector11;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g70880 = WorldData19_g70880;
				#else
				float3 staticSwitch14_g70880 = ObjectData20_g70880;
				#endif
				half3 Vertex_Size1741_g70845 = staticSwitch14_g70880;
				half3 _Vector5 = half3(1,1,1);
				float3 Vertex_SizeFade1740_g70845 = _Vector5;
				half3 Grass_Perspective2661_g70845 = half3(0,0,0);
				float3 lerpResult16_g70879 = lerp( VertexPosition3588_g70845 , ( ( staticSwitch4976_g70845 * Vertex_Size1741_g70845 * Vertex_SizeFade1740_g70845 ) + Mesh_PivotsOS2291_g70845 + Grass_Perspective2661_g70845 ) , TVE_Enabled);
				float3 Final_VertexPosition890_g70845 = ( lerpResult16_g70879 + _DisableSRPBatcher );
				
				float3 ase_worldNormal = TransformObjectToWorldNormal(inputMesh.normalOS);
				float3 vertexToFrag5058_g70845 = ase_worldNormal;
				outputPackedVaryingsMeshToPS.ase_texcoord4.xyz = vertexToFrag5058_g70845;
				outputPackedVaryingsMeshToPS.ase_texcoord5.xyz = vertexToFrag3890_g70845;
				outputPackedVaryingsMeshToPS.ase_texcoord6.xyz = vertexToFrag4224_g70845;
				
				outputPackedVaryingsMeshToPS.ase_texcoord7.xyz = ase_worldPos;
				float temp_output_7_0_g70861 = TVE_CameraFadeStart;
				float lerpResult4755_g70845 = lerp( 1.0 , saturate( ( ( distance( ase_worldPos , _WorldSpaceCameraPos ) - temp_output_7_0_g70861 ) / ( TVE_CameraFadeEnd - temp_output_7_0_g70861 ) ) ) , _FadeCameraValue);
				float vertexToFrag11_g70867 = lerpResult4755_g70845;
				outputPackedVaryingsMeshToPS.ase_texcoord4.w = vertexToFrag11_g70867;
				
				outputPackedVaryingsMeshToPS.ase_texcoord3 = inputMesh.ase_texcoord;
				outputPackedVaryingsMeshToPS.ase_normal = inputMesh.normalOS;
				outputPackedVaryingsMeshToPS.ase_color = inputMesh.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				outputPackedVaryingsMeshToPS.ase_texcoord5.w = 0;
				outputPackedVaryingsMeshToPS.ase_texcoord6.w = 0;
				outputPackedVaryingsMeshToPS.ase_texcoord7.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue = Final_VertexPosition890_g70845;

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
				half2 Main_UVs15_g70845 = ( ( packedInput.ase_texcoord3.xy * (_MainUVs).xy ) + (_MainUVs).zw );
				float3 unpack4112_g70845 = UnpackNormalScale( tex2D( _MainNormalTex, Main_UVs15_g70845 ), _MainNormalValue );
				unpack4112_g70845.z = lerp( 1, unpack4112_g70845.z, saturate(_MainNormalValue) );
				half3 Main_Normal137_g70845 = unpack4112_g70845;
				float3 temp_output_13_0_g70856 = Main_Normal137_g70845;
				float3 switchResult12_g70856 = (((ase_vface>0)?(temp_output_13_0_g70856):(( temp_output_13_0_g70856 * _render_normals ))));
				half3 Blend_Normal312_g70845 = switchResult12_g70856;
				half3 Final_Normal366_g70845 = Blend_Normal312_g70845;
				
				float4 tex2DNode35_g70845 = tex2D( _MainMaskTex, Main_UVs15_g70845 );
				half Main_Smoothness227_g70845 = ( tex2DNode35_g70845.a * _MainSmoothnessValue );
				half Blend_Smoothness314_g70845 = Main_Smoothness227_g70845;
				half Global_OverlaySmoothness311_g70845 = TVE_OverlaySmoothness;
				float3 vertexToFrag5058_g70845 = packedInput.ase_texcoord4.xyz;
				half3 World_Normal4101_g70845 = vertexToFrag5058_g70845;
				half Global_DynamicMode5112_g70845 = _VertexDynamicMode;
				float lerpResult4801_g70845 = lerp( World_Normal4101_g70845.y , packedInput.ase_normal.y , Global_DynamicMode5112_g70845);
				float lerpResult3567_g70845 = lerp( 0.5 , 1.0 , lerpResult4801_g70845);
				float4 tex2DNode29_g70845 = tex2D( _MainAlbedoTex, Main_UVs15_g70845 );
				half3 Main_Albedo99_g70845 = ( (_MainColor).rgb * (tex2DNode29_g70845).rgb );
				half3 Blend_Albedo265_g70845 = Main_Albedo99_g70845;
				float4 temp_output_93_19_g70850 = TVE_ExtrasCoords;
				float3 vertexToFrag3890_g70845 = packedInput.ase_texcoord5.xyz;
				float3 WorldPosition3905_g70845 = vertexToFrag3890_g70845;
				float3 vertexToFrag4224_g70845 = packedInput.ase_texcoord6.xyz;
				half3 ObjectData20_g70886 = vertexToFrag4224_g70845;
				half3 WorldData19_g70886 = vertexToFrag3890_g70845;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g70886 = WorldData19_g70886;
				#else
				float3 staticSwitch14_g70886 = ObjectData20_g70886;
				#endif
				float3 ObjectPosition4223_g70845 = staticSwitch14_g70886;
				float3 lerpResult4827_g70845 = lerp( WorldPosition3905_g70845 , ObjectPosition4223_g70845 , _ExtrasPositionMode);
				half2 UV96_g70850 = ( (temp_output_93_19_g70850).zw + ( (temp_output_93_19_g70850).xy * (lerpResult4827_g70845).xz ) );
				float temp_output_84_0_g70850 = _LayerExtrasValue;
				float4 lerpResult109_g70850 = lerp( TVE_ExtrasParams , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_ExtrasTex, sampler_linear_repeat, UV96_g70850,temp_output_84_0_g70850, 0.0 ) , TVE_ExtrasUsage[(int)temp_output_84_0_g70850]);
				float4 break89_g70850 = lerpResult109_g70850;
				half Global_Extras_Overlay156_g70845 = break89_g70850.b;
				float3 break111_g70874 = ObjectPosition4223_g70845;
				half Input_DynamicMode120_g70874 = Global_DynamicMode5112_g70845;
				float Mesh_Variation16_g70845 = packedInput.ase_color.r;
				half Input_Variation124_g70874 = Mesh_Variation16_g70845;
				half ObjectData20_g70875 = frac( ( ( ( break111_g70874.x + break111_g70874.y + break111_g70874.z ) * ( 1.0 - Input_DynamicMode120_g70874 ) ) + Input_Variation124_g70874 ) );
				half WorldData19_g70875 = Input_Variation124_g70874;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g70875 = WorldData19_g70875;
				#else
				float staticSwitch14_g70875 = ObjectData20_g70875;
				#endif
				float clampResult129_g70874 = clamp( staticSwitch14_g70875 , 0.01 , 0.99 );
				half Global_MeshVariation5104_g70845 = clampResult129_g70874;
				float lerpResult1065_g70845 = lerp( 1.0 , Global_MeshVariation5104_g70845 , _OverlayVariationValue);
				half Overlay_Variation4560_g70845 = lerpResult1065_g70845;
				half Overlay_Commons1365_g70845 = ( _GlobalOverlay * Global_Extras_Overlay156_g70845 * Overlay_Variation4560_g70845 );
				half Overlay_Mask_3D5122_g70845 = ( ( ( lerpResult3567_g70845 * 0.5 ) + Blend_Albedo265_g70845.y ) * Overlay_Commons1365_g70845 );
				float temp_output_7_0_g70887 = _OverlayMaskMinValue;
				half Overlay_Mask269_g70845 = saturate( ( ( Overlay_Mask_3D5122_g70845 - temp_output_7_0_g70887 ) / ( _OverlayMaskMaxValue - temp_output_7_0_g70887 ) ) );
				float lerpResult343_g70845 = lerp( Blend_Smoothness314_g70845 , Global_OverlaySmoothness311_g70845 , Overlay_Mask269_g70845);
				half Final_Smoothness371_g70845 = lerpResult343_g70845;
				half Global_Extras_Wetness305_g70845 = break89_g70850.g;
				float lerpResult3673_g70845 = lerp( 0.0 , Global_Extras_Wetness305_g70845 , _GlobalWetness);
				half Final_SmoothnessAndWetness4130_g70845 = saturate( ( Final_Smoothness371_g70845 + lerpResult3673_g70845 ) );
				
				float localCustomAlphaClip9_g70878 = ( 0.0 );
				float3 normalizeResult2169_g70845 = normalize( V );
				float3 ViewDir_Normalized3963_g70845 = normalizeResult2169_g70845;
				float3 ase_worldPos = packedInput.ase_texcoord7.xyz;
				float3 normalizeResult3971_g70845 = normalize( cross( ddy( ase_worldPos ) , ddx( ase_worldPos ) ) );
				float3 NormalsWS_Derivates3972_g70845 = normalizeResult3971_g70845;
				float dotResult3851_g70845 = dot( ViewDir_Normalized3963_g70845 , NormalsWS_Derivates3972_g70845 );
				float lerpResult3993_g70845 = lerp( 1.0 , saturate( abs( dotResult3851_g70845 ) ) , _FadeGlancingValue);
				half Fade_Glancing3853_g70845 = lerpResult3993_g70845;
				float vertexToFrag11_g70867 = packedInput.ase_texcoord4.w;
				half Fade_Camera_Mask5149_g70845 = 1.0;
				float lerpResult5141_g70845 = lerp( 1.0 , vertexToFrag11_g70867 , Fade_Camera_Mask5149_g70845);
				half Fade_Camera3743_g70845 = lerpResult5141_g70845;
				float temp_output_41_0_g70864 = ( Fade_Glancing3853_g70845 * Fade_Camera3743_g70845 );
				half Final_AlphaFade3727_g70845 = saturate( ( temp_output_41_0_g70864 + ( temp_output_41_0_g70864 * tex3D( TVE_ScreenTex3D, ( TVE_ScreenTexCoord * WorldPosition3905_g70845 ) ).r ) ) );
				float Main_Alpha316_g70845 = ( _MainColor.a * tex2DNode29_g70845.a );
				half Global_Extras_Alpha1033_g70845 = saturate( break89_g70850.a );
				float lerpResult5154_g70845 = lerp( 0.0 , Global_MeshVariation5104_g70845 , _AlphaVariationValue);
				half Global_Alpha_Variation5158_g70845 = lerpResult5154_g70845;
				half AlphaTreshold2132_g70845 = _AlphaClipValue;
				half Global_Alpha_Mask4546_g70845 = 1.0;
				float lerpResult5203_g70845 = lerp( 1.0 , ( ( Global_Extras_Alpha1033_g70845 - Global_Alpha_Variation5158_g70845 ) + AlphaTreshold2132_g70845 ) , ( Global_Alpha_Mask4546_g70845 * _GlobalAlpha ));
				float lerpResult16_g70919 = lerp( 1.0 , lerpResult5203_g70845 , TVE_Enabled);
				half Global_Alpha315_g70845 = lerpResult16_g70919;
				half Final_Alpha3754_g70845 = ( ( Main_Alpha316_g70845 * Global_Alpha315_g70845 ) - ( AlphaTreshold2132_g70845 - 0.5 ) );
				float temp_output_661_0_g70845 = ( Final_AlphaFade3727_g70845 * Final_Alpha3754_g70845 );
				float temp_output_3_0_g70865 = temp_output_661_0_g70845;
				half Offest27_g70865 = 0.5;
				half Feather30_g70865 = 0.5;
				float temp_output_3_0_g70878 = ( ( ( temp_output_3_0_g70865 - Offest27_g70865 ) / ( max( fwidth( temp_output_3_0_g70865 ) , 0.001 ) + Feather30_g70865 ) ) + Offest27_g70865 );
				float Alpha9_g70878 = temp_output_3_0_g70878;
				float temp_output_15_0_g70878 = 0.5;
				float Treshold9_g70878 = temp_output_15_0_g70878;
				{
				#if TVE_FEATURE_CLIP
				clip(Alpha9_g70878 - Treshold9_g70878);
				#endif
				}
				half Final_Clip914_g70845 = Alpha9_g70878;
				
				surfaceDescription.Normal = Final_Normal366_g70845;
				surfaceDescription.Smoothness = Final_SmoothnessAndWetness4130_g70845;
				surfaceDescription.Alpha = Final_Clip914_g70845;

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

			#define _MATERIAL_FEATURE_TRANSMISSION 1
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
			half4 _MainColor;
			half4 _ColorsMaskRemap;
			half4 _SubsurfaceMaskRemap;
			half4 _VertexOcclusionRemap;
			float4 _GradientMaskRemap;
			float4 _SubsurfaceDiffusion_asset;
			float4 _MaxBoundsInfo;
			float4 _SubsurfaceDiffusion_Asset;
			float4 _Color;
			half4 _GradientColorTwo;
			half4 _GradientColorOne;
			half4 _MainUVs;
			half4 _OverlayMaskRemap;
			half4 _SubsurfaceColor;
			half4 _VertexOcclusionColor;
			half4 _AlphaMaskRemap;
			float4 _EmissiveIntensityParams;
			half4 _EmissiveColor;
			half4 _EmissiveUVs;
			float4 _NoiseMaskRemap;
			half4 _DetailBlendRemap;
			half3 _render_normals;
			half _VertexOcclusionMinValue;
			float _MotionScale_32;
			half _MotionFacingValue;
			half _MotionValue_20;
			half _EmissiveExposureValue;
			half _MotionAmplitude_20;
			half _GlobalEmissive;
			half _MainSmoothnessValue;
			half _GlobalWetness;
			half _MotionSpeed_20;
			half _MotionVariation_20;
			half _MotionScale_20;
			half _InteractionMaskValue;
			half _InteractionAmplitude;
			half _VertexDynamicMode;
			half _MainOcclusionValue;
			half _MotionVariation_10;
			float _MotionSpeed_10;
			half _FadeGlancingValue;
			float _MotionScale_10;
			half _FadeCameraValue;
			half _MotionAmplitude_10;
			half _LayerMotionValue;
			float _MotionVariation_32;
			float _MotionSpeed_32;
			half _MotionNormalValue;
			half _MotionValue_30;
			half _MainNormalValue;
			half _OverlayMaskMaxValue;
			half _OverlayMaskMinValue;
			half _OverlayVariationValue;
			half _LayerExtrasValue;
			half _ExtrasPositionMode;
			half _GlobalOverlay;
			half _SubsurfaceMaskMaxValue;
			half _SubsurfaceMaskMinValue;
			half _SubsurfaceValue;
			half _ColorsMaskMaxValue;
			half _ColorsMaskMinValue;
			half _ColorsVariationValue;
			half _GlobalColors;
			half _LayerColorsValue;
			half _ColorsPositionMode;
			half _VertexPivotMode;
			half _GradientMaxValue;
			half _GradientMinValue;
			half _GlobalSize;
			half _LayerVertexValue;
			half _VertexDataMode;
			half _VertexOcclusionMaxValue;
			half _MotionAmplitude_32;
			half _render_cull;
			half _RenderSSR;
			half _RenderDirect;
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
			half _CategorySubsurface;
			half _SubsurfaceNormalValue;
			half _SpaceMotionGlobals;
			half _SubsurfaceShadowValue;
			half _RenderCoverage;
			half _RenderPriority;
			float _SubsurfaceDiffusion;
			half _VertexRollingMode;
			half _Cutoff;
			half _SubsurfaceScatteringValue;
			half _render_dst;
			half _IsSubsurfaceShader;
			half _render_zw;
			half _render_src;
			half _IsLeafShader;
			half _EmissiveFlagMode;
			half _subsurface_shadow;
			half _RenderClip;
			half _MessageMotionVariation;
			half _CategoryRender;
			half _SpaceGlobalPosition;
			half _AlphaVariationValue;
			half _RenderCull;
			half _SubsurfaceDirectValue;
			half _RenderZWrite;
			half _SubsurfaceAmbientValue;
			half _RenderQueue;
			half _SubsurfaceAngleValue;
			half _AlphaClipValue;
			half _VertexMasksMode;
			half _LayerReactValue;
			half _DetailBlendMode;
			half _MessageGlobalsVariation;
			half _VertexVariationMode;
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
			half _RenderDecals;
			half _GlobalAlpha;
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
			half4 TVE_FlutterParams;
			half TVE_MotionFadeEnd;
			half TVE_MotionFadeStart;
			half4 TVE_VertexParams;
			TEXTURE2D_ARRAY(TVE_VertexTex);
			half4 TVE_VertexCoords;
			float TVE_VertexUsage[10];
			half _DisableSRPBatcher;
			sampler2D _MainAlbedoTex;
			half4 TVE_ColorsParams;
			TEXTURE2D_ARRAY(TVE_ColorsTex);
			half4 TVE_ColorsCoords;
			float TVE_ColorsUsage[10];
			sampler2D _MainMaskTex;
			half TVE_SubsurfaceValue;
			half3 TVE_MainLightDirection;
			half4 TVE_OverlayColor;
			half4 TVE_ExtrasParams;
			TEXTURE2D_ARRAY(TVE_ExtrasTex);
			half4 TVE_ExtrasCoords;
			float TVE_ExtrasUsage[10];
			sampler2D _MainNormalTex;
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
			#define ASE_NEEDS_FRAG_WORLD_VIEW_DIR
			#define ASE_NEEDS_FRAG_VFACE
			#define ASE_NEEDS_FRAG_RELATIVE_WORLD_POS
			#pragma shader_feature_local TVE_FEATURE_CLIP
			#pragma shader_feature_local TVE_FEATURE_BATCHING
			//TVE Pipeline Defines
			#define THE_VEGETATION_ENGINE
			#define TVE_IS_HD_PIPELINE
			//TVE HD Pipeline Defines
			#pragma shader_feature_local _DISABLE_DECALS
			#pragma shader_feature_local _DISABLE_SSR
			//TVE Shader Type Defines
			#define TVE_IS_VEGETATION_SHADER
			//TVE Injection Defines
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END


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
				float4 ase_color : COLOR;
				float4 ase_texcoord10 : TEXCOORD10;
				float3 ase_normal : NORMAL;
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
				float3 VertexPosition3588_g70845 = inputMesh.positionOS;
				half3 Mesh_PivotsOS2291_g70845 = half3(0,0,0);
				float3 temp_output_2283_0_g70845 = ( VertexPosition3588_g70845 - Mesh_PivotsOS2291_g70845 );
				half3 VertexPos40_g70921 = temp_output_2283_0_g70845;
				float3 appendResult74_g70921 = (float3(VertexPos40_g70921.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g70921 = appendResult74_g70921;
				float3 break84_g70921 = VertexPos40_g70921;
				float3 appendResult81_g70921 = (float3(0.0 , break84_g70921.y , break84_g70921.z));
				half3 VertexPosOtherAxis82_g70921 = appendResult81_g70921;
				float4 temp_output_91_19_g70881 = TVE_MotionCoords;
				float3 localObjectPosition_UNITY_MATRIX_M14_g70912 = ObjectPosition_UNITY_MATRIX_M();
				float3 appendResult60_g70870 = (float3(inputMesh.ase_texcoord3.x , inputMesh.ase_texcoord3.z , inputMesh.ase_texcoord3.y));
				half3 Mesh_PivotsData2831_g70845 = ( appendResult60_g70870 * _VertexPivotMode );
				float3 temp_output_122_0_g70912 = Mesh_PivotsData2831_g70845;
				float3 PivotsOnly105_g70912 = (mul( GetObjectToWorldMatrix(), float4( temp_output_122_0_g70912 , 0.0 ) ).xyz).xyz;
				#ifdef SHADEROPTIONS_CAMERA_RELATIVE_RENDERING
				float3 staticSwitch13_g70912 = ( ( localObjectPosition_UNITY_MATRIX_M14_g70912 + PivotsOnly105_g70912 ) + _WorldSpaceCameraPos );
				#else
				float3 staticSwitch13_g70912 = ( localObjectPosition_UNITY_MATRIX_M14_g70912 + PivotsOnly105_g70912 );
				#endif
				half3 ObjectData20_g70913 = staticSwitch13_g70912;
				float3 ase_worldPos = GetAbsolutePositionWS( TransformObjectToWorld( (inputMesh.positionOS).xyz ) );
				half3 WorldData19_g70913 = ase_worldPos;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g70913 = WorldData19_g70913;
				#else
				float3 staticSwitch14_g70913 = ObjectData20_g70913;
				#endif
				float3 temp_output_114_0_g70912 = staticSwitch14_g70913;
				float3 vertexToFrag4224_g70845 = temp_output_114_0_g70912;
				half3 ObjectData20_g70886 = vertexToFrag4224_g70845;
				float3 vertexToFrag3890_g70845 = ase_worldPos;
				half3 WorldData19_g70886 = vertexToFrag3890_g70845;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g70886 = WorldData19_g70886;
				#else
				float3 staticSwitch14_g70886 = ObjectData20_g70886;
				#endif
				float3 ObjectPosition4223_g70845 = staticSwitch14_g70886;
				half2 UV94_g70881 = ( (temp_output_91_19_g70881).zw + ( (temp_output_91_19_g70881).xy * (ObjectPosition4223_g70845).xz ) );
				float temp_output_84_0_g70881 = _LayerMotionValue;
				float4 lerpResult107_g70881 = lerp( TVE_MotionParams , saturate( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_MotionTex, sampler_linear_repeat, UV94_g70881,temp_output_84_0_g70881, 0.0 ) ) , TVE_MotionUsage[(int)temp_output_84_0_g70881]);
				half4 Global_Motion_Params3909_g70845 = lerpResult107_g70881;
				float4 break322_g70888 = Global_Motion_Params3909_g70845;
				float3 appendResult397_g70888 = (float3(break322_g70888.x , 0.0 , break322_g70888.y));
				float3 temp_output_398_0_g70888 = (appendResult397_g70888*2.0 + -1.0);
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				half2 Global_MotionDirectionOS39_g70845 = (( mul( GetWorldToObjectMatrix(), float4( temp_output_398_0_g70888 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_DirectionOS358_g70917 = Global_MotionDirectionOS39_g70845;
				half Mesh_Height1524_g70845 = inputMesh.ase_color.a;
				half Mesh_Height114_g70872 = Mesh_Height1524_g70845;
				half ObjectData20_g70873 = ( Mesh_Height114_g70872 * 2.0 );
				float enc62_g70871 = inputMesh.ase_texcoord.w;
				float2 localDecodeFloatToVector262_g70871 = DecodeFloatToVector2( enc62_g70871 );
				float2 break63_g70871 = ( localDecodeFloatToVector262_g70871 * 100.0 );
				float Bounds_Height5230_g70845 = break63_g70871.x;
				float Bounds_Height117_g70872 = Bounds_Height5230_g70845;
				half WorldData19_g70873 = ( ( Mesh_Height114_g70872 * Mesh_Height114_g70872 ) * Bounds_Height117_g70872 * 2.0 );
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g70873 = WorldData19_g70873;
				#else
				float staticSwitch14_g70873 = ObjectData20_g70873;
				#endif
				half Motion_10_Mask5242_g70845 = staticSwitch14_g70873;
				half Wind_Power369_g70888 = break322_g70888.z;
				half Global_MotionPower2223_g70845 = Wind_Power369_g70888;
				half3 Input_Position419_g70891 = -ObjectPosition4223_g70845;
				half2 Global_MotionDirectionWS4683_g70845 = (temp_output_398_0_g70888).xz;
				half2 Input_DirectionWS423_g70891 = Global_MotionDirectionWS4683_g70845;
				float Motion_Scale287_g70891 = ( _MotionScale_10 + 0.2 );
				half Global_Scale448_g70891 = TVE_NoiseParams.x;
				half Input_Speed62_g70891 = _MotionSpeed_10;
				half Global_Speed449_g70891 = TVE_NoiseParams.y;
				float mulTime426_g70891 = _TimeParameters.x * ( Input_Speed62_g70891 * Global_Speed449_g70891 );
				half Global_DistScale561_g70891 = TVE_NoiseParams.w;
				float3 break461_g70891 = ( Input_Position419_g70891 * Global_DistScale561_g70891 );
				half Global_DistAmplitude559_g70891 = TVE_NoiseParams.z;
				float Noise_Distortion469_g70891 = ( sin( ( break461_g70891.x + break461_g70891.z ) ) * Global_DistAmplitude559_g70891 );
				float3 break111_g70874 = ObjectPosition4223_g70845;
				half Global_DynamicMode5112_g70845 = _VertexDynamicMode;
				half Input_DynamicMode120_g70874 = Global_DynamicMode5112_g70845;
				float Mesh_Variation16_g70845 = inputMesh.ase_color.r;
				half Input_Variation124_g70874 = Mesh_Variation16_g70845;
				half ObjectData20_g70875 = frac( ( ( ( break111_g70874.x + break111_g70874.y + break111_g70874.z ) * ( 1.0 - Input_DynamicMode120_g70874 ) ) + Input_Variation124_g70874 ) );
				half WorldData19_g70875 = Input_Variation124_g70874;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g70875 = WorldData19_g70875;
				#else
				float staticSwitch14_g70875 = ObjectData20_g70875;
				#endif
				float clampResult129_g70874 = clamp( staticSwitch14_g70875 , 0.01 , 0.99 );
				half Global_MeshVariation5104_g70845 = clampResult129_g70874;
				half Motion_Variation284_g70891 = ( _MotionVariation_10 * Global_MeshVariation5104_g70845 );
				float2 temp_output_425_0_g70891 = ( ( (Input_Position419_g70891).xz * Input_DirectionWS423_g70891 * Motion_Scale287_g70891 * Global_Scale448_g70891 ) + ( mulTime426_g70891 + Noise_Distortion469_g70891 + Motion_Variation284_g70891 ) );
				float2 break500_g70891 = ( temp_output_425_0_g70891 * 0.1178 );
				float2 break494_g70891 = ( temp_output_425_0_g70891 * 0.1742 );
				half Input_WindPower327_g70891 = Global_MotionPower2223_g70845;
				float lerpResult430_g70891 = lerp( 1.4 , 0.4 , Input_WindPower327_g70891);
				half Global_MotionNoise34_g70845 = (pow( (( sin( ( break500_g70891.x + break500_g70891.y ) ) * sin( ( break494_g70891.x + break494_g70891.y ) ) )*0.4 + 0.6) , lerpResult430_g70891 )*1.2 + -0.2);
				half Motion_10_Amplitude2258_g70845 = ( _MotionAmplitude_10 * Motion_10_Mask5242_g70845 * Global_MotionPower2223_g70845 * Global_MotionNoise34_g70845 );
				half Input_BendingAmplitude376_g70917 = Motion_10_Amplitude2258_g70845;
				half Input_InteractionAmplitude58_g70917 = _InteractionAmplitude;
				half Input_MeshMotion_10321_g70917 = Motion_10_Mask5242_g70845;
				half Input_InteractionUseMask62_g70917 = _InteractionMaskValue;
				float lerpResult371_g70917 = lerp( 2.0 , Input_MeshMotion_10321_g70917 , Input_InteractionUseMask62_g70917);
				half ObjectData20_g70918 = lerpResult371_g70917;
				half WorldData19_g70918 = Input_MeshMotion_10321_g70917;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g70918 = WorldData19_g70918;
				#else
				float staticSwitch14_g70918 = ObjectData20_g70918;
				#endif
				half Motion_10_Interaction373_g70917 = ( Input_InteractionAmplitude58_g70917 * staticSwitch14_g70918 );
				half Global_InteractionMask66_g70845 = ( break322_g70888.w * break322_g70888.w );
				float Input_InteractionMask330_g70917 = Global_InteractionMask66_g70845;
				float lerpResult360_g70917 = lerp( Input_BendingAmplitude376_g70917 , Motion_10_Interaction373_g70917 , saturate( ( Input_InteractionAmplitude58_g70917 * Input_InteractionMask330_g70917 ) ));
				float2 break364_g70917 = ( Input_DirectionOS358_g70917 * lerpResult360_g70917 );
				half Motion_10_BendingZ190_g70845 = break364_g70917.y;
				half Angle44_g70921 = Motion_10_BendingZ190_g70845;
				half3 VertexPos40_g70920 = ( VertexPosRotationAxis50_g70921 + ( VertexPosOtherAxis82_g70921 * cos( Angle44_g70921 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g70921 ) * sin( Angle44_g70921 ) ) );
				float3 appendResult74_g70920 = (float3(0.0 , 0.0 , VertexPos40_g70920.z));
				half3 VertexPosRotationAxis50_g70920 = appendResult74_g70920;
				float3 break84_g70920 = VertexPos40_g70920;
				float3 appendResult81_g70920 = (float3(break84_g70920.x , break84_g70920.y , 0.0));
				half3 VertexPosOtherAxis82_g70920 = appendResult81_g70920;
				half Motion_10_BendingX216_g70845 = break364_g70917.x;
				half Angle44_g70920 = -Motion_10_BendingX216_g70845;
				half Input_Scale321_g70860 = _MotionScale_20;
				half Input_Variation330_g70860 = ( _MotionVariation_20 * Global_MeshVariation5104_g70845 );
				half Input_Speed62_g70860 = _MotionSpeed_20;
				float mulTime349_g70860 = _TimeParameters.x * Input_Speed62_g70860;
				float temp_output_302_0_g70860 = sin( ( ( ( ase_worldPos.x + ase_worldPos.y + ase_worldPos.z ) * Input_Scale321_g70860 ) + Input_Variation330_g70860 + mulTime349_g70860 ) );
				float enc59_g70871 = inputMesh.ase_texcoord.z;
				float2 localDecodeFloatToVector259_g70871 = DecodeFloatToVector2( enc59_g70871 );
				float2 break61_g70871 = localDecodeFloatToVector259_g70871;
				half Mesh_Motion_2060_g70845 = break61_g70871.x;
				half Mesh_Motion_20115_g70872 = Mesh_Motion_2060_g70845;
				float Bounds_Radius5231_g70845 = break63_g70871.y;
				float Bounds_Radius118_g70872 = Bounds_Radius5231_g70845;
				half Motion_20_Mask5243_g70845 = ( Mesh_Motion_20115_g70872 * Bounds_Radius118_g70872 );
				half3 Input_Position419_g70876 = VertexPosition3588_g70845;
				float3 normalizeResult518_g70876 = normalize( Input_Position419_g70876 );
				half2 Input_DirectionOS423_g70876 = Global_MotionDirectionOS39_g70845;
				float2 break521_g70876 = -Input_DirectionOS423_g70876;
				float3 appendResult522_g70876 = (float3(break521_g70876.x , 0.0 , break521_g70876.y));
				float dotResult519_g70876 = dot( normalizeResult518_g70876 , appendResult522_g70876 );
				half Input_Mask62_g70876 = _MotionFacingValue;
				float lerpResult524_g70876 = lerp( 1.0 , (dotResult519_g70876*0.5 + 0.5) , Input_Mask62_g70876);
				half ObjectData20_g70877 = lerpResult524_g70876;
				half WorldData19_g70877 = 1.0;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g70877 = WorldData19_g70877;
				#else
				float staticSwitch14_g70877 = ObjectData20_g70877;
				#endif
				half Motion_FacingMask5214_g70845 = staticSwitch14_g70877;
				half Motion_20_Amplitude4381_g70845 = ( _MotionAmplitude_20 * _MotionValue_20 * Motion_20_Mask5243_g70845 * Global_MotionPower2223_g70845 * Global_MotionNoise34_g70845 * Motion_FacingMask5214_g70845 );
				half Input_Amplitude58_g70860 = Motion_20_Amplitude4381_g70845;
				half2 Input_DirectionOS366_g70860 = Global_MotionDirectionOS39_g70845;
				float2 break371_g70860 = Input_DirectionOS366_g70860;
				float3 appendResult372_g70860 = (float3(break371_g70860.x , ( temp_output_302_0_g70860 * 0.1 ) , break371_g70860.y));
				half3 Motion_20_Squash4418_g70845 = ( ( (temp_output_302_0_g70860*0.2 + 1.0) * Input_Amplitude58_g70860 ) * appendResult372_g70860 );
				half Motion_Scale321_g70908 = _MotionScale_32;
				half Motion_Variation330_g70908 = ( _MotionVariation_32 * Global_MeshVariation5104_g70845 );
				half Input_Speed62_g70908 = _MotionSpeed_32;
				half Global_Speed350_g70908 = TVE_FlutterParams.y;
				float mulTime349_g70908 = _TimeParameters.x * ( Input_Speed62_g70908 * Global_Speed350_g70908 );
				half Mesh_Motion_30144_g70845 = break61_g70871.y;
				half Mesh_Motion_30116_g70872 = Mesh_Motion_30144_g70845;
				half Motion_30_Mask5244_g70845 = ( Mesh_Motion_30116_g70872 * 0.4 );
				float temp_output_7_0_g70869 = TVE_MotionFadeEnd;
				half Motion_FadeOut4005_g70845 = saturate( ( ( distance( ase_worldPos , _WorldSpaceCameraPos ) - temp_output_7_0_g70869 ) / ( TVE_MotionFadeStart - temp_output_7_0_g70869 ) ) );
				half Motion_30_Amplitude4960_g70845 = ( _MotionAmplitude_32 * _MotionValue_30 * Motion_30_Mask5244_g70845 * Global_MotionPower2223_g70845 * Global_MotionNoise34_g70845 * Motion_FacingMask5214_g70845 * Motion_FadeOut4005_g70845 );
				half Input_Amplitude58_g70908 = Motion_30_Amplitude4960_g70845;
				half Global_Power354_g70908 = TVE_FlutterParams.x;
				half Motion_Normal364_g70908 = _MotionNormalValue;
				float3 lerpResult370_g70908 = lerp( float3( 1,1,1 ) , inputMesh.normalOS , Motion_Normal364_g70908);
				half3 Motion_30_Details263_g70845 = ( ( sin( ( ( ( ase_worldPos.x + ase_worldPos.y + ase_worldPos.z ) * Motion_Scale321_g70908 ) + Motion_Variation330_g70908 + mulTime349_g70908 ) ) * Input_Amplitude58_g70908 * Global_Power354_g70908 ) * lerpResult370_g70908 );
				float3 Vertex_Motion_Object833_g70845 = ( ( ( VertexPosRotationAxis50_g70920 + ( VertexPosOtherAxis82_g70920 * cos( Angle44_g70920 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g70920 ) * sin( Angle44_g70920 ) ) ) + Motion_20_Squash4418_g70845 ) + Motion_30_Details263_g70845 );
				float3 temp_output_3474_0_g70845 = ( VertexPosition3588_g70845 - Mesh_PivotsOS2291_g70845 );
				float3 appendResult2043_g70845 = (float3(Motion_10_BendingX216_g70845 , 0.0 , Motion_10_BendingZ190_g70845));
				float3 Vertex_Motion_World1118_g70845 = ( ( ( temp_output_3474_0_g70845 + appendResult2043_g70845 ) + Motion_20_Squash4418_g70845 ) + Motion_30_Details263_g70845 );
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch4976_g70845 = Vertex_Motion_World1118_g70845;
				#else
				float3 staticSwitch4976_g70845 = ( Vertex_Motion_Object833_g70845 + ( _VertexDataMode * 0.0 ) );
				#endif
				float4 temp_output_94_19_g70904 = TVE_VertexCoords;
				half2 UV97_g70904 = ( (temp_output_94_19_g70904).zw + ( (temp_output_94_19_g70904).xy * (ObjectPosition4223_g70845).xz ) );
				float temp_output_84_0_g70904 = _LayerVertexValue;
				float4 lerpResult109_g70904 = lerp( TVE_VertexParams , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_VertexTex, sampler_linear_repeat, UV97_g70904,temp_output_84_0_g70904, 0.0 ) , TVE_VertexUsage[(int)temp_output_84_0_g70904]);
				half4 Global_Object_Params4173_g70845 = lerpResult109_g70904;
				half Global_VertexSize174_g70845 = saturate( Global_Object_Params4173_g70845.w );
				float lerpResult346_g70845 = lerp( 1.0 , Global_VertexSize174_g70845 , _GlobalSize);
				float3 appendResult3480_g70845 = (float3(lerpResult346_g70845 , lerpResult346_g70845 , lerpResult346_g70845));
				half3 ObjectData20_g70880 = appendResult3480_g70845;
				half3 _Vector11 = half3(1,1,1);
				half3 WorldData19_g70880 = _Vector11;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g70880 = WorldData19_g70880;
				#else
				float3 staticSwitch14_g70880 = ObjectData20_g70880;
				#endif
				half3 Vertex_Size1741_g70845 = staticSwitch14_g70880;
				half3 _Vector5 = half3(1,1,1);
				float3 Vertex_SizeFade1740_g70845 = _Vector5;
				half3 Grass_Perspective2661_g70845 = half3(0,0,0);
				float3 lerpResult16_g70879 = lerp( VertexPosition3588_g70845 , ( ( staticSwitch4976_g70845 * Vertex_Size1741_g70845 * Vertex_SizeFade1740_g70845 ) + Mesh_PivotsOS2291_g70845 + Grass_Perspective2661_g70845 ) , TVE_Enabled);
				float3 Final_VertexPosition890_g70845 = ( lerpResult16_g70879 + _DisableSRPBatcher );
				
				float temp_output_7_0_g70898 = _GradientMinValue;
				half Gradient_Tint2784_g70845 = saturate( ( ( Mesh_Height1524_g70845 - temp_output_7_0_g70898 ) / ( _GradientMaxValue - temp_output_7_0_g70898 ) ) );
				float vertexToFrag11_g70849 = Gradient_Tint2784_g70845;
				outputPackedVaryingsMeshToPS.ase_texcoord7.x = vertexToFrag11_g70849;
				outputPackedVaryingsMeshToPS.ase_texcoord7.yzw = vertexToFrag3890_g70845;
				outputPackedVaryingsMeshToPS.ase_texcoord9.xyz = vertexToFrag4224_g70845;
				float3 ase_worldNormal = TransformObjectToWorldNormal(inputMesh.normalOS);
				float3 vertexToFrag5058_g70845 = ase_worldNormal;
				outputPackedVaryingsMeshToPS.ase_texcoord10.xyz = vertexToFrag5058_g70845;
				float Mesh_Occlusion318_g70845 = inputMesh.ase_color.g;
				float temp_output_7_0_g70885 = _VertexOcclusionMinValue;
				float temp_output_3377_0_g70845 = saturate( ( ( Mesh_Occlusion318_g70845 - temp_output_7_0_g70885 ) / ( _VertexOcclusionMaxValue - temp_output_7_0_g70885 ) ) );
				float vertexToFrag11_g70889 = temp_output_3377_0_g70845;
				outputPackedVaryingsMeshToPS.ase_texcoord9.w = vertexToFrag11_g70889;
				
				float temp_output_7_0_g70861 = TVE_CameraFadeStart;
				float lerpResult4755_g70845 = lerp( 1.0 , saturate( ( ( distance( ase_worldPos , _WorldSpaceCameraPos ) - temp_output_7_0_g70861 ) / ( TVE_CameraFadeEnd - temp_output_7_0_g70861 ) ) ) , _FadeCameraValue);
				float vertexToFrag11_g70867 = lerpResult4755_g70845;
				outputPackedVaryingsMeshToPS.ase_texcoord10.w = vertexToFrag11_g70867;
				
				outputPackedVaryingsMeshToPS.ase_texcoord8 = inputMesh.ase_texcoord;
				outputPackedVaryingsMeshToPS.ase_color = inputMesh.ase_color;
				outputPackedVaryingsMeshToPS.ase_normal = inputMesh.normalOS;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue = Final_VertexPosition890_g70845;

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
				float vertexToFrag11_g70849 = packedInput.ase_texcoord7.x;
				float3 lerpResult2779_g70845 = lerp( (_GradientColorTwo).rgb , (_GradientColorOne).rgb , vertexToFrag11_g70849);
				half2 Main_UVs15_g70845 = ( ( packedInput.ase_texcoord8.xy * (_MainUVs).xy ) + (_MainUVs).zw );
				float4 tex2DNode29_g70845 = tex2D( _MainAlbedoTex, Main_UVs15_g70845 );
				half3 Main_Albedo99_g70845 = ( (_MainColor).rgb * (tex2DNode29_g70845).rgb );
				half3 Blend_Albedo265_g70845 = Main_Albedo99_g70845;
				half3 Blend_AlbedoTinted2808_g70845 = ( ( lerpResult2779_g70845 * float3(1,1,1) * float3(1,1,1) ) * Blend_Albedo265_g70845 );
				float dotResult3616_g70845 = dot( Blend_AlbedoTinted2808_g70845 , float3(0.2126,0.7152,0.0722) );
				float3 temp_cast_0 = (dotResult3616_g70845).xxx;
				float4 temp_output_91_19_g70893 = TVE_ColorsCoords;
				float3 vertexToFrag3890_g70845 = packedInput.ase_texcoord7.yzw;
				float3 WorldPosition3905_g70845 = vertexToFrag3890_g70845;
				float3 vertexToFrag4224_g70845 = packedInput.ase_texcoord9.xyz;
				half3 ObjectData20_g70886 = vertexToFrag4224_g70845;
				half3 WorldData19_g70886 = vertexToFrag3890_g70845;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g70886 = WorldData19_g70886;
				#else
				float3 staticSwitch14_g70886 = ObjectData20_g70886;
				#endif
				float3 ObjectPosition4223_g70845 = staticSwitch14_g70886;
				float3 lerpResult4822_g70845 = lerp( WorldPosition3905_g70845 , ObjectPosition4223_g70845 , _ColorsPositionMode);
				half2 UV94_g70893 = ( (temp_output_91_19_g70893).zw + ( (temp_output_91_19_g70893).xy * (lerpResult4822_g70845).xz ) );
				float temp_output_82_0_g70893 = _LayerColorsValue;
				float4 lerpResult108_g70893 = lerp( TVE_ColorsParams , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_ColorsTex, sampler_linear_repeat, UV94_g70893,temp_output_82_0_g70893, 0.0 ) , TVE_ColorsUsage[(int)temp_output_82_0_g70893]);
				half Global_ColorsTex_A1701_g70845 = saturate( (lerpResult108_g70893).a );
				half Global_Colors_Influence3668_g70845 = Global_ColorsTex_A1701_g70845;
				float3 lerpResult3618_g70845 = lerp( Blend_AlbedoTinted2808_g70845 , temp_cast_0 , Global_Colors_Influence3668_g70845);
				half3 Global_ColorsTex_RGB1700_g70845 = (lerpResult108_g70893).rgb;
				half3 Global_Colors1954_g70845 = ( Global_ColorsTex_RGB1700_g70845 * 4.594794 );
				float3 break111_g70874 = ObjectPosition4223_g70845;
				half Global_DynamicMode5112_g70845 = _VertexDynamicMode;
				half Input_DynamicMode120_g70874 = Global_DynamicMode5112_g70845;
				float Mesh_Variation16_g70845 = packedInput.ase_color.r;
				half Input_Variation124_g70874 = Mesh_Variation16_g70845;
				half ObjectData20_g70875 = frac( ( ( ( break111_g70874.x + break111_g70874.y + break111_g70874.z ) * ( 1.0 - Input_DynamicMode120_g70874 ) ) + Input_Variation124_g70874 ) );
				half WorldData19_g70875 = Input_Variation124_g70874;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g70875 = WorldData19_g70875;
				#else
				float staticSwitch14_g70875 = ObjectData20_g70875;
				#endif
				float clampResult129_g70874 = clamp( staticSwitch14_g70875 , 0.01 , 0.99 );
				half Global_MeshVariation5104_g70845 = clampResult129_g70874;
				float lerpResult3870_g70845 = lerp( 1.0 , ( Global_MeshVariation5104_g70845 * Global_MeshVariation5104_g70845 ) , _ColorsVariationValue);
				half Global_Colors_Variation3650_g70845 = ( _GlobalColors * lerpResult3870_g70845 );
				float4 tex2DNode35_g70845 = tex2D( _MainMaskTex, Main_UVs15_g70845 );
				half Main_Mask57_g70845 = tex2DNode35_g70845.b;
				float temp_output_7_0_g70892 = _ColorsMaskMinValue;
				half Global_Colors_Mask3692_g70845 = saturate( ( ( Main_Mask57_g70845 - temp_output_7_0_g70892 ) / ( _ColorsMaskMaxValue - temp_output_7_0_g70892 ) ) );
				float lerpResult16_g70915 = lerp( 0.0 , ( Global_Colors_Variation3650_g70845 * Global_Colors_Mask3692_g70845 ) , TVE_Enabled);
				float3 lerpResult3628_g70845 = lerp( Blend_AlbedoTinted2808_g70845 , ( lerpResult3618_g70845 * Global_Colors1954_g70845 ) , lerpResult16_g70915);
				half3 Blend_AlbedoColored863_g70845 = lerpResult3628_g70845;
				float3 temp_output_799_0_g70845 = (_SubsurfaceColor).rgb;
				float dotResult3930_g70845 = dot( temp_output_799_0_g70845 , float3(0.2126,0.7152,0.0722) );
				float3 temp_cast_3 = (dotResult3930_g70845).xxx;
				float3 lerpResult3932_g70845 = lerp( temp_output_799_0_g70845 , temp_cast_3 , Global_Colors_Influence3668_g70845);
				float3 lerpResult3942_g70845 = lerp( temp_output_799_0_g70845 , ( lerpResult3932_g70845 * Global_Colors1954_g70845 ) , ( Global_Colors_Variation3650_g70845 * Global_Colors_Mask3692_g70845 ));
				half3 Subsurface_Color1722_g70845 = lerpResult3942_g70845;
				half Global_Subsurface4041_g70845 = TVE_SubsurfaceValue;
				half Subsurface_Intensity1752_g70845 = ( _SubsurfaceValue * Global_Subsurface4041_g70845 );
				float temp_output_7_0_g70890 = _SubsurfaceMaskMinValue;
				half Subsurface_Mask1557_g70845 = saturate( ( ( Main_Mask57_g70845 - temp_output_7_0_g70890 ) / ( _SubsurfaceMaskMaxValue - temp_output_7_0_g70890 ) ) );
				half3 Subsurface_Transmission884_g70845 = ( Subsurface_Color1722_g70845 * Subsurface_Intensity1752_g70845 * Subsurface_Mask1557_g70845 );
				half3 MainLight_Direction3926_g70845 = TVE_MainLightDirection;
				float3 normalizeResult2169_g70845 = normalize( V );
				float3 ViewDir_Normalized3963_g70845 = normalizeResult2169_g70845;
				float dotResult785_g70845 = dot( -MainLight_Direction3926_g70845 , ViewDir_Normalized3963_g70845 );
				float saferPower1624_g70845 = abs( saturate( dotResult785_g70845 ) );
				#ifdef UNITY_PASS_FORWARDADD
				float staticSwitch1602_g70845 = 0.0;
				#else
				float staticSwitch1602_g70845 = ( pow( saferPower1624_g70845 , _SubsurfaceAngleValue ) * _SubsurfaceScatteringValue );
				#endif
				half Mask_Subsurface_View782_g70845 = staticSwitch1602_g70845;
				half3 Subsurface_Approximation1693_g70845 = ( Subsurface_Transmission884_g70845 * Blend_AlbedoColored863_g70845 * Mask_Subsurface_View782_g70845 );
				half3 Blend_AlbedoAndSubsurface149_g70845 = ( Blend_AlbedoColored863_g70845 + Subsurface_Approximation1693_g70845 );
				half3 Global_OverlayColor1758_g70845 = (TVE_OverlayColor).rgb;
				float3 vertexToFrag5058_g70845 = packedInput.ase_texcoord10.xyz;
				half3 World_Normal4101_g70845 = vertexToFrag5058_g70845;
				float lerpResult4801_g70845 = lerp( World_Normal4101_g70845.y , packedInput.ase_normal.y , Global_DynamicMode5112_g70845);
				float lerpResult3567_g70845 = lerp( 0.5 , 1.0 , lerpResult4801_g70845);
				float4 temp_output_93_19_g70850 = TVE_ExtrasCoords;
				float3 lerpResult4827_g70845 = lerp( WorldPosition3905_g70845 , ObjectPosition4223_g70845 , _ExtrasPositionMode);
				half2 UV96_g70850 = ( (temp_output_93_19_g70850).zw + ( (temp_output_93_19_g70850).xy * (lerpResult4827_g70845).xz ) );
				float temp_output_84_0_g70850 = _LayerExtrasValue;
				float4 lerpResult109_g70850 = lerp( TVE_ExtrasParams , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_ExtrasTex, sampler_linear_repeat, UV96_g70850,temp_output_84_0_g70850, 0.0 ) , TVE_ExtrasUsage[(int)temp_output_84_0_g70850]);
				float4 break89_g70850 = lerpResult109_g70850;
				half Global_Extras_Overlay156_g70845 = break89_g70850.b;
				float lerpResult1065_g70845 = lerp( 1.0 , Global_MeshVariation5104_g70845 , _OverlayVariationValue);
				half Overlay_Variation4560_g70845 = lerpResult1065_g70845;
				half Overlay_Commons1365_g70845 = ( _GlobalOverlay * Global_Extras_Overlay156_g70845 * Overlay_Variation4560_g70845 );
				half Overlay_Mask_3D5122_g70845 = ( ( ( lerpResult3567_g70845 * 0.5 ) + Blend_Albedo265_g70845.y ) * Overlay_Commons1365_g70845 );
				float temp_output_7_0_g70887 = _OverlayMaskMinValue;
				half Overlay_Mask269_g70845 = saturate( ( ( Overlay_Mask_3D5122_g70845 - temp_output_7_0_g70887 ) / ( _OverlayMaskMaxValue - temp_output_7_0_g70887 ) ) );
				float3 lerpResult336_g70845 = lerp( Blend_AlbedoAndSubsurface149_g70845 , Global_OverlayColor1758_g70845 , Overlay_Mask269_g70845);
				half3 Final_Albedo359_g70845 = lerpResult336_g70845;
				float3 temp_cast_6 = (1.0).xxx;
				float vertexToFrag11_g70889 = packedInput.ase_texcoord9.w;
				float3 lerpResult2945_g70845 = lerp( (_VertexOcclusionColor).rgb , temp_cast_6 , vertexToFrag11_g70889);
				float3 Vertex_Occlusion648_g70845 = lerpResult2945_g70845;
				
				float3 unpack4112_g70845 = UnpackNormalScale( tex2D( _MainNormalTex, Main_UVs15_g70845 ), _MainNormalValue );
				unpack4112_g70845.z = lerp( 1, unpack4112_g70845.z, saturate(_MainNormalValue) );
				half3 Main_Normal137_g70845 = unpack4112_g70845;
				float3 temp_output_13_0_g70856 = Main_Normal137_g70845;
				float3 switchResult12_g70856 = (((isFrontFace>0)?(temp_output_13_0_g70856):(( temp_output_13_0_g70856 * _render_normals ))));
				half3 Blend_Normal312_g70845 = switchResult12_g70856;
				half3 Final_Normal366_g70845 = Blend_Normal312_g70845;
				
				float3 hdEmission4189_g70845 = ASEGetEmissionHDRColor(_EmissiveColor.rgb,_EmissiveIntensityParams.x,_EmissiveExposureValue,GetInverseCurrentExposureMultiplier());
				half2 Emissive_UVs2468_g70845 = ( ( packedInput.ase_texcoord8.xy * (_EmissiveUVs).xy ) + (_EmissiveUVs).zw );
				half Global_Extras_Emissive4203_g70845 = break89_g70850.r;
				float lerpResult4206_g70845 = lerp( 1.0 , Global_Extras_Emissive4203_g70845 , _GlobalEmissive);
				half3 Final_Emissive2476_g70845 = ( (( hdEmission4189_g70845 * tex2D( _EmissiveTex, Emissive_UVs2468_g70845 ) )).rgb * lerpResult4206_g70845 );
				
				half Main_Smoothness227_g70845 = ( tex2DNode35_g70845.a * _MainSmoothnessValue );
				half Blend_Smoothness314_g70845 = Main_Smoothness227_g70845;
				half Global_OverlaySmoothness311_g70845 = TVE_OverlaySmoothness;
				float lerpResult343_g70845 = lerp( Blend_Smoothness314_g70845 , Global_OverlaySmoothness311_g70845 , Overlay_Mask269_g70845);
				half Final_Smoothness371_g70845 = lerpResult343_g70845;
				half Global_Extras_Wetness305_g70845 = break89_g70850.g;
				float lerpResult3673_g70845 = lerp( 0.0 , Global_Extras_Wetness305_g70845 , _GlobalWetness);
				half Final_SmoothnessAndWetness4130_g70845 = saturate( ( Final_Smoothness371_g70845 + lerpResult3673_g70845 ) );
				
				float lerpResult240_g70845 = lerp( 1.0 , tex2DNode35_g70845.g , _MainOcclusionValue);
				half Main_Occlusion247_g70845 = lerpResult240_g70845;
				half Blend_Occlusion323_g70845 = Main_Occlusion247_g70845;
				
				float localCustomAlphaClip9_g70878 = ( 0.0 );
				float3 ase_worldPos = GetAbsolutePositionWS( positionRWS );
				float3 normalizeResult3971_g70845 = normalize( cross( ddy( ase_worldPos ) , ddx( ase_worldPos ) ) );
				float3 NormalsWS_Derivates3972_g70845 = normalizeResult3971_g70845;
				float dotResult3851_g70845 = dot( ViewDir_Normalized3963_g70845 , NormalsWS_Derivates3972_g70845 );
				float lerpResult3993_g70845 = lerp( 1.0 , saturate( abs( dotResult3851_g70845 ) ) , _FadeGlancingValue);
				half Fade_Glancing3853_g70845 = lerpResult3993_g70845;
				float vertexToFrag11_g70867 = packedInput.ase_texcoord10.w;
				half Fade_Camera_Mask5149_g70845 = 1.0;
				float lerpResult5141_g70845 = lerp( 1.0 , vertexToFrag11_g70867 , Fade_Camera_Mask5149_g70845);
				half Fade_Camera3743_g70845 = lerpResult5141_g70845;
				float temp_output_41_0_g70864 = ( Fade_Glancing3853_g70845 * Fade_Camera3743_g70845 );
				half Final_AlphaFade3727_g70845 = saturate( ( temp_output_41_0_g70864 + ( temp_output_41_0_g70864 * tex3D( TVE_ScreenTex3D, ( TVE_ScreenTexCoord * WorldPosition3905_g70845 ) ).r ) ) );
				float Main_Alpha316_g70845 = ( _MainColor.a * tex2DNode29_g70845.a );
				half Global_Extras_Alpha1033_g70845 = saturate( break89_g70850.a );
				float lerpResult5154_g70845 = lerp( 0.0 , Global_MeshVariation5104_g70845 , _AlphaVariationValue);
				half Global_Alpha_Variation5158_g70845 = lerpResult5154_g70845;
				half AlphaTreshold2132_g70845 = _AlphaClipValue;
				half Global_Alpha_Mask4546_g70845 = 1.0;
				float lerpResult5203_g70845 = lerp( 1.0 , ( ( Global_Extras_Alpha1033_g70845 - Global_Alpha_Variation5158_g70845 ) + AlphaTreshold2132_g70845 ) , ( Global_Alpha_Mask4546_g70845 * _GlobalAlpha ));
				float lerpResult16_g70919 = lerp( 1.0 , lerpResult5203_g70845 , TVE_Enabled);
				half Global_Alpha315_g70845 = lerpResult16_g70919;
				half Final_Alpha3754_g70845 = ( ( Main_Alpha316_g70845 * Global_Alpha315_g70845 ) - ( AlphaTreshold2132_g70845 - 0.5 ) );
				float temp_output_661_0_g70845 = ( Final_AlphaFade3727_g70845 * Final_Alpha3754_g70845 );
				float temp_output_3_0_g70865 = temp_output_661_0_g70845;
				half Offest27_g70865 = 0.5;
				half Feather30_g70865 = 0.5;
				float temp_output_3_0_g70878 = ( ( ( temp_output_3_0_g70865 - Offest27_g70865 ) / ( max( fwidth( temp_output_3_0_g70865 ) , 0.001 ) + Feather30_g70865 ) ) + Offest27_g70865 );
				float Alpha9_g70878 = temp_output_3_0_g70878;
				float temp_output_15_0_g70878 = 0.5;
				float Treshold9_g70878 = temp_output_15_0_g70878;
				{
				#if TVE_FEATURE_CLIP
				clip(Alpha9_g70878 - Treshold9_g70878);
				#endif
				}
				half Final_Clip914_g70845 = Alpha9_g70878;
				
				half Subsurface_HD1276_g70845 = ( 1.0 - ( Subsurface_Intensity1752_g70845 * Subsurface_Mask1557_g70845 ) );
				
				surfaceDescription.Albedo = ( Final_Albedo359_g70845 * Vertex_Occlusion648_g70845 );
				surfaceDescription.Normal = Final_Normal366_g70845;
				surfaceDescription.BentNormal = float3( 0, 0, 1 );
				surfaceDescription.CoatMask = 0;
				surfaceDescription.Metallic = 0;

				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceDescription.Specular = 0;
				#endif

				surfaceDescription.Emission = Final_Emissive2476_g70845;
				surfaceDescription.Smoothness = Final_SmoothnessAndWetness4130_g70845;
				surfaceDescription.Occlusion = Blend_Occlusion323_g70845;
				surfaceDescription.Alpha = Final_Clip914_g70845;

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
				surfaceDescription.Thickness = Subsurface_HD1276_g70845;
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
				surfaceDescription.DiffusionProfile = _SubsurfaceDiffusion;
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
        
			#define _MATERIAL_FEATURE_TRANSMISSION 1
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
			half4 _MainColor;
			half4 _ColorsMaskRemap;
			half4 _SubsurfaceMaskRemap;
			half4 _VertexOcclusionRemap;
			float4 _GradientMaskRemap;
			float4 _SubsurfaceDiffusion_asset;
			float4 _MaxBoundsInfo;
			float4 _SubsurfaceDiffusion_Asset;
			float4 _Color;
			half4 _GradientColorTwo;
			half4 _GradientColorOne;
			half4 _MainUVs;
			half4 _OverlayMaskRemap;
			half4 _SubsurfaceColor;
			half4 _VertexOcclusionColor;
			half4 _AlphaMaskRemap;
			float4 _EmissiveIntensityParams;
			half4 _EmissiveColor;
			half4 _EmissiveUVs;
			float4 _NoiseMaskRemap;
			half4 _DetailBlendRemap;
			half3 _render_normals;
			half _VertexOcclusionMinValue;
			float _MotionScale_32;
			half _MotionFacingValue;
			half _MotionValue_20;
			half _EmissiveExposureValue;
			half _MotionAmplitude_20;
			half _GlobalEmissive;
			half _MainSmoothnessValue;
			half _GlobalWetness;
			half _MotionSpeed_20;
			half _MotionVariation_20;
			half _MotionScale_20;
			half _InteractionMaskValue;
			half _InteractionAmplitude;
			half _VertexDynamicMode;
			half _MainOcclusionValue;
			half _MotionVariation_10;
			float _MotionSpeed_10;
			half _FadeGlancingValue;
			float _MotionScale_10;
			half _FadeCameraValue;
			half _MotionAmplitude_10;
			half _LayerMotionValue;
			float _MotionVariation_32;
			float _MotionSpeed_32;
			half _MotionNormalValue;
			half _MotionValue_30;
			half _MainNormalValue;
			half _OverlayMaskMaxValue;
			half _OverlayMaskMinValue;
			half _OverlayVariationValue;
			half _LayerExtrasValue;
			half _ExtrasPositionMode;
			half _GlobalOverlay;
			half _SubsurfaceMaskMaxValue;
			half _SubsurfaceMaskMinValue;
			half _SubsurfaceValue;
			half _ColorsMaskMaxValue;
			half _ColorsMaskMinValue;
			half _ColorsVariationValue;
			half _GlobalColors;
			half _LayerColorsValue;
			half _ColorsPositionMode;
			half _VertexPivotMode;
			half _GradientMaxValue;
			half _GradientMinValue;
			half _GlobalSize;
			half _LayerVertexValue;
			half _VertexDataMode;
			half _VertexOcclusionMaxValue;
			half _MotionAmplitude_32;
			half _render_cull;
			half _RenderSSR;
			half _RenderDirect;
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
			half _CategorySubsurface;
			half _SubsurfaceNormalValue;
			half _SpaceMotionGlobals;
			half _SubsurfaceShadowValue;
			half _RenderCoverage;
			half _RenderPriority;
			float _SubsurfaceDiffusion;
			half _VertexRollingMode;
			half _Cutoff;
			half _SubsurfaceScatteringValue;
			half _render_dst;
			half _IsSubsurfaceShader;
			half _render_zw;
			half _render_src;
			half _IsLeafShader;
			half _EmissiveFlagMode;
			half _subsurface_shadow;
			half _RenderClip;
			half _MessageMotionVariation;
			half _CategoryRender;
			half _SpaceGlobalPosition;
			half _AlphaVariationValue;
			half _RenderCull;
			half _SubsurfaceDirectValue;
			half _RenderZWrite;
			half _SubsurfaceAmbientValue;
			half _RenderQueue;
			half _SubsurfaceAngleValue;
			half _AlphaClipValue;
			half _VertexMasksMode;
			half _LayerReactValue;
			half _DetailBlendMode;
			half _MessageGlobalsVariation;
			half _VertexVariationMode;
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
			half _RenderDecals;
			half _GlobalAlpha;
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
			half4 TVE_FlutterParams;
			half TVE_MotionFadeEnd;
			half TVE_MotionFadeStart;
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
			half4 TVE_ExtrasParams;
			TEXTURE2D_ARRAY(TVE_ExtrasTex);
			half4 TVE_ExtrasCoords;
			float TVE_ExtrasUsage[10];

        
            
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/PickingSpaceTransforms.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Unlit/Unlit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"
        

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#pragma shader_feature_local TVE_FEATURE_CLIP
			#pragma shader_feature_local TVE_FEATURE_BATCHING
			//TVE Pipeline Defines
			#define THE_VEGETATION_ENGINE
			#define TVE_IS_HD_PIPELINE
			//TVE HD Pipeline Defines
			#pragma shader_feature_local _DISABLE_DECALS
			#pragma shader_feature_local _DISABLE_SSR
			//TVE Shader Type Defines
			#define TVE_IS_VEGETATION_SHADER
			//TVE Injection Defines
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END


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
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_color : COLOR;
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

				float3 VertexPosition3588_g70845 = inputMesh.positionOS;
				half3 Mesh_PivotsOS2291_g70845 = half3(0,0,0);
				float3 temp_output_2283_0_g70845 = ( VertexPosition3588_g70845 - Mesh_PivotsOS2291_g70845 );
				half3 VertexPos40_g70921 = temp_output_2283_0_g70845;
				float3 appendResult74_g70921 = (float3(VertexPos40_g70921.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g70921 = appendResult74_g70921;
				float3 break84_g70921 = VertexPos40_g70921;
				float3 appendResult81_g70921 = (float3(0.0 , break84_g70921.y , break84_g70921.z));
				half3 VertexPosOtherAxis82_g70921 = appendResult81_g70921;
				float4 temp_output_91_19_g70881 = TVE_MotionCoords;
				float3 localObjectPosition_UNITY_MATRIX_M14_g70912 = ObjectPosition_UNITY_MATRIX_M();
				float3 appendResult60_g70870 = (float3(inputMesh.ase_texcoord3.x , inputMesh.ase_texcoord3.z , inputMesh.ase_texcoord3.y));
				half3 Mesh_PivotsData2831_g70845 = ( appendResult60_g70870 * _VertexPivotMode );
				float3 temp_output_122_0_g70912 = Mesh_PivotsData2831_g70845;
				float3 PivotsOnly105_g70912 = (mul( GetObjectToWorldMatrix(), float4( temp_output_122_0_g70912 , 0.0 ) ).xyz).xyz;
				#ifdef SHADEROPTIONS_CAMERA_RELATIVE_RENDERING
				float3 staticSwitch13_g70912 = ( ( localObjectPosition_UNITY_MATRIX_M14_g70912 + PivotsOnly105_g70912 ) + _WorldSpaceCameraPos );
				#else
				float3 staticSwitch13_g70912 = ( localObjectPosition_UNITY_MATRIX_M14_g70912 + PivotsOnly105_g70912 );
				#endif
				half3 ObjectData20_g70913 = staticSwitch13_g70912;
				float3 ase_worldPos = GetAbsolutePositionWS( TransformObjectToWorld( (inputMesh.positionOS).xyz ) );
				half3 WorldData19_g70913 = ase_worldPos;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g70913 = WorldData19_g70913;
				#else
				float3 staticSwitch14_g70913 = ObjectData20_g70913;
				#endif
				float3 temp_output_114_0_g70912 = staticSwitch14_g70913;
				float3 vertexToFrag4224_g70845 = temp_output_114_0_g70912;
				half3 ObjectData20_g70886 = vertexToFrag4224_g70845;
				float3 vertexToFrag3890_g70845 = ase_worldPos;
				half3 WorldData19_g70886 = vertexToFrag3890_g70845;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g70886 = WorldData19_g70886;
				#else
				float3 staticSwitch14_g70886 = ObjectData20_g70886;
				#endif
				float3 ObjectPosition4223_g70845 = staticSwitch14_g70886;
				half2 UV94_g70881 = ( (temp_output_91_19_g70881).zw + ( (temp_output_91_19_g70881).xy * (ObjectPosition4223_g70845).xz ) );
				float temp_output_84_0_g70881 = _LayerMotionValue;
				float4 lerpResult107_g70881 = lerp( TVE_MotionParams , saturate( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_MotionTex, sampler_linear_repeat, UV94_g70881,temp_output_84_0_g70881, 0.0 ) ) , TVE_MotionUsage[(int)temp_output_84_0_g70881]);
				half4 Global_Motion_Params3909_g70845 = lerpResult107_g70881;
				float4 break322_g70888 = Global_Motion_Params3909_g70845;
				float3 appendResult397_g70888 = (float3(break322_g70888.x , 0.0 , break322_g70888.y));
				float3 temp_output_398_0_g70888 = (appendResult397_g70888*2.0 + -1.0);
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				half2 Global_MotionDirectionOS39_g70845 = (( mul( GetWorldToObjectMatrix(), float4( temp_output_398_0_g70888 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_DirectionOS358_g70917 = Global_MotionDirectionOS39_g70845;
				half Mesh_Height1524_g70845 = inputMesh.ase_color.a;
				half Mesh_Height114_g70872 = Mesh_Height1524_g70845;
				half ObjectData20_g70873 = ( Mesh_Height114_g70872 * 2.0 );
				float enc62_g70871 = inputMesh.ase_texcoord.w;
				float2 localDecodeFloatToVector262_g70871 = DecodeFloatToVector2( enc62_g70871 );
				float2 break63_g70871 = ( localDecodeFloatToVector262_g70871 * 100.0 );
				float Bounds_Height5230_g70845 = break63_g70871.x;
				float Bounds_Height117_g70872 = Bounds_Height5230_g70845;
				half WorldData19_g70873 = ( ( Mesh_Height114_g70872 * Mesh_Height114_g70872 ) * Bounds_Height117_g70872 * 2.0 );
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g70873 = WorldData19_g70873;
				#else
				float staticSwitch14_g70873 = ObjectData20_g70873;
				#endif
				half Motion_10_Mask5242_g70845 = staticSwitch14_g70873;
				half Wind_Power369_g70888 = break322_g70888.z;
				half Global_MotionPower2223_g70845 = Wind_Power369_g70888;
				half3 Input_Position419_g70891 = -ObjectPosition4223_g70845;
				half2 Global_MotionDirectionWS4683_g70845 = (temp_output_398_0_g70888).xz;
				half2 Input_DirectionWS423_g70891 = Global_MotionDirectionWS4683_g70845;
				float Motion_Scale287_g70891 = ( _MotionScale_10 + 0.2 );
				half Global_Scale448_g70891 = TVE_NoiseParams.x;
				half Input_Speed62_g70891 = _MotionSpeed_10;
				half Global_Speed449_g70891 = TVE_NoiseParams.y;
				float mulTime426_g70891 = _TimeParameters.x * ( Input_Speed62_g70891 * Global_Speed449_g70891 );
				half Global_DistScale561_g70891 = TVE_NoiseParams.w;
				float3 break461_g70891 = ( Input_Position419_g70891 * Global_DistScale561_g70891 );
				half Global_DistAmplitude559_g70891 = TVE_NoiseParams.z;
				float Noise_Distortion469_g70891 = ( sin( ( break461_g70891.x + break461_g70891.z ) ) * Global_DistAmplitude559_g70891 );
				float3 break111_g70874 = ObjectPosition4223_g70845;
				half Global_DynamicMode5112_g70845 = _VertexDynamicMode;
				half Input_DynamicMode120_g70874 = Global_DynamicMode5112_g70845;
				float Mesh_Variation16_g70845 = inputMesh.ase_color.r;
				half Input_Variation124_g70874 = Mesh_Variation16_g70845;
				half ObjectData20_g70875 = frac( ( ( ( break111_g70874.x + break111_g70874.y + break111_g70874.z ) * ( 1.0 - Input_DynamicMode120_g70874 ) ) + Input_Variation124_g70874 ) );
				half WorldData19_g70875 = Input_Variation124_g70874;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g70875 = WorldData19_g70875;
				#else
				float staticSwitch14_g70875 = ObjectData20_g70875;
				#endif
				float clampResult129_g70874 = clamp( staticSwitch14_g70875 , 0.01 , 0.99 );
				half Global_MeshVariation5104_g70845 = clampResult129_g70874;
				half Motion_Variation284_g70891 = ( _MotionVariation_10 * Global_MeshVariation5104_g70845 );
				float2 temp_output_425_0_g70891 = ( ( (Input_Position419_g70891).xz * Input_DirectionWS423_g70891 * Motion_Scale287_g70891 * Global_Scale448_g70891 ) + ( mulTime426_g70891 + Noise_Distortion469_g70891 + Motion_Variation284_g70891 ) );
				float2 break500_g70891 = ( temp_output_425_0_g70891 * 0.1178 );
				float2 break494_g70891 = ( temp_output_425_0_g70891 * 0.1742 );
				half Input_WindPower327_g70891 = Global_MotionPower2223_g70845;
				float lerpResult430_g70891 = lerp( 1.4 , 0.4 , Input_WindPower327_g70891);
				half Global_MotionNoise34_g70845 = (pow( (( sin( ( break500_g70891.x + break500_g70891.y ) ) * sin( ( break494_g70891.x + break494_g70891.y ) ) )*0.4 + 0.6) , lerpResult430_g70891 )*1.2 + -0.2);
				half Motion_10_Amplitude2258_g70845 = ( _MotionAmplitude_10 * Motion_10_Mask5242_g70845 * Global_MotionPower2223_g70845 * Global_MotionNoise34_g70845 );
				half Input_BendingAmplitude376_g70917 = Motion_10_Amplitude2258_g70845;
				half Input_InteractionAmplitude58_g70917 = _InteractionAmplitude;
				half Input_MeshMotion_10321_g70917 = Motion_10_Mask5242_g70845;
				half Input_InteractionUseMask62_g70917 = _InteractionMaskValue;
				float lerpResult371_g70917 = lerp( 2.0 , Input_MeshMotion_10321_g70917 , Input_InteractionUseMask62_g70917);
				half ObjectData20_g70918 = lerpResult371_g70917;
				half WorldData19_g70918 = Input_MeshMotion_10321_g70917;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g70918 = WorldData19_g70918;
				#else
				float staticSwitch14_g70918 = ObjectData20_g70918;
				#endif
				half Motion_10_Interaction373_g70917 = ( Input_InteractionAmplitude58_g70917 * staticSwitch14_g70918 );
				half Global_InteractionMask66_g70845 = ( break322_g70888.w * break322_g70888.w );
				float Input_InteractionMask330_g70917 = Global_InteractionMask66_g70845;
				float lerpResult360_g70917 = lerp( Input_BendingAmplitude376_g70917 , Motion_10_Interaction373_g70917 , saturate( ( Input_InteractionAmplitude58_g70917 * Input_InteractionMask330_g70917 ) ));
				float2 break364_g70917 = ( Input_DirectionOS358_g70917 * lerpResult360_g70917 );
				half Motion_10_BendingZ190_g70845 = break364_g70917.y;
				half Angle44_g70921 = Motion_10_BendingZ190_g70845;
				half3 VertexPos40_g70920 = ( VertexPosRotationAxis50_g70921 + ( VertexPosOtherAxis82_g70921 * cos( Angle44_g70921 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g70921 ) * sin( Angle44_g70921 ) ) );
				float3 appendResult74_g70920 = (float3(0.0 , 0.0 , VertexPos40_g70920.z));
				half3 VertexPosRotationAxis50_g70920 = appendResult74_g70920;
				float3 break84_g70920 = VertexPos40_g70920;
				float3 appendResult81_g70920 = (float3(break84_g70920.x , break84_g70920.y , 0.0));
				half3 VertexPosOtherAxis82_g70920 = appendResult81_g70920;
				half Motion_10_BendingX216_g70845 = break364_g70917.x;
				half Angle44_g70920 = -Motion_10_BendingX216_g70845;
				half Input_Scale321_g70860 = _MotionScale_20;
				half Input_Variation330_g70860 = ( _MotionVariation_20 * Global_MeshVariation5104_g70845 );
				half Input_Speed62_g70860 = _MotionSpeed_20;
				float mulTime349_g70860 = _TimeParameters.x * Input_Speed62_g70860;
				float temp_output_302_0_g70860 = sin( ( ( ( ase_worldPos.x + ase_worldPos.y + ase_worldPos.z ) * Input_Scale321_g70860 ) + Input_Variation330_g70860 + mulTime349_g70860 ) );
				float enc59_g70871 = inputMesh.ase_texcoord.z;
				float2 localDecodeFloatToVector259_g70871 = DecodeFloatToVector2( enc59_g70871 );
				float2 break61_g70871 = localDecodeFloatToVector259_g70871;
				half Mesh_Motion_2060_g70845 = break61_g70871.x;
				half Mesh_Motion_20115_g70872 = Mesh_Motion_2060_g70845;
				float Bounds_Radius5231_g70845 = break63_g70871.y;
				float Bounds_Radius118_g70872 = Bounds_Radius5231_g70845;
				half Motion_20_Mask5243_g70845 = ( Mesh_Motion_20115_g70872 * Bounds_Radius118_g70872 );
				half3 Input_Position419_g70876 = VertexPosition3588_g70845;
				float3 normalizeResult518_g70876 = normalize( Input_Position419_g70876 );
				half2 Input_DirectionOS423_g70876 = Global_MotionDirectionOS39_g70845;
				float2 break521_g70876 = -Input_DirectionOS423_g70876;
				float3 appendResult522_g70876 = (float3(break521_g70876.x , 0.0 , break521_g70876.y));
				float dotResult519_g70876 = dot( normalizeResult518_g70876 , appendResult522_g70876 );
				half Input_Mask62_g70876 = _MotionFacingValue;
				float lerpResult524_g70876 = lerp( 1.0 , (dotResult519_g70876*0.5 + 0.5) , Input_Mask62_g70876);
				half ObjectData20_g70877 = lerpResult524_g70876;
				half WorldData19_g70877 = 1.0;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g70877 = WorldData19_g70877;
				#else
				float staticSwitch14_g70877 = ObjectData20_g70877;
				#endif
				half Motion_FacingMask5214_g70845 = staticSwitch14_g70877;
				half Motion_20_Amplitude4381_g70845 = ( _MotionAmplitude_20 * _MotionValue_20 * Motion_20_Mask5243_g70845 * Global_MotionPower2223_g70845 * Global_MotionNoise34_g70845 * Motion_FacingMask5214_g70845 );
				half Input_Amplitude58_g70860 = Motion_20_Amplitude4381_g70845;
				half2 Input_DirectionOS366_g70860 = Global_MotionDirectionOS39_g70845;
				float2 break371_g70860 = Input_DirectionOS366_g70860;
				float3 appendResult372_g70860 = (float3(break371_g70860.x , ( temp_output_302_0_g70860 * 0.1 ) , break371_g70860.y));
				half3 Motion_20_Squash4418_g70845 = ( ( (temp_output_302_0_g70860*0.2 + 1.0) * Input_Amplitude58_g70860 ) * appendResult372_g70860 );
				half Motion_Scale321_g70908 = _MotionScale_32;
				half Motion_Variation330_g70908 = ( _MotionVariation_32 * Global_MeshVariation5104_g70845 );
				half Input_Speed62_g70908 = _MotionSpeed_32;
				half Global_Speed350_g70908 = TVE_FlutterParams.y;
				float mulTime349_g70908 = _TimeParameters.x * ( Input_Speed62_g70908 * Global_Speed350_g70908 );
				half Mesh_Motion_30144_g70845 = break61_g70871.y;
				half Mesh_Motion_30116_g70872 = Mesh_Motion_30144_g70845;
				half Motion_30_Mask5244_g70845 = ( Mesh_Motion_30116_g70872 * 0.4 );
				float temp_output_7_0_g70869 = TVE_MotionFadeEnd;
				half Motion_FadeOut4005_g70845 = saturate( ( ( distance( ase_worldPos , _WorldSpaceCameraPos ) - temp_output_7_0_g70869 ) / ( TVE_MotionFadeStart - temp_output_7_0_g70869 ) ) );
				half Motion_30_Amplitude4960_g70845 = ( _MotionAmplitude_32 * _MotionValue_30 * Motion_30_Mask5244_g70845 * Global_MotionPower2223_g70845 * Global_MotionNoise34_g70845 * Motion_FacingMask5214_g70845 * Motion_FadeOut4005_g70845 );
				half Input_Amplitude58_g70908 = Motion_30_Amplitude4960_g70845;
				half Global_Power354_g70908 = TVE_FlutterParams.x;
				half Motion_Normal364_g70908 = _MotionNormalValue;
				float3 lerpResult370_g70908 = lerp( float3( 1,1,1 ) , inputMesh.normalOS , Motion_Normal364_g70908);
				half3 Motion_30_Details263_g70845 = ( ( sin( ( ( ( ase_worldPos.x + ase_worldPos.y + ase_worldPos.z ) * Motion_Scale321_g70908 ) + Motion_Variation330_g70908 + mulTime349_g70908 ) ) * Input_Amplitude58_g70908 * Global_Power354_g70908 ) * lerpResult370_g70908 );
				float3 Vertex_Motion_Object833_g70845 = ( ( ( VertexPosRotationAxis50_g70920 + ( VertexPosOtherAxis82_g70920 * cos( Angle44_g70920 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g70920 ) * sin( Angle44_g70920 ) ) ) + Motion_20_Squash4418_g70845 ) + Motion_30_Details263_g70845 );
				float3 temp_output_3474_0_g70845 = ( VertexPosition3588_g70845 - Mesh_PivotsOS2291_g70845 );
				float3 appendResult2043_g70845 = (float3(Motion_10_BendingX216_g70845 , 0.0 , Motion_10_BendingZ190_g70845));
				float3 Vertex_Motion_World1118_g70845 = ( ( ( temp_output_3474_0_g70845 + appendResult2043_g70845 ) + Motion_20_Squash4418_g70845 ) + Motion_30_Details263_g70845 );
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch4976_g70845 = Vertex_Motion_World1118_g70845;
				#else
				float3 staticSwitch4976_g70845 = ( Vertex_Motion_Object833_g70845 + ( _VertexDataMode * 0.0 ) );
				#endif
				float4 temp_output_94_19_g70904 = TVE_VertexCoords;
				half2 UV97_g70904 = ( (temp_output_94_19_g70904).zw + ( (temp_output_94_19_g70904).xy * (ObjectPosition4223_g70845).xz ) );
				float temp_output_84_0_g70904 = _LayerVertexValue;
				float4 lerpResult109_g70904 = lerp( TVE_VertexParams , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_VertexTex, sampler_linear_repeat, UV97_g70904,temp_output_84_0_g70904, 0.0 ) , TVE_VertexUsage[(int)temp_output_84_0_g70904]);
				half4 Global_Object_Params4173_g70845 = lerpResult109_g70904;
				half Global_VertexSize174_g70845 = saturate( Global_Object_Params4173_g70845.w );
				float lerpResult346_g70845 = lerp( 1.0 , Global_VertexSize174_g70845 , _GlobalSize);
				float3 appendResult3480_g70845 = (float3(lerpResult346_g70845 , lerpResult346_g70845 , lerpResult346_g70845));
				half3 ObjectData20_g70880 = appendResult3480_g70845;
				half3 _Vector11 = half3(1,1,1);
				half3 WorldData19_g70880 = _Vector11;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g70880 = WorldData19_g70880;
				#else
				float3 staticSwitch14_g70880 = ObjectData20_g70880;
				#endif
				half3 Vertex_Size1741_g70845 = staticSwitch14_g70880;
				half3 _Vector5 = half3(1,1,1);
				float3 Vertex_SizeFade1740_g70845 = _Vector5;
				half3 Grass_Perspective2661_g70845 = half3(0,0,0);
				float3 lerpResult16_g70879 = lerp( VertexPosition3588_g70845 , ( ( staticSwitch4976_g70845 * Vertex_Size1741_g70845 * Vertex_SizeFade1740_g70845 ) + Mesh_PivotsOS2291_g70845 + Grass_Perspective2661_g70845 ) , TVE_Enabled);
				float3 Final_VertexPosition890_g70845 = ( lerpResult16_g70879 + _DisableSRPBatcher );
				
				o.ase_texcoord2.xyz = ase_worldPos;
				float temp_output_7_0_g70861 = TVE_CameraFadeStart;
				float lerpResult4755_g70845 = lerp( 1.0 , saturate( ( ( distance( ase_worldPos , _WorldSpaceCameraPos ) - temp_output_7_0_g70861 ) / ( TVE_CameraFadeEnd - temp_output_7_0_g70861 ) ) ) , _FadeCameraValue);
				float vertexToFrag11_g70867 = lerpResult4755_g70845;
				o.ase_texcoord2.w = vertexToFrag11_g70867;
				o.ase_texcoord3.xyz = vertexToFrag3890_g70845;
				o.ase_texcoord5.xyz = vertexToFrag4224_g70845;
				
				o.ase_texcoord4 = inputMesh.ase_texcoord;
				o.ase_color = inputMesh.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord3.w = 0;
				o.ase_texcoord5.w = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue =  Final_VertexPosition890_g70845;
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
				float localCustomAlphaClip9_g70878 = ( 0.0 );
				float3 ase_worldPos = packedInput.ase_texcoord2.xyz;
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 normalizeResult2169_g70845 = normalize( ase_worldViewDir );
				float3 ViewDir_Normalized3963_g70845 = normalizeResult2169_g70845;
				float3 normalizeResult3971_g70845 = normalize( cross( ddy( ase_worldPos ) , ddx( ase_worldPos ) ) );
				float3 NormalsWS_Derivates3972_g70845 = normalizeResult3971_g70845;
				float dotResult3851_g70845 = dot( ViewDir_Normalized3963_g70845 , NormalsWS_Derivates3972_g70845 );
				float lerpResult3993_g70845 = lerp( 1.0 , saturate( abs( dotResult3851_g70845 ) ) , _FadeGlancingValue);
				half Fade_Glancing3853_g70845 = lerpResult3993_g70845;
				float vertexToFrag11_g70867 = packedInput.ase_texcoord2.w;
				half Fade_Camera_Mask5149_g70845 = 1.0;
				float lerpResult5141_g70845 = lerp( 1.0 , vertexToFrag11_g70867 , Fade_Camera_Mask5149_g70845);
				half Fade_Camera3743_g70845 = lerpResult5141_g70845;
				float temp_output_41_0_g70864 = ( Fade_Glancing3853_g70845 * Fade_Camera3743_g70845 );
				float3 vertexToFrag3890_g70845 = packedInput.ase_texcoord3.xyz;
				float3 WorldPosition3905_g70845 = vertexToFrag3890_g70845;
				half Final_AlphaFade3727_g70845 = saturate( ( temp_output_41_0_g70864 + ( temp_output_41_0_g70864 * tex3D( TVE_ScreenTex3D, ( TVE_ScreenTexCoord * WorldPosition3905_g70845 ) ).r ) ) );
				half2 Main_UVs15_g70845 = ( ( packedInput.ase_texcoord4.xy * (_MainUVs).xy ) + (_MainUVs).zw );
				float4 tex2DNode29_g70845 = tex2D( _MainAlbedoTex, Main_UVs15_g70845 );
				float Main_Alpha316_g70845 = ( _MainColor.a * tex2DNode29_g70845.a );
				float4 temp_output_93_19_g70850 = TVE_ExtrasCoords;
				float3 vertexToFrag4224_g70845 = packedInput.ase_texcoord5.xyz;
				half3 ObjectData20_g70886 = vertexToFrag4224_g70845;
				half3 WorldData19_g70886 = vertexToFrag3890_g70845;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g70886 = WorldData19_g70886;
				#else
				float3 staticSwitch14_g70886 = ObjectData20_g70886;
				#endif
				float3 ObjectPosition4223_g70845 = staticSwitch14_g70886;
				float3 lerpResult4827_g70845 = lerp( WorldPosition3905_g70845 , ObjectPosition4223_g70845 , _ExtrasPositionMode);
				half2 UV96_g70850 = ( (temp_output_93_19_g70850).zw + ( (temp_output_93_19_g70850).xy * (lerpResult4827_g70845).xz ) );
				float temp_output_84_0_g70850 = _LayerExtrasValue;
				float4 lerpResult109_g70850 = lerp( TVE_ExtrasParams , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_ExtrasTex, sampler_linear_repeat, UV96_g70850,temp_output_84_0_g70850, 0.0 ) , TVE_ExtrasUsage[(int)temp_output_84_0_g70850]);
				float4 break89_g70850 = lerpResult109_g70850;
				half Global_Extras_Alpha1033_g70845 = saturate( break89_g70850.a );
				float3 break111_g70874 = ObjectPosition4223_g70845;
				half Global_DynamicMode5112_g70845 = _VertexDynamicMode;
				half Input_DynamicMode120_g70874 = Global_DynamicMode5112_g70845;
				float Mesh_Variation16_g70845 = packedInput.ase_color.r;
				half Input_Variation124_g70874 = Mesh_Variation16_g70845;
				half ObjectData20_g70875 = frac( ( ( ( break111_g70874.x + break111_g70874.y + break111_g70874.z ) * ( 1.0 - Input_DynamicMode120_g70874 ) ) + Input_Variation124_g70874 ) );
				half WorldData19_g70875 = Input_Variation124_g70874;
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g70875 = WorldData19_g70875;
				#else
				float staticSwitch14_g70875 = ObjectData20_g70875;
				#endif
				float clampResult129_g70874 = clamp( staticSwitch14_g70875 , 0.01 , 0.99 );
				half Global_MeshVariation5104_g70845 = clampResult129_g70874;
				float lerpResult5154_g70845 = lerp( 0.0 , Global_MeshVariation5104_g70845 , _AlphaVariationValue);
				half Global_Alpha_Variation5158_g70845 = lerpResult5154_g70845;
				half AlphaTreshold2132_g70845 = _AlphaClipValue;
				half Global_Alpha_Mask4546_g70845 = 1.0;
				float lerpResult5203_g70845 = lerp( 1.0 , ( ( Global_Extras_Alpha1033_g70845 - Global_Alpha_Variation5158_g70845 ) + AlphaTreshold2132_g70845 ) , ( Global_Alpha_Mask4546_g70845 * _GlobalAlpha ));
				float lerpResult16_g70919 = lerp( 1.0 , lerpResult5203_g70845 , TVE_Enabled);
				half Global_Alpha315_g70845 = lerpResult16_g70919;
				half Final_Alpha3754_g70845 = ( ( Main_Alpha316_g70845 * Global_Alpha315_g70845 ) - ( AlphaTreshold2132_g70845 - 0.5 ) );
				float temp_output_661_0_g70845 = ( Final_AlphaFade3727_g70845 * Final_Alpha3754_g70845 );
				float temp_output_3_0_g70865 = temp_output_661_0_g70845;
				half Offest27_g70865 = 0.5;
				half Feather30_g70865 = 0.5;
				float temp_output_3_0_g70878 = ( ( ( temp_output_3_0_g70865 - Offest27_g70865 ) / ( max( fwidth( temp_output_3_0_g70865 ) , 0.001 ) + Feather30_g70865 ) ) + Offest27_g70865 );
				float Alpha9_g70878 = temp_output_3_0_g70878;
				float temp_output_15_0_g70878 = 0.5;
				float Treshold9_g70878 = temp_output_15_0_g70878;
				{
				#if TVE_FEATURE_CLIP
				clip(Alpha9_g70878 - Treshold9_g70878);
				#endif
				}
				half Final_Clip914_g70845 = Alpha9_g70878;
				
				surfaceDescription.Alpha = Final_Clip914_g70845;
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
1920;6;1920;1023;3075.48;643.9542;1;True;False
Node;AmplifyShaderEditor.RangedFloatNode;10;-2176,-640;Half;False;Property;_render_cull;_render_cull;195;1;[HideInInspector];Create;True;0;3;Both;0;Back;1;Front;2;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;1033;-1536,-768;Inherit;False;Compile Core;-1;;70924;634b02fd1f32e6a4c875d8fc2c450956;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;907;-1408,-640;Half;False;Property;_subsurface_shadow;_subsurface_shadow;192;1;[HideInInspector];Create;True;0;0;0;True;0;False;1;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;1008;-2177,-257;Inherit;False;Base Shader;0;;70845;856f7164d1c579d43a5cf4968a75ca43;79,3880,1,4028,1,4029,1,3903,1,3900,1,4204,1,3904,1,3908,1,4172,1,1300,1,1298,1,4179,1,4995,1,3586,0,4499,1,1708,1,3658,1,3509,1,5151,1,3873,1,893,1,5196,0,5128,1,5156,1,1717,1,1715,1,1714,1,1718,1,5075,1,916,1,1763,0,1762,0,3568,1,5118,1,1776,1,3475,1,4210,1,1745,1,3479,0,3501,1,5152,1,1646,1,1271,1,3889,0,2807,1,3886,0,4999,0,3887,0,3957,1,2172,1,3883,0,3728,1,3949,0,5147,0,5146,1,2658,0,1742,0,3484,0,1736,0,4837,0,1735,0,1733,0,5079,0,1737,0,1734,0,878,0,1550,0,860,1,2261,1,2260,1,2054,1,2032,1,2039,1,2062,1,3243,0,5220,1,4217,1,5090,1,4242,0;5;5115;FLOAT;1;False;5127;FLOAT;1;False;5143;FLOAT;1;False;5119;FLOAT;1;False;5117;FLOAT;1;False;21;FLOAT3;0;FLOAT3;528;FLOAT3;2489;FLOAT;531;FLOAT;4842;FLOAT;529;FLOAT;3678;FLOAT;530;FLOAT;4122;FLOAT;4134;FLOAT;1235;FLOAT3;1230;FLOAT;1461;FLOAT;1290;FLOAT;721;FLOAT;532;FLOAT;629;FLOAT3;534;FLOAT;4867;FLOAT4;5246;FLOAT4;4841
Node;AmplifyShaderEditor.RangedFloatNode;7;-1792,-640;Half;False;Property;_render_dst;_render_dst;197;1;[HideInInspector];Create;True;0;2;Opaque;0;Transparent;1;0;True;0;False;10;10;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;822;-1984,-768;Half;False;Property;_IsSubsurfaceShader;_IsSubsurfaceShader;194;1;[HideInInspector];Create;True;0;0;0;True;0;False;1;1;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;1032;-1344,-768;Inherit;False;Compile All Shaders;-1;;70844;e67c8238031dbf04ab79a5d4d63d1b4f;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;20;-1984,-640;Half;False;Property;_render_src;_render_src;196;1;[HideInInspector];Create;True;0;0;0;True;0;False;5;5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;471;-2176,512;Inherit;False;Define Shader Vegetation;-1;;70843;b458122dd75182d488380bd0f592b9e6;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;1031;-1856,512;Inherit;False;Define Pipeline HD;-1;;70842;7af1bc24c286d754db63fb6a44aba77b;0;0;1;FLOAT;529
Node;AmplifyShaderEditor.RangedFloatNode;168;-2176,-768;Half;False;Property;_IsLeafShader;_IsLeafShader;193;1;[HideInInspector];Create;True;0;0;0;True;0;False;1;1;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;17;-1600,-640;Half;False;Property;_render_zw;_render_zw;198;1;[HideInInspector];Create;True;0;2;Opaque;0;Transparent;1;0;True;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1034;-1376,-146;Float;False;False;-1;2;Rendering.HighDefinition.LightingShaderGraphGUI;0;1;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;ScenePickingPass;0;11;ScenePickingPass;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;0;True;-30;False;False;False;False;False;False;False;False;False;False;False;True;2;False;-1;True;3;False;-1;False;True;1;LightMode=Picking;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1026;-1376,-256;Float;False;False;-1;2;Rendering.HighDefinition.LitShaderGraphGUI;0;1;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;Distortion;0;6;Distortion;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;True;4;1;False;-1;1;False;-1;4;1;False;-1;1;False;-1;True;1;False;-1;1;False;-1;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;True;True;0;True;-10;255;False;-1;255;True;-11;7;False;-1;3;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;True;2;False;-1;True;3;False;-1;False;True;1;LightMode=DistortionVectors;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1022;-1376,-256;Float;False;False;-1;2;Rendering.HighDefinition.LitShaderGraphGUI;0;1;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;ShadowCaster;0;2;ShadowCaster;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;0;True;-25;False;True;False;False;False;False;0;False;-1;False;False;False;False;False;False;False;False;False;True;1;False;-1;True;3;False;-1;False;True;1;LightMode=ShadowCaster;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1024;-1376,-256;Float;False;False;-1;2;Rendering.HighDefinition.LitShaderGraphGUI;0;1;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;DepthOnly;0;4;DepthOnly;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;0;True;-25;False;False;False;False;False;False;False;False;False;True;True;0;True;-6;255;False;-1;255;True;-7;7;False;-1;3;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;True;1;False;-1;False;False;True;1;LightMode=DepthOnly;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1027;-1376,-256;Float;False;False;-1;2;Rendering.HighDefinition.LitShaderGraphGUI;0;1;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;TransparentBackface;0;7;TransparentBackface;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;True;1;0;True;-19;0;True;-20;1;0;True;-21;0;True;-22;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;True;0;True;-31;False;True;1;LightMode=TransparentBackface;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1020;-1376,-256;Float;False;True;-1;2;TVEShaderCoreGUI;0;20;BOXOPHOBIC/The Vegetation Engine/Default/Leaf Subsurface Lit;28cd5599e02859647ae1798e4fcaef6c;True;GBuffer;0;0;GBuffer;35;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;0;True;-30;False;False;False;False;False;False;False;False;True;True;True;0;True;-15;255;False;-1;255;True;-14;7;False;-1;3;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;True;False;True;0;True;-16;False;True;1;LightMode=GBuffer;False;False;0;Hidden/BOXOPHOBIC/The Vegetation Engine/Fallback;0;0;Standard;43;Surface Type;0;0;  Rendering Pass;1;0;  Refraction Model;0;0;    Blending Mode;0;0;    Blend Preserves Specular;1;0;  Receive Fog;1;0;  Back Then Front Rendering;0;0;  Transparent Depth Prepass;0;0;  Transparent Depth Postpass;0;0;  Transparent Writes Motion Vector;0;0;  Distortion;0;0;    Distortion Mode;0;0;    Distortion Depth Test;1;0;  ZWrite;0;0;  Z Test;4;0;Double-Sided;0;637921063286337496;Alpha Clipping;0;0;  Use Shadow Threshold;0;0;Material Type,InvertActionOnDeselection;5;0;  Energy Conserving Specular;1;0;  Transmission;1;0;Receive Decals;1;0;Receives SSR;1;0;Receive SSR Transparent;0;0;Motion Vectors;1;0;  Add Precomputed Velocity;0;0;Specular AA;0;0;Specular Occlusion Mode;0;0;Override Baked GI;0;0;Depth Offset;0;0;DOTS Instancing;1;0;GPU Instancing;1;0;LOD CrossFade;1;0;Tessellation;0;0;  Phong;0;0;  Strength;0.5,False,-1;0;  Type;0;0;  Tess;16,False,-1;0;  Min;10,False,-1;0;  Max;25,False,-1;0;  Edge Length;16,False,-1;0;  Max Displacement;25,False,-1;0;Vertex Position;0;0;0;12;True;True;True;True;True;True;False;False;False;False;True;True;False;;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1030;-1376,-256;Float;False;False;-1;2;Rendering.HighDefinition.LitShaderGraphGUI;0;1;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;Forward;0;10;Forward;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;True;1;0;True;-19;0;True;-20;1;0;True;-21;0;True;-22;False;False;False;False;False;False;False;False;False;False;False;False;True;0;True;-28;False;False;False;False;False;False;False;False;False;True;True;0;True;-4;255;False;-1;255;True;-5;7;False;-1;3;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;True;0;True;-23;True;0;True;-30;False;True;1;LightMode=Forward;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1029;-1376,-256;Float;False;False;-1;2;Rendering.HighDefinition.LitShaderGraphGUI;0;1;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;TransparentDepthPostpass;0;9;TransparentDepthPostpass;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;True;1;1;False;-1;0;False;-1;0;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;True;0;True;-25;False;True;False;False;False;False;0;False;-1;False;False;False;False;False;False;False;False;False;True;1;False;-1;False;False;True;1;LightMode=TransparentDepthPostpass;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1028;-1376,-256;Float;False;False;-1;2;Rendering.HighDefinition.LitShaderGraphGUI;0;1;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;TransparentDepthPrepass;0;8;TransparentDepthPrepass;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;True;1;1;False;-1;0;False;-1;0;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;True;0;True;-25;False;False;False;False;False;False;False;False;False;True;True;0;True;-7;255;False;-1;255;True;-8;7;False;-1;3;False;-1;1;False;-1;1;False;-1;7;False;-1;3;False;-1;1;False;-1;1;False;-1;False;True;1;False;-1;False;False;True;1;LightMode=TransparentDepthPrepass;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1025;-1376,-256;Float;False;False;-1;2;Rendering.HighDefinition.LitShaderGraphGUI;0;1;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;Motion Vectors;0;5;Motion Vectors;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;0;True;-25;False;False;False;False;False;False;False;False;False;True;True;0;True;-8;255;False;-1;255;True;-9;7;False;-1;3;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;True;1;False;-1;False;False;True;1;LightMode=MotionVectors;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1021;-1376,-256;Float;False;False;-1;2;Rendering.HighDefinition.LitShaderGraphGUI;0;1;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;META;0;1;META;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1023;-1376,-256;Float;False;False;-1;2;Rendering.HighDefinition.LitShaderGraphGUI;0;1;New Amplify Shader;28cd5599e02859647ae1798e4fcaef6c;True;SceneSelectionPass;0;3;SceneSelectionPass;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=SceneSelectionPass;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.CommentaryNode;37;-2176,-896;Inherit;False;1024.392;100;Internal;0;;1,0.252,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;33;-2176,-384;Inherit;False;1024.392;100;Final;0;;0,1,0.5,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;449;-2176,384;Inherit;False;1026.438;100;Features;0;;0,1,0.5,1;0;0
WireConnection;1020;0;1008;0
WireConnection;1020;1;1008;528
WireConnection;1020;6;1008;2489
WireConnection;1020;7;1008;530
WireConnection;1020;8;1008;531
WireConnection;1020;9;1008;532
WireConnection;1020;16;1008;1461
WireConnection;1020;21;1008;1290
WireConnection;1020;11;1008;534
ASEEND*/
//CHKSM=41DBB2C747218D1B47AC395782086EFB4F3C0C06
