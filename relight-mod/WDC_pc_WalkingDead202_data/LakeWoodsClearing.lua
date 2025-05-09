--|||||||||||||||||||||||||||||||||||||||||||||||| INCLUDES ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| INCLUDES ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| INCLUDES ||||||||||||||||||||||||||||||||||||||||||||||||
--Here we include the relight include file, and this file will include all of the dependencies with the relight mod.
--This also includes the Telltale Lua Script Extensions (TLSE) backend as well with all of it's core files + development tools.

require("RELIGHT_Include.lua");

--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE SCENE VARIABLES ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE SCENE VARIABLES ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE SCENE VARIABLES ||||||||||||||||||||||||||||||||||||||||||||||||
--Here telltale declares these two variables at the top of every level script.
--NOTE: That we are only intrested in kScene which is a reference to the actual scene file.
--This is CRITICAL as getting a reference to it means we can do everything that we need to do in the scene.

local kScript = "LakeWoodsClearing"
local kScene = "adv_lakeWoodsTruckClearing"

--|||||||||||||||||||||||||||||||||||||||||||||||| CUSTOM VARIABLES ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| CUSTOM VARIABLES ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| CUSTOM VARIABLES ||||||||||||||||||||||||||||||||||||||||||||||||
--Here we declare our own variables related to Relight and Telltale Lua Script Extensions (TLSE) development tools.
--NOTE: These are declared globally so they can be used throughout all scripts.

--Telltale Lua Script Extensions (TLSE) Development variables
TLSE_Development_SceneObject = kScene;
TLSE_Development_SceneObjectAgentName = kScene .. ".scene";
TLSE_Development_FreecamUseFOVScale = false;

--Relight variables
RELIGHT_SceneObject = kScene;
RELIGHT_SceneObjectAgentName = kScene .. ".scene";
RelightConfigLevel = RelightConfigData_Season2.Level_202_LakeWoodsClearing;

--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--Here is alot of the original (decompiled) telltale lua script logic for the level.
--We are leaving this untouched because we still want the level to function normally as intended.

local kPeteSearchSoundsInitDelay = 1.5
local kPeteSearchSoundsMinDelay = 3
local kPeteSearchSoundsMaxDelay = 8

local PreloadAssets = function()
  if LogicGet(kAct) == 2 then
    PreLoad("env_lakeWoodsTrail_cs_returnToClearing_4.chore")
  end
  if Platform_NeedShaderPreload() then
    RenderPreloadShader("Mesh_QLo.t3fxb", "391")
    RenderPreloadShader("Mesh_LGT_QLo.t3fxb", "78")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "3")
    RenderPreloadShader("Mesh_LGT_DTL_QLo.t3fxb", "78")
    RenderPreloadShader("Mesh_1SKN_LGT_QLo.t3fxb", "7")
    RenderPreloadShader("Mesh_LGT_QLo.t3fxb", "270")
    RenderPreloadShader("Mesh_DTL_SDTL_QLo.t3fxb", "6")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "4")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "6")
    RenderPreloadShader("Mesh_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_DTL_SDTL_QLo.t3fxb", "3")
    RenderPreloadShader("Mesh_QLo.t3fxb", "334")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "334")
    RenderPreloadShader("Mesh_QLo.t3fxb", "262")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "259")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_LGT_QLo.t3fxb", "142")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_DTL_QLo.t3fxb", "142")
    RenderPreloadShader("Mesh_LGT_VCOL_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_LGT_DTL_VCOL_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_VCOL_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_VCOL_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_VCOL_QLo.t3fxb", "199")
    RenderPreloadShader("SceneToonOutline2_QLo.t3fxb", "256")
    RenderPreloadShader("Mesh_DTL_SDTL_QLo.t3fxb", "259")
    RenderPreloadShader("Mesh_VCOL_QLo.t3fxb", "3")
    RenderPreloadShader("Mesh_VCOL_QLo.t3fxb", "67")
    RenderPreloadShader("ScenePreZ_QLo.t3fxb", "128")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "135")
    RenderPreloadShader("Mesh_DTL_SDTL_QLo.t3fxb", "10")
    RenderPreloadShader("Mesh_QLo.t3fxb", "10")
    RenderPreloadShader("Mesh_QLo.t3fxb", "266")
    RenderPreloadShader("Mesh_DTL_SDTL_QLo.t3fxb", "266")
    RenderPreloadShader("Mesh_1SKN_LGT_QLo.t3fxb", "14")
    RenderPreloadShader("Mesh_1SKN_DTL_QLo.t3fxb", "7")
    RenderPreloadShader("Mesh_LGT_QLo.t3fxb", "10")
    RenderPreloadShader("Mesh_LGT_DTL_CC_TINT_QLo.t3fxb", "78")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "14")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "78")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "270")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "142")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_1SKN_LGT_CC_TINT_QLo.t3fxb", "14")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "3")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "334")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "206")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_DTL_CC_TINT_SDTL_QLo.t3fxb", "330")
    RenderPreloadShader("Mesh_1SKN_LGT_CC_TINT_QLo.t3fxb", "78")
    RenderPreloadShader("Mesh_1SKN_LGT_CC_TINT_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_1SKN_LGT_CC_TINT_QLo.t3fxb", "7")
    RenderPreloadShader("Mesh_1SKN_DTL_CC_TINT_SDTL_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_1SKN_DTL_CC_TINT_SDTL_QLo.t3fxb", "3")
    RenderPreloadShader("Mesh_1SKN_TOON_CC_TINT_QLo.t3fxb", "70")
    RenderPreloadShader("SceneToonOutline2_1SKN_QLo.t3fxb", "0")
    RenderPreloadShader("Mesh_1SKN_DTL_SDTL_QLo.t3fxb", "6")
    RenderPreloadShader("Mesh_LGT_QLo.t3fxb", "206")
    RenderPreloadShader("Mesh_LGT_DTL_VCOL_QLo.t3fxb", "78")
    RenderPreloadShader("Mesh_LGT_VCOL_QLo.t3fxb", "206")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "7")
    RenderPreloadShader("Mesh_LGT_DTL_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_QLo.t3fxb", "270")
    RenderPreloadShader("SceneShadowMapAlpha_1SKN_QLo.t3fxb", "0")
    RenderPreloadShader("Mesh_1SKN_LGT_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "78")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_LGT_QLo.t3fxb", "334")
    RenderPreloadShader("SceneToonOutline2_QLo.t3fxb", "64")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "70")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "74")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "72")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "68")
    RenderPreloadShader("Mesh_DTL_SDTL_QLo.t3fxb", "70")
    RenderPreloadShader("Mesh_DTL_SDTL_QLo.t3fxb", "74")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "330")
    RenderPreloadShader("Mesh_QLo.t3fxb", "206")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "14")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "8")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "10")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "266")
    RenderPreloadShader("SceneShadowMapAlpha_VCOL_QLo.t3fxb", "0")
    RenderPreloadShader("SceneShadowMap_VCOL_QLo.t3fxb", "0")
    RenderPreloadShader("SceneToonOutline2_QLo.t3fxb", "320")
    RenderPreloadShader("Mesh_DTL_VCOL_SDTL_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_DTL_VCOL_SDTL_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_DTL_VCOL_SDTL_QLo.t3fxb", "7")
    RenderPreloadShader("Mesh_DTL_VCOL_SDTL_QLo.t3fxb", "263")
    RenderPreloadShader("Mesh_QLo.t3fxb", "142")
    RenderPreloadShader("Mesh_DTL_SDTL_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_QLo.t3fxb", "323")
    RenderPreloadShader("Mesh_QLo.t3fxb", "195")
    RenderPreloadShader("Mesh_DTL_SDTL_QLo.t3fxb", "7")
    RenderPreloadShader("Mesh_DTL_SDTL_QLo.t3fxb", "263")
    RenderPreloadShader("SceneToonOutline2_QLo.t3fxb", "192")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_LGT_DTL_QLo.t3fxb", "14")
    RenderPreloadShader("Mesh_QLo.t3fxb", "74")
    RenderPreloadShader("Mesh_QLo.t3fxb", "330")
    RenderPreloadShader("Mesh_QLo.t3fxb", "202")
    RenderPreloadShader("Mesh_QLo.t3fxb", "264")
    RenderPreloadShader("Mesh_QLo.t3fxb", "328")
  end
end

function LakeWoodsClearing_HideZombies(bKillIdles)
  for i = 1, 8 do
    local zombie = "Zombie" .. i
    if AgentExists(zombie) then
      print("Hiding " .. zombie)
      if bKillIdles then
        AgentSetProperty(zombie, "Walk Animation - Idle", "")
      end
      AgentSetProperty(zombie, "Runtime: Visible", false)
    end
  end
end

function LakeWoodsClearing_FindPete()
  AgentSetProperty(Game_GetPlayer(), "Chored Movement - Chore Forward", "env_lakeWoodsTrail_cMove_findPete_1.chore")
  AgentSetProperty(Game_GetPlayer(), "Chored Movement - Dialog End", "cs_trailToClearingFindPete")
  ChoredMovement_Start()
end

function LakeWoodsClearing_PeteSearchSounds()
  local PlaySearchSound = function()
    if not LogicGet("2WoodsTrail - Found Pete") then
      Dialog_Run("env_lakeWoodsTrail.dlog", "amb_peteSearch", true)
    end
  end
  local Timer = function(curTime, delay)
    local inc = 0
    while curTime < delay do
      inc = GetFrameTime() * SceneGetTimeScale(kScene)
      curTime = curTime + inc
      Yield()
    end
  end
  local curTime = GetTotalTime()
  local delay = curTime + kPeteSearchSoundsInitDelay
  Timer(curTime, delay)
  PlaySearchSound()
  if LogicGet("2WoodsTrail - Found Pete") then
    return
  end
  curTime = GetTotalTime()
  delay = curTime + math.random(kPeteSearchSoundsMinDelay, kPeteSearchSoundsMaxDelay)
  Timer(curTime, delay)
  PlaySearchSound()
  if LogicGet("2WoodsTrail - Found Pete") then
    return
  end
  curTime = GetTotalTime()
  delay = curTime + math.random(kPeteSearchSoundsMinDelay, kPeteSearchSoundsMaxDelay)
  Timer(curTime, delay)
  PlaySearchSound()
end

local OriginalTelltaleLevelStartLogic = function()
  Game_NewScene(kScene, kScript)
  PreloadAssets()
  if Game_GetDebug() then
    LogicSet("Episode 201 - Rescue Choice", "Pete")
    if LogicGet("1Clearing - Left Truck") then
      if SystemBoolDialogEx("Did Pete come with you?", "Got Pete?", true) then
        LogicSet("1Clearing - Asked Pete to Come", true)
      end
      Game_SetSceneDialogNode("cs_exitTruck")
    end
  end
  Game_StartScene(true)
end

--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--Here is the main function that gets called when the level starts.
--This is where we will setup and execute everything that we want to do!

function LakeWoodsClearing()
  --Load/Parse the required configuration files, and apply them.
  RELIGHT_ConfigurationStart();

  --if we are configured to be in editor mode, make sure to keep track of the original agents in the scene before we apply any modifications to them.
  if (RelightConfigDevelopment.EditorMode == true) then
    TLSE_Development_Editor_CaptureOriginalSceneAgentNames();
  end
  
  --load this scene's external relight LUA file (NOTE: if it doesn't exist; or it's named incorrectly; or the path is incorrect; or it loads but there are lua errors, then this won't run)
  if(TLSE_LoadAndUseLuaFile(RelightConfigLevel["RelightSceneLuaFile"])) then
    RELIGHT_SceneStart();
    Callback_OnPostUpdate:Add(RELIGHT_SceneUpdate);
  end

  --apply relight backend global logic
  RELIGHT_Global_Start();
  Callback_OnPostUpdate:Add(RELIGHT_Global_Update);

  --If configured in the development ini, enable the TLSE editor
  if (RelightConfigDevelopment.EditorMode == true) then
    TLSE_Development_GUI_RelightLuaExportNamePrefix = "202_";
    TLSE_Development_Editor_Start();
    Callback_OnPostUpdate:Add(TLSE_Development_Editor_Update);
    return; --don't continue
  end

  --If configured in the development ini, enable freecamera (if editor is not enabled)
  if (RelightConfigDevelopment.FreeCameraOnlyMode == true) then     
    TLSE_Development_CreateFreeCamera();
    Callback_OnPostUpdate:Add(TLSE_Development_UpdateFreeCamera);
  end

  --If configured in the development ini, enable a performance metrics overlayalthou
  if (RelightConfigDevelopment.PerformanceMetrics == true) then     
    TLSE_Development_PerformanceMetrics_Initalize();
    Callback_OnPostUpdate:Add(TLSE_Development_PerformanceMetrics_Update);
  end

  --If it's configured in the development ini to be in freecamera mode...
  if (RelightConfigDevelopment.FreeCameraOnlyMode == true and RelightConfigDevelopment.FreeCameraOnlyMode_StartSceneNormally == false) then
    return; --don't start the scene normally as the user wants to fly around the scene but not have it attempt to run the original level logic
  end

  --execute the original telltale level start logic
  OriginalTelltaleLevelStartLogic();
end

SceneOpen(kScene, kScript)

if not (RelightConfigDevelopment.EditorMode == true or RelightConfigDevelopment.FreeCameraOnlyMode == true) then
  SceneAdd("ui_openingCredits")
end