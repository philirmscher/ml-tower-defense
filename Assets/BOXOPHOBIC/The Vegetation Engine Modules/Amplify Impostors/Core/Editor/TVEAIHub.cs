// Cristian Pop - https://boxophobic.com/

using UnityEngine;
using UnityEditor;
using Boxophobic.StyledGUI;
using Boxophobic.Utils;
using System.IO;

namespace TheVegetationEngineImpostors
{
    public class TVEAIHub : EditorWindow
    {
        const int GUI_HEIGHT = 18;

        string assetFolder = "Assets/BOXOPHOBIC/The Vegetation Engine Modules/Amplify Impostors";
        string userFolder = "Assets/BOXOPHOBIC/User";

        string[] pipelinePaths;
        string[] pipelineOptions;
        string pipelinesPath;
        int pipelineIndex;

        GUIStyle stylePopup;

        Color bannerColor;
        string bannerText;
        static TVEAIHub window;
        //Vector2 scrollPosition = Vector2.zero;

        [MenuItem("Window/BOXOPHOBIC/The Vegetation Engine | Amplify Impostors/Hub", false, 1001)]
        public static void ShowWindow()
        {
            window = GetWindow<TVEAIHub>(false, "Amplify Impostors Module", true);
            window.minSize = new Vector2(389, 220);
        }

        void OnEnable()
        {
            //Safer search, there might be many user folders
            string[] searchFolders;

            searchFolders = AssetDatabase.FindAssets("Amplify Impostors");

            for (int i = 0; i < searchFolders.Length; i++)
            {
                if (AssetDatabase.GUIDToAssetPath(searchFolders[i]).EndsWith("Amplify Impostors.pdf"))
                {
                    assetFolder = AssetDatabase.GUIDToAssetPath(searchFolders[i]);
                    assetFolder = assetFolder.Replace("/Amplify Impostors.pdf", "");
                }
            }

            searchFolders = AssetDatabase.FindAssets("User");

            for (int i = 0; i < searchFolders.Length; i++)
            {
                if (AssetDatabase.GUIDToAssetPath(searchFolders[i]).EndsWith("User.pdf"))
                {
                    userFolder = AssetDatabase.GUIDToAssetPath(searchFolders[i]);
                    userFolder = userFolder.Replace("/User.pdf", "");
                    userFolder += "/The Vegetation Engine";
                }
            }

            pipelinesPath = assetFolder + "/Core/Pipelines";

            GetPackages();

            for (int i = 0; i < pipelineOptions.Length; i++)
            {
                if (pipelineOptions[i] == SettingsUtils.LoadSettingsData(userFolder + "/PipelineAI.asset", ""))
                {
                    pipelineIndex = i;
                }
            }

            var assetVersionString = SettingsUtils.LoadSettingsData(assetFolder + "/Core/Editor/Version.asset", "100");
            var bannerVersion = assetVersionString.ToString();
            bannerVersion = bannerVersion.Insert(1, ".");
            bannerVersion = bannerVersion.Insert(3, ".");

            bannerColor = new Color(0.890f, 0.745f, 0.309f);
            bannerText = "Amplify Impostors Module " + bannerVersion;
        }

        void OnGUI()
        {
            SetGUIStyles();

            DrawToolbar();

            StyledGUI.DrawWindowBanner(bannerColor, bannerText);

            GUILayout.BeginHorizontal();
            GUILayout.Space(15);

            GUILayout.BeginVertical();

            if (File.Exists(assetFolder + "/Core/Editor/TVEAIHubAutoRun.cs"))
            {
                EditorGUILayout.HelpBox("Welcome to the Amplify Impostors Module for the Vegetation Engine! Press Install to go to the Render Pipeline selection tab!", MessageType.Info, true);

                GUILayout.Space(15);

                if (GUILayout.Button("Install", GUILayout.Height(24)))
                {
                    InstallAsset();
                }
            }
            else
            {
                if (EditorApplication.isCompiling)
                {
                    GUI.enabled = false;
                }

                EditorGUILayout.HelpBox("Select the render pipeline used in your project to make the shaders compatible with the current pipeline!", MessageType.Info, true);

                GUILayout.Space(15);

                GUILayout.BeginHorizontal();

                GUILayout.Label("Render Pipeline Support", GUILayout.Width(220));
                pipelineIndex = EditorGUILayout.Popup(pipelineIndex, pipelineOptions, stylePopup);

                if (GUILayout.Button("Import", GUILayout.Height(GUI_HEIGHT), GUILayout.Width(80)))
                {
                    SettingsUtils.SaveSettingsData(userFolder + "/PipelineAI.asset", pipelineOptions[pipelineIndex]);

                    ImportPackage();

                    GUIUtility.ExitGUI();
                }

                GUILayout.EndHorizontal();
            }

            GUI.enabled = true;

            GUILayout.EndVertical();

            GUILayout.Space(13);
            GUILayout.EndHorizontal();
        }

        void SetGUIStyles()
        {
            stylePopup = new GUIStyle(EditorStyles.popup)
            {
                alignment = TextAnchor.MiddleCenter
            };
        }

        void DrawToolbar()
        {
            var GUI_TOOLBAR_EDITOR_WIDTH = this.position.width / 5.0f + 1;

            var styledToolbar = new GUIStyle(EditorStyles.toolbarButton)
            {
                alignment = TextAnchor.MiddleCenter,
                fontStyle = FontStyle.Normal,
                fontSize = 11,
            };

            GUILayout.Space(1);
            GUILayout.BeginHorizontal();

            if (GUILayout.Button("Discord Server", styledToolbar, GUILayout.Width(GUI_TOOLBAR_EDITOR_WIDTH)))
            {
                Application.OpenURL("https://discord.com/invite/znxuXET");
            }
            GUILayout.Space(-1);

            if (GUILayout.Button("Documentation", styledToolbar, GUILayout.Width(GUI_TOOLBAR_EDITOR_WIDTH)))
            {
                Application.OpenURL("https://docs.google.com/document/d/1otI7lGjXNL9FYmvvogNUG4ymG8tUrlUmwbrTj9hFMN8/edit#heading=h.u2ox035i3s3h");
            }
            GUILayout.Space(-1);

            if (GUILayout.Button("Demo Scene", styledToolbar, GUILayout.Width(GUI_TOOLBAR_EDITOR_WIDTH)))
            {
                EditorGUIUtility.PingObject(AssetDatabase.LoadAssetAtPath<Object>(assetFolder + "/Demo/Demo Impostors.unity"));
            }
            GUILayout.Space(-1);

            if (GUILayout.Button("More Modules", styledToolbar, GUILayout.Width(GUI_TOOLBAR_EDITOR_WIDTH)))
            {
                Application.OpenURL("https://assetstore.unity.com/publishers/20529");
            }

#if UNITY_2020_3_OR_NEWER
            var rectModules = GUILayoutUtility.GetLastRect();
            var iconModules = new Rect(rectModules.xMax - 24, rectModules.y, 20, 20);
            GUI.color = new Color(0.6f, 0.9f, 1.0f);
            GUI.Label(iconModules, EditorGUIUtility.IconContent("d_SceneViewFx"));
            GUI.color = Color.white;
#endif
            GUILayout.Space(-1);

            if (GUILayout.Button("Write A Review", styledToolbar, GUILayout.Width(GUI_TOOLBAR_EDITOR_WIDTH)))
            {
                Application.OpenURL("https://assetstore.unity.com/packages/vfx/shaders/the-vegetation-engine-amplify-impostors-module-189099#reviews");
            }

#if UNITY_2020_3_OR_NEWER
            var rectReview = GUILayoutUtility.GetLastRect();
            var iconReview = new Rect(rectReview.xMax - 24, rectReview.y, 20, 20);
            GUI.color = new Color(1.0f, 1.0f, 0.5f);
            GUI.Label(iconReview, EditorGUIUtility.IconContent("d_Favorite"));
            GUI.color = Color.white;
#endif
            GUILayout.Space(-1);

            GUILayout.EndHorizontal();
            GUILayout.Space(4);
        }

        void GetPackages()
        {
            pipelinePaths = Directory.GetFiles(pipelinesPath, "*.unitypackage", SearchOption.TopDirectoryOnly);

            pipelineOptions = new string[pipelinePaths.Length];

            for (int i = 0; i < pipelineOptions.Length; i++)
            {
                pipelineOptions[i] = Path.GetFileNameWithoutExtension(pipelinePaths[i].Replace("Built-in Pipeline", "Standard"));
            }
        }

        void InstallAsset()
        {
            FileUtil.DeleteFileOrDirectory(assetFolder + "/Core/Editor/TVEAIHubAutorun.cs");

            if (File.Exists(assetFolder + "/Core/Editor/TVEAIHubAutoRun.cs.meta"))
            {
                FileUtil.DeleteFileOrDirectory(assetFolder + "/Core/Editor/TVEAIHubAutorun.cs.meta");
            }

            SettingsUtils.SaveSettingsData(userFolder + "/PipelineAI.asset", "Standard");

            AssetDatabase.Refresh();

            SetDefineSymbols();

            GUIUtility.ExitGUI();
        }

        void ImportPackage()
        {
            SettingsUtils.SaveSettingsData(userFolder + "/PipelineAI.asset", pipelineOptions[pipelineIndex]);

            AssetDatabase.ImportPackage(pipelinePaths[pipelineIndex], false);
            AssetDatabase.SaveAssets();
            AssetDatabase.Refresh();

            Debug.Log("<b>[Amplify Impostors Module]</b> " + pipelineOptions[pipelineIndex] + " package is imported!");
        }

        void SetDefineSymbols()
        {
            var defineSymbols = PlayerSettings.GetScriptingDefineSymbolsForGroup(EditorUserBuildSettings.selectedBuildTargetGroup);

            if (!defineSymbols.Contains("THE_VEGETATION_ENGINE_IMPOSTORS"))
            {
                defineSymbols += ";THE_VEGETATION_ENGINE_IMPOSTORS;";
            }

            PlayerSettings.SetScriptingDefineSymbolsForGroup(EditorUserBuildSettings.selectedBuildTargetGroup, defineSymbols);
        }
    }
}

