--|||||||||||||||||||||||||||||||||||||||||||||||||||| GUI NUMBER PROPERTY FIELD ||||||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||||||| GUI NUMBER PROPERTY FIELD ||||||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||||||| GUI NUMBER PROPERTY FIELD ||||||||||||||||||||||||||||||||||||||||||||||||||||

TLSE_Development_Editor_GUI_NumberPropertyFieldsCount = 1;
TLSE_Development_Editor_GUI_NumberPropertyFields = {};

TLSE_Development_Editor_GUI_CreateNumberPropertyField = function(agent_referenceAgent, string_property, vector_screenPosition, bool_canHold, function_onIncrease, function_onDecrease)
    local numberPropertyField_newField = 
    {
        ReferenceAgent = agent_referenceAgent,
        ReferenceAgentProperty = string_property,
        NameLabel = TLSE_Development_Editor_GUI_CreateLabel(string_property, vector_screenPosition),
        ValueLabel = TLSE_Development_Editor_GUI_CreateLabel("nil", vector_screenPosition),
        Value = nil,
        Decrease = nil,
        Increase = nil,
        Visible = true,
        ScreenPosition = vector_screenPosition,
        CanHold = bool_canHold
    };

    if(function_onIncrease == nil) then
        local function_internalOnIncrease = function(parameterData)
            if(parameterData ~= nil) then
                if(parameterData["ReferenceAgent"] ~= nil and parameterData["ReferenceAgentProperty"] ~= nil) then
                    if(AgentHasProperty(parameterData["ReferenceAgent"], parameterData["ReferenceAgentProperty"])) then
                        parameterData["Value"] = AgentGetProperty(parameterData["ReferenceAgent"], parameterData["ReferenceAgentProperty"]);
                        parameterData["Value"] = parameterData["Value"] + TLSE_Development_GUI_PropertyAdjustmentValue;
                        AgentSetProperty(parameterData["ReferenceAgent"], parameterData["ReferenceAgentProperty"], parameterData["Value"]);
                    end
                end
            end
        end

        if(bool_canHold) then
            numberPropertyField_newField["Increase"] = TLSE_Development_Editor_GUI_CreateTextButton("(+)", false, vector_screenPosition, nil, nil);
            numberPropertyField_newField["Increase"]["OnHold"] = function_internalOnIncrease;
        else
            numberPropertyField_newField["Increase"] = TLSE_Development_Editor_GUI_CreateTextButton("(+)", false, vector_screenPosition, nil, nil);
            numberPropertyField_newField["Increase"]["OnPress"] = function_internalOnIncrease;
        end
    else
        if(bool_canHold) then
            numberPropertyField_newField["Increase"] = TLSE_Development_Editor_GUI_CreateTextButton("(+)", false, vector_screenPosition, nil, function_onIncrease);
        else
            numberPropertyField_newField["Increase"] = TLSE_Development_Editor_GUI_CreateTextButton("(+)", false, vector_screenPosition, function_onIncrease, nil);
        end
    end

    if(function_onDecrease == nil) then
        local function_internalOnDecrease = function(parameterData)
            if(parameterData ~= nil) then
                if(parameterData["ReferenceAgent"] ~= nil and parameterData["ReferenceAgentProperty"] ~= nil) then
                    if(AgentHasProperty(parameterData["ReferenceAgent"], parameterData["ReferenceAgentProperty"])) then
                        parameterData["Value"] = AgentGetProperty(parameterData["ReferenceAgent"], parameterData["ReferenceAgentProperty"]);
                        parameterData["Value"] = parameterData["Value"] - TLSE_Development_GUI_PropertyAdjustmentValue;
                        AgentSetProperty(parameterData["ReferenceAgent"], parameterData["ReferenceAgentProperty"], parameterData["Value"]);
                    end
                end
            end
        end

        if(bool_canHold) then
            numberPropertyField_newField["Decrease"] = TLSE_Development_Editor_GUI_CreateTextButton("(-)", false, vector_screenPosition, nil, nil);
            numberPropertyField_newField["Decrease"]["OnHold"] = function_internalOnDecrease;
        else
            numberPropertyField_newField["Decrease"] = TLSE_Development_Editor_GUI_CreateTextButton("(-)", false, vector_screenPosition, nil, nil);
            numberPropertyField_newField["Decrease"]["OnPress"] = function_internalOnDecrease;
        end
    else
        if(bool_canHold) then
            numberPropertyField_newField["Decrease"] = TLSE_Development_Editor_GUI_CreateTextButton("(-)", false, vector_screenPosition, nil, function_onDecrease);
        else
            numberPropertyField_newField["Decrease"] = TLSE_Development_Editor_GUI_CreateTextButton("(-)", false, vector_screenPosition, function_onDecrease, nil);
        end
    end

    numberPropertyField_newField["Increase"]["ParameterData"] = numberPropertyField_newField;
    numberPropertyField_newField["Decrease"]["ParameterData"] = numberPropertyField_newField;

    table.insert(TLSE_Development_Editor_GUI_NumberPropertyFields, numberPropertyField_newField);
    TLSE_Development_Editor_GUI_NumberPropertyFieldsCount = TLSE_Development_Editor_GUI_NumberPropertyFieldsCount + 1;

    return numberPropertyField_newField;
end

TLSE_Development_Editor_GUI_UpdateNumberPropertyField = function(numberPropertyField_field)
    if(numberPropertyField_field == nil) then return end

    local bool_visibility = numberPropertyField_field["Visible"];

    numberPropertyField_field["NameLabel"]["Visible"] = bool_visibility;
    numberPropertyField_field["ValueLabel"]["Visible"] = bool_visibility;
    numberPropertyField_field["Increase"]["Visible"] = bool_visibility;
    numberPropertyField_field["Decrease"]["Visible"] = bool_visibility;

    if(bool_visibility == false) then return end

    local number_xOffset = 0;
    local vector_screenPosition = numberPropertyField_field["ScreenPosition"];
    local vector_contentsScreenSize = TLSE_TextUI_GetTextScreenSize(numberPropertyField_field["NameLabel"].TextAgent);
    local vector_decreaseScreenSize = TLSE_TextUI_GetTextScreenSize(numberPropertyField_field["Decrease"].TextAgent);
    local vector_increaseScreenSize = TLSE_TextUI_GetTextScreenSize(numberPropertyField_field["Increase"].TextAgent);

    numberPropertyField_field["NameLabel"]["ScreenPosition"] = vector_screenPosition;

    number_xOffset = number_xOffset + (vector_contentsScreenSize.x * 2.0) + TLSE_Development_Editor_GUI_PropertyFieldHorizontalSeparation;
    numberPropertyField_field["Decrease"]["ScreenPosition"] = VectorAdd(Vector(number_xOffset, 0, 0), vector_screenPosition);

    number_xOffset = number_xOffset + (vector_decreaseScreenSize.x * 2.0) + TLSE_Development_Editor_GUI_PropertyFieldHorizontalSeparation;
    numberPropertyField_field["Increase"]["ScreenPosition"] = VectorAdd(Vector(number_xOffset, 0, 0), vector_screenPosition);

    number_xOffset = number_xOffset + (vector_increaseScreenSize.x * 2.0) + TLSE_Development_Editor_GUI_PropertyFieldHorizontalSeparation;
    numberPropertyField_field["ValueLabel"]["ScreenPosition"] = VectorAdd(Vector(number_xOffset, 0, 0), vector_screenPosition);

    if(numberPropertyField_field["ReferenceAgent"] ~= nil) then
        if(AgentHasProperty(numberPropertyField_field["ReferenceAgent"], numberPropertyField_field["ReferenceAgentProperty"])) then
            local number_agentPropertyValue = AgentGetProperty(numberPropertyField_field["ReferenceAgent"], numberPropertyField_field["ReferenceAgentProperty"]);
            numberPropertyField_field["Value"] = number_agentPropertyValue;
        end
    end

    numberPropertyField_field["ValueLabel"]["Text"] = tostring(numberPropertyField_field["Value"]);
end