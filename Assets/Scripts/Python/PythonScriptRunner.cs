using Python.Runtime;
using System.Collections.Generic;
using System.Diagnostics;
using UnityEngine;

public class PythonScriptRunner : MonoBehaviour
{
    private void Start()
    {
        using (Py.GIL())
        {
            dynamic sys = Py.Import("sys");
            dynamic version = sys.version;
            string pythonVersion = version.ToString();
            UnityEngine.Debug.Log("Python Version: " + pythonVersion);

            dynamic message = "Hello, Python!";
            string messageString = message.ToString();
            UnityEngine.Debug.Log(messageString);
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
            if(packages == "")
            {
                packages += "Installed Packages: ";
            }
            packages += packageName + ", ";
        }
        UnityEngine.Debug.Log(packages);
    }
}