using UnityEngine;
using Python.Runtime;
using UnityPython;

public class PythonIntegration : MonoBehaviour
{
    private void Start()
    {
        UnityPython.PythonLifeCycle.Initialize();

        using (Py.GIL())
        {
            dynamic locals = new PyDict();

            string pythonScriptPath = "Assets/Scripts/Python/testBaslines3.py";
            string pythonScriptCode = System.IO.File.ReadAllText(pythonScriptPath);

            PythonEngine.Exec(pythonScriptCode, locals, locals);
        }
    }
}