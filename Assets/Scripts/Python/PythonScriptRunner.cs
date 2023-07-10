using Python.Runtime;
using System.Collections.Generic;
using System.Diagnostics;
using UnityEngine;
using System;
using TMPro;

public class PythonScriptRunner : MonoBehaviour
{
    public TextMeshProUGUI resultText;

    private void Start()
    {
        using (Py.GIL())
        {
            dynamic sys = Py.Import("sys");
            dynamic platform = Py.Import("platform");
            dynamic math = Py.Import("math");

            // Python-Version abrufen
            dynamic pythonVersion = sys.version;
            UnityEngine.Debug.Log("Python Version: " + pythonVersion);

            // Betriebssysteminformationen abrufen
            dynamic osInfo = platform.system();
            UnityEngine.Debug.Log("Operating System: " + osInfo);

            // Berechnung in Python durchführen
            dynamic result = math.sqrt(25);

            // Ergebnis an Unity übermitteln
            float unityResult = (float)result;

            // Ergebnis in Unity ausgeben
            UnityEngine.Debug.Log("Square root of 25: " + unityResult);
            UnityEngine.Debug.Log("Result Text is null: " + (resultText == null));
            resultText.text = "Result sqrt(25): " + unityResult + " Current OS: " + osInfo + " Current Python Version: " + pythonVersion; 
        }

        LogInstalledLibraries();
    }

    private void LogInstalledLibraries()
    {
        using (Py.GIL())
        {
            dynamic sys = Py.Import("sys");

            dynamic paths = sys.path;
            foreach (dynamic path in paths)
            {
                UnityEngine.Debug.Log("Python Library Path: " + path);
            }
        }

        List<string> installedPackages = new List<string>();

        using (Py.GIL())
        {
            dynamic pkgResources = Py.Import("pkg_resources");
            dynamic workingSet = pkgResources.working_set;

            foreach (dynamic package in workingSet)
            {
                string packageName = package.key;
                installedPackages.Add(packageName);
            }
        }

        string packages = "";
        foreach (string packageName in installedPackages)
        {
            if (packages == "")
            {
                packages += "Installed Packages: ";
            }
            packages += packageName + ", ";
        }
        UnityEngine.Debug.Log(packages);
    }
}