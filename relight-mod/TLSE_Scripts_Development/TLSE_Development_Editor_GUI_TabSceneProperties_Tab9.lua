--[FX TONEMAP RGB] 9
local tab9_boolProperty1 = nil; --(boolean) FX Tonemap RGB Enabled
local tab9_boolProperty2 = nil; --(boolean) FX Tonemap RGB DOF Enabled
local tab9_vector3Property3 = nil; --(Vector3) FX Tonemap RGB Pivots
local tab9_vector3Property4 = nil; --(Vector3) FX Tonemap RGB Signs
local tab9_vector3Property5 = nil; --(Vector3) FX Tonemap RGB Shoulder Intensities
local tab9_vector3Property6 = nil; --(Vector3) FX Tonemap RGB Toe Intensities
local tab9_vector3Property7 = nil; --(Vector3) FX Tonemap RGB Black Points
local tab9_vector3Property8 = nil; --(Vector3) FX Tonemap RGB White Points
local tab9_vector3Property9 = nil; --(Vector3) FX Tonemap RGB Far Pivots
local tab9_vector3Property10 = nil; --(Vector3) FX Tonemap RGB Far Signs
local tab9_vector3Property11 = nil; --(Vector3) FX Tonemap RGB Far Shoulder Intensities
local tab9_vector3Property12 = nil; --(Vector3) FX Tonemap RGB Far Toe Intensities
local tab9_vector3Property13 = nil; --(Vector3) FX Tonemap RGB Far Black Points
local tab9_vector3Property14 = nil; --(Vector3) FX Tonemap RGB Far White Points

TLSE_Development_GUI_TabSceneProperties_Tab9Initalize = function()
    --[FX TONEMAP RGB] 9
    tab9_boolProperty1 = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "FX Tonemap RGB Enabled", "FX Tonemap RGB Enabled", Vector(0.685, 0.585, 0.0), nil);
    tab9_boolProperty2 = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "FX Tonemap RGB DOF Enabled", "FX Tonemap RGB DOF Enabled", Vector(0.685, 0.595, 0.0), nil);
    tab9_vector3Property3 = TLSE_Development_Editor_GUI_CreateVector3PropertyField(nil, "FX Tonemap RGB Pivots", "FX Tonemap RGB Pivots", Vector(0.685, 0.605, 0.0), true, nil, nil, nil, nil, nil, nil);
    tab9_vector3Property4 = TLSE_Development_Editor_GUI_CreateVector3PropertyField(nil, "FX Tonemap RGB Signs", "FX Tonemap RGB Signs", Vector(0.685, 0.635, 0.0), true, nil, nil, nil, nil, nil, nil);
    tab9_vector3Property5 = TLSE_Development_Editor_GUI_CreateVector3PropertyField(nil, "FX Tonemap RGB Shoulder Intensities", "FX Tonemap RGB Shoulder Intensities", Vector(0.685, 0.665, 0.0), true, nil, nil, nil, nil, nil, nil);
    tab9_vector3Property6 = TLSE_Development_Editor_GUI_CreateVector3PropertyField(nil, "FX Tonemap RGB Toe Intensities", "FX Tonemap RGB Toe Intensities", Vector(0.685, 0.695, 0.0), true, nil, nil, nil, nil, nil, nil);
    tab9_vector3Property7 = TLSE_Development_Editor_GUI_CreateVector3PropertyField(nil, "FX Tonemap RGB Black Points", "FX Tonemap RGB Black Points", Vector(0.685, 0.725, 0.0), true, nil, nil, nil, nil, nil, nil);
    tab9_vector3Property8 = TLSE_Development_Editor_GUI_CreateVector3PropertyField(nil, "FX Tonemap RGB White Points", "FX Tonemap RGB White Points", Vector(0.685, 0.755, 0.0), true, nil, nil, nil, nil, nil, nil);
    tab9_vector3Property9 = TLSE_Development_Editor_GUI_CreateVector3PropertyField(nil, "FX Tonemap RGB Far Pivots", "FX Tonemap RGB Far Pivots", Vector(0.685, 0.785, 0.0), true, nil, nil, nil, nil, nil, nil);
    tab9_vector3Property10 = TLSE_Development_Editor_GUI_CreateVector3PropertyField(nil, "FX Tonemap RGB Far Signs", "FX Tonemap RGB Far Signs", Vector(0.685, 0.815, 0.0), true, nil, nil, nil, nil, nil, nil);
    tab9_vector3Property11 = TLSE_Development_Editor_GUI_CreateVector3PropertyField(nil, "FX Tonemap RGB Far Shoulder Intensities", "FX Tonemap RGB Far Shoulder Intensities", Vector(0.685, 0.845, 0.0), true, nil, nil, nil, nil, nil, nil);
    tab9_vector3Property12 = TLSE_Development_Editor_GUI_CreateVector3PropertyField(nil, "FX Tonemap RGB Far Toe Intensities", "FX Tonemap RGB Far Toe Intensities", Vector(0.685, 0.875, 0.0), true, nil, nil, nil, nil, nil, nil);
    tab9_vector3Property13 = TLSE_Development_Editor_GUI_CreateVector3PropertyField(nil, "FX Tonemap RGB Far Black Points", "FX Tonemap RGB Far Black Points", Vector(0.685, 0.905, 0.0), true, nil, nil, nil, nil, nil, nil);
    tab9_vector3Property14 = TLSE_Development_Editor_GUI_CreateVector3PropertyField(nil, "FX Tonemap RGB Far White Points", "FX Tonemap RGB Far White Points", Vector(0.685, 0.935, 0.0), true, nil, nil, nil, nil, nil, nil);
end

TLSE_Development_GUI_TabSceneProperties_Tab9Update = function()
    --[FX TONEMAP RGB] 9
    tab9_boolProperty1["Visible"] = TLSE_TabSceneProperties_Tab9_Active;
    tab9_boolProperty2["Visible"] = TLSE_TabSceneProperties_Tab9_Active;
    tab9_vector3Property3["Visible"] = TLSE_TabSceneProperties_Tab9_Active;
    tab9_vector3Property4["Visible"] = TLSE_TabSceneProperties_Tab9_Active;
    tab9_vector3Property5["Visible"] = TLSE_TabSceneProperties_Tab9_Active;
    tab9_vector3Property6["Visible"] = TLSE_TabSceneProperties_Tab9_Active;
    tab9_vector3Property7["Visible"] = TLSE_TabSceneProperties_Tab9_Active;
    tab9_vector3Property8["Visible"] = TLSE_TabSceneProperties_Tab9_Active;
    tab9_vector3Property9["Visible"] = TLSE_TabSceneProperties_Tab9_Active;
    tab9_vector3Property10["Visible"] = TLSE_TabSceneProperties_Tab9_Active;
    tab9_vector3Property11["Visible"] = TLSE_TabSceneProperties_Tab9_Active;
    tab9_vector3Property12["Visible"] = TLSE_TabSceneProperties_Tab9_Active;
    tab9_vector3Property13["Visible"] = TLSE_TabSceneProperties_Tab9_Active;
    tab9_vector3Property14["Visible"] = TLSE_TabSceneProperties_Tab9_Active;

    if(TLSE_TabSceneProperties_Tab9_Active == false) then
        return
    end

    --[FX TONEMAP RGB] 9
    tab9_boolProperty1["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab9_boolProperty2["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab9_vector3Property3["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab9_vector3Property4["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab9_vector3Property5["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab9_vector3Property6["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab9_vector3Property7["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab9_vector3Property8["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab9_vector3Property9["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab9_vector3Property10["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab9_vector3Property11["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab9_vector3Property12["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab9_vector3Property13["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab9_vector3Property14["ReferenceAgent"] = TLSE_Development_SceneAgent;
end