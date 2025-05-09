TLSE_Development_GUI_CursorOverGUI = false;
TLSE_Development_GUI_BottomRightWindowTab = "Agent";
TLSE_Development_GUI_AgentTabActive = false;
TLSE_Development_GUI_EnvLightTabActive = false;
TLSE_Development_GUI_ScenePropertiesTabActive = false;
TLSE_Development_GUI_EnvFogTabActive = false;
TLSE_Development_GUI_MeshTabActive = false;
TLSE_Development_GUI_DebugTabActive = false;
TLSE_Development_GUI_EditorTabActive = false;
TLSE_Development_GUI_RelightLuaExportNamePrefix = "";

local string_texture_editorColor = "TLSE_Development_EditorGUIGrey.d3dtx";
local agent_guiGroup = nil;
local agent_bg_rightSide = nil;
local agent_bg_inspectorArea = nil;
local agent_bg_hierarchyArea = nil;
local label_hierarchyTitle = nil;
local label_editorModeTextTopLeft = nil;
local textButton_agentTab = nil;
local textButton_envLightTab = nil;
local textButton_envFogTab = nil;
local textButton_meshTab = nil;
local textButton_scenePropertiesTab = nil;
local textButton_debugTab = nil;
local textButton_editorTab = nil;
local textButton_hideIcons = nil;
local textButton_hideSelectionBox = nil;
local textButton_hideHoverBox = nil;
local textButton_exportSceneToLuaScript = nil;
local textButton_disableAllLights = nil;
local textButton_enableAllLights = nil;
local textButton_killAllControllers = nil;
local textButton_keybindHelp = nil;

local bool_showKeybinds = true;

local OnPress_SelectAgentTab = function(textButton_button) TLSE_Development_GUI_BottomRightWindowTab = "Agent"; end
local OnPress_SelectEnvLightTab = function(textButton_button) TLSE_Development_GUI_BottomRightWindowTab = "EnvLight"; end
local OnPress_SelectScenePropertiesTab = function(textButton_button) TLSE_Development_GUI_BottomRightWindowTab = "SceneProperties"; end
local OnPress_SelectEnvFogTab = function(textButton_button) TLSE_Development_GUI_BottomRightWindowTab = "EnvFog"; end
local OnPress_SelectMeshTab = function(textButton_button) TLSE_Development_GUI_BottomRightWindowTab = "Mesh"; end
local OnPress_SelectDebugTab = function(textButton_button) TLSE_Development_GUI_BottomRightWindowTab = "Debug"; end
local OnPress_SelectEditorTab = function(textButton_button) TLSE_Development_GUI_BottomRightWindowTab = "Editor"; end
local OnPress_HideIcons = function(textButton_button) TLSE_Development_Editor_ObjectIcons_Visible = not TLSE_Development_Editor_ObjectIcons_Visible; end
local OnPress_HideSelectionBox = function(textButton_button) TLSE_Development_Selection_HideSelectBox = not TLSE_Development_Selection_HideSelectBox; end
local OnPress_HideHoverBox = function(textButton_button) TLSE_Development_Selection_HideHoverBox = not TLSE_Development_Selection_HideHoverBox; end

local OnPress_ToggleKeybinds = function(textButton_button) bool_showKeybinds = not bool_showKeybinds; end

local OnPress_ExportSceneChangesToScript = function(textButton_button) 
    TLSE_Development_Editor_RelightLuaExport_ExportSceneChangesToScript(TLSE_Development_GUI_RelightLuaExportNamePrefix .. TLSE_Development_SceneObject);
end

local OnPress_DisableAllLights = function(textButton_button) 
    for index, agent_sceneAgent in pairs(TLSE_Development_SceneAgentsList) do
        if(AgentHasProperty(agent_sceneAgent, "EnvLight - Enabled")) then
            AgentSetProperty(agent_sceneAgent, "EnvLight - Enabled", false);
        end
    end
end

local OnPress_EnableAllLights = function(textButton_button) 
    for index, agent_sceneAgent in pairs(TLSE_Development_SceneAgentsList) do
        if(AgentHasProperty(agent_sceneAgent, "EnvLight - Enabled")) then
            AgentSetProperty(agent_sceneAgent, "EnvLight - Enabled", true);
        end
    end
end

local OnPress_KillAllControllers = function(textButton_button) 
    local agentTable_sceneAgents = SceneGetAgents(TLSE_Development_SceneObject); --NOTE: Getting all agents rather than filtered from TLSE_Development_SceneAgentsList

    for index, agent_sceneAgent in pairs(agentTable_sceneAgents) do
        local controllers_agentControllers = AgentGetControllers(agent_sceneAgent);

        for index2, controller_controllerOnAgent in pairs(controllers_agentControllers) do
            ControllerKill(controller_controllerOnAgent);
        end
    end
end

TLSE_Development_GUI_Initalize = function()
    TLSE_Development_Freecam_ForceDisableZoom = true;

    TLSE_Development_GUI_TransformPanelInitalize();
    TLSE_Development_GUI_TabSceneHierarchyInitalize();
    TLSE_Development_GUI_TabEnvLightInitalize();
    TLSE_Development_GUI_TabEnvFogInitalize();
    TLSE_Development_GUI_TabMeshInitalize();
    TLSE_Development_GUI_TabAgentInitalize();
    TLSE_Development_GUI_TabScenePropertiesInitalize();
    TLSE_Development_GUI_TabDebugInitalize();
    TLSE_Development_GUI_TabEditorInitalize();

    agent_bg_rightSide = AgentCreate("TLSE_Development_bg_rightSide", TLSE_Development_FlatPlaneMesh, Vector(0, 0, 0), Vector(0, 0, 0), TLSE_Development_SceneObject, false, false);
    agent_bg_inspectorArea = AgentCreate("TLSE_Development_bg_inspectorArea", TLSE_Development_FlatPlaneMesh, Vector(0, 0, 0), Vector(0, 0, 0), TLSE_Development_SceneObject, false, false);
    agent_bg_hierarchyArea = AgentCreate("TLSE_Development_bg_hierarchyArea", TLSE_Development_FlatPlaneMesh, Vector(0, 0, 0), Vector(0, 0, 0), TLSE_Development_SceneObject, false, false);

    label_hierarchyTitle = TLSE_Development_Editor_GUI_CreateLabel("[SCENE HIERARCHY]", Vector(0.685, 0.005, 0.0));
    textButton_agentTab = TLSE_Development_Editor_GUI_CreateTextButton("[Agent]", true, Vector(0.685, 0.5, 0.0), OnPress_SelectAgentTab, nil);
    textButton_envLightTab = TLSE_Development_Editor_GUI_CreateTextButton("[EnvLight]", true, Vector(0.735, 0.5, 0.0), OnPress_SelectEnvLightTab, nil);
    textButton_envFogTab = TLSE_Development_Editor_GUI_CreateTextButton("[EnvFog]", true, Vector(0.778, 0.5, 0.0), OnPress_SelectEnvFogTab, nil);
    textButton_meshTab = TLSE_Development_Editor_GUI_CreateTextButton("[Renderable]", true, Vector(0.803, 0.5, 0.0), OnPress_SelectMeshTab, nil);
    textButton_scenePropertiesTab = TLSE_Development_Editor_GUI_CreateTextButton("[Scene]", true, Vector(0.843, 0.5, 0.0), OnPress_SelectScenePropertiesTab, nil);
    textButton_debugTab = TLSE_Development_Editor_GUI_CreateTextButton("[Debug]", true, Vector(0.843, 0.5, 0.0), OnPress_SelectDebugTab, nil);
    textButton_editorTab = TLSE_Development_Editor_GUI_CreateTextButton("[Editor]", true, Vector(0.843, 0.5, 0.0), OnPress_SelectEditorTab, nil);

    textButton_exportSceneToLuaScript = TLSE_Development_Editor_GUI_CreateTextButton("[EXPORT SCENE TO LUA]", false, Vector(0.0, 0.002, 0.0), OnPress_ExportSceneChangesToScript, nil);
    textButton_hideIcons = TLSE_Development_Editor_GUI_CreateTextButton("[HIDE ICONS]", false, Vector(0.635, 0.020, 0.0), OnPress_HideIcons, nil);
    textButton_hideSelectionBox = TLSE_Development_Editor_GUI_CreateTextButton("[HIDE SELECTION BOX]", false, Vector(0.602, 0.035, 0.0), OnPress_HideSelectionBox, nil);
    textButton_hideHoverBox = TLSE_Development_Editor_GUI_CreateTextButton("[HIDE HOVER BOX]", false, Vector(0.615, 0.050, 0.0), OnPress_HideHoverBox, nil);
    textButton_disableAllLights = TLSE_Development_Editor_GUI_CreateTextButton("[DISABLE ALL LIGHTS]", false, Vector(0.605, 0.065, 0.0), OnPress_DisableAllLights, nil);
    textButton_enableAllLights = TLSE_Development_Editor_GUI_CreateTextButton("[ENABLE ALL LIGHTS]", false, Vector(0.605, 0.080, 0.0), OnPress_EnableAllLights, nil);
    textButton_killAllControllers = TLSE_Development_Editor_GUI_CreateTextButton("[KILL ALL CONTROLLERS]", false, Vector(0.594, 0.095, 0.0), OnPress_KillAllControllers, nil);
    textButton_keybindHelp = TLSE_Development_Editor_GUI_CreateTextButton("[KEYBIND HELP]", false, Vector(0.594, 0.095, 0.0), OnPress_ToggleKeybinds, nil);

    label_editorModeTextTopLeft = TLSE_Development_Editor_GUI_CreateLabel("", Vector(0, 0.02, 0));

    ShaderSwapTexture(agent_bg_rightSide, TLSE_Development_FlatPlaneOriginalTexture, "color_000.d3dtx");
    ShaderSwapTexture(agent_bg_inspectorArea, TLSE_Development_FlatPlaneOriginalTexture, string_texture_editorColor);
    ShaderSwapTexture(agent_bg_hierarchyArea, TLSE_Development_FlatPlaneOriginalTexture, string_texture_editorColor);

    AgentSetProperty(agent_bg_rightSide, "Render Axis Scale", Vector(0.1, 0.5, 1));
    AgentSetProperty(agent_bg_rightSide, "Render After Anti-Aliasing", true);
    AgentSetProperty(agent_bg_rightSide, "Render Depth Test", false);
    AgentSetProperty(agent_bg_rightSide, "Render Depth Write", false);
    AgentSetProperty(agent_bg_rightSide, "Render Depth Write Alpha", false);
    AgentSetProperty(agent_bg_rightSide, "Render Layer", 93);

    AgentSetProperty(agent_bg_inspectorArea, "Render Axis Scale", Vector(0.1, 0.081, 1));
    AgentSetProperty(agent_bg_inspectorArea, "Render After Anti-Aliasing", true);
    AgentSetProperty(agent_bg_inspectorArea, "Render Depth Test", false);
    AgentSetProperty(agent_bg_inspectorArea, "Render Depth Write", false);
    AgentSetProperty(agent_bg_inspectorArea, "Render Depth Write Alpha", false);
    AgentSetProperty(agent_bg_inspectorArea, "Render Layer", 94);

    AgentSetProperty(agent_bg_hierarchyArea, "Render Axis Scale", Vector(0.1, 0.081, 1));
    AgentSetProperty(agent_bg_hierarchyArea, "Render After Anti-Aliasing", true);
    AgentSetProperty(agent_bg_hierarchyArea, "Render Depth Test", false);
    AgentSetProperty(agent_bg_hierarchyArea, "Render Depth Write", false);
    AgentSetProperty(agent_bg_hierarchyArea, "Render Depth Write Alpha", false);
    AgentSetProperty(agent_bg_hierarchyArea, "Render Layer", 94);
end

TLSE_Development_GUI_Update = function()  
    TLSE_Development_GUI_CursorOverGUI = false;

    TLSE_Development_Editor_GUI_Update();

    local agent_sceneCamera = SceneGetCamera(TLSE_Development_SceneObject);
    local vector_sceneCameraPosition = AgentGetWorldPos(agent_sceneCamera);
    local vector_sceneCameraRotation = AgentGetWorldRot(agent_sceneCamera);
    local vector_sceneCameraForward = AgentGetForwardVec(agent_sceneCamera);

    local number_buttonVerticalSize = 0.04;
    local number_buttonHorizontalSize = 0.04 / RenderGetAspectRatio();
    local vector_buttonExtentsMin = Vector(-number_buttonHorizontalSize, -number_buttonVerticalSize, 1);
    local vector_buttonExtentsMax = Vector(number_buttonHorizontalSize, number_buttonVerticalSize, 1);

    local bool_isOverRightSideGUI = TLSE_TextUI_IsCursorOverBounds(Vector(1, 0, 0), Vector(-0.6 / RenderGetAspectRatio(), -2, 0), Vector(0.6 / RenderGetAspectRatio(), 2, 0));

    --screen pos notes
    --0.0 0.0 0.0 = top left
    --0.5 0.5 0.0 = center
    --0.0 1.0 0.0 = bottom left

    if(bool_isOverRightSideGUI) then
        TLSE_Development_GUI_CursorOverGUI = true;
    end

    TLSE_Development_GUI_TransformPanelUpdate();

    AgentSetWorldPos(agent_bg_rightSide, VectorAdd(vector_sceneCameraForward, CameraGetWorldPosFromLogicalScreenPos(agent_sceneCamera, Vector(8, 0, 0))));
    AgentSetWorldPos(agent_bg_hierarchyArea, VectorAdd(vector_sceneCameraForward, CameraGetWorldPosFromLogicalScreenPos(agent_sceneCamera, Vector(8.05, -5.25, 0))));
    AgentSetWorldPos(agent_bg_inspectorArea, VectorAdd(vector_sceneCameraForward, CameraGetWorldPosFromLogicalScreenPos(agent_sceneCamera, Vector(8.05, 5.75, 0))));

    AgentSetWorldRot(agent_bg_rightSide, vector_sceneCameraRotation);
    AgentSetWorldRot(agent_bg_inspectorArea, vector_sceneCameraRotation);
    AgentSetWorldRot(agent_bg_hierarchyArea, vector_sceneCameraRotation);

    --||||||||||||||||||||||||| TOOLBAR ITEMS |||||||||||||||||||||||||
    --||||||||||||||||||||||||| TOOLBAR ITEMS |||||||||||||||||||||||||
    --||||||||||||||||||||||||| TOOLBAR ITEMS |||||||||||||||||||||||||

    local vector_startScreenPosition = textButton_exportSceneToLuaScript["ScreenPosition"];
    local vector_screenSizeItem1 = TLSE_TextUI_GetTextScreenSize(textButton_exportSceneToLuaScript["TextAgent"]);
    local vector_screenSizeItem2 = TLSE_TextUI_GetTextScreenSize(textButton_hideIcons["TextAgent"]);
    local vector_screenSizeItem3 = TLSE_TextUI_GetTextScreenSize(textButton_hideSelectionBox["TextAgent"]);
    local vector_screenSizeItem4 = TLSE_TextUI_GetTextScreenSize(textButton_hideHoverBox["TextAgent"]);
    local vector_screenSizeItem5 = TLSE_TextUI_GetTextScreenSize(textButton_disableAllLights["TextAgent"]);
    local vector_screenSizeItem6 = TLSE_TextUI_GetTextScreenSize(textButton_enableAllLights["TextAgent"]);
    local vector_screenSizeItem7 = TLSE_TextUI_GetTextScreenSize(textButton_killAllControllers["TextAgent"]);

    local number_horizontalOffset = 0.003;
    local vector_guiOffset = Vector(0, 0, 0);

    vector_guiOffset.x = 0;
    vector_guiOffset.y = 0;
    textButton_exportSceneToLuaScript["ScreenPosition"] = vector_startScreenPosition;

    vector_guiOffset.x = vector_guiOffset.x + (vector_screenSizeItem1.x * 2.0) + number_horizontalOffset;
    textButton_hideIcons["ScreenPosition"] = VectorAdd(vector_guiOffset, vector_startScreenPosition);

    vector_guiOffset.x = vector_guiOffset.x + (vector_screenSizeItem2.x * 2.0) + number_horizontalOffset;
    textButton_hideSelectionBox["ScreenPosition"] = VectorAdd(vector_guiOffset, vector_startScreenPosition);

    vector_guiOffset.x = vector_guiOffset.x + (vector_screenSizeItem3.x * 2.0) + number_horizontalOffset;
    textButton_hideHoverBox["ScreenPosition"] = VectorAdd(vector_guiOffset, vector_startScreenPosition);

    vector_guiOffset.x = vector_guiOffset.x + (vector_screenSizeItem4.x * 2.0) + number_horizontalOffset;
    textButton_disableAllLights["ScreenPosition"] = VectorAdd(vector_guiOffset, vector_startScreenPosition);

    vector_guiOffset.x = vector_guiOffset.x + (vector_screenSizeItem5.x * 2.0) + number_horizontalOffset;
    textButton_enableAllLights["ScreenPosition"] = VectorAdd(vector_guiOffset, vector_startScreenPosition);

    vector_guiOffset.x = vector_guiOffset.x + (vector_screenSizeItem6.x * 2.0) + number_horizontalOffset;
    textButton_killAllControllers["ScreenPosition"] = VectorAdd(vector_guiOffset, vector_startScreenPosition);

    vector_guiOffset.x = vector_guiOffset.x + (vector_screenSizeItem7.x * 2.0) + number_horizontalOffset;
    textButton_keybindHelp["ScreenPosition"] = VectorAdd(vector_guiOffset, vector_startScreenPosition);

    --||||||||||||||||||||||||| EDITOR MODE LABEL |||||||||||||||||||||||||
    --||||||||||||||||||||||||| EDITOR MODE LABEL |||||||||||||||||||||||||
    --||||||||||||||||||||||||| EDITOR MODE LABEL |||||||||||||||||||||||||

    string_editorModeTextTopLeftText = "[Editor Mode]";
    string_editorModeTextTopLeftText = string_editorModeTextTopLeftText .. "\n"; --new line
    string_editorModeTextTopLeftText = string_editorModeTextTopLeftText .. "Scene: " .. TLSE_Development_SceneObjectAgentName;
    string_editorModeTextTopLeftText = string_editorModeTextTopLeftText .. "\n"; --new line
    string_editorModeTextTopLeftText = string_editorModeTextTopLeftText .. "Camera World Position: " .. TLSE_VectorToString(AgentGetWorldPos(TLSE_Development_Freecam_Camera));
    string_editorModeTextTopLeftText = string_editorModeTextTopLeftText .. "\n"; --new line
    string_editorModeTextTopLeftText = string_editorModeTextTopLeftText .. "Camera World Rotation: " .. TLSE_VectorToString(AgentGetWorldRot(TLSE_Development_Freecam_Camera));
    string_editorModeTextTopLeftText = string_editorModeTextTopLeftText .. "\n"; --new line
    string_editorModeTextTopLeftText = string_editorModeTextTopLeftText .. "\n"; --new line

    if(bool_showKeybinds) then
        string_editorModeTextTopLeftText = string_editorModeTextTopLeftText .. "[KEYBIND HELP]";
        string_editorModeTextTopLeftText = string_editorModeTextTopLeftText .. "\n"; --new line
        string_editorModeTextTopLeftText = string_editorModeTextTopLeftText .. "WASD - Move Camera";
        string_editorModeTextTopLeftText = string_editorModeTextTopLeftText .. "\n"; --new line
        string_editorModeTextTopLeftText = string_editorModeTextTopLeftText .. "Q / E - Lower / Raise Camera";
        string_editorModeTextTopLeftText = string_editorModeTextTopLeftText .. "\n"; --new line
        string_editorModeTextTopLeftText = string_editorModeTextTopLeftText .. "R - Unfreeze Camera / Hide Cursor";
        string_editorModeTextTopLeftText = string_editorModeTextTopLeftText .. "\n"; --new line
        string_editorModeTextTopLeftText = string_editorModeTextTopLeftText .. "F - Freeze Camera / Show Cursor";
        string_editorModeTextTopLeftText = string_editorModeTextTopLeftText .. "\n"; --new line
        string_editorModeTextTopLeftText = string_editorModeTextTopLeftText .. "Left Shift - Speedup Camera / Larger Value Increments";
        string_editorModeTextTopLeftText = string_editorModeTextTopLeftText .. "\n"; --new line
        string_editorModeTextTopLeftText = string_editorModeTextTopLeftText .. "Left Ctrl - Smaller Value Increments";
        string_editorModeTextTopLeftText = string_editorModeTextTopLeftText .. "\n"; --new line
        string_editorModeTextTopLeftText = string_editorModeTextTopLeftText .. "Del - Delete Selected Agent (Agent Tab Active)";
        string_editorModeTextTopLeftText = string_editorModeTextTopLeftText .. "\n"; --new line
        string_editorModeTextTopLeftText = string_editorModeTextTopLeftText .. "Ctrl + D - Duplicate Selected Agent (Agent Tab Active)";
        string_editorModeTextTopLeftText = string_editorModeTextTopLeftText .. "\n"; --new line
    end

    label_editorModeTextTopLeft["Text"] = string_editorModeTextTopLeftText;

    --||||||||||||||||||||||||| INSPECTOR TAB ITEMS |||||||||||||||||||||||||
    --||||||||||||||||||||||||| INSPECTOR TAB ITEMS |||||||||||||||||||||||||
    --||||||||||||||||||||||||| INSPECTOR TAB ITEMS |||||||||||||||||||||||||

    local vector_startScreenPosition = textButton_agentTab["ScreenPosition"];
    local vector_screenSizeTab1 = TLSE_TextUI_GetTextScreenSize(textButton_agentTab["TextAgent"]);
    local vector_screenSizeTab2 = TLSE_TextUI_GetTextScreenSize(textButton_envLightTab["TextAgent"]);
    local vector_screenSizeTab3 = TLSE_TextUI_GetTextScreenSize(textButton_envFogTab["TextAgent"]);
    local vector_screenSizeTab4 = TLSE_TextUI_GetTextScreenSize(textButton_meshTab["TextAgent"]);
    local vector_screenSizeTab5 = TLSE_TextUI_GetTextScreenSize(textButton_scenePropertiesTab["TextAgent"]);
    local vector_screenSizeTab6 = TLSE_TextUI_GetTextScreenSize(textButton_debugTab["TextAgent"]);

    local number_horizontalOffset = 0.003;
    local vector_guiOffset = Vector(0, 0, 0);

    vector_guiOffset.x = 0;
    vector_guiOffset.y = 0;
    textButton_agentTab["ScreenPosition"] = vector_startScreenPosition;

    vector_guiOffset.x = vector_guiOffset.x + (vector_screenSizeTab1.x * 2.0) + number_horizontalOffset;
    textButton_envLightTab["ScreenPosition"] = VectorAdd(vector_guiOffset, vector_startScreenPosition);

    vector_guiOffset.x = vector_guiOffset.x + (vector_screenSizeTab2.x * 2.0) + number_horizontalOffset;
    textButton_envFogTab["ScreenPosition"] = VectorAdd(vector_guiOffset, vector_startScreenPosition);

    vector_guiOffset.x = vector_guiOffset.x + (vector_screenSizeTab3.x * 2.0) + number_horizontalOffset;
    textButton_meshTab["ScreenPosition"] = VectorAdd(vector_guiOffset, vector_startScreenPosition);

    vector_guiOffset.x = vector_guiOffset.x + (vector_screenSizeTab4.x * 2.0) + number_horizontalOffset;
    textButton_scenePropertiesTab["ScreenPosition"] = VectorAdd(vector_guiOffset, vector_startScreenPosition);

    vector_guiOffset.x = vector_guiOffset.x + (vector_screenSizeTab5.x * 2.0) + number_horizontalOffset;
    textButton_debugTab["ScreenPosition"] = VectorAdd(vector_guiOffset, vector_startScreenPosition);

    vector_guiOffset.x = vector_guiOffset.x + (vector_screenSizeTab6.x * 2.0) + number_horizontalOffset;
    textButton_editorTab["ScreenPosition"] = VectorAdd(vector_guiOffset, vector_startScreenPosition);

    TLSE_Development_GUI_AgentTabActive = TLSE_Development_GUI_BottomRightWindowTab == "Agent";
    TLSE_Development_GUI_EnvLightTabActive = TLSE_Development_GUI_BottomRightWindowTab == "EnvLight";;
    TLSE_Development_GUI_ScenePropertiesTabActive = TLSE_Development_GUI_BottomRightWindowTab == "SceneProperties";
    TLSE_Development_GUI_EnvFogTabActive = TLSE_Development_GUI_BottomRightWindowTab == "EnvFog";
    TLSE_Development_GUI_MeshTabActive = TLSE_Development_GUI_BottomRightWindowTab == "Mesh";
    TLSE_Development_GUI_DebugTabActive = TLSE_Development_GUI_BottomRightWindowTab == "Debug";
    TLSE_Development_GUI_EditorTabActive = TLSE_Development_GUI_BottomRightWindowTab == "Editor";
    
    textButton_agentTab["Selected"] = TLSE_Development_GUI_AgentTabActive;
    textButton_envLightTab["Selected"] = TLSE_Development_GUI_EnvLightTabActive;
    textButton_envFogTab["Selected"] = TLSE_Development_GUI_EnvFogTabActive;
    textButton_meshTab["Selected"] = TLSE_Development_GUI_MeshTabActive;
    textButton_scenePropertiesTab["Selected"] = TLSE_Development_GUI_ScenePropertiesTabActive;
    textButton_debugTab["Selected"] = TLSE_Development_GUI_DebugTabActive;
    textButton_editorTab["Selected"] = TLSE_Development_GUI_EditorTabActive;

    --||||||||||||||||||||||||| UI SUB TABS |||||||||||||||||||||||||
    --||||||||||||||||||||||||| UI SUB TABS |||||||||||||||||||||||||
    --||||||||||||||||||||||||| UI SUB TABS |||||||||||||||||||||||||

    TLSE_Development_GUI_TabSceneHierarchyUpdate();
    TLSE_Development_GUI_TabAgentUpdate();
    TLSE_Development_GUI_TabEnvLightUpdate();
    TLSE_Development_GUI_TabEnvFogUpdate();
    TLSE_Development_GUI_TabMeshUpdate();
    TLSE_Development_GUI_TabScenePropertiesUpdate();
    TLSE_Development_GUI_TabDebugUpdate();
    TLSE_Development_GUI_TabEditorUpdate();
end