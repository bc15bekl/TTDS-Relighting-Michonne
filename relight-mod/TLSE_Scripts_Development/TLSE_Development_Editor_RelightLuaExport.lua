--|||||||||||||||||||||||||||||||||||||||||||||| RELIGHT LUA EXPORT - CODE HELPERS ||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||| RELIGHT LUA EXPORT - CODE HELPERS ||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||| RELIGHT LUA EXPORT - CODE HELPERS ||||||||||||||||||||||||||||||||||||||||||||||

TLSE_Development_Editor_RelightLuaExport_WriteColor = function(color_colorToWrite)
    --REFERENCE LINE
    --Color(color_colorToWrite.r, color_colorToWrite.g, color_colorToWrite.b, color_colorToWrite.a)

    local string_codeToWrite = "Color(";
    string_codeToWrite = string_codeToWrite .. tostring(color_colorToWrite.r) .. ", ";
    string_codeToWrite = string_codeToWrite .. tostring(color_colorToWrite.g) .. ", ";
    string_codeToWrite = string_codeToWrite .. tostring(color_colorToWrite.b) .. ", ";
    string_codeToWrite = string_codeToWrite .. tostring(color_colorToWrite.a) .. ")";
    return string_codeToWrite;
end

TLSE_Development_Editor_RelightLuaExport_WriteVector3 = function(vector_vector3ToWrite)
    --REFERENCE LINE
    --Vector(vector_vector3ToWrite.x, vector_vector3ToWrite.y, vector_vector3ToWrite.z)

    local string_codeToWrite = "Vector(";
    string_codeToWrite = string_codeToWrite .. tostring(vector_vector3ToWrite.x) .. ", ";
    string_codeToWrite = string_codeToWrite .. tostring(vector_vector3ToWrite.y) .. ", ";
    string_codeToWrite = string_codeToWrite .. tostring(vector_vector3ToWrite.z) .. ")";
    return string_codeToWrite;
end

TLSE_Development_Editor_RelightLuaExport_WriteVector2 = function(vector_vector2ToWrite)
    --REFERENCE LINE
    --Vector(vector_vector2ToWrite.x, vector_vector2ToWrite.y, 0);

    local string_codeToWrite = "Vector(";
    string_codeToWrite = string_codeToWrite .. tostring(vector_vector2ToWrite.x) .. ", ";
    string_codeToWrite = string_codeToWrite .. tostring(vector_vector2ToWrite.y) .. ", ";
    string_codeToWrite = string_codeToWrite .. "0)";
    return string_codeToWrite;
end

TLSE_Development_Editor_RelightLuaExport_WriteAgentDestroy = function(string_agentVariableName, string_sceneVariableName)
    --REFERENCE LINE
    --AgentDestroy(AgentFindInScene("string_agentVariableName", "string_sceneVariableName")))

    local string_codeToWrite = "AgentDestroy(AgentFindInScene(";
    string_codeToWrite = string_codeToWrite .. '"' .. string_agentVariableName .. '"' .. ", ";
    string_codeToWrite = string_codeToWrite .. '"' .. string_sceneVariableName .. '"' .. "))";
    return string_codeToWrite;
end

TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty = function(string_agentVariableName, string_agentPropertyName, string_propertyValue)
    --REFERENCE LINE
    --AgentSetProperty("string_agentVariableName", "string_agentPropertyName", string_propertyValue)

    local string_codeToWrite = "AgentSetProperty(";
    string_codeToWrite = string_codeToWrite .. string_agentVariableName .. ", ";
    string_codeToWrite = string_codeToWrite .. '"' .. string_agentPropertyName .. '"' .. ", ";
    string_codeToWrite = string_codeToWrite .. string_propertyValue .. ")";
    return string_codeToWrite;
end

TLSE_Development_Editor_RelightLuaExport_WriteAgentNameSetProperty = function(agent_sceneAgent, string_agentPropertyName, string_propertyValue, string_sceneVariableName)
    --REFERENCE LINE
    --TLSE_AgentNameSetProperty("agent_sceneAgent", "string_agentPropertyName", string_propertyValue, string_sceneVariableName)

    local string_codeToWrite = "TLSE_AgentNameSetProperty(";
    string_codeToWrite = string_codeToWrite .. '"' .. AgentGetName(agent_sceneAgent) .. '"' .. ", ";
    string_codeToWrite = string_codeToWrite .. '"' .. string_agentPropertyName .. '"' .. ", ";
    string_codeToWrite = string_codeToWrite .. string_propertyValue .. ", ";
    string_codeToWrite = string_codeToWrite .. string_sceneVariableName .. ")";
    return string_codeToWrite;
end

TLSE_Development_Editor_RelightLuaExport_WriteAgentNameSetWorldPositionAndRotation = function(agent_sceneAgent, string_sceneVariableName)
    --REFERENCE LINE
    --TLSE_AgentNameSetWorldPositionAndRotation("agent_sceneAgent", Vector(0, 0, 0), Vector(0, 0, 0), string_sceneVariableName)

    local string_codeToWrite = "TLSE_AgentNameSetWorldPositionAndRotation(";
    string_codeToWrite = string_codeToWrite .. '"' .. tostring(AgentGetName(agent_sceneAgent)) .. '"' .. ", ";
    string_codeToWrite = string_codeToWrite .. TLSE_Development_Editor_RelightLuaExport_WriteVector3(AgentGetWorldPos(agent_sceneAgent)) .. ", ";
    string_codeToWrite = string_codeToWrite .. TLSE_Development_Editor_RelightLuaExport_WriteVector3(AgentGetWorldRot(agent_sceneAgent)) .. ", ";
    string_codeToWrite = string_codeToWrite .. string_sceneVariableName .. ")";
    return string_codeToWrite;
end

TLSE_Development_Editor_RelightLuaExport_WriteAgentSetPropertyWithSymbol = function(string_agentVariableName, string_agentPropertySymbol, string_propertyValue)
    --REFERENCE LINE
    --TLSE_AgentSetPropertyWithSymbol(agent_object, string_symbol, type_value)

    local string_codeToWrite = "TLSE_AgentSetPropertyWithSymbol(";
    string_codeToWrite = string_codeToWrite .. string_agentVariableName .. ", ";
    string_codeToWrite = string_codeToWrite .. '"' .. string_agentPropertySymbol.. '"' .. ", ";
    string_codeToWrite = string_codeToWrite .. string_propertyValue .. ")";
    return string_codeToWrite;
end

--|||||||||||||||||||||||||||||||||||||||||||||| RELIGHT LUA EXPORT - AGENT PROPERTY SYMBOL ||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||| RELIGHT LUA EXPORT - AGENT PROPERTY SYMBOL ||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||| RELIGHT LUA EXPORT - AGENT PROPERTY SYMBOL ||||||||||||||||||||||||||||||||||||||||||||||

TLSE_Development_Editor_RelightLuaExport_WriteSetAgentPropertiesBySymbol = function(agent_object, bool_useSymbolDatabase)
    local string_codeToWrite = "\n";

    string_codeToWrite = string_codeToWrite .. "--Settings all of the runtime properties on an agent by their raw symbol. \n";
    string_codeToWrite = string_codeToWrite .. "RELIGHT_SetAllPropertiesBySymbolOnAgent = function(agent_object) \n";

    local propertySet_reference = AgentGetProperties(agent_object);
    local propertySetKeys_reference = PropertyGetKeys(propertySet_reference);
    
    for index, symbol_propertyKey in pairs(propertySetKeys_reference) do
        local type_propertyValue = PropertyGet(propertySet_reference, symbol_propertyKey);
        local string_propertyValueType = TypeName(type_propertyValue);
        local string_propertyValue = tostring(type_propertyValue);

        local bool_writeAsComment = false;
        local string_propertyKeySymbol = TLSE_KeyToString(symbol_propertyKey);

        if(string_propertyValueType == "boolean" or string_propertyValueType == "number") then
            bool_writeAsComment = false;
        elseif(string_propertyValueType == "string") then
            string_propertyValue = '"' .. type_propertyValue .. '"';
        elseif(string_propertyValueType == "table") then
            local string_tableType = TLSE_GetTableType(type_propertyValue);
    
            if (string_tableType == "color") then
                string_propertyValue = TLSE_Development_Editor_RelightLuaExport_WriteColor(type_propertyValue);
            else
                bool_writeAsComment = true;
            end
        else
            bool_writeAsComment = true;
        end

        string_codeToWrite = string_codeToWrite .. "    ";

        if(bool_writeAsComment) then
            string_codeToWrite = string_codeToWrite .. "--" .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetPropertyWithSymbol("agent_object", string_propertyKeySymbol, string_propertyValue) .. " --" .. string_propertyValueType;
        else
            string_codeToWrite = string_codeToWrite .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetPropertyWithSymbol("agent_object", string_propertyKeySymbol, string_propertyValue) .. ";";
        end

        if(bool_useSymbolDatabase) then
            local symbolDatabase = require("TLSE_Development_SymbolKeyValueDatabase.lua");
            string_codeToWrite = string_codeToWrite .. " --" .. TLSE_Development_GetSymbolDatabaseMatchesForSymbol(symbol_propertyKey);
        end

        string_codeToWrite = string_codeToWrite .. "\n";
    end

    string_codeToWrite = string_codeToWrite .. "end \n";

    return string_codeToWrite;
end

TLSE_Development_Editor_RelightLuaExport_ExportAgentSetPropertiesBySymbolToScript = function(agent_object, string_scriptName, bool_useSymbolDatabase)
    local luaPath = "TLSEDevelopment/" .. string_scriptName .. ".lua";

    if(TLSE_FileExists(luaPath) == true) then
        TLSE_FileDelete(luaPath);
    else
        TLSE_DirectoryCreate("TLSEDevelopment");
    end

    local main_lua_file = io.open(luaPath, "w");

    --||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
    local string_codeToWrite = "\n";

    string_codeToWrite = string_codeToWrite .. TLSE_Development_Editor_RelightLuaExport_WriteSetAgentPropertiesBySymbol(agent_object, bool_useSymbolDatabase);

    main_lua_file:write(string_codeToWrite);
    main_lua_file:close();
end

--|||||||||||||||||||||||||||||||||||||||||||||| RELIGHT LUA EXPORT - TLSE SCENE EDITOR CHANGES FUNCTIONS ||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||| RELIGHT LUA EXPORT - TLSE SCENE EDITOR CHANGES FUNCTIONS ||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||| RELIGHT LUA EXPORT - TLSE SCENE EDITOR CHANGES FUNCTIONS ||||||||||||||||||||||||||||||||||||||||||||||

TLSE_Development_Editor_RelightLuaExport_WriteSceneAgentsDeleteFunction = function(stringArray_agentNamesToDelete)
    local string_codeToWrite = "";

    string_codeToWrite = "\n";
    string_codeToWrite = string_codeToWrite .. "--Here we delete agents that were deleted from a previous session of the TLSE editor. \n";
    string_codeToWrite = string_codeToWrite .. "RELIGHT_DeleteAgentsInScene = function(string_scene) \n";
    string_codeToWrite = string_codeToWrite .. "    --remove the following agents from the scene \n";

    for i, string_agentNameToDelete in pairs(stringArray_agentNamesToDelete) do
        --REFERENCE LINE
        --    TLSE_AgentNameDestroy("string_agentNameToDelete", string_scene);

        string_codeToWrite = string_codeToWrite.. "   TLSE_AgentNameDestroy(" .. '"' .. string_agentNameToDelete .. '"' .. ", string_scene); \n";
    end

    string_codeToWrite = string_codeToWrite .. "end \n";

    return string_codeToWrite;
end

TLSE_Development_Editor_RelightLuaExport_WriteSceneAgentsDuplicateFunction = function(duplicateAgentsArray_agentsToDuplicate)
    local string_codeToWrite = "";

    string_codeToWrite = "\n";
    string_codeToWrite = string_codeToWrite .. "--Here we duplicate agents that were duplicateedd from a previous session of the TLSE editor. \n";
    string_codeToWrite = string_codeToWrite .. "RELIGHT_DuplicateAgentsInScene = function(string_scene) \n";
    string_codeToWrite = string_codeToWrite .. "    --duplicate the following agents in the scene \n";

    for key, value in pairs(duplicateAgentsArray_agentsToDuplicate) do
        local string_agentReferenceName = value["AgentReferenceName"];
        local string_agentDuplicateName = value["AgentDuplicateName"];

        --REFERENCE LINE
        --    AgentDuplicate("string_agentDuplicateName", AgentFindInScene("string_agentReferenceName", string_scene), false, true, true);

        string_codeToWrite = string_codeToWrite .. "    AgentDuplicate(";
        string_codeToWrite = string_codeToWrite .. '"';
        string_codeToWrite = string_codeToWrite .. string_agentDuplicateName;
        string_codeToWrite = string_codeToWrite .. '"';
        string_codeToWrite = string_codeToWrite .. ", AgentFindInScene(";
        string_codeToWrite = string_codeToWrite .. '"';
        string_codeToWrite = string_codeToWrite .. string_agentReferenceName;
        string_codeToWrite = string_codeToWrite .. '"';
        string_codeToWrite = string_codeToWrite .. ", string_scene), ";
        string_codeToWrite = string_codeToWrite .. "false, "; -- duplicate children
        string_codeToWrite = string_codeToWrite .. "true, "; -- copy scene props
        string_codeToWrite = string_codeToWrite .. "true"; -- copy classes
        string_codeToWrite = string_codeToWrite .. ");\n";
    end

    string_codeToWrite = string_codeToWrite .. "end \n";

    return string_codeToWrite;
end

TLSE_Development_Editor_RelightLuaExport_WriteSceneAgentsTransformationsFunction = function(agentArray_sceneAgents)
    local string_codeToWrite = "";

    string_codeToWrite = "\n";
    string_codeToWrite = string_codeToWrite .. "--Here apply transformations to all agents from a previous session of the TLSE editor (NOTE: Even if some agents weren't moved, their transformations are still tracked here). \n";
    string_codeToWrite = string_codeToWrite .. "RELIGHT_TransformAgentsInScene = function(string_scene) \n";
    string_codeToWrite = string_codeToWrite .. "    --apply transformations to the following agents in the scene \n";

    for i, agent_sceneAgent in pairs(agentArray_sceneAgents) do
        string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentNameSetWorldPositionAndRotation(agent_sceneAgent, "string_scene") .. ";\n";
    end

    string_codeToWrite = string_codeToWrite .. "end \n";

    return string_codeToWrite;
end

TLSE_Development_Editor_RelightLuaExport_WriteApplyLightPropertiesChunk = function(agent_light)
    local string_codeToWrite = "";

    local string_agentName = AgentGetName(agent_light);

    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentNameSetProperty(string_agentName, "EnvLight - Enabled", tostring(AgentGetProperty(agent_light, "EnvLight - Enabled")), "string_scene") .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentNameSetProperty(string_agentName, "EnvLight - Enabled Group", tostring(AgentGetProperty(agent_light, "EnvLight - Enabled Group")), "string_scene") .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentNameSetProperty(string_agentName, "EnvLight - Type", tostring(AgentGetProperty(agent_light, "EnvLight - Type")), "string_scene") .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentNameSetProperty(string_agentName, "EnvLight - Intensity", tostring(AgentGetProperty(agent_light, "EnvLight - Intensity")), "string_scene") .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentNameSetProperty(string_agentName, "EnvLight - Intensity Dimmer", tostring(AgentGetProperty(agent_light, "EnvLight - Intensity Dimmer")), "string_scene") .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentNameSetProperty(string_agentName, "EnvLight - Intensity Specular", tostring(AgentGetProperty(agent_light, "EnvLight - Intensity Specular")), "string_scene") .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentNameSetProperty(string_agentName, "EnvLight - Intensity Diffuse", tostring(AgentGetProperty(agent_light, "EnvLight - Intensity Diffuse")), "string_scene") .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentNameSetProperty(string_agentName, "EnvLight - Enlighten Intensity", tostring(AgentGetProperty(agent_light, "EnvLight - Enlighten Intensity")), "string_scene") .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentNameSetProperty(string_agentName, "EnvLight - Color", TLSE_Development_Editor_RelightLuaExport_WriteColor(AgentGetProperty(agent_light, "EnvLight - Color")), "string_scene") .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentNameSetProperty(string_agentName, "EnvLight - Radius", tostring(AgentGetProperty(agent_light, "EnvLight - Radius")), "string_scene") .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentNameSetProperty(string_agentName, "EnvLight - Distance Falloff", tostring(AgentGetProperty(agent_light, "EnvLight - Distance Falloff")), "string_scene") .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentNameSetProperty(string_agentName, "EnvLight - Spot Angle Inner", tostring(AgentGetProperty(agent_light, "EnvLight - Spot Angle Inner")), "string_scene") .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentNameSetProperty(string_agentName, "EnvLight - Spot Angle Outer", tostring(AgentGetProperty(agent_light, "EnvLight - Spot Angle Outer")), "string_scene") .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentNameSetProperty(string_agentName, "EnvLight - Shadow Type", tostring(AgentGetProperty(agent_light, "EnvLight - Shadow Type")), "string_scene") .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentNameSetProperty(string_agentName, "EnvLight - Shadow Quality", tostring(AgentGetProperty(agent_light, "EnvLight - Shadow Quality")), "string_scene") .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentNameSetProperty(string_agentName, "EnvLight - Shadow Softness", tostring(AgentGetProperty(agent_light, "EnvLight - Shadow Softness")), "string_scene") .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentNameSetProperty(string_agentName, "EnvLight - Shadow Near Clip", tostring(AgentGetProperty(agent_light, "EnvLight - Shadow Near Clip")), "string_scene") .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentNameSetProperty(string_agentName, "EnvLight - Shadow Depth Bias", tostring(AgentGetProperty(agent_light, "EnvLight - Shadow Depth Bias")), "string_scene") .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentNameSetProperty(string_agentName, "EnvLight - Shadow Modulated Intensity", tostring(AgentGetProperty(agent_light, "EnvLight - Shadow Modulated Intensity")), "string_scene") .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentNameSetProperty(string_agentName, "EnvLight - Shadow Map Quality Distance Scale", tostring(AgentGetProperty(agent_light, "EnvLight - Shadow Map Quality Distance Scale")), "string_scene") .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentNameSetProperty(string_agentName, "EnvLight - Wrap", tostring(AgentGetProperty(agent_light, "EnvLight - Wrap")), "string_scene") .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentNameSetProperty(string_agentName, "EnvLight - Opacity", tostring(AgentGetProperty(agent_light, "EnvLight - Opacity")), "string_scene") .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentNameSetProperty(string_agentName, "EnvLight - Mobility", tostring(AgentGetProperty(agent_light, "EnvLight - Mobility")), "string_scene") .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentNameSetProperty(string_agentName, "EnvLight - Priority", tostring(AgentGetProperty(agent_light, "EnvLight - Priority")), "string_scene") .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentNameSetProperty(string_agentName, "EnvLight - HBAO Participation Type", tostring(AgentGetProperty(agent_light, "EnvLight - HBAO Participation Type")), "string_scene") .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentNameSetProperty(string_agentName, "EnvLight - Bake Allowed on Static", tostring(AgentGetProperty(agent_light, "EnvLight - Bake Allowed on Static")), "string_scene") .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentNameSetProperty(string_agentName, "EnvLight - Visible Threshold Scale", tostring(AgentGetProperty(agent_light, "EnvLight - Visible Threshold Scale")), "string_scene") .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentNameSetProperty(string_agentName, "EnvLight - LOD Behavior", tostring(AgentGetProperty(agent_light, "EnvLight - LOD Behavior")), "string_scene") .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentNameSetProperty(string_agentName, "EnvLight - NPR Banding", tostring(AgentGetProperty(agent_light, "EnvLight - NPR Banding")), "string_scene") .. ";\n";

    return string_codeToWrite;
end

TLSE_Development_Editor_RelightLuaExport_WriteApplyLightPropertiesFunction = function(agentsArray_sceneAgents)
    local string_codeToWrite = "";

    string_codeToWrite = "\n";
    string_codeToWrite = string_codeToWrite .. "--Here apply light settings to all environment light agents from a previous session of the TLSE editor (NOTE: Even if some agents weren't changed, their light settings are still tracked here). \n";
    string_codeToWrite = string_codeToWrite .. "RELIGHT_ApplyLightingSettings = function(string_scene) \n";

    for i, agent_sceneAgent in pairs(agentsArray_sceneAgents) do
        if(TLSE_AgentIsLight(agent_sceneAgent)) then
            string_codeToWrite = string_codeToWrite .. TLSE_Development_Editor_RelightLuaExport_WriteApplyLightPropertiesChunk(agent_sceneAgent) .. "\n";
        end
    end

    string_codeToWrite = string_codeToWrite .. "end \n";

    return string_codeToWrite;
end

TLSE_Development_Editor_RelightLuaExport_WriteApplyMeshPropertiesChunk = function(agent_mesh)
    local string_codeToWrite = "";

    local string_agentName = AgentGetName(agent_mesh);

    if(AgentHasProperty(agent_mesh, "Runtime: Visible")) then
        string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentNameSetProperty(string_agentName, "Runtime: Visible", tostring(AgentGetProperty(agent_mesh, "Runtime: Visible")), "string_scene") .. ";\n";
    end

    if(AgentHasProperty(agent_mesh, "Group - Visible")) then
        string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentNameSetProperty(string_agentName, "Group - Visible", tostring(AgentGetProperty(agent_mesh, "Group - Visible")), "string_scene") .. ";\n";
    end

    if(AgentHasProperty(agent_mesh, "Extents Min")) then
        string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentNameSetProperty(string_agentName, "Extents Min", TLSE_Development_Editor_RelightLuaExport_WriteVector3(AgentGetProperty(agent_mesh, "Extents Min")), "string_scene") .. ";\n";
    end

    if(AgentHasProperty(agent_mesh, "Extents Max")) then
        string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentNameSetProperty(string_agentName, "Extents Max", TLSE_Development_Editor_RelightLuaExport_WriteVector3(AgentGetProperty(agent_mesh, "Extents Max")), "string_scene") .. ";\n";
    end

    if(AgentHasProperty(agent_mesh, "Render Axis Scale")) then
        string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentNameSetProperty(string_agentName, "Render Axis Scale", TLSE_Development_Editor_RelightLuaExport_WriteVector3(AgentGetProperty(agent_mesh, "Render Axis Scale")), "string_scene") .. ";\n";
    end

    if(AgentHasProperty(agent_mesh, "Render Global Scale")) then
        string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentNameSetProperty(string_agentName, "Render Global Scale", tostring(AgentGetProperty(agent_mesh, "Render Global Scale")), "string_scene") .. ";\n";
    end

    if(AgentHasProperty(agent_mesh, "Render Cull")) then
        string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentNameSetProperty(string_agentName, "Render Cull", tostring(AgentGetProperty(agent_mesh, "Render Cull")), "string_scene") .. ";\n";
    end

    if(AgentHasProperty(agent_mesh, "Render Static")) then
        string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentNameSetProperty(string_agentName, "Render Static", tostring(AgentGetProperty(agent_mesh, "Render Static")), "string_scene") .. ";\n";
    end

    if(AgentHasProperty(agent_mesh, "Render Depth Test")) then
        string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentNameSetProperty(string_agentName, "Render Depth Test", tostring(AgentGetProperty(agent_mesh, "Render Depth Test")), "string_scene") .. ";\n";
    end

    if(AgentHasProperty(agent_mesh, "Render Depth Test Function")) then
        string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentNameSetProperty(string_agentName, "Render Depth Test Function", tostring(AgentGetProperty(agent_mesh, "Render Depth Test Function")), "string_scene") .. ";\n";
    end

    if(AgentHasProperty(agent_mesh, "Render Depth Write")) then
        string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentNameSetProperty(string_agentName, "Render Depth Write", tostring(AgentGetProperty(agent_mesh, "Render Depth Write")), "string_scene") .. ";\n";
    end

    if(AgentHasProperty(agent_mesh, "Render Depth Write Alpha")) then
        string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentNameSetProperty(string_agentName, "Render Depth Write Alpha", tostring(AgentGetProperty(agent_mesh, "Render Depth Write Alpha")), "string_scene") .. ";\n";
    end

    if(AgentHasProperty(agent_mesh, "Render 3D Alpha")) then
        string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentNameSetProperty(string_agentName, "Render 3D Alpha", tostring(AgentGetProperty(agent_mesh, "Render 3D Alpha")), "string_scene") .. ";\n";
    end

    if(AgentHasProperty(agent_mesh, "Render Constant Alpha")) then
        string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentNameSetProperty(string_agentName, "Render Constant Alpha", tostring(AgentGetProperty(agent_mesh, "Render Constant Alpha")), "string_scene") .. ";\n";
    end

    if(AgentHasProperty(agent_mesh, "Render Constant Alpha Multiply")) then
        string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentNameSetProperty(string_agentName, "Render Constant Alpha Multiply", tostring(AgentGetProperty(agent_mesh, "Render Constant Alpha Multiply")), "string_scene") .. ";\n";
    end

    if(AgentHasProperty(agent_mesh, "Render Color Write")) then
        string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentNameSetProperty(string_agentName, "Render Color Write", tostring(AgentGetProperty(agent_mesh, "Render Color Write")), "string_scene") .. ";\n";
    end

    if(AgentHasProperty(agent_mesh, "Render Force As Alpha")) then
        string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentNameSetProperty(string_agentName, "Render Force As Alpha", tostring(AgentGetProperty(agent_mesh, "Render Force As Alpha")), "string_scene") .. ";\n";
    end

    if(AgentHasProperty(agent_mesh, "Render Shadow Force Visible")) then
        string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentNameSetProperty(string_agentName, "Render Shadow Force Visible", tostring(AgentGetProperty(agent_mesh, "Render Shadow Force Visible")), "string_scene") .. ";\n";
    end

    if(AgentHasProperty(agent_mesh, "Render Enlighten Force Visible")) then
        string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentNameSetProperty(string_agentName, "Render Enlighten Force Visible", tostring(AgentGetProperty(agent_mesh, "Render Enlighten Force Visible")), "string_scene") .. ";\n";
    end

    if(AgentHasProperty(agent_mesh, "Render EnvLight Shadow Cast Enable")) then
        string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentNameSetProperty(string_agentName, "Render EnvLight Shadow Cast Enable", tostring(AgentGetProperty(agent_mesh, "Render EnvLight Shadow Cast Enable")), "string_scene") .. ";\n";
    end

    if(AgentHasProperty(agent_mesh, "Render FX Color Enabled")) then
        string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentNameSetProperty(string_agentName, "Render FX Color Enabled", tostring(AgentGetProperty(agent_mesh, "Render FX Color Enabled")), "string_scene") .. ";\n";
    end

    if(AgentHasProperty(agent_mesh, "Render Diffuse Color")) then
        string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentNameSetProperty(string_agentName, "Render Diffuse Color", TLSE_Development_Editor_RelightLuaExport_WriteColor(AgentGetProperty(agent_mesh, "Render Diffuse Color")), "string_scene") .. ";\n";
    end

    if(AgentHasProperty(agent_mesh, "Render Layer")) then
        string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentNameSetProperty(string_agentName, "Render Layer", tostring(AgentGetProperty(agent_mesh, "Render Layer")), "string_scene") .. ";\n";
    end

    if(AgentHasProperty(agent_mesh, "Render Material Time")) then
        string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentNameSetProperty(string_agentName, "Render Material Time", tostring(AgentGetProperty(agent_mesh, "Render Material Time")), "string_scene") .. ";\n";
    end

    if(AgentHasProperty(agent_mesh, "Render Auto Focus Enable")) then
        string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentNameSetProperty(string_agentName, "Render Auto Focus Enable", tostring(AgentGetProperty(agent_mesh, "Render Auto Focus Enable")), "string_scene") .. ";\n";
    end

    if(AgentHasProperty(agent_mesh, "Render After Anti-Aliasing")) then
        string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentNameSetProperty(string_agentName, "Render After Anti-Aliasing", tostring(AgentGetProperty(agent_mesh, "Render After Anti-Aliasing")), "string_scene") .. ";\n";
    end

    if(AgentHasProperty(agent_mesh, "Camera Facing")) then
        string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentNameSetProperty(string_agentName, "Camera Facing", tostring(AgentGetProperty(agent_mesh, "Camera Facing")), "string_scene") .. ";\n";
    end

    if(AgentHasProperty(agent_mesh, "Camera Facing Type")) then
        string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentNameSetProperty(string_agentName, "Camera Facing Type", tostring(AgentGetProperty(agent_mesh, "Camera Facing Type")), "string_scene") .. ";\n";
    end

    if(AgentHasProperty(agent_mesh, "Motion Blur Enabled")) then
        string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentNameSetProperty(string_agentName, "Motion Blur Enabled", tostring(AgentGetProperty(agent_mesh, "Motion Blur Enabled")), "string_scene") .. ";\n";
    end

    if(AgentHasProperty(agent_mesh, "Fog Override settings")) then
        string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentNameSetProperty(string_agentName, "Fog Override settings", tostring(AgentGetProperty(agent_mesh, "Fog Override settings")), "string_scene") .. ";\n";
    end

    if(AgentHasProperty(agent_mesh, "Fog Mesh Enabled")) then
        string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentNameSetProperty(string_agentName, "Fog Mesh Enabled", tostring(AgentGetProperty(agent_mesh, "Fog Mesh Enabled")), "string_scene") .. ";\n";
    end

    if(AgentHasProperty(agent_mesh, "Fog Mesh Color")) then
        string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentNameSetProperty(string_agentName, "Fog Mesh Color", TLSE_Development_Editor_RelightLuaExport_WriteColor(AgentGetProperty(agent_mesh, "Fog Mesh Color")), "string_scene") .. ";\n";
    end

    if(AgentHasProperty(agent_mesh, "Fog Mesh Near Plane")) then
        string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentNameSetProperty(string_agentName, "Fog Mesh Near Plane", tostring(AgentGetProperty(agent_mesh, "Fog Mesh Near Plane")), "string_scene") .. ";\n";
    end

    if(AgentHasProperty(agent_mesh, "Fog Mesh Far Plane")) then
        string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentNameSetProperty(string_agentName, "Fog Mesh Far Plane", tostring(AgentGetProperty(agent_mesh, "Fog Mesh Far Plane")), "string_scene") .. ";\n";
    end

    return string_codeToWrite;
end

TLSE_Development_Editor_RelightLuaExport_WriteApplyMeshPropertiesFunction = function(agentsArray_sceneAgents)
    local string_codeToWrite = "";

    string_codeToWrite = "\n";
    string_codeToWrite = string_codeToWrite .. "--Here apply mesh settings to all mesh/renderable agents from a previous session of the TLSE editor (NOTE: Even if some agents weren't changed, their mesh/renderable settings are still tracked here). \n";
    string_codeToWrite = string_codeToWrite .. "RELIGHT_ApplyMeshSettings = function(string_scene) \n";

    for i, agent_sceneAgent in pairs(agentsArray_sceneAgents) do
        if(TLSE_AgentIsMesh(agent_sceneAgent)) then
            string_codeToWrite = string_codeToWrite .. TLSE_Development_Editor_RelightLuaExport_WriteApplyMeshPropertiesChunk(agent_sceneAgent) .. "\n";
        end
    end

    string_codeToWrite = string_codeToWrite .. "end \n";

    return string_codeToWrite;
end

TLSE_Development_Editor_RelightLuaExport_WriteApplyEnvironmentFogModulePropertiesFunction = function(agentsArray_sceneAgents)
    local string_codeToWrite = "";

    local agent_environmentFog = nil;

    for index, agent_sceneAgent in pairs(agentsArray_sceneAgents) do
        if(TLSE_AgentIsEnvironmentFog(agent_sceneAgent)) then
            agent_environmentFog = agent_sceneAgent;
        end
    end

    string_codeToWrite = "\n";
    string_codeToWrite = string_codeToWrite .. "--Here apply environment fog module settings from a previous session of the TLSE editor (NOTE: If a scene doesn't have an environment fog module then this function will be empty, in addition even if settings weren't changed, they are still tracked here). \n";
    string_codeToWrite = string_codeToWrite .. "RELIGHT_ApplyEnvironmentFogSettings = function(string_scene) \n";

    if(agent_environmentFog ~= nil) then
        local string_agentName = AgentGetName(agent_environmentFog);

        string_codeToWrite = string_codeToWrite .. "    --apply properties to environment fog module agent \n";
        string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentNameSetProperty(string_agentName, "Env - Fog Enabled", tostring(AgentGetProperty(agent_environmentFog, "Env - Fog Enabled")), "string_scene") .. ";\n";
        string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentNameSetProperty(string_agentName, "Env - Enabled", tostring(AgentGetProperty(agent_environmentFog, "Env - Enabled")), "string_scene") .. ";\n";
        string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentNameSetProperty(string_agentName, "Env - Enabled on High", tostring(AgentGetProperty(agent_environmentFog, "Env - Enabled on High")), "string_scene") .. ";\n";
        string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentNameSetProperty(string_agentName, "Env - Enabled on Medium", tostring(AgentGetProperty(agent_environmentFog, "Env - Enabled on Medium")), "string_scene") .. ";\n";
        string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentNameSetProperty(string_agentName, "Env - Enabled on Low", tostring(AgentGetProperty(agent_environmentFog, "Env - Enabled on Low")), "string_scene") .. ";\n";
        string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentNameSetProperty(string_agentName, "Env - Fog Color", TLSE_Development_Editor_RelightLuaExport_WriteColor(AgentGetProperty(agent_environmentFog, "Env - Fog Color")), "string_scene") .. ";\n";
        string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentNameSetProperty(string_agentName, "Env - Fog Density", tostring(AgentGetProperty(agent_environmentFog, "Env - Fog Density")), "string_scene") .. ";\n";
        string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentNameSetProperty(string_agentName, "Env - Fog Start Distance", tostring(AgentGetProperty(agent_environmentFog, "Env - Fog Start Distance")), "string_scene") .. ";\n";
        string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentNameSetProperty(string_agentName, "Env - Fog Height", tostring(AgentGetProperty(agent_environmentFog, "Env - Fog Height")), "string_scene") .. ";\n";
        string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentNameSetProperty(string_agentName, "Env - Fog Height Falloff", tostring(AgentGetProperty(agent_environmentFog, "Env - Fog Height Falloff")), "string_scene") .. ";\n";
        string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentNameSetProperty(string_agentName, "Env - Fog Max Opacity", tostring(AgentGetProperty(agent_environmentFog, "Env - Fog Max Opacity")), "string_scene") .. ";\n";
        string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentNameSetProperty(string_agentName, "Env - Priority", tostring(AgentGetProperty(agent_environmentFog, "Env - Priority")), "string_scene") .. ";\n";
    end

    string_codeToWrite = string_codeToWrite .. "end \n";

    return string_codeToWrite;
end

TLSE_Development_Editor_RelightLuaExport_WriteApplyScenePropertiesFunction = function(agent_sceneAgent)
    local string_codeToWrite = "";

    local string_agentVariable = "agent_sceneAgent";

    string_codeToWrite = "\n";
    string_codeToWrite = string_codeToWrite .. "--Here apply scene settings from a previous session of the TLSE editor (NOTE: Even if settings weren't changed, they are still tracked here). \n";
    string_codeToWrite = string_codeToWrite .. "RELIGHT_ApplySceneSettings = function(" .. string_agentVariable .. ") \n";

    --[ANTI ALIASING] 1
    string_codeToWrite = string_codeToWrite .. "    --apply anti aliasing settings \n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "FX anti-aliasing", tostring(AgentGetProperty(agent_sceneAgent, "FX anti-aliasing"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "FX TAA Weight", tostring(AgentGetProperty(agent_sceneAgent, "FX TAA Weight"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "\n";

    --[FX LEVELS] 2
    string_codeToWrite = string_codeToWrite .. "    --apply fx levels settings \n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "FX Levels Enabled", tostring(AgentGetProperty(agent_sceneAgent, "FX Levels Enabled"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "FX Levels Intensity", tostring(AgentGetProperty(agent_sceneAgent, "FX Levels Intensity"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "FX Levels Intensity HDR", tostring(AgentGetProperty(agent_sceneAgent, "FX Levels Intensity HDR"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "FX Levels White Point", tostring(AgentGetProperty(agent_sceneAgent, "FX Levels White Point"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "FX Levels White Point HDR", tostring(AgentGetProperty(agent_sceneAgent, "FX Levels White Point HDR"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "FX Levels Black Point", tostring(AgentGetProperty(agent_sceneAgent, "FX Levels Black Point"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "FX Levels Black Point HDR", tostring(AgentGetProperty(agent_sceneAgent, "FX Levels Black Point HDR"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "\n";

    --[SCENE FOG] 3
    string_codeToWrite = string_codeToWrite .. "    --apply scene fog settings \n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "Fog Enabled", tostring(AgentGetProperty(agent_sceneAgent, "Fog Enabled"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "Fog Color", TLSE_Development_Editor_RelightLuaExport_WriteColor(AgentGetProperty(agent_sceneAgent, "Fog Color"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "Fog Far Plane", tostring(AgentGetProperty(agent_sceneAgent, "Fog Far Plane"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "Fog Near Plane", tostring(AgentGetProperty(agent_sceneAgent, "Fog Near Plane"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "Fog Alpha", tostring(AgentGetProperty(agent_sceneAgent, "Fog Alpha"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "\n";

    --[NPR LINES] 4
    string_codeToWrite = string_codeToWrite .. "    --apply npr lines settings \n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "Generate NPR Lines", tostring(AgentGetProperty(agent_sceneAgent, "Generate NPR Lines"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "NPR Lines Alpha Bias", tostring(AgentGetProperty(agent_sceneAgent, "NPR Lines Alpha Bias"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "NPR Lines Alpha Falloff", tostring(AgentGetProperty(agent_sceneAgent, "NPR Lines Alpha Falloff"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "NPR Lines Bias", tostring(AgentGetProperty(agent_sceneAgent, "NPR Lines Bias"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "NPR Lines Falloff", tostring(AgentGetProperty(agent_sceneAgent, "NPR Lines Falloff"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "\n";

    --[BLOOM] 5
    string_codeToWrite = string_codeToWrite .. "    --apply bloom settings \n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "FX Bloom Threshold", tostring(AgentGetProperty(agent_sceneAgent, "FX Bloom Threshold"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "FX Bloom Intensity", tostring(AgentGetProperty(agent_sceneAgent, "FX Bloom Intensity"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "\n";

    --[GLOW] 6
    string_codeToWrite = string_codeToWrite .. "    --apply glow settings \n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "Glow Clear Color", TLSE_Development_Editor_RelightLuaExport_WriteColor(AgentGetProperty(agent_sceneAgent, "Glow Clear Color"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "Glow Sigma Scale", tostring(AgentGetProperty(agent_sceneAgent, "Glow Sigma Scale"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "\n";

    --[FX COLOR] 7
    string_codeToWrite = string_codeToWrite .. "    --apply fx color settings \n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "FX Color Enabled", tostring(AgentGetProperty(agent_sceneAgent, "FX Color Enabled"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "FX Color Tint", TLSE_Development_Editor_RelightLuaExport_WriteColor(AgentGetProperty(agent_sceneAgent, "FX Color Tint"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "FX Color Opacity", tostring(AgentGetProperty(agent_sceneAgent, "FX Color Opacity"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "\n";

    --[FX TONEMAP] 8
    string_codeToWrite = string_codeToWrite .. "    --apply fx tonemap settings \n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "FX Tonemap Enabled", tostring(AgentGetProperty(agent_sceneAgent, "FX Tonemap Enabled"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "FX Tonemap DOF Enabled", tostring(AgentGetProperty(agent_sceneAgent, "FX Tonemap DOF Enabled"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "FX Tonemap Intensity", tostring(AgentGetProperty(agent_sceneAgent, "FX Tonemap Intensity"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "FX Tonemap Type", tostring(AgentGetProperty(agent_sceneAgent, "FX Tonemap Type"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "FX Tonemap White Point", tostring(AgentGetProperty(agent_sceneAgent, "FX Tonemap White Point"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "FX Tonemap Black Point", tostring(AgentGetProperty(agent_sceneAgent, "FX Tonemap Black Point"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "FX Tonemap Filmic Pivot", tostring(AgentGetProperty(agent_sceneAgent, "FX Tonemap Filmic Pivot"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "FX Tonemap Filmic Sign", tostring(AgentGetProperty(agent_sceneAgent, "FX Tonemap Filmic Sign"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "FX Tonemap Filmic Shoulder Intensity", tostring(AgentGetProperty(agent_sceneAgent, "FX Tonemap Filmic Shoulder Intensity"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "FX Tonemap Filmic Toe Intensity", tostring(AgentGetProperty(agent_sceneAgent, "FX Tonemap Filmic Toe Intensity"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "FX Tonemap Far Filmic Pivot", tostring(AgentGetProperty(agent_sceneAgent, "FX Tonemap Far Filmic Pivot"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "FX Tonemap Far Filmic Sign", tostring(AgentGetProperty(agent_sceneAgent, "FX Tonemap Far Filmic Sign"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "FX Tonemap Far Filmic Shoulder Intensity", tostring(AgentGetProperty(agent_sceneAgent, "FX Tonemap Far Filmic Shoulder Intensity"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "FX Tonemap Far Filmic Toe Intensity", tostring(AgentGetProperty(agent_sceneAgent, "FX Tonemap Far Filmic Toe Intensity"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "FX Tonemap Far White Point", tostring(AgentGetProperty(agent_sceneAgent, "FX Tonemap Far White Point"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "FX Tonemap Far Black Point", tostring(AgentGetProperty(agent_sceneAgent, "FX Tonemap Far Black Point"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "\n";

    --[FX TONEMAP RGB] 9
    string_codeToWrite = string_codeToWrite .. "    --apply fx tonemap rgb settings \n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "FX Tonemap RGB Enabled", tostring(AgentGetProperty(agent_sceneAgent, "FX Tonemap RGB Enabled"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "FX Tonemap RGB DOF Enabled", tostring(AgentGetProperty(agent_sceneAgent, "FX Tonemap RGB DOF Enabled"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "FX Tonemap RGB Pivots", TLSE_Development_Editor_RelightLuaExport_WriteVector3(AgentGetProperty(agent_sceneAgent, "FX Tonemap RGB Pivots"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "FX Tonemap RGB Signs", TLSE_Development_Editor_RelightLuaExport_WriteVector3(AgentGetProperty(agent_sceneAgent, "FX Tonemap RGB Signs"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "FX Tonemap RGB Shoulder Intensities", TLSE_Development_Editor_RelightLuaExport_WriteVector3(AgentGetProperty(agent_sceneAgent, "FX Tonemap RGB Shoulder Intensities"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "FX Tonemap RGB Toe Intensities", TLSE_Development_Editor_RelightLuaExport_WriteVector3(AgentGetProperty(agent_sceneAgent, "FX Tonemap RGB Toe Intensities"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "FX Tonemap RGB Black Points", TLSE_Development_Editor_RelightLuaExport_WriteVector3(AgentGetProperty(agent_sceneAgent, "FX Tonemap RGB Black Points"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "FX Tonemap RGB White Points", TLSE_Development_Editor_RelightLuaExport_WriteVector3(AgentGetProperty(agent_sceneAgent, "FX Tonemap RGB White Points"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "FX Tonemap RGB Far Pivots", TLSE_Development_Editor_RelightLuaExport_WriteVector3(AgentGetProperty(agent_sceneAgent, "FX Tonemap RGB Far Pivots"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "FX Tonemap RGB Far Signs", TLSE_Development_Editor_RelightLuaExport_WriteVector3(AgentGetProperty(agent_sceneAgent, "FX Tonemap RGB Far Signs"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "FX Tonemap RGB Far Shoulder Intensities", TLSE_Development_Editor_RelightLuaExport_WriteVector3(AgentGetProperty(agent_sceneAgent, "FX Tonemap RGB Far Shoulder Intensities"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "FX Tonemap RGB Far Toe Intensities", TLSE_Development_Editor_RelightLuaExport_WriteVector3(AgentGetProperty(agent_sceneAgent, "FX Tonemap RGB Far Toe Intensities"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "FX Tonemap RGB Far Black Points", TLSE_Development_Editor_RelightLuaExport_WriteVector3(AgentGetProperty(agent_sceneAgent, "FX Tonemap RGB Far Black Points"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "FX Tonemap RGB Far White Points", TLSE_Development_Editor_RelightLuaExport_WriteVector3(AgentGetProperty(agent_sceneAgent, "FX Tonemap RGB Far White Points"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "\n";

    --[FX AMBIENT OCCLUSION] 10
    string_codeToWrite = string_codeToWrite .. "    --apply fx ambient occlusion settings \n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "FX Ambient Occlusion Enabled", tostring(AgentGetProperty(agent_sceneAgent, "FX Ambient Occlusion Enabled"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "FX Ambient Occlusion Intensity", tostring(AgentGetProperty(agent_sceneAgent, "FX Ambient Occlusion Intensity"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "FX Ambient Occlusion Falloff", tostring(AgentGetProperty(agent_sceneAgent, "FX Ambient Occlusion Falloff"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "FX Ambient Occlusion Radius", tostring(AgentGetProperty(agent_sceneAgent, "FX Ambient Occlusion Radius"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "FX Ambient Occlusion Lightmap", tostring(AgentGetProperty(agent_sceneAgent, "FX Ambient Occlusion Lightmap"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "\n";

    --[FX DOF] 11
    string_codeToWrite = string_codeToWrite .. "    --apply fx dof settings \n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "FX DOF Enabled", tostring(AgentGetProperty(agent_sceneAgent, "FX DOF Enabled"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "FX DOF FOV Adjust Enabled", tostring(AgentGetProperty(agent_sceneAgent, "FX DOF FOV Adjust Enabled"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "FX DOF Auto Focus Enabled", tostring(AgentGetProperty(agent_sceneAgent, "FX DOF Auto Focus Enabled"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "FX Vignette DOF Enabled", tostring(AgentGetProperty(agent_sceneAgent, "FX Vignette DOF Enabled"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "FX DOF Near", tostring(AgentGetProperty(agent_sceneAgent, "FX DOF Near"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "FX DOF Far", tostring(AgentGetProperty(agent_sceneAgent, "FX DOF Far"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "FX DOF Near Falloff", tostring(AgentGetProperty(agent_sceneAgent, "FX DOF Near Falloff"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "FX DOF Far Falloff", tostring(AgentGetProperty(agent_sceneAgent, "FX DOF Far Falloff"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "FX DOF Near Max", tostring(AgentGetProperty(agent_sceneAgent, "FX DOF Near Max"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "FX DOF Far Max", tostring(AgentGetProperty(agent_sceneAgent, "FX DOF Far Max"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "FX DOF Vignette Max", tostring(AgentGetProperty(agent_sceneAgent, "FX DOF Vignette Max"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "FX DOF Coverage Boost", tostring(AgentGetProperty(agent_sceneAgent, "FX DOF Coverage Boost"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "FX DOF Debug", tostring(AgentGetProperty(agent_sceneAgent, "FX DOF Debug"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "\n";

    --[FX VIGNETTE] 12
    string_codeToWrite = string_codeToWrite .. "    --apply fx vignette settings \n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "FX Vignette Tint Enabled", tostring(AgentGetProperty(agent_sceneAgent, "FX Vignette Tint Enabled"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "FX Vignette Tint", TLSE_Development_Editor_RelightLuaExport_WriteColor(AgentGetProperty(agent_sceneAgent, "FX Vignette Tint"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "FX Vignette Falloff", tostring(AgentGetProperty(agent_sceneAgent, "FX Vignette Falloff"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "FX Vignette Center", tostring(AgentGetProperty(agent_sceneAgent, "FX Vignette Center"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "FX Vignette Corners", tostring(AgentGetProperty(agent_sceneAgent, "FX Vignette Corners"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "\n";

    --[HBAO] 13
    string_codeToWrite = string_codeToWrite .. "    --apply hbao settings \n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "HBAO Enabled", tostring(AgentGetProperty(agent_sceneAgent, "HBAO Enabled"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "HBAO Debug", tostring(AgentGetProperty(agent_sceneAgent, "HBAO Debug"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "HBAO Intensity", tostring(AgentGetProperty(agent_sceneAgent, "HBAO Intensity"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "HBAO Radius", tostring(AgentGetProperty(agent_sceneAgent, "HBAO Radius"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "HBAO Max Radius Percent", tostring(AgentGetProperty(agent_sceneAgent, "HBAO Max Radius Percent"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "HBAO Hemisphere Bias", tostring(AgentGetProperty(agent_sceneAgent, "HBAO Hemisphere Bias"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "HBAO Occlusion Scale", tostring(AgentGetProperty(agent_sceneAgent, "HBAO Occlusion Scale"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "HBAO Luminance Scale", tostring(AgentGetProperty(agent_sceneAgent, "HBAO Luminance Scale"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "HBAO Max Distance", tostring(AgentGetProperty(agent_sceneAgent, "HBAO Max Distance"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "HBAO Distance Falloff", tostring(AgentGetProperty(agent_sceneAgent, "HBAO Distance Falloff"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "HBAO Blur Sharpness", tostring(AgentGetProperty(agent_sceneAgent, "HBAO Blur Sharpness"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "\n";

    --[SCREEN SPACE LINES] 14
    string_codeToWrite = string_codeToWrite .. "    --apply screen space lines settings \n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "Screen Space Lines - Enabled", tostring(AgentGetProperty(agent_sceneAgent, "Screen Space Lines - Enabled"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "Screen Space Lines - Color", TLSE_Development_Editor_RelightLuaExport_WriteColor(AgentGetProperty(agent_sceneAgent, "Screen Space Lines - Color"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "Screen Space Lines - Thickness", tostring(AgentGetProperty(agent_sceneAgent, "Screen Space Lines - Thickness"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "Screen Space Lines - Depth Fade Near", tostring(AgentGetProperty(agent_sceneAgent, "Screen Space Lines - Depth Fade Near"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "Screen Space Lines - Depth Fade Far", tostring(AgentGetProperty(agent_sceneAgent, "Screen Space Lines - Depth Fade Far"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "Screen Space Lines - Depth Magnitude", tostring(AgentGetProperty(agent_sceneAgent, "Screen Space Lines - Depth Magnitude"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "Screen Space Lines - Depth Exponent", tostring(AgentGetProperty(agent_sceneAgent, "Screen Space Lines - Depth Exponent"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "Screen Space Lines - Debug", tostring(AgentGetProperty(agent_sceneAgent, "Screen Space Lines - Debug"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "Screen Space Lines - Light Magnitude", tostring(AgentGetProperty(agent_sceneAgent, "Screen Space Lines - Light Magnitude"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "Screen Space Lines - Light Exponent", tostring(AgentGetProperty(agent_sceneAgent, "Screen Space Lines - Light Exponent"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "Screen Space Lines - Light Direction", TLSE_Development_Editor_RelightLuaExport_WriteVector3(AgentGetProperty(agent_sceneAgent, "Screen Space Lines - Light Direction"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "\n";

    --[GRAPHIC BLACK] 15
    string_codeToWrite = string_codeToWrite .. "    --apply graphic black settings \n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "Graphic Black Threshold", tostring(AgentGetProperty(agent_sceneAgent, "Graphic Black Threshold"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "Graphic Black Softness", tostring(AgentGetProperty(agent_sceneAgent, "Graphic Black Softness"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "Graphic Black Alpha", tostring(AgentGetProperty(agent_sceneAgent, "Graphic Black Alpha"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "Graphic Black Near", tostring(AgentGetProperty(agent_sceneAgent, "Graphic Black Near"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "Graphic Black Far", tostring(AgentGetProperty(agent_sceneAgent, "Graphic Black Far"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "\n";

    --[WIND] 16
    string_codeToWrite = string_codeToWrite .. "    --apply wind settings \n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "Wind Speed", tostring(AgentGetProperty(agent_sceneAgent, "Wind Speed"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "Wind Idle Strength", tostring(AgentGetProperty(agent_sceneAgent, "Wind Idle Strength"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "Wind Idle Spacial Frequency", tostring(AgentGetProperty(agent_sceneAgent, "Wind Idle Spacial Frequency"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "Wind Gust Speed", tostring(AgentGetProperty(agent_sceneAgent, "Wind Gust Speed"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "Wind Gust Strength", tostring(AgentGetProperty(agent_sceneAgent, "Wind Gust Strength"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "Wind Gust Spacial Frequency", tostring(AgentGetProperty(agent_sceneAgent, "Wind Gust Spacial Frequency"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "Wind Gust Idle Strength Multiplier", tostring(AgentGetProperty(agent_sceneAgent, "Wind Gust Idle Strength Multiplier"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "Wind Gust Separation Exponent", tostring(AgentGetProperty(agent_sceneAgent, "Wind Gust Separation Exponent"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "Wind Direction", TLSE_Development_Editor_RelightLuaExport_WriteVector3(AgentGetProperty(agent_sceneAgent, "Wind Direction"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "\n";

    --[REFLECTION] 17
    string_codeToWrite = string_codeToWrite .. "    --apply reflection settings \n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "LightEnv Reflection Enabled", tostring(AgentGetProperty(agent_sceneAgent, "LightEnv Reflection Enabled"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "LightEnv Reflection Intensity", tostring(AgentGetProperty(agent_sceneAgent, "LightEnv Reflection Intensity"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "LightEnv Reflection Intensity Shadow", tostring(AgentGetProperty(agent_sceneAgent, "LightEnv Reflection Intensity Shadow"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "LightEnv Reflection Tint", TLSE_Development_Editor_RelightLuaExport_WriteColor(AgentGetProperty(agent_sceneAgent, "LightEnv Reflection Tint"))) .. ";\n";
    --string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "LightEnv Reflection Texture", tostring(AgentGetProperty(agent_sceneAgent, "LightEnv Reflection Texture"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    --LightEnv Reflection Texture (string) \n";
    string_codeToWrite = string_codeToWrite .. "\n";

    --[SHADOWS] 18
    string_codeToWrite = string_codeToWrite .. "    --apply shadows settings \n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "FX Sharp Shadows Enabled", tostring(AgentGetProperty(agent_sceneAgent, "FX Sharp Shadows Enabled"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "LightEnv Shadow Auto Depth Bounds", tostring(AgentGetProperty(agent_sceneAgent, "LightEnv Shadow Auto Depth Bounds"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "LightEnv Shadow Moment Bias", tostring(AgentGetProperty(agent_sceneAgent, "LightEnv Shadow Moment Bias"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "LightEnv Shadow Depth Bias", tostring(AgentGetProperty(agent_sceneAgent, "LightEnv Shadow Depth Bias"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "LightEnv Shadow Position Offset Bias", tostring(AgentGetProperty(agent_sceneAgent, "LightEnv Shadow Position Offset Bias"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "LightEnv Shadow Light Bleed Reduction", tostring(AgentGetProperty(agent_sceneAgent, "LightEnv Shadow Light Bleed Reduction"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "LightEnv Shadow Min Distance", tostring(AgentGetProperty(agent_sceneAgent, "LightEnv Shadow Min Distance"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "LightEnv Shadow Max Distance", tostring(AgentGetProperty(agent_sceneAgent, "LightEnv Shadow Max Distance"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "LightEnv Dynamic Shadow Max Distance", tostring(AgentGetProperty(agent_sceneAgent, "LightEnv Dynamic Shadow Max Distance"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "Light Shadow Trace Max Distance", tostring(AgentGetProperty(agent_sceneAgent, "Light Shadow Trace Max Distance"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "LightEnv Shadow Cascade Split Bias", tostring(AgentGetProperty(agent_sceneAgent, "LightEnv Shadow Cascade Split Bias"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "LightEnv Shadow Max Updates", tostring(AgentGetProperty(agent_sceneAgent, "LightEnv Shadow Max Updates"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "Light Static Shadow Bounds Min", TLSE_Development_Editor_RelightLuaExport_WriteVector3(AgentGetProperty(agent_sceneAgent, "Light Static Shadow Bounds Min"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "Light Static Shadow Bounds Max", TLSE_Development_Editor_RelightLuaExport_WriteVector3(AgentGetProperty(agent_sceneAgent, "Light Static Shadow Bounds Max"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "\n";

    --[FX BRUSH] 19
    string_codeToWrite = string_codeToWrite .. "    --apply fx brush settings \n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "FX Brush Outline Enable", tostring(AgentGetProperty(agent_sceneAgent, "FX Brush Outline Enable"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "FX Brush Outline Filter Enable", tostring(AgentGetProperty(agent_sceneAgent, "FX Brush Outline Filter Enable"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "FX Brush DOF Enable", tostring(AgentGetProperty(agent_sceneAgent, "FX Brush DOF Enable"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "FX Brush Outline Size", tostring(AgentGetProperty(agent_sceneAgent, "FX Brush Outline Size"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "FX Brush Outline Threshold", tostring(AgentGetProperty(agent_sceneAgent, "FX Brush Outline Threshold"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "FX Brush Outline Color Threshold", tostring(AgentGetProperty(agent_sceneAgent, "FX Brush Outline Color Threshold"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "FX Brush Outline Falloff", tostring(AgentGetProperty(agent_sceneAgent, "FX Brush Outline Falloff"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "FX Brush Near Outline Scale", tostring(AgentGetProperty(agent_sceneAgent, "FX Brush Near Outline Scale"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "FX Brush Near Scale", tostring(AgentGetProperty(agent_sceneAgent, "FX Brush Near Scale"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "FX Brush Near Detail", tostring(AgentGetProperty(agent_sceneAgent, "FX Brush Near Detail"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "FX Brush Far Scale", tostring(AgentGetProperty(agent_sceneAgent, "FX Brush Far Scale"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "FX Brush Far Detail", tostring(AgentGetProperty(agent_sceneAgent, "FX Brush Far Detail"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "FX Brush Far Scale Boost", tostring(AgentGetProperty(agent_sceneAgent, "FX Brush Far Scale Boost"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "FX Brush Far Plane", tostring(AgentGetProperty(agent_sceneAgent, "FX Brush Far Plane"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "FX Brush Far Plane Falloff", tostring(AgentGetProperty(agent_sceneAgent, "FX Brush Far Plane Falloff"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "FX Brush Far Plane Max Scale", tostring(AgentGetProperty(agent_sceneAgent, "FX Brush Far Plane Max Scale"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "\n";

    --[FRAME BUFFER] 20
    string_codeToWrite = string_codeToWrite .. "    --apply frame buffer settings \n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "Frame Buffer Scale Override", tostring(AgentGetProperty(agent_sceneAgent, "Frame Buffer Scale Override"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "Frame Buffer Scale Factor", tostring(AgentGetProperty(agent_sceneAgent, "Frame Buffer Scale Factor"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "\n";

    --[SPECULAR] 21
    string_codeToWrite = string_codeToWrite .. "    --apply specular settings \n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "Specular Multiplier Enabled", tostring(AgentGetProperty(agent_sceneAgent, "Specular Multiplier Enabled"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "Specular Color Multiplier", tostring(AgentGetProperty(agent_sceneAgent, "Specular Color Multiplier"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "Specular Intensity Multiplier", tostring(AgentGetProperty(agent_sceneAgent, "Specular Intensity Multiplier"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "Specular Exponent Multiplier", tostring(AgentGetProperty(agent_sceneAgent, "Specular Exponent Multiplier"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "\n";

    --[MISC] 22
    string_codeToWrite = string_codeToWrite .. "    --apply misc settings \n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "After Effects Enabled", tostring(AgentGetProperty(agent_sceneAgent, "After Effects Enabled"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "HDR lightmaps Enabled", tostring(AgentGetProperty(agent_sceneAgent, "HDR lightmaps Enabled"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "HDR lightmaps Intensity", tostring(AgentGetProperty(agent_sceneAgent, "HDR lightmaps Intensity"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "FX Noise Scale", tostring(AgentGetProperty(agent_sceneAgent, "FX Noise Scale"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "Ambient Color", TLSE_Development_Editor_RelightLuaExport_WriteColor(AgentGetProperty(agent_sceneAgent, "Ambient Color"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "Shadow Color", TLSE_Development_Editor_RelightLuaExport_WriteColor(AgentGetProperty(agent_sceneAgent, "Shadow Color"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "FX Force Linear Depth Offset", tostring(AgentGetProperty(agent_sceneAgent, "FX Force Linear Depth Offset"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "HDR - Paper White Nits", tostring(AgentGetProperty(agent_sceneAgent, "HDR - Paper White Nits"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "LightEnv Bake Enabled", tostring(AgentGetProperty(agent_sceneAgent, "LightEnv Bake Enabled"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "LightEnv Enabled", tostring(AgentGetProperty(agent_sceneAgent, "LightEnv Enabled"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "LightEnv Intensity", tostring(AgentGetProperty(agent_sceneAgent, "LightEnv Intensity"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "LightEnv Saturation", tostring(AgentGetProperty(agent_sceneAgent, "LightEnv Saturation"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "LightEnv Tint", TLSE_Development_Editor_RelightLuaExport_WriteColor(AgentGetProperty(agent_sceneAgent, "LightEnv Tint"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "LightEnv Background Color", TLSE_Development_Editor_RelightLuaExport_WriteColor(AgentGetProperty(agent_sceneAgent, "LightEnv Background Color"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "LightEnv Probe Resolution XZ", tostring(AgentGetProperty(agent_sceneAgent, "LightEnv Probe Resolution XZ"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_RelightLuaExport_WriteAgentSetProperty(string_agentVariable, "LightEnv Probe Resolution Y", tostring(AgentGetProperty(agent_sceneAgent, "LightEnv Probe Resolution Y"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "\n";

    string_codeToWrite = string_codeToWrite .. "end \n";

    return string_codeToWrite;
end

TLSE_Development_Editor_RelightLuaExport_WriteOriginalSceneCleanupFunction = function(agentArray_sceneAgents)
    local string_codeToWrite = "\n";
    string_codeToWrite = string_codeToWrite .. "--Here is a utility function for removing ALL of the agents in the original scene (NOTE: That this isn't used, but it's here so you can actually see all of the original agents that were in the scene without modifications). \n";
    string_codeToWrite = string_codeToWrite .. "RELIGHT_DeleteAllOriginalSceneAgents = function(string_scene) \n";

    --REFERENCE LINE
    --    TLSE_AgentNameDestroy("agentName", string_scene);

    for i, string_agentName in pairs(TLSE_Development_OriginalSceneAgentNamesList) do
        string_codeToWrite = string_codeToWrite .. "    TLSE_AgentNameDestroy(" .. '"' .. tostring(string_agentName) .. '"' .. ", string_scene); \n";
    end

    string_codeToWrite = string_codeToWrite .. "\n";
    string_codeToWrite = string_codeToWrite .. "end \n";

    return string_codeToWrite;
end

TLSE_Development_Editor_RelightLuaExport_ExportSceneChangesToScript = function(string_scriptName)
    local luaPath = "TLSEDevelopment/RELIGHT_" .. string_scriptName .. ".lua";
    local iniFileName = "RELIGHT_" .. string_scriptName .. ".ini";

    if(TLSE_FileExists(luaPath) == true) then
        TLSE_FileDelete(luaPath);
    else
        TLSE_DirectoryCreate("TLSEDevelopment");
    end

    local main_lua_file = io.open(luaPath, "w");

    --||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
    local string_codeToWrite = "\n";

    string_codeToWrite = string_codeToWrite .. "--|||||||||||||||||||||||||||||||||||||||||||||||| TLSE EDITOR CHANGES |||||||||||||||||||||||||||||||||||||||||||||||| \n";
    string_codeToWrite = string_codeToWrite .. "--|||||||||||||||||||||||||||||||||||||||||||||||| TLSE EDITOR CHANGES |||||||||||||||||||||||||||||||||||||||||||||||| \n";
    string_codeToWrite = string_codeToWrite .. "--|||||||||||||||||||||||||||||||||||||||||||||||| TLSE EDITOR CHANGES |||||||||||||||||||||||||||||||||||||||||||||||| \n";
    string_codeToWrite = string_codeToWrite .. "--(This is autogenerated by TLSE Editor) Here we tracked changes made in the editor and apply them back to the scene. \n";
    string_codeToWrite = string_codeToWrite .. "\n";

    string_codeToWrite = string_codeToWrite .. TLSE_Development_Editor_RelightLuaExport_WriteSceneAgentsDeleteFunction(TLSE_Development_SceneAgentsDeletedNames);
    string_codeToWrite = string_codeToWrite .. TLSE_Development_Editor_RelightLuaExport_WriteSceneAgentsDuplicateFunction(TLSE_Development_SceneAgentsDuplicated);
    string_codeToWrite = string_codeToWrite .. TLSE_Development_Editor_RelightLuaExport_WriteApplyScenePropertiesFunction(TLSE_Development_SceneAgent);
    string_codeToWrite = string_codeToWrite .. TLSE_Development_Editor_RelightLuaExport_WriteApplyEnvironmentFogModulePropertiesFunction(TLSE_Development_SceneAgentsRelightExportList);
    string_codeToWrite = string_codeToWrite .. TLSE_Development_Editor_RelightLuaExport_WriteApplyLightPropertiesFunction(TLSE_Development_SceneAgentsRelightExportList); --problematic
    string_codeToWrite = string_codeToWrite .. TLSE_Development_Editor_RelightLuaExport_WriteApplyMeshPropertiesFunction(TLSE_Development_SceneAgentsRelightExportList); --problematic
    string_codeToWrite = string_codeToWrite .. TLSE_Development_Editor_RelightLuaExport_WriteSceneAgentsTransformationsFunction(TLSE_Development_SceneAgentsRelightExportList); --problematic
    string_codeToWrite = string_codeToWrite .. TLSE_Development_Editor_RelightLuaExport_WriteOriginalSceneCleanupFunction(TLSE_Development_SceneAgentsRelightExportList);

    string_codeToWrite = string_codeToWrite .. "\n";
    string_codeToWrite = string_codeToWrite .. "--|||||||||||||||||||||||||||||||||||||||||||||||| ADDITIONAL LOGIC HERE |||||||||||||||||||||||||||||||||||||||||||||||| \n";
    string_codeToWrite = string_codeToWrite .. "--|||||||||||||||||||||||||||||||||||||||||||||||| ADDITIONAL LOGIC HERE |||||||||||||||||||||||||||||||||||||||||||||||| \n";
    string_codeToWrite = string_codeToWrite .. "--|||||||||||||||||||||||||||||||||||||||||||||||| ADDITIONAL LOGIC HERE |||||||||||||||||||||||||||||||||||||||||||||||| \n";
    string_codeToWrite = string_codeToWrite .. "--(This is autogenerated by TLSE Editor) Here you can write additional logic for the scene, whatever that may be. (Not required, but recomended for organization sake) \n";
    string_codeToWrite = string_codeToWrite .. "\n";
    string_codeToWrite = string_codeToWrite .. "\n";
    string_codeToWrite = string_codeToWrite .. "\n";

    string_codeToWrite = string_codeToWrite .. "--|||||||||||||||||||||||||||||||||||||||||||||||| RELIGHT SCENE CONFIGURATION INI |||||||||||||||||||||||||||||||||||||||||||||||| \n";
    string_codeToWrite = string_codeToWrite .. "--|||||||||||||||||||||||||||||||||||||||||||||||| RELIGHT SCENE CONFIGURATION INI |||||||||||||||||||||||||||||||||||||||||||||||| \n";
    string_codeToWrite = string_codeToWrite .. "--|||||||||||||||||||||||||||||||||||||||||||||||| RELIGHT SCENE CONFIGURATION INI |||||||||||||||||||||||||||||||||||||||||||||||| \n";
    string_codeToWrite = string_codeToWrite .. "--(This is autogenerated by TLSE Editor) Here we create an ini file specific for the scene, so that users can make changes without modifying our code. \n";
    string_codeToWrite = string_codeToWrite .. "\n";

    string_codeToWrite = string_codeToWrite .. "RELIGHT_ConfigFileName_LevelPreset = RELIGHT_LevelsFolderName .. " .. '"' .. "/" .. iniFileName .. '"' .. "; \n";
    string_codeToWrite = string_codeToWrite .. "RelightConfigData_LevelPreset = nil; \n";
    string_codeToWrite = string_codeToWrite .. "local RELIGHT_ForceRebuildINI = false; --NOTE: If you are adding new fields to the INI here, best to leave this set to true so the INI file will regenerate with the new fields/values as your developing so issues won't occur. \n";
    string_codeToWrite = string_codeToWrite .. "\n";

    string_codeToWrite = string_codeToWrite .. "local RELIGHT_GenerateNewINI_LevelPreset = function(number_configurationVersion) \n";
    string_codeToWrite = string_codeToWrite .. "    local data =  \n";
    string_codeToWrite = string_codeToWrite .. "    { \n";
    string_codeToWrite = string_codeToWrite .. "        Version = \n";
    string_codeToWrite = string_codeToWrite .. "        { \n";
    string_codeToWrite = string_codeToWrite .. "            ConfigurationVersion = number_configurationVersion, \n";
    string_codeToWrite = string_codeToWrite .. "        }, \n";
    string_codeToWrite = string_codeToWrite .. "        Main = \n";
    string_codeToWrite = string_codeToWrite .. "        { \n";
    string_codeToWrite = string_codeToWrite .. "            EnableRelighting = true, \n";
    string_codeToWrite = string_codeToWrite .. "            ExposureOffset = 0.0, \n";
    string_codeToWrite = string_codeToWrite .. "        }, \n";
    string_codeToWrite = string_codeToWrite .. "    }; \n";
    string_codeToWrite = string_codeToWrite .. "\n";
    string_codeToWrite = string_codeToWrite .. "    return data; \n";
    string_codeToWrite = string_codeToWrite .. "end \n";
    string_codeToWrite = string_codeToWrite .. "\n";

    string_codeToWrite = string_codeToWrite .. "do --DONT TOUCH THIS CHUNK OF CODE (UNLESS YOU KNOW WHAT YOU ARE DOING) \n";
    string_codeToWrite = string_codeToWrite .. "    --checks if the ini file for this scene exists, if not then generate a new ini object and write that to the disk \n";
    string_codeToWrite = string_codeToWrite .. "    if TLSE_FileExists(RELIGHT_ConfigFileName_LevelPreset) == false then \n";
    string_codeToWrite = string_codeToWrite .. "        TLSE_INI_SaveINIFile(RELIGHT_ConfigFileName_LevelPreset, RELIGHT_GenerateNewINI_LevelPreset(RELIGHT_CurrentConfigurationVersion)); \n";
    string_codeToWrite = string_codeToWrite .. "    end \n";
    string_codeToWrite = string_codeToWrite .. "\n";
    string_codeToWrite = string_codeToWrite .. "    --load in the ini files so we can pull data from them \n";
    string_codeToWrite = string_codeToWrite .. "    RelightConfigData_LevelPreset = TLSE_INI_LoadINIFile(RELIGHT_ConfigFileName_LevelPreset); \n";
    string_codeToWrite = string_codeToWrite .. "\n";
    string_codeToWrite = string_codeToWrite .. "    --do a version check after loading, and if the version number doesn't match, rebuild the ini file (NOTE: this will revert changes to the original ini file) \n";
    string_codeToWrite = string_codeToWrite .. "    if (not (RelightConfigData_LevelPreset[" .. '"' .. "Version" .. '"' .. "][" .. '"' .. "ConfigurationVersion" .. '"' .. "] == RELIGHT_CurrentConfigurationVersion)) or (RELIGHT_ForceRebuildINI == true) then \n";
    string_codeToWrite = string_codeToWrite .. "        TLSE_INI_SaveINIFile(RELIGHT_ConfigFileName_LevelPreset, RELIGHT_GenerateNewINI_LevelPreset(RELIGHT_CurrentConfigurationVersion)); \n";
    string_codeToWrite = string_codeToWrite .. "        RelightConfigData_LevelPreset = TLSE_INI_LoadINIFile(RELIGHT_ConfigFileName_LevelPreset); \n";
    string_codeToWrite = string_codeToWrite .. "    end \n";
    string_codeToWrite = string_codeToWrite .. "end \n";

    string_codeToWrite = string_codeToWrite .. "\n";
    string_codeToWrite = string_codeToWrite .. "--|||||||||||||||||||||||||||||||||||||||||||||||| RELIGHT SCENE MAIN |||||||||||||||||||||||||||||||||||||||||||||||| \n";
    string_codeToWrite = string_codeToWrite .. "--|||||||||||||||||||||||||||||||||||||||||||||||| RELIGHT SCENE MAIN |||||||||||||||||||||||||||||||||||||||||||||||| \n";
    string_codeToWrite = string_codeToWrite .. "--|||||||||||||||||||||||||||||||||||||||||||||||| RELIGHT SCENE MAIN |||||||||||||||||||||||||||||||||||||||||||||||| \n";
    string_codeToWrite = string_codeToWrite .. "--(This is autogenerated by TLSE Editor) Here we have two CRITICAL main functions that are used and called by relight backend. \n";
    string_codeToWrite = string_codeToWrite .. "\n";

    string_codeToWrite = string_codeToWrite .. "--(DO NOT CHANGE FUNCTION NAME OR ADD PARAMETERS) This function gets called at the start of the level by the relight backend. \n";
    string_codeToWrite = string_codeToWrite .. "RELIGHT_SceneStart = function() \n";
    string_codeToWrite = string_codeToWrite .. "    if(RelightConfigData_LevelPreset[" .. '"' .. "Main" .. '"' .. "][" .. '"' .. "EnableRelighting" .. '"' .. "] == true) then \n";
    string_codeToWrite = string_codeToWrite .. "        RELIGHT_DuplicateAgentsInScene(RELIGHT_SceneObject); \n";
    string_codeToWrite = string_codeToWrite .. "        RELIGHT_ApplySceneSettings(RELIGHT_SceneObjectAgentName); \n";
    string_codeToWrite = string_codeToWrite .. "        RELIGHT_ApplyEnvironmentFogSettings(RELIGHT_SceneObject); \n";
    string_codeToWrite = string_codeToWrite .. "        RELIGHT_ApplyLightingSettings(RELIGHT_SceneObject); \n";
    string_codeToWrite = string_codeToWrite .. "        RELIGHT_ApplyMeshSettings(RELIGHT_SceneObject); \n";
    string_codeToWrite = string_codeToWrite .. "        RELIGHT_TransformAgentsInScene(RELIGHT_SceneObject); \n";
    string_codeToWrite = string_codeToWrite .. "        RELIGHT_DeleteAgentsInScene(RELIGHT_SceneObject); \n";
    string_codeToWrite = string_codeToWrite .. "        --RELIGHT_DeleteAllOriginalSceneAgents(RELIGHT_SceneObject); --commented out because we don't want to completely purge the scene of everything \n";
    string_codeToWrite = string_codeToWrite .. "    end \n";
    string_codeToWrite = string_codeToWrite .. "\n";
    string_codeToWrite = string_codeToWrite .. "    TLSE_SetPropertyOnAllCameras(RELIGHT_SceneObject, " .. '"' .. "Exposure" .. '"' .. ", RelightConfigData_LevelPreset[" .. '"' .. "Main" .. '"' .. "][" .. '"' .. "ExposureOffset" .. '"' .. "]); \n";
    string_codeToWrite = string_codeToWrite .. "end \n";
    string_codeToWrite = string_codeToWrite .. "\n";
    string_codeToWrite = string_codeToWrite .. "--(DO NOT CHANGE FUNCTION NAME OR ADD PARAMETERS) This function gets called every single frame after the start of the level. \n";
    string_codeToWrite = string_codeToWrite .. "RELIGHT_SceneUpdate = function() \n"
    string_codeToWrite = string_codeToWrite .. "\n";
    string_codeToWrite = string_codeToWrite .. "end \n";

    main_lua_file:write(string_codeToWrite);
    main_lua_file:close();
end


















































































































TLSE_Development_Editor_RelightLuaExport_SymbolDatabaseLuaKeyValueTable = function()
    local symbolDatabase = require("TLSE_Development_SymbolDatabase.lua");

    local string_codeToWrite = "\n";

    string_codeToWrite = string_codeToWrite .. "TLSE_Development_SymbolKeyValueDatabase = \n";
    string_codeToWrite = string_codeToWrite .. "{ \n";


    
    for index, string_rawString in pairs(TLSE_Development_SymbolDatabase) do
        local string_hash = TLSE_KeyToString(tostring(StringToSymbol(string_rawString)));

        string_codeToWrite = string_codeToWrite .. "    " .. '"' .. string_hash .. '"' .. " = " .. '"' .. string_rawString .. '"' .. ", \n";
    end

    string_codeToWrite = string_codeToWrite .. "} \n";

    return string_codeToWrite;
end

TLSE_Development_Editor_RelightLuaExport_ExportSymbolDatabaseLuaKeyValueTable = function()
    local luaPath = "TLSEDevelopment/KeyValueTable.lua";

    if(TLSE_FileExists(luaPath) == true) then
        TLSE_FileDelete(luaPath);
    else
        TLSE_DirectoryCreate("TLSEDevelopment");
    end

    local main_lua_file = io.open(luaPath, "w");

    --||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
    local string_codeToWrite = "\n";

    local symbolDatabase = require("TLSE_Development_SymbolDatabase.lua");

    --[[
    main_lua_file:write("TLSE_Development_SymbolKeyValueDatabase = ", "\n");
    main_lua_file:write("{", "\n");

    for index, string_rawString in pairs(TLSE_Development_SymbolDatabase) do
        local string_hash = TLSE_KeyToString(tostring(StringToSymbol(string_rawString)));
        main_lua_file:write("    { [" .. '"' .. string_hash .. '"' .. "] = " .. '"' .. string_rawString .. '"' .. " }, ", "\n");
    end

    main_lua_file:write("};", "\n");
    ]]

    main_lua_file:write("TLSE_Development_SymbolKeyValueDatabase = {};", "\n");

    for index, string_rawString in pairs(TLSE_Development_SymbolDatabase) do
        local string_hash = TLSE_KeyToString(tostring(StringToSymbol(string_rawString)));
        main_lua_file:write("TLSE_Development_SymbolKeyValueDatabase[" .. '"' .. string_hash .. '"' .. "] = " .. '"' .. string_rawString .. '"' .. ";", "\n");
    end

   --string_codeToWrite = string_codeToWrite .. TLSE_Development_Editor_RelightLuaExport_SymbolDatabaseLuaKeyValueTable();
    --main_lua_file:write(string_codeToWrite);
    main_lua_file:close();
end