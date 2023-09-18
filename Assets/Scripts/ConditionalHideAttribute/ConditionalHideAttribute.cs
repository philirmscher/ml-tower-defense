using UnityEngine;

public class ConditionalHideAttribute : PropertyAttribute
{
    public string conditionalSourceField = "";
    public bool hideInInspector = false;

    public ConditionalHideAttribute(string conditionalSourceField, bool hideInInspector = false)
    {
        this.conditionalSourceField = conditionalSourceField;
        this.hideInInspector = hideInInspector;
    }
}
