// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Hidden/BOXOPHOBIC/The Vegetation Engine/Helpers/Impostors Baker"
{
	Properties
	{
		_IsPropShader("IsPropShader", Float) = 0
		_IsBarkShader("IsBarkShader", Float) = 0
		_IsGrassShader("IsGrassShader", Float) = 0
		_IsVegetationShader("IsVegetationShader", Float) = 0
		_IsPolygonalShader("IsPolygonalShader", Float) = 0
		_IsObjectsShader("IsObjectsShader", Float) = 0
		_IsLeafShader("IsLeafShader", Float) = 0
		_IsCrossShader("IsCrossShader", Float) = 0
		_HasEmissive("_HasEmissive", Float) = 0
		_HasOcclusion("_HasOcclusion", Float) = 1
		_HasGradient("_HasGradient", Float) = 1
		[HDR]_MainColor("Main Color", Color) = (1,1,1,1)
		[NoScaleOffset]_MainAlbedoTex("Main Albedo", 2D) = "white" {}
		[NoScaleOffset]_MainNormalTex("Main Normal", 2D) = "gray" {}
		[NoScaleOffset]_MainMaskTex("Main Mask", 2D) = "white" {}
		[Space(10)]_MainUVs("Main UVs", Vector) = (1,1,0,0)
		_MainNormalValue("Main Normal", Range( -8 , 8)) = 0
		[HDR]_VertexOcclusionColor("Vertex Occlusion Color", Color) = (1,1,1,1)
		[HideInInspector]_VertexOcclusionMinValue("Vertex Occlusion Min Value", Range( 0 , 1)) = 0
		[HideInInspector]_VertexOcclusionMaxValue("Vertex Occlusion Max Value", Range( 0 , 1)) = 1
		_AlphaClipValue("_AlphaClipValue", Float) = 0
		_MainSmoothnessValue("Main Smoothness", Range( 0 , 1)) = 1
		_MainMetallicValue("Main Metallic", Range( 0 , 1)) = 1
		[HDR]_GradientColorOne("Gradient Color One", Color) = (1,1,1,1)
		[HDR]_GradientColorTwo("Gradient Color Two", Color) = (1,1,1,1)
		[StyledRemapSlider(_GradientMinValue, _GradientMaxValue, 0, 1)]_GradientMaskRemap("Gradient Mask", Vector) = (0,0,0,0)
		[HideInInspector]_GradientMinValue("Gradient Mask Min", Range( 0 , 1)) = 0
		[HideInInspector]_GradientMaxValue("Gradient Mask Max ", Range( 0 , 1)) = 1
		_RenderClip("Render Clip", Float) = 1
		[Enum(UV 0,0,Baked,1)]_DetailTypeMode("Detail Type", Float) = 0
		[Enum(Off,0,On,1)]_DetailMode("Detail Mode", Float) = 0
		[Enum(UV 0,0,Baked,1)]_DetailCoordMode("Detail UVs", Float) = 0
		[NoScaleOffset]_SecondAlbedoTex("Detail Albedo", 2D) = "white" {}
		[NoScaleOffset]_SecondNormalTex("Detail Normal", 2D) = "gray" {}
		[NoScaleOffset]_SecondMaskTex("Detail Mask", 2D) = "white" {}
		[Space(10)]_SecondUVs("Detail UVs", Vector) = (1,1,0,0)
		[HDR]_SecondColor("Detail Color", Color) = (1,1,1,1)
		_SecondNormalValue("Detail Normal", Range( -8 , 8)) = 1
		_SecondMetallicValue("Detail Metallic", Range( 0 , 1)) = 0
		_SecondSmoothnessValue("Detail Smoothness", Range( 0 , 1)) = 1
		[Enum(Top,0,Bottom,1)]_DetailProjectionMode("Detail Projection", Float) = 0
		[Space(10)]_DetailNormalValue("Detail Use Main Normal", Range( 0 , 1)) = 0.5
		[Enum(Main Mask,0,Detail Mask,1)][Space(10)]_DetailMaskMode("Detail Mask", Float) = 0
		_DetailMeshValue("Detail Offset", Range( -1 , 1)) = 0
		[StyledRemapSlider(_DetailBlendMinValue, _DetailBlendMaxValue,0,1)]_DetailBlendRemap("Detail Blend", Vector) = (0,0,0,0)
		[Space(10)][StyledToggle]_VertexColorMode("Use Vertex Color for Albedo", Range( 0 , 1)) = 0
		[HideInInspector]_DetailBlendMinValue("Detail Blend Min Value", Range( 0 , 1)) = 0.2
		[StyledToggle]_LeavesFilterMode("Use Color Filter for Leaves", Float) = 0
		[HideInInspector]_DetailBlendMaxValue("Detail Blend Max Value", Range( 0 , 1)) = 0.3
		[Space(10)]_LeavesFilterColor("Leaves Color Filter", Color) = (0,0,0,1)
		[HideInInspector]_render_normals("_render_normals", Vector) = (1,1,1,0)
		_LeavesFilterRange("Leaves Color Range", Range( 0 , 1)) = 0
		[Enum(Off,0,On,1)]_DetailMaskInvertMode("Detail Mask Invert", Float) = 0
		[NoScaleOffset][StyledTextureSingleLine]_EmissiveTex("Emissive Texture", 2D) = "white" {}
		[HDR]_EmissiveColor("Emissive Color", Color) = (0,0,0,0)
		[Space(10)]_EmissiveUVs("Emissive UVs", Vector) = (1,1,0,0)
		[ASEEnd][Enum(Overlay,0,Replace,1)]_DetailBlendMode("Detail Blend", Float) = 1
		[HideInInspector]_render_cull("_render_cull", Float) = 0

	}

	SubShader
	{
		Tags { "RenderType"="Opaque" }
	LOD 100
		CGINCLUDE
		#pragma target 4.0
		ENDCG
		Cull [_render_cull]
		

		Pass
		{
			Name "Unlit"
			CGPROGRAM
			#if defined(SHADER_API_GLCORE) || defined(SHADER_API_GLES) || defined(SHADER_API_GLES3) || defined(SHADER_API_D3D9)
			#define FRONT_FACE_SEMANTIC VFACE
			#define FRONT_FACE_TYPE float
			#else
			#define FRONT_FACE_SEMANTIC SV_IsFrontFace
			#define FRONT_FACE_TYPE bool
			#endif

			#pragma vertex vert
			#pragma fragment frag
			#include "UnityCG.cginc"
			#pragma multi_compile_fwdbase
			#include "UnityStandardUtils.cginc"
			#include "UnityShaderVariables.cginc"
			#define ASE_NEEDS_FRAG_COLOR
			#define ASE_NEEDS_VERT_POSITION


			struct appdata
			{
				float4 vertex : POSITION;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_color : COLOR;
				float4 ase_texcoord1 : TEXCOORD1;
				float3 ase_normal : NORMAL;
				float4 ase_tangent : TANGENT;
			};

			struct v2f
			{
				UNITY_POSITION(pos);
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_color : COLOR;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
			};

			uniform half _render_cull;
			uniform half4 _DetailBlendRemap;
			uniform half _DetailBlendMode;
			uniform float4 _GradientMaskRemap;
			uniform sampler2D _MainAlbedoTex;
			uniform half4 _MainUVs;
			uniform float _IsPolygonalShader;
			uniform half _VertexColorMode;
			uniform float4 _MainColor;
			uniform half4 _SecondColor;
			uniform sampler2D _SecondAlbedoTex;
			uniform half _DetailCoordMode;
			uniform float _IsBarkShader;
			uniform half _DetailTypeMode;
			uniform float _IsPropShader;
			uniform half4 _SecondUVs;
			uniform half _DetailMeshValue;
			uniform half _DetailProjectionMode;
			uniform sampler2D _MainMaskTex;
			uniform sampler2D _SecondMaskTex;
			uniform half _DetailMaskMode;
			uniform half _DetailMaskInvertMode;
			uniform half _DetailBlendMinValue;
			uniform half _DetailBlendMaxValue;
			uniform half _DetailMode;
			uniform half4 _VertexOcclusionColor;
			uniform half _VertexOcclusionMinValue;
			uniform half _VertexOcclusionMaxValue;
			uniform float _HasOcclusion;
			uniform half4 _GradientColorTwo;
			uniform half4 _GradientColorOne;
			uniform half _GradientMinValue;
			uniform half _GradientMaxValue;
			uniform float _HasGradient;
			uniform float _IsLeafShader;
			uniform float _IsGrassShader;
			uniform float _IsObjectsShader;
			uniform float _IsVegetationShader;
			uniform sampler2D _MainNormalTex;
			uniform float _MainNormalValue;
			uniform half _DetailNormalValue;
			uniform sampler2D _SecondNormalTex;
			uniform half _SecondNormalValue;
			uniform half3 _render_normals;
			uniform float _MainMetallicValue;
			uniform half _SecondMetallicValue;
			uniform float _IsCrossShader;
			uniform half4 _LeavesFilterColor;
			uniform float _LeavesFilterRange;
			uniform half _LeavesFilterMode;
			uniform float _MainSmoothnessValue;
			uniform half _SecondSmoothnessValue;
			uniform half4 _EmissiveColor;
			uniform sampler2D _EmissiveTex;
			uniform half4 _EmissiveUVs;
			uniform float _HasEmissive;
			uniform float _AlphaClipValue;
			uniform float _RenderClip;


			v2f vert(appdata v )
			{
				v2f o = (v2f)0;
				UNITY_SETUP_INSTANCE_ID( v );
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );
				UNITY_TRANSFER_INSTANCE_ID( v, o );
				float3 ase_worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
				o.ase_texcoord2.xyz = ase_worldPos;
				float3 ase_worldNormal = UnityObjectToWorldNormal(v.ase_normal);
				o.ase_texcoord3.xyz = ase_worldNormal;
				
				float3 ase_worldTangent = UnityObjectToWorldDir(v.ase_tangent);
				o.ase_texcoord4.xyz = ase_worldTangent;
				float ase_vertexTangentSign = v.ase_tangent.w * unity_WorldTransformParams.w;
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				o.ase_texcoord5.xyz = ase_worldBitangent;
				float3 objectToViewPos = UnityObjectToViewPos(v.vertex.xyz);
				float eyeDepth = -objectToViewPos.z;
				o.ase_texcoord.z = eyeDepth;
				
				o.ase_texcoord.xy = v.ase_texcoord.xy;
				o.ase_color = v.ase_color;
				o.ase_texcoord1 = v.ase_texcoord1;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord.w = 0;
				o.ase_texcoord2.w = 0;
				o.ase_texcoord3.w = 0;
				o.ase_texcoord4.w = 0;
				o.ase_texcoord5.w = 0;

				v.vertex.xyz +=  float3(0,0,0) ;
				o.pos = UnityObjectToClipPos(v.vertex);
				return o;
			}


			void frag(v2f i , FRONT_FACE_TYPE ase_vface : FRONT_FACE_SEMANTIC,
				out half4 outGBuffer0 : SV_Target0, 
				out half4 outGBuffer1 : SV_Target1, 
				out half4 outGBuffer2 : SV_Target2, 
				out half4 outGBuffer3 : SV_Target3,
				out half4 outGBuffer4 : SV_Target4,
				out half4 outGBuffer5 : SV_Target5,
				out half4 outGBuffer6 : SV_Target6,
				out half4 outGBuffer7 : SV_Target7,
				out float outDepth : SV_Depth
			) 
			{
				UNITY_SETUP_INSTANCE_ID( i );
				float _IsPolygonalShader691_g50703 = _IsPolygonalShader;
				float2 lerpResult724_g50703 = lerp( ( ( i.ase_texcoord.xy * (_MainUVs).xy ) + (_MainUVs).zw ) , i.ase_texcoord.xy , _IsPolygonalShader691_g50703);
				float2 Main_UVs247_g50703 = lerpResult724_g50703;
				float4 tex2DNode14_g50703 = tex2D( _MainAlbedoTex, Main_UVs247_g50703 );
				float3 lerpResult678_g50703 = lerp( (tex2DNode14_g50703).rgb , (i.ase_color).rgb , _VertexColorMode);
				float3 Main_Albedo79_g50703 = ( lerpResult678_g50703 * (_MainColor).rgb );
				float2 appendResult745_g50703 = (float2(i.ase_texcoord1.z , i.ase_texcoord1.w));
				float2 lerpResult461_g50703 = lerp( i.ase_texcoord.xy , appendResult745_g50703 , _DetailCoordMode);
				float _IsBarkShader78_g50703 = _IsBarkShader;
				float3 ase_worldPos = i.ase_texcoord2.xyz;
				float Detail_Type749_g50703 = _DetailTypeMode;
				float2 lerpResult748_g50703 = lerp( lerpResult461_g50703 , (ase_worldPos).xz , Detail_Type749_g50703);
				float _IsPropShader89_g50703 = _IsPropShader;
				half2 Second_UVs495_g50703 = ( ( ( ( lerpResult461_g50703 * _IsBarkShader78_g50703 ) + ( lerpResult748_g50703 * _IsPropShader89_g50703 ) ) * (_SecondUVs).xy ) + (_SecondUVs).zw );
				float4 tex2DNode491_g50703 = tex2D( _SecondAlbedoTex, Second_UVs495_g50703 );
				half3 Second_Albedo469_g50703 = (( _SecondColor * tex2DNode491_g50703 )).rgb;
				#ifdef UNITY_COLORSPACE_GAMMA
				float staticSwitch1_g50706 = 2.0;
				#else
				float staticSwitch1_g50706 = 4.594794;
				#endif
				float3 lerpResult743_g50703 = lerp( ( Main_Albedo79_g50703 * Second_Albedo469_g50703 * staticSwitch1_g50706 ) , Second_Albedo469_g50703 , _DetailBlendMode);
				float3 ase_worldNormal = i.ase_texcoord3.xyz;
				float3 lerpResult573_g50703 = lerp( float3(0,1,0) , float3(0,-1,0) , _DetailProjectionMode);
				float dotResult556_g50703 = dot( ase_worldNormal , lerpResult573_g50703 );
				float lerpResult752_g50703 = lerp( ( ( i.ase_color.b - 0.5 ) + _DetailMeshValue ) , ( ( dotResult556_g50703 * 0.5 ) + _DetailMeshValue ) , Detail_Type749_g50703);
				half Blend_Source550_g50703 = lerpResult752_g50703;
				float4 tex2DNode30_g50703 = tex2D( _MainMaskTex, Main_UVs247_g50703 );
				float Main_Mask64_g50703 = tex2DNode30_g50703.b;
				float4 tex2DNode451_g50703 = tex2D( _SecondMaskTex, Second_UVs495_g50703 );
				half Second_Mask437_g50703 = tex2DNode451_g50703.b;
				float lerpResult563_g50703 = lerp( Main_Mask64_g50703 , Second_Mask437_g50703 , _DetailMaskMode);
				float lerpResult611_g50703 = lerp( lerpResult563_g50703 , ( 1.0 - lerpResult563_g50703 ) , _DetailMaskInvertMode);
				float temp_output_7_0_g50709 = _DetailBlendMinValue;
				half Detail_Mask535_g50703 = saturate( ( ( saturate( ( Blend_Source550_g50703 + ( Blend_Source550_g50703 * lerpResult611_g50703 ) ) ) - temp_output_7_0_g50709 ) / ( _DetailBlendMaxValue - temp_output_7_0_g50709 ) ) );
				float3 lerpResult560_g50703 = lerp( Main_Albedo79_g50703 , lerpResult743_g50703 , Detail_Mask535_g50703);
				float3 lerpResult759_g50703 = lerp( lerpResult560_g50703 , Main_Albedo79_g50703 , Detail_Type749_g50703);
				float Detail_Mode769_g50703 = _DetailMode;
				float3 lerpResult771_g50703 = lerp( Main_Albedo79_g50703 , lerpResult759_g50703 , Detail_Mode769_g50703);
				half3 Blend_Albedo540_g50703 = lerpResult771_g50703;
				float3 temp_cast_0 = (1.0).xxx;
				float3 temp_cast_1 = (1.0).xxx;
				float temp_output_7_0_g50707 = _VertexOcclusionMinValue;
				float3 lerpResult260_g50703 = lerp( (_VertexOcclusionColor).rgb , temp_cast_1 , saturate( ( ( i.ase_color.g - temp_output_7_0_g50707 ) / ( _VertexOcclusionMaxValue - temp_output_7_0_g50707 ) ) ));
				float3 lerpResult421_g50703 = lerp( temp_cast_0 , lerpResult260_g50703 , _HasOcclusion);
				float3 Vertex_Occlusion_Color261_g50703 = lerpResult421_g50703;
				float3 temp_cast_2 = (1.0).xxx;
				float temp_output_7_0_g50708 = _GradientMinValue;
				float3 lerpResult339_g50703 = lerp( (_GradientColorTwo).rgb , (_GradientColorOne).rgb , saturate( ( ( i.ase_color.a - temp_output_7_0_g50708 ) / ( _GradientMaxValue - temp_output_7_0_g50708 ) ) ));
				float3 lerpResult419_g50703 = lerp( temp_cast_2 , lerpResult339_g50703 , _HasGradient);
				half3 Gradient_Tint335_g50703 = lerpResult419_g50703;
				float _IsLeafShader81_g50703 = _IsLeafShader;
				float _IsGrassShader255_g50703 = _IsGrassShader;
				float _IsObjectsShader686_g50703 = _IsObjectsShader;
				float _IsVegetationShader688_g50703 = _IsVegetationShader;
				half3 Final_Albedo606_g50703 = ( ( Blend_Albedo540_g50703 * Vertex_Occlusion_Color261_g50703 * Gradient_Tint335_g50703 * _IsLeafShader81_g50703 ) + ( Blend_Albedo540_g50703 * Vertex_Occlusion_Color261_g50703 * Gradient_Tint335_g50703 * _IsGrassShader255_g50703 ) + ( Blend_Albedo540_g50703 * Vertex_Occlusion_Color261_g50703 * _IsBarkShader78_g50703 ) + ( Blend_Albedo540_g50703 * _IsPropShader89_g50703 ) + ( Blend_Albedo540_g50703 * Vertex_Occlusion_Color261_g50703 * _IsObjectsShader686_g50703 ) + ( Blend_Albedo540_g50703 * _IsVegetationShader688_g50703 ) );
				float Final_Alpha387_g50703 = 1.0;
				float4 appendResult230_g50703 = (float4(Final_Albedo606_g50703 , Final_Alpha387_g50703));
				
				float4 tex2DNode18_g50703 = tex2D( _MainNormalTex, Main_UVs247_g50703 );
				float2 appendResult88_g50710 = (float2(tex2DNode18_g50703.a , tex2DNode18_g50703.g));
				float2 temp_output_90_0_g50710 = ( (appendResult88_g50710*2.0 + -1.0) * _MainNormalValue );
				float3 appendResult91_g50710 = (float3(temp_output_90_0_g50710 , 1.0));
				float3 Main_Normal27_g50703 = appendResult91_g50710;
				float3 lerpResult554_g50703 = lerp( float3( 0,0,1 ) , Main_Normal27_g50703 , _DetailNormalValue);
				float4 tex2DNode459_g50703 = tex2D( _SecondNormalTex, Second_UVs495_g50703 );
				float2 appendResult88_g50704 = (float2(tex2DNode459_g50703.a , tex2DNode459_g50703.g));
				float2 temp_output_90_0_g50704 = ( (appendResult88_g50704*2.0 + -1.0) * _SecondNormalValue );
				float3 appendResult91_g50704 = (float3(temp_output_90_0_g50704 , 1.0));
				half3 Second_Normal443_g50703 = appendResult91_g50704;
				float3 lerpResult502_g50703 = lerp( Main_Normal27_g50703 , BlendNormals( lerpResult554_g50703 , Second_Normal443_g50703 ) , Detail_Mask535_g50703);
				float3 lerpResult761_g50703 = lerp( lerpResult502_g50703 , Main_Normal27_g50703 , Detail_Type749_g50703);
				float3 lerpResult773_g50703 = lerp( Main_Normal27_g50703 , lerpResult761_g50703 , Detail_Mode769_g50703);
				float3 temp_output_13_0_g50705 = lerpResult773_g50703;
				float3 switchResult12_g50705 = (((ase_vface>0)?(temp_output_13_0_g50705):(( temp_output_13_0_g50705 * _render_normals ))));
				half3 Blend_Normal582_g50703 = switchResult12_g50705;
				float3 ase_worldTangent = i.ase_texcoord4.xyz;
				float3 ase_worldBitangent = i.ase_texcoord5.xyz;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 tanNormal3_g50703 = Blend_Normal582_g50703;
				float3 worldNormal3_g50703 = float3(dot(tanToWorld0,tanNormal3_g50703), dot(tanToWorld1,tanNormal3_g50703), dot(tanToWorld2,tanNormal3_g50703));
				float3 Final_NormalsWS91_g50703 = (worldNormal3_g50703*0.5 + 0.5);
				float eyeDepth = i.ase_texcoord.z;
				float temp_output_7_0_g50703 = ( -1.0 / UNITY_MATRIX_P[2].z );
				float Final_Depth92_g50703 = ( ( eyeDepth + temp_output_7_0_g50703 ) / temp_output_7_0_g50703 );
				float4 appendResult235_g50703 = (float4(Final_NormalsWS91_g50703 , Final_Depth92_g50703));
				
				float Main_Metallic62_g50703 = ( tex2DNode30_g50703.r * _MainMetallicValue );
				half Second_Metallic465_g50703 = ( tex2DNode451_g50703.r * _SecondMetallicValue );
				float lerpResult505_g50703 = lerp( Main_Metallic62_g50703 , Second_Metallic465_g50703 , Detail_Mask535_g50703);
				float lerpResult763_g50703 = lerp( lerpResult505_g50703 , Main_Metallic62_g50703 , Detail_Type749_g50703);
				float lerpResult775_g50703 = lerp( Main_Metallic62_g50703 , lerpResult763_g50703 , Detail_Mode769_g50703);
				half Blend_Metallic543_g50703 = lerpResult775_g50703;
				float _IsCrossShader254_g50703 = _IsCrossShader;
				float _IsAnyVegetationShader86_g50703 = saturate( ( _IsBarkShader78_g50703 + _IsLeafShader81_g50703 + _IsCrossShader254_g50703 + _IsGrassShader255_g50703 + _IsVegetationShader688_g50703 ) );
				float Final_VariationOrMetallic67_g50703 = ( ( Blend_Metallic543_g50703 * _IsPropShader89_g50703 ) + ( i.ase_color.r * _IsAnyVegetationShader86_g50703 ) );
				float3 linearToGamma713_g50703 = LinearToGammaSpace( _LeavesFilterColor.rgb );
				#ifdef UNITY_COLORSPACE_GAMMA
				float3 staticSwitch706_g50703 = (_LeavesFilterColor).rgb;
				#else
				float3 staticSwitch706_g50703 = linearToGamma713_g50703;
				#endif
				float3 linearToGamma708_g50703 = LinearToGammaSpace( Main_Albedo79_g50703 );
				#ifdef UNITY_COLORSPACE_GAMMA
				float3 staticSwitch709_g50703 = (Main_Albedo79_g50703).xyz;
				#else
				float3 staticSwitch709_g50703 = linearToGamma708_g50703;
				#endif
				float lerpResult710_g50703 = lerp( 1.0 , saturate( ( 1.0 - ceil( ( distance( staticSwitch706_g50703 , staticSwitch709_g50703 ) - _LeavesFilterRange ) ) ) ) , _LeavesFilterMode);
				half Main_ColorFilter714_g50703 = lerpResult710_g50703;
				float Final_Leaves372_g50703 = saturate( ( ( 1.0 * _IsLeafShader81_g50703 ) + ( 1.0 * _IsGrassShader255_g50703 ) + ( 0.0 * _IsBarkShader78_g50703 ) + ( 0.0 * _IsPropShader89_g50703 ) + ( Main_Mask64_g50703 * Main_ColorFilter714_g50703 * ( _IsVegetationShader688_g50703 * _IsPolygonalShader691_g50703 ) ) ) );
				half Detail_MaskTex636_g50703 = lerpResult611_g50703;
				float Final_Mask208_g50703 = saturate( ( ( Main_Mask64_g50703 * _IsLeafShader81_g50703 ) + ( i.ase_color.a * _IsGrassShader255_g50703 ) + ( 0.0 * _IsBarkShader78_g50703 ) + ( Detail_MaskTex636_g50703 * _IsPropShader89_g50703 ) + ( Main_Mask64_g50703 * Main_ColorFilter714_g50703 * ( _IsVegetationShader688_g50703 * _IsPolygonalShader691_g50703 ) ) ) );
				float Main_Smoothness65_g50703 = ( tex2DNode30_g50703.a * _MainSmoothnessValue );
				half Second_Smoothness472_g50703 = ( tex2DNode451_g50703.a * _SecondSmoothnessValue );
				float lerpResult539_g50703 = lerp( Main_Smoothness65_g50703 , Second_Smoothness472_g50703 , Detail_Mask535_g50703);
				float lerpResult766_g50703 = lerp( lerpResult539_g50703 , Main_Smoothness65_g50703 , Detail_Type749_g50703);
				float lerpResult778_g50703 = lerp( Main_Smoothness65_g50703 , lerpResult766_g50703 , Detail_Mode769_g50703);
				half Blend_Smoothness553_g50703 = lerpResult778_g50703;
				float Final_Smoothness214_g50703 = Blend_Smoothness553_g50703;
				float4 appendResult236_g50703 = (float4(Final_VariationOrMetallic67_g50703 , Final_Leaves372_g50703 , Final_Mask208_g50703 , Final_Smoothness214_g50703));
				
				half2 Emissive_UVs655_g50703 = ( ( i.ase_texcoord.xy * (_EmissiveUVs).xy ) + (_EmissiveUVs).zw );
				half3 Final_Emissive661_g50703 = ( (( _EmissiveColor * tex2D( _EmissiveTex, Emissive_UVs655_g50703 ) )).rgb * _HasEmissive );
				float4 appendResult672_g50703 = (float4(Final_Emissive661_g50703 , 0.0));
				
				float Albedo_Alpha90_g50703 = tex2DNode14_g50703.a;
				float Alpha_Cutoff406_g50703 = _AlphaClipValue;
				float Render_Clip390_g50703 = _RenderClip;
				float lerpResult389_g50703 = lerp( 1.0 , ( Albedo_Alpha90_g50703 - Alpha_Cutoff406_g50703 ) , Render_Clip390_g50703);
				float Final_Clip393_g50703 = lerpResult389_g50703;
				

				outGBuffer0 = appendResult230_g50703;
				outGBuffer1 = appendResult235_g50703;
				outGBuffer2 = appendResult236_g50703;
				outGBuffer3 = appendResult672_g50703;
				outGBuffer4 = 0;
				outGBuffer5 = 0;
				outGBuffer6 = 0;
				outGBuffer7 = 0;
				float alpha = Final_Clip393_g50703;
				clip( alpha );
				outDepth = i.pos.z;
			}
			ENDCG
		}
	}
	
	
	
}
/*ASEBEGIN
Version=18934
1920;0;1920;1029;-1531.045;852.5616;1;True;False
Node;AmplifyShaderEditor.RangedFloatNode;268;2304,-512;Half;False;Property;_render_cull;_render_cull;62;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;285;2304,-384;Inherit;False;Base Baker;0;;50703;fd1de57b6831b5a4a975edc31360e4cc;0;0;5;FLOAT4;0;FLOAT4;19;FLOAT4;20;FLOAT4;673;FLOAT;323
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;199;2688,-384;Float;False;True;-1;2;;100;9;Hidden/BOXOPHOBIC/The Vegetation Engine/Helpers/Impostors Baker;f53051a8190f7044fa936bd7fbe116c1;True;Unlit;0;0;Unlit;10;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;2;True;268;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;RenderType=Opaque=RenderType;True;4;False;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;0;;0;0;Standard;0;0;1;True;False;;False;0
WireConnection;199;0;285;0
WireConnection;199;1;285;19
WireConnection;199;2;285;20
WireConnection;199;3;285;673
WireConnection;199;8;285;323
ASEEND*/
//CHKSM=05ABF4B9B4B0F2A97A0524E0B26CD5FE1D51AE12