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

local kScript = "RiverWoods"
local kScene = "adv_riverWoods"

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
RelightConfigLevel = RelightConfigData_Season2.Level_201_RiverWoods;

--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--Here is alot of the original (decompiled) telltale lua script logic for the level.
--We are leaving this untouched because we still want the level to function normally as intended.

local kClemTreeStruggleTime = 3.5
local multiAgents = {}
multiAgents.buckeye = {}
multiAgents.buckeye.agents = {
  "obj_acornBuckeyeWD",
  "obj_acornBuckeyeWD_clementine"
}

multiAgents.buckeye.lastUpdateTime = -1
multiAgents.rock = {}
multiAgents.rock.agents = {
  "obj_rockWD",
  "obj_rockRiverWoods_clementineWristL",
  "obj_rockRiverWoods_clementine",
  "obj_rockRiverWoods"
}

multiAgents.rock.lastUpdateTime = -1
multiAgents.branch = {}
multiAgents.branch.agents = {
  "obj_branchLogRiverWoods",
  "obj_branchLogRiverWoods_clementine"
}

multiAgents.branch.lastUpdateTime = -1
local mBGdlgID
local clemAttachedObjs = {
  "obj_branchLogRiverWoods_clementine",
  "obj_rockRiverWoods_clementine",
  "obj_rockRiverWoods_clementineWristL"
}

local StartNodeDebugPrint = function(dialog, nodeID, instanceID, executionCount)
  print("Executing Start Node: " .. DlgGetNodeName(dialog, nodeID))
end

local PreloadAssets = function()
  PreLoad("adv_riverWoods_clementineHideAtRock.chore")
  PreLoad("adv_riverWoods_clementineHideAtRock.chore")
  PreLoad("adv_riverWoods_clementineDodgeZombieGround.chore")
  PreLoad("adv_riverWoods_clementineDodgeZombieGround.chore")
  PreLoad("env_riverWoods_use_rockLeft_1.chore")
  PreLoad("env_riverWoods_use_rockRight_1.chore")
  PreLoad("env_riverWoods_use_winstonThumb_1.chore")
  PreLoad("env_riverWoods_timer_clemPulledLog_1.chore")
  PreLoad("env_riverWoods_timer_winstonDragsClem_2_1.chore")
  PreLoad("env_riverWoods_death_foundByVictor_1.chore")
  PreLoad("env_riverWoods_use_winstonHands_1.chore")
  PreLoad("env_riverWoods_timer_failState_winstonDrag_3.chore")
  PreLoad("adv_riverWoods_clementineHoldTree.chore")
  PreLoad("adv_riverWoods_clementineHoldTree.chore")
  PreLoad("adv_riverWoods_zombieScavengerA_struggleZombieImpaled.chore")
  PreLoad("adv_riverWoods_zombieScavengerA_struggleZombieImpaled.chore")
  PreLoad("amb_riverWoods_struggle_thumb.chore")
  PreLoad("adv_riverWoods_clementineTrappedAtDeadfall.chore")
  PreLoad("adv_riverWoods_clementineTrappedAtDeadfall.chore")
  PreLoad("env_riverWoods_cs_winstonAdjustsHold_2.chore")
  PreLoad("env_riverWoods_cs_clemTackled_1.chore")
  PreLoad("env_riverWoods_timer_clemDragged_1_1.chore")
  PreLoad("env_riverWoods_timer_clemDragged_1b_1.chore")
  PreLoad("env_riverWoods_fail_struggle_stumpZombie_1.chore")
  PreLoad("env_riverWoods_cs_winstonShitsSelfLeft_1.chore")
  PreLoad("env_riverWoods_cs_winstonShitsSelfCenter_1.chore")
  PreLoad("env_riverWoods_fail_dodgeZombieGround_1.chore")
  PreLoad("env_riverWoods_use_branch_1.chore")
  PreLoad("adv_riverWoods_clementineTrappedAtDeadfall_Branch.chore")
  PreLoad("adv_riverWoods_clementineTrappedAtDeadfall_Branch.chore")
  PreLoad("env_riverWoods_cs_winstonAdjustsHold_1.chore")
  PreLoad("env_riverWoods_peek_rightToTree_1.chore")
  PreLoad("env_riverWoods_peek_rightToTree_1.chore")
  PreLoad("env_riverWoods_peek_rightToTree_1.chore")
  PreLoad("adv_riverWoods_clementineTrappedAtDeadfall.chore")
  PreLoad("adv_riverWoods_clementineTrappedAtDeadfall.chore")
  PreLoad("env_riverWoods_timer_clemGrabbedTreeZombie_1.chore")
  PreLoad("adv_riverWoods_clementinePulledLog.chore")
  PreLoad("adv_riverWoods_clementinePulledLog.chore")
  PreLoad("env_riverWoods_kick_winston_3.chore")
  PreLoad("env_riverWoods_timer_dodgeZombieGround_1.chore")
  PreLoad("env_riverWoods_use_buckeye_1.chore")
  PreLoad("adv_riverWoods_clementineHoldBuckeye.chore")
  PreLoad("adv_riverWoods_clementineHoldBuckeye.chore")
  PreLoad("env_riverWoods_cs_winstonShitsSelf_1.chore")
  PreLoad("env_riverWoods_swing_rockWinston_1.chore")
  PreLoad("env_riverWoods_cs_R-ratedThumb_1.chore")
  PreLoad("env_riverWoods_timer_dodgeTreeZombie_1.chore")
  PreLoad("env_riverWoods_cs_exit_1.chore")
  PreLoad("env_riverWoods_fail_dodgeTreeZombie_1.chore")
  PreLoad("env_riverWoods_fail_finalDodge_1.chore")
  PreLoad("env_riverWoods_cs_enterClearing_1.chore")
  PreLoad("env_riverWoods_move_zombieTumblesWinston_1.chore")
  PreLoad("env_riverWoods_timer_WinstonBrokenNose_1.chore")
  PreLoad("env_riverWoods_use_tree_1.chore")
  PreLoad("env_riverWoods_fail_treeZombie_1.chore")
  PreLoad("env_riverWoods_timer_clemHoldingBranch_1.chore")
  PreLoad("env_riverWoods_fail_moveFromDeadfall_2.chore")
  PreLoad("env_riverWoods_kick_winston_1.chore")
  PreLoad("env_riverWoods_use_winstonHands_2.chore")
  PreLoad("env_riverWoods_cs_winstonApproachesRock.chore")
  PreLoad("env_riverWoods_cs_winstonAdjustsHold_3.chore")
  PreLoad("env_riverWoods_fail_dodgeOnWayToDeadfall_1.chore")
  PreLoad("env_riverWoods_cs_clemBacksUpToRiverBank_2.chore")
  PreLoad("env_riverWoods_timer_throwRockAtMultipleZombies_1.chore")
  PreLoad("env_riverWoods_cs_clemThrowsRockAtZombie_1.chore")
  PreLoad("env_riverWoods_cs_clemThrowsRockAtZombie_2.chore")
  PreLoad("env_riverWoods_cs_clemThrowsRockAtZombie_3.chore")
  PreLoad("env_riverWoods_cs_clemThrowsRockAtZombie_4.chore")
  PreLoad("env_riverWoods_cs_clemThrowsRockAtZombie_5.chore")
  PreLoad("env_riverWoods_cs_clemThrowsRockAtZombie_6.chore")
  PreLoad("env_riverWoods_fail_biteThumb_1.chore")
  PreLoad("env_riverWoods_timer_dodgeOnWayToDeadfall_1.chore")
  PreLoad("env_riverWoods_swing_branch_1.chore")
  PreLoad("env_riverWoods_cs_clemYankedFromLog_1.chore")
  PreLoad("env_riverWoods_kick_winston_2.chore")
  PreLoad("env_riverWoods_timer_WinstonBlocksClem_1.chore")
  PreLoad("env_riverWoods_fail_throwRock_1.chore")
  PreLoad("env_riverWoods_cs_clemThrowsRockAtZombie_7.chore")
  PreLoad("env_riverWoods_cs_fail_moveFromRock.chore")
  PreLoad("env_riverWoods_cs_move_rightToTree.chore")
  PreLoad("env_riverWoods_fail_moveFromDeadfall_1.chore")
  PreLoad("env_riverWoods_cs_clemHides_1.chore")
  PreLoad("env_riverWoods_timer_clemBiteThumb_1.chore")
  PreLoad("env_riverWoods_death_foundByVictor_2.chore")
  PreLoad("env_riverWoods_cs_move_rightToTree_2.chore")
  PreLoad("env_riverWoods_fail_treeZombie_2.chore")
  PreLoad("adv_riverWoods_zombieScavengerA_impaledZombie.chore")
  PreLoad("adv_riverWoods_zombieScavengerA_impaledZombie.chore")
  PreLoad("tile_barkOak.d3dtx")
  PreLoad("env_leavesHiRiverWoods.d3dtx")
  PreLoad("obj_rootRapidsRiverWoods_000.d3dtx")
  PreLoad("Tile_forestWaterTowerTreeRoot.d3dtx")
  PreLoad("obj_boulderRapidsRiverWoods_000.d3dtx")
  PreLoad("obj_hatClementine200_detail.d3dtx")
  PreLoad("obj_hatClementine200_nm.d3dtx")
  PreLoad("obj_hatClementine200.d3dtx")
  PreLoad("obj_treeDeadRiverShore_000.d3dtx")
  PreLoad("adv_riverWoodsTile_meshesE_000.d3dtx")
  PreLoad("adv_riverWoodsTile_meshesD_000.d3dtx")
  PreLoad("obj_acornBuckeyeWD.d3dtx")
  PreLoad("sk54_zombieScavengerC_head_detail.d3dtx")
  PreLoad("sk54_zombieScavengerC_body_detail.d3dtx")
  PreLoad("sk54_zombieScavengerC_head_nm.d3dtx")
  PreLoad("sk54_zombieScavengerC_hair_nm.d3dtx")
  PreLoad("sk54_zombieScavengerC_body_nm.d3dtx")
  PreLoad("sk54_zombieScavengerC_head.d3dtx")
  PreLoad("sk54_zombieScavengerC_hair.d3dtx")
  PreLoad("sk54_zombieScavengerC_body.d3dtx")
  PreLoad("obj_armZombieScavengerB_nm.d3dtx")
  PreLoad("obj_armZombieScavengerB.d3dtx")
  PreLoad("sk55_zombieScavengerB_bodyDamage_nm.d3dtx")
  PreLoad("sk55_zombieScavengerB_bodyDamage.d3dtx")
  PreLoad("sk55_zombieScavengerB_body_detail.d3dtx")
  PreLoad("sk55_zombieScavengerB_body_nm.d3dtx")
  PreLoad("sk55_zombieScavengerB_body.d3dtx")
  PreLoad("sk55_zombieScavengerB_head_detail.d3dtx")
  PreLoad("sk55_zombieScavengerB_head_nm.d3dtx")
  PreLoad("sk55_zombieScavengerB_hair_nm.d3dtx")
  PreLoad("sk55_zombieScavengerB_head.d3dtx")
  PreLoad("sk55_zombieScavengerB_hair.d3dtx")
  PreLoad("sk54_victor_head_detail.d3dtx")
  PreLoad("sk54_victor_body_detail.d3dtx")
  PreLoad("sk54_victor_head_nm.d3dtx")
  PreLoad("sk54_victor_hair_nm.d3dtx")
  PreLoad("sk54_victor_body_nm.d3dtx")
  PreLoad("sk54_victor_head.d3dtx")
  PreLoad("sk54_victor_hairAlpha.d3dtx")
  PreLoad("sk54_victor_hair.d3dtx")
  PreLoad("sk54_victor_body.d3dtx")
  PreLoad("sk54_zombie200_neckGoreCap_nm.d3dtx")
  PreLoad("sk54_zombie200_neckGoreCap.d3dtx")
  PreLoad("sk54_zombie200_armFracture_Detail.d3dtx")
  PreLoad("sk54_zombie200_armFracture_nm.d3dtx")
  PreLoad("sk54_zombie200_armFracture.d3dtx")
  PreLoad("sk54_zombie200_horseShoeHairA_nm.d3dtx")
  PreLoad("sk54_zombie200_horseShoeHairAAlpha_nm.d3dtx")
  PreLoad("sk54_zombie200_horseShoeHairAblackAlpha.d3dtx")
  PreLoad("sk54_zombie200_horseShoeHairAblack.d3dtx")
  PreLoad("sk54_zombie200_longHairA_nm.d3dtx")
  PreLoad("sk54_zombie200_longHairAAlpha_nm.d3dtx")
  PreLoad("sk54_zombie200_longHairABlackAlpha.d3dtx")
  PreLoad("sk54_zombie200_longHairABlack.d3dtx")
  PreLoad("map_gradiant_zombie200.d3dtx")
  PreLoad("sk54_zombie200_spikeyHairA_nm.d3dtx")
  PreLoad("sk54_zombie200_spikeyHairAAlpha_nm.d3dtx")
  PreLoad("sk54_zombie200_spikeyHairAblackAlpha.d3dtx")
  PreLoad("sk54_zombie200_spikeyHairAblack.d3dtx")
  PreLoad("sk54_zombie200_stragglyHairAblackAlpha.d3dtx")
  PreLoad("sk54_zombie200_fullArms_detail.d3dtx")
  PreLoad("sk54_zombie200_fullArms_nm.d3dtx")
  PreLoad("sk54_zombie200_fullArms.d3dtx")
  PreLoad("sk54_zombie200_faceB_detail.d3dtx")
  PreLoad("sk54_zombie200_faceB_nm.d3dtx")
  PreLoad("sk54_zombie200_faceB.d3dtx")
  PreLoad("sk54_zombie200_jacketABlue_Detail.d3dtx")
  PreLoad("sk54_zombie200_jacketABlue_nm.d3dtx")
  PreLoad("sk54_zombie200_jacketABlue.d3dtx")
  PreLoad("sk54_zombie200_jacketB_Detail.d3dtx")
  PreLoad("sk54_zombie200_jacketB_nm.d3dtx")
  PreLoad("sk54_zombie200_jacketB.d3dtx")
  PreLoad("sk54_zombie200_summerShirt_detail.d3dtx")
  PreLoad("sk54_zombie200_summerShirt_nm.d3dtx")
  PreLoad("sk54_zombie200_summerShirt.d3dtx")
  PreLoad("sk54_zombie200_shirtA_detail.d3dtx")
  PreLoad("sk54_zombie200_shirtA_nm.d3dtx")
  PreLoad("sk54_zombie_alphaSketch.d3dtx")
  PreLoad("sk54_zombie200_shirtA.d3dtx")
  PreLoad("obj_gunGlockClip.d3dtx")
  PreLoad("obj_gunGlock.d3dtx")
  PreLoad("random_lookup.d3dtx")
  PreLoad("smaa_area_lookup.d3dtx")
  PreLoad("smaa_search_lookup.d3dtx")
  PreLoad("sk55_zombieFem_hairStraggleyBlack.d3dtx")
  PreLoad("sk55_zombieFem_hairStraggleyBlackAlpha.d3dtx")
  PreLoad("fx_bloodSpurtDirRadBurst.d3dtx")
  PreLoad("fx_bloodSpurtDirWdeA2.d3dtx")
  PreLoad("sk54_winston_headThumbBite.d3dtx")
  PreLoad("fx_bloodSpurtRadB2.d3dtx")
  PreLoad("fx_splashWaterRiverFoam.d3dtx")
  PreLoad("fx_bubbles.d3dtx")
  PreLoad("sk56_clementine200FearB.ptable")
  PreLoad("clementine200_phoneme_default_fearB.anm")
  PreLoad("clementine200_phoneme_FV_fearB.anm")
  PreLoad("clementine200_phoneme_I_fearB.anm")
  PreLoad("clementine200_phoneme_LL_fearB.anm")
  PreLoad("clementine200_phoneme_MM_fearB.anm")
  PreLoad("clementine200_phoneme_NN_fearB.anm")
  PreLoad("clementine200_phoneme_O_fearB.anm")
  PreLoad("clementine200_phoneme_SH_fearB.anm")
  PreLoad("clementine200_phoneme_TH_fearB.anm")
  PreLoad("clementine200_phoneme_U_fearB.anm")
  PreLoad("sk56_idle_clementine200FearCX.chore")
  PreLoad("sk56_idle_clem200FearCX.anm")
  PreLoad("sk56_clementine200FearCX.ptable")
  PreLoad("clementine200_phoneme_AA_fearCX.anm")
  PreLoad("clementine200_phoneme_default_fearCX.anm")
  PreLoad("clementine200_phoneme_EE_fearCX.anm")
  PreLoad("clementine200_phoneme_FV_fearCX.anm")
  PreLoad("clementine200_phoneme_I_fearCX.anm")
  PreLoad("clementine200_phoneme_LL_fearCX.anm")
  PreLoad("clementine200_phoneme_MM_fearCX.anm")
  PreLoad("clementine200_phoneme_NN_fearCX.anm")
  PreLoad("clementine200_phoneme_O_fearCX.anm")
  PreLoad("clementine200_phoneme_SH_fearCX.anm")
  PreLoad("clementine200_phoneme_TH_fearCX.anm")
  PreLoad("clementine200_phoneme_U_fearCX.anm")
  PreLoad("fs_mud_run_step_6.wav")
  PreLoad("fs_mud_run_step_7.wav")
  PreLoad("fs_mud_run_step_8.wav")
  PreLoad("fs_mud_run_step_9.wav")
  PreLoad("fs_mud_run_step_10.wav")
  PreLoad("sk56_idle_clementine200PainA.chore")
  PreLoad("sk56_clementine200PainA.ptable")
  PreLoad("clementine200_phoneme_AA_painA.anm")
  PreLoad("clementine200_phoneme_default_painA.anm")
  PreLoad("clementine200_phoneme_EE_painA.anm")
  PreLoad("clementine200_phoneme_FV_painA.anm")
  PreLoad("clementine200_phoneme_I_painA.anm")
  PreLoad("clementine200_phoneme_LL_painA.anm")
  PreLoad("clementine200_phoneme_MM_painA.anm")
  PreLoad("clementine200_phoneme_NN_painA.anm")
  PreLoad("clementine200_phoneme_O_painA.anm")
  PreLoad("clementine200_phoneme_SH_painA.anm")
  PreLoad("clementine200_phoneme_TH_painA.anm")
  PreLoad("clementine200_phoneme_U_painA.anm")
  PreLoad("mus_loop_Tense_24.wav")
  PreLoad("sk54_idle_winstonAngryCX.chore")
  PreLoad("sk54_winstonAngryCX.ptable")
  PreLoad("winston_phoneme_AA_angryCX.anm")
  PreLoad("winston_phoneme_default_angryCX.anm")
  PreLoad("winston_phoneme_EE_angryCX.anm")
  PreLoad("winston_phoneme_FV_angryCX.anm")
  PreLoad("winston_phoneme_I_angryCX.anm")
  PreLoad("winston_phoneme_LL_angryCX.anm")
  PreLoad("winston_phoneme_MM_angryCX.anm")
  PreLoad("winston_phoneme_NN_angryCX.anm")
  PreLoad("winston_phoneme_O_angryCX.anm")
  PreLoad("winston_phoneme_SH_angryCX.anm")
  PreLoad("winston_phoneme_TH_angryCX.anm")
  PreLoad("winston_phoneme_U_angryCX.anm")
  PreLoad("sk54_idle_winstonAngryC.chore")
  PreLoad("sk54_winstonAngryC.ptable")
  PreLoad("winston_phoneme_AA_angryC.anm")
  PreLoad("winston_phoneme_default_angryC.anm")
  PreLoad("winston_phoneme_EE_angryC.anm")
  PreLoad("winston_phoneme_FV_angryC.anm")
  PreLoad("winston_phoneme_I_angryC.anm")
  PreLoad("winston_phoneme_LL_angryC.anm")
  PreLoad("winston_phoneme_MM_angryC.anm")
  PreLoad("winston_phoneme_NN_angryC.anm")
  PreLoad("winston_phoneme_O_angryC.anm")
  PreLoad("winston_phoneme_SH_angryC.anm")
  PreLoad("winston_phoneme_TH_angryC.anm")
  PreLoad("winston_phoneme_U_angryC.anm")
  PreLoad("ui_notification.prop")
  PreLoad("ui_notification_text.prop")
  PreLoad("ui_notification_background.prop")
  PreLoad("ui_notification_exclamation.prop")
  PreLoad("ui_notification_question.prop")
  PreLoad("ui_notification_saving.prop")
  PreLoad("ui_notification.scene")
  PreLoad("SceneShadowMapAlpha_QHi.t3fxb")
  PreLoad("SceneVelocityAlpha_QHi.t3fxb")
  PreLoad("SceneGlowAlphaTest_QHi.t3fxb")
  PreLoad("ui_peek.prop")
  PreLoad("ui_peek_arrow.prop")
  PreLoad("ui_peek.scene")
  PreLoad("ui_peek_arrow.d3dmesh")
  PreLoad("ui_peek_arrow.d3dtx")
  PreLoad("ui_notification_background.d3dmesh")
  PreLoad("ui_notification_exclamation.d3dmesh")
  PreLoad("ui_notification_question.d3dmesh")
  PreLoad("ui_notification_saving.d3dmesh")
  PreLoad("ui_notification_background.d3dtx")
  PreLoad("ui_notification_exclamation.d3dtx")
  PreLoad("ui_notification_question.d3dtx")
  PreLoad("ui_notification_saving1.d3dtx")
  PreLoad("cam_nav_clemAtRock_horizontal_adv_riverWoods.chore")
  PreLoad("cam_nav_clemAtRock_vertical_adv_riverWoods.chore")
  PreLoad("ui_peek_arrowOn.chore")
  PreLoad("Peek.imap")
  PreLoad("sk54_idle_winstonAngryB.chore")
  PreLoad("ui_panicMeter.prop")
  PreLoad("ui_panicMeter_vignette.prop")
  PreLoad("ui_panicMeter_background.prop")
  PreLoad("ui_dialog_timer.prop")
  PreLoad("ui_dialog_timerLine.prop")
  PreLoad("ui_panicMeter.scene")
  PreLoad("ui_panicMeter_timerCombat.chore")
  PreLoad("ui_panicMeter_vignetteRotateRight.chore")
  PreLoad("ui_panicMeter_vignetteRotateLeft.chore")
  PreLoad("ui_panicMeter_vignette.d3dmesh")
  PreLoad("ui_panicMeter_background.d3dmesh")
  PreLoad("ui_dialog_timer.d3dmesh")
  PreLoad("ui_dialog_timerLine.d3dmesh")
  PreLoad("ui_panicMeter_vignette.d3dtx")
  PreLoad("ui_dialog_timer.d3dtx")
  PreLoad("ui_dialog_timerLine.d3dtx")
  PreLoad("ui_episode.dlog")
  PreLoad("ui_notification_tutorialOn.chore")
  PreLoad("ui_peek_arrowOff.chore")
  PreLoad("ui_dot.prop")
  PreLoad("ui_dot.d3dmesh")
  PreLoad("ui_dot.d3dtx")
  PreLoad("ui_icon_Walk.d3dtx")
  PreLoad("ui_reticle_textShow.chore")
  PreLoad("ui_reticle_defaultPrompt_keyboard.d3dtx")
  PreLoad("ui_reticle_combatExpand.chore")
  PreLoad("ui_reticle_defaultExpand.chore")
  PreLoad("ui_reticle_cursorAcknowledgeIput.chore")
  PreLoad("ui_reticle_actionExpandPress.chore")
  PreLoad("ui_reticle_actionExpandPress.d3dtx")
  PreLoad("ui_notification_tutorialOff.chore")
  PreLoad("Action.imap")
  PreLoad("ui_hud_prompt_keyboard_stroke.d3dtx")
  PreLoad("ui_hud_prompt_stick.d3dmesh")
  PreLoad("ui_hud_prompt_stick_left.d3dtx")
  PreLoad("ui_hud_prompt_stick_stroke.d3dmesh")
  PreLoad("ui_hud_prompt_stick_stroke.d3dtx")
  PreLoad("ui_hud_prompt_keyboard_right.d3dtx")
  PreLoad("ui_hud_prompt_stick_reveal.chore")
  PreLoad("ui_hud_prompt_arrow_reveal.chore")
  PreLoad("ui_hud_prompt_arrow.d3dtx")
  PreLoad("ui_hud_prompt_arrow.d3dmesh")
  PreLoad("ui_hud_prompt_button.d3dmesh")
  PreLoad("ui_hud_prompt_button_glow.d3dmesh")
  PreLoad("ui_hud_prompt_button_stroke.d3dmesh")
  PreLoad("ui_hud_prompt_arrow_background.d3dmesh")
  PreLoad("ui_mask.d3dmesh")
  PreLoad("ui_hud_prompt_button_background.d3dmesh")
  PreLoad("ui_hud_prompt_facebutton_down.d3dtx")
  PreLoad("ui_hud_prompt_facebutton_down_glow.d3dtx")
  PreLoad("ui_hud_prompt_button_stroke.d3dtx")
  PreLoad("ui_hud_prompt_arrow_background.d3dtx")
  PreLoad("ui_mask.d3dtx")
  PreLoad("ui_hud_prompt_button_background.d3dtx")
  PreLoad("ui_hud_prompt_stick_succeed.chore")
  PreLoad("ui_hud_prompt_arrow_succeed.chore")
  PreLoad("ui_hud_prompt_arrowPress.d3dtx")
  PreLoad("ui_reticle_textHide.chore")
  PreLoad("sk54_idle_zombieAverageStandA.anm")
  PreLoad("zombieAverage200_face_default.anm")
  PreLoad("Mesh_1SKN_BMP_CC_TINT_QHi.t3fxb")
  PreLoad("SceneToonOutline2_1SKN_CC_TINT_QHi.t3fxb")
  PreLoad("ui_hud_prompt_keyboard_left.d3dtx")
  PreLoad("fs_wet_mud_1.wav")
  PreLoad("fs_wet_mud_2.wav")
  PreLoad("fs_wet_mud_3.wav")
  PreLoad("fs_wet_mud_4.wav")
  PreLoad("SceneGBuffer_1SKN_QHi.t3fxb")
  PreLoad("SceneToonOutline2_GBuffer_1SKN_QHi.t3fxb")
  PreLoad("SceneVelocity_1SKN_QHi.t3fxb")
  PreLoad("SceneGlow_1SKN_QHi.t3fxb")
  PreLoad("cam_nav_clemAtDeadfall_horizontal_adv_riverWoods.chore")
  PreLoad("cam_nav_clemAtDeadfall_vertical_adv_riverWoods.chore")
  PreLoad("ui_notification_saving.chore")
  PreLoad("ui_notification_saving2.d3dtx")
  PreLoad("ui_notification_saving3.d3dtx")
  PreLoad("ui_notification_saving4.d3dtx")
  PreLoad("ui_notification_saving5.d3dtx")
  PreLoad("ui_notification_saving6.d3dtx")
  PreLoad("ui_notification_saving7.d3dtx")
  PreLoad("ui_notification_saving8.d3dtx")
  PreLoad("sk56_idle_clementine200AngryB.chore")
  PreLoad("sk56_clementine200AngryB.ptable")
  PreLoad("clementine200_phoneme_AA_angryB.anm")
  PreLoad("clementine200_phoneme_default_angryB.anm")
  PreLoad("clementine200_phoneme_EE_angryB.anm")
  PreLoad("clementine200_phoneme_FV_angryB.anm")
  PreLoad("clementine200_phoneme_I_angryB.anm")
  PreLoad("clementine200_phoneme_LL_angryB.anm")
  PreLoad("clementine200_phoneme_MM_angryB.anm")
  PreLoad("clementine200_phoneme_NN_angryB.anm")
  PreLoad("clementine200_phoneme_O_angryB.anm")
  PreLoad("clementine200_phoneme_SH_angryB.anm")
  PreLoad("clementine200_phoneme_TH_angryB.anm")
  PreLoad("clementine200_phoneme_U_angryB.anm")
  PreLoad("ui_icon_hand.d3dtx")
  PreLoad("sk56_idle_clementine200AngryC.chore")
  PreLoad("sk56_clementine200AngryC.ptable")
  PreLoad("clementine200_phoneme_AA_angryC.anm")
  PreLoad("clementine200_phoneme_default_angryC.anm")
  PreLoad("clementine200_phoneme_EE_angryC.anm")
  PreLoad("clementine200_phoneme_FV_angryC.anm")
  PreLoad("clementine200_phoneme_I_angryC.anm")
  PreLoad("clementine200_phoneme_LL_angryC.anm")
  PreLoad("clementine200_phoneme_MM_angryC.anm")
  PreLoad("clementine200_phoneme_NN_angryC.anm")
  PreLoad("clementine200_phoneme_O_angryC.anm")
  PreLoad("clementine200_phoneme_SH_angryC.anm")
  PreLoad("clementine200_phoneme_TH_angryC.anm")
  PreLoad("clementine200_phoneme_U_angryC.anm")
  PreLoad("fx_bloodSpurtRadEmitter_idleA.chore")
  PreLoad("sk54_idle_winstonPainA.chore")
  PreLoad("sk56_idle_clementine200ThinkingB.chore")
  PreLoad("sk56_idle_clem200ThinkingB.anm")
  PreLoad("sk56_clementine200ThinkingB.ptable")
  PreLoad("clementine200_phoneme_AA_thinkingB.anm")
  PreLoad("clementine200_phoneme_default_thinkingB.anm")
  PreLoad("clementine200_phoneme_EE_thinkingB.anm")
  PreLoad("clementine200_phoneme_FV_thinkingB.anm")
  PreLoad("clementine200_phoneme_I_thinkingB.anm")
  PreLoad("clementine200_phoneme_LL_thinkingB.anm")
  PreLoad("clementine200_phoneme_MM_thinkingB.anm")
  PreLoad("clementine200_phoneme_NN_thinkingB.anm")
  PreLoad("clementine200_phoneme_O_thinkingB.anm")
  PreLoad("clementine200_phoneme_SH_thinkingB.anm")
  PreLoad("clementine200_phoneme_TH_thinkingB.anm")
  PreLoad("clementine200_phoneme_U_thinkingB.anm")
  PreLoad("sk54_petePainAX.ptable")
  PreLoad("pete_phoneme_AA_painAX.anm")
  PreLoad("pete_phoneme_default_painAX.anm")
  PreLoad("pete_phoneme_EE_painAX.anm")
  PreLoad("pete_phoneme_FV_painAX.anm")
  PreLoad("pete_phoneme_I_painAX.anm")
  PreLoad("pete_phoneme_LL_painAX.anm")
  PreLoad("pete_phoneme_MM_painAX.anm")
  PreLoad("pete_phoneme_NN_painAX.anm")
  PreLoad("pete_phoneme_O_painAX.anm")
  PreLoad("pete_phoneme_SH_painAX.anm")
  PreLoad("pete_phoneme_TH_painAX.anm")
  PreLoad("pete_phoneme_U_painAX.anm")
  PreLoad("sk56_idle_clementine200SurprisedC.chore")
  PreLoad("sk56_idle_clem200SurpriseC.anm")
  PreLoad("sk56_clementine200SurpriseC.ptable")
  PreLoad("clementine200_phoneme_AA_surpriseC.anm")
  PreLoad("clementine200_phoneme_default_surpriseC.anm")
  PreLoad("clementine200_phoneme_EE_surpriseC.anm")
  PreLoad("clementine200_phoneme_FV_surpriseC.anm")
  PreLoad("clementine200_phoneme_I_surpriseC.anm")
  PreLoad("clementine200_phoneme_LL_surpriseC.anm")
  PreLoad("clementine200_phoneme_MM_surpriseC.anm")
  PreLoad("clementine200_phoneme_NN_surpriseC.anm")
  PreLoad("clementine200_phoneme_O_surpriseC.anm")
  PreLoad("clementine200_phoneme_SH_surpriseC.anm")
  PreLoad("clementine200_phoneme_TH_surpriseC.anm")
  PreLoad("clementine200_phoneme_U_surpriseC.anm")
  PreLoad("sk56_idle_clementine200SurprisedCX.chore")
  PreLoad("sk56_idle_clem200SurpriseCX.anm")
  PreLoad("sk56_clementine200SurpriseCX.ptable")
  PreLoad("clementine200_phoneme_AA_surpriseCX.anm")
  PreLoad("clementine200_phoneme_default_surpriseCX.anm")
  PreLoad("clementine200_phoneme_EE_surpriseCX.anm")
  PreLoad("clementine200_phoneme_FV_surpriseCX.anm")
  PreLoad("clementine200_phoneme_I_surpriseCX.anm")
  PreLoad("clementine200_phoneme_LL_surpriseCX.anm")
  PreLoad("clementine200_phoneme_MM_surpriseCX.anm")
  PreLoad("clementine200_phoneme_NN_surpriseCX.anm")
  PreLoad("clementine200_phoneme_O_surpriseCX.anm")
  PreLoad("clementine200_phoneme_SH_surpriseCX.anm")
  PreLoad("clementine200_phoneme_TH_surpriseCX.anm")
  PreLoad("clementine200_phoneme_U_surpriseCX.anm")
  PreLoad("sk56_idle_clementine200PainD.chore")
  PreLoad("sk56_idle_clem200PainD.anm")
  PreLoad("sk56_clementine200PainD.ptable")
  PreLoad("clementine200_phoneme_AA_painD.anm")
  PreLoad("clementine200_phoneme_default_painD.anm")
  PreLoad("clementine200_phoneme_EE_painD.anm")
  PreLoad("clementine200_phoneme_FV_painD.anm")
  PreLoad("clementine200_phoneme_I_painD.anm")
  PreLoad("clementine200_phoneme_LL_painD.anm")
  PreLoad("clementine200_phoneme_MM_painD.anm")
  PreLoad("clementine200_phoneme_NN_painD.anm")
  PreLoad("clementine200_phoneme_O_painD.anm")
  PreLoad("clementine200_phoneme_SH_painD.anm")
  PreLoad("clementine200_phoneme_TH_painD.anm")
  PreLoad("clementine200_phoneme_U_painD.anm")
  PreLoad("Mesh_BMP_SCM_DTL_DBMP_CC_TINT_QHi.t3fxb")
  PreLoad("cam_nav_clemBiteThumb_horizontal_adv_riverWoods.chore")
  PreLoad("cam_nav_clemBiteThumb_vertical_adv_riverWoods.chore")
  PreLoad("sk56_idle_clementine200PainC.chore")
  PreLoad("sk54_idle_winstonHoldSpear.chore")
  PreLoad("sk54_idle_winstonHoldSpear.anm")
  PreLoad("ui_icon_Bite.d3dtx")
  PreLoad("sk56_clementine200PainC.ptable")
  PreLoad("clementine200_phoneme_AA_painC.anm")
  PreLoad("clementine200_phoneme_default_painC.anm")
  PreLoad("clementine200_phoneme_EE_painC.anm")
  PreLoad("clementine200_phoneme_FV_painC.anm")
  PreLoad("clementine200_phoneme_I_painC.anm")
  PreLoad("clementine200_phoneme_LL_painC.anm")
  PreLoad("clementine200_phoneme_MM_painC.anm")
  PreLoad("clementine200_phoneme_NN_painC.anm")
  PreLoad("clementine200_phoneme_O_painC.anm")
  PreLoad("clementine200_phoneme_SH_painC.anm")
  PreLoad("clementine200_phoneme_TH_painC.anm")
  PreLoad("clementine200_phoneme_U_painC.anm")
  PreLoad("sk56_idle_clementine200PainB.chore")
  PreLoad("sk56_idle_clem200PainB.anm")
  PreLoad("sk56_clementine200PainB.ptable")
  PreLoad("clementine200_phoneme_AA_painB.anm")
  PreLoad("clementine200_phoneme_default_painB.anm")
  PreLoad("clementine200_phoneme_EE_painB.anm")
  PreLoad("clementine200_phoneme_FV_painB.anm")
  PreLoad("clementine200_phoneme_I_painB.anm")
  PreLoad("clementine200_phoneme_LL_painB.anm")
  PreLoad("clementine200_phoneme_MM_painB.anm")
  PreLoad("clementine200_phoneme_NN_painB.anm")
  PreLoad("clementine200_phoneme_O_painB.anm")
  PreLoad("clementine200_phoneme_SH_painB.anm")
  PreLoad("clementine200_phoneme_TH_painB.anm")
  PreLoad("clementine200_phoneme_U_painB.anm")
  PreLoad("bg_riverWoods_struggle_clemBitesWinstonThumb.chore")
  PreLoad("sk56_idle_clementine200BitesWinstonThumb.chore")
  PreLoad("sk54_winston_sk56_idle_clementine200BitesWinstonThumb.anm")
  PreLoad("sk56_idle_clementine200BitesWinstonThumb.anm")
  PreLoad("cam_cutscene_cameraNoiseSniper_add.anm")
  PreLoad("struggle.chore")
  PreLoad("struggle_left.chore")
  PreLoad("ui_struggle.prop")
  PreLoad("ui_struggle_square.prop")
  PreLoad("ui_struggle_chevron.prop")
  PreLoad("ui_struggle_facebuttonA.prop")
  PreLoad("ui_struggle_swipe.prop")
  PreLoad("ui_struggle_arrow.prop")
  PreLoad("ui_struggle_actionArrow.prop")
  PreLoad("ui_struggle_facebuttonA_shadow.prop")
  PreLoad("ui_struggle_mashProgressFill.prop")
  PreLoad("ui_struggle.scene")
  PreLoad("Struggle.imap")
  PreLoad("ui_struggle_mashShow.chore")
  PreLoad("ui_struggle_facebuttonA.d3dtx")
  PreLoad("ui_struggle_facebuttonA.d3dmesh")
  PreLoad("ui_struggle_facebuttonQ_keyboard.d3dtx")
  PreLoad("ui_struggle_facebuttonA_shadow.d3dmesh")
  PreLoad("ui_struggle_facebuttonA_shadow.d3dtx")
  PreLoad("ui_struggle_mashProgressFill_keyboard.chore")
  PreLoad("ui_struggle_mashProgressMeter.d3dtx")
  PreLoad("ui_struggle_mashProgressFill.d3dmesh")
  PreLoad("ui_struggle_mashProgressFill.d3dmesh")
  PreLoad("ui_struggle_square.d3dmesh")
  PreLoad("ui_struggle_chevron.d3dmesh")
  PreLoad("ui_struggle_actionArrow.d3dmesh")
  PreLoad("ui_struggle_square.d3dtx")
  PreLoad("ui_struggle_chevron.d3dtx")
  PreLoad("ui_struggle_actionArrow.d3dtx")
  PreLoad("ui_struggle_mash.chore")
  PreLoad("sk56_idle_clementine200NormalA.chore")
  PreLoad("sk54_idle_winstonNormalA.chore")
  PreLoad("cam_nav_clemInLog_horizontal_adv_riverWoods.chore")
  PreLoad("cam_nav_clemInLog_vertical_adv_riverWoods.chore")
  PreLoad("ui_icon_Kick.d3dtx")
  PreLoad("sk56_idle_clementine200PainAX.chore")
  PreLoad("sk56_idle_clem200PainAX.anm")
  PreLoad("sk54_move_winstonWalk.chore")
  PreLoad("sk54_move_wd200GMWalkA.anm")
  PreLoad("sk56_clementine200PainAX.ptable")
  PreLoad("clementine200_phoneme_AA_painAX.anm")
  PreLoad("clementine200_phoneme_default_painAX.anm")
  PreLoad("clementine200_phoneme_FV_painAX.anm")
  PreLoad("clementine200_phoneme_I_painAX.anm")
  PreLoad("clementine200_phoneme_LL_painAX.anm")
  PreLoad("clementine200_phoneme_MM_painAX.anm")
  PreLoad("clementine200_phoneme_NN_painAX.anm")
  PreLoad("clementine200_phoneme_O_painAX.anm")
  PreLoad("clementine200_phoneme_SH_painAX.anm")
  PreLoad("clementine200_phoneme_TH_painAX.anm")
  PreLoad("clementine200_phoneme_U_painAX.anm")
  PreLoad("cam_nav_secondDrag_horizontal_adv_riverWoods.chore")
  PreLoad("cam_nav_secondDrag_vertical_adv_riverWoods.chore")
  PreLoad("bg_riverWoods_struggle_winstonClemStruggleHoldTreeNearFail_1.chore")
  PreLoad("bg_riverWoods_struggle_winstonClemStruggleHoldTree_1.chore")
  PreLoad("bg_riverWoods_struggle_winstonClemStruggleHoldTreeNearSuccess_1.chore")
  PreLoad("sk54_idle_winstonClemStrugglesHoldTreeNearFail.chore")
  PreLoad("sk54_idle_winstonClemStrugglesHoldTreeNearFail.anm")
  PreLoad("sk56_clementine200_sk54_idle_winstonClemStrugglesHoldTreeNearFail.anm")
  PreLoad("clementine200_headGesture_lookUpRight_add.anm")
  PreLoad("NV_Clem_Grunt_Exertion-01.wav")
  PreLoad("Vox_David_attackRecovery_lp_3.wav")
  PreLoad("fs_wet_mud_13.wav")
  PreLoad("fs_wet_mud_14.wav")
  PreLoad("mus_loop_Action_19b.wav")
  PreLoad("bg_riverWoods_struggle_clemPushWinstonChinStruggleRightNearFail_1.chore")
  PreLoad("bg_riverWoods_struggle_clemPushWinstonChinStruggleRight_1.chore")
  PreLoad("bg_riverWoods_struggle_clemPushWinstonChinStruggleRightNearSuccess_1.chore")
  PreLoad("sk56_idle_clemPushWinstonChinStruggleRightNearFail.chore")
  PreLoad("sk54_winston_sk56_idle_clemPushWinstonChinStruggleRightNearFail.anm")
  PreLoad("sk54_winston_toAngryA.chore")
  PreLoad("sk56_idle_clemPushWinstonChinStruggleRightNearFail.anm")
  PreLoad("sk56_idle_clemPushWinstonChinStruggleRightNearSuccess.chore")
  PreLoad("sk54_winston_sk56_idle_clemPushWinstonChinStruggleRightNearSuccess.anm")
  PreLoad("sk54_winston_toSurpriseA.chore")
  PreLoad("sk54_idle_peteSurprisedA.anm")
  PreLoad("sk56_idle_clemPushWinstonChinStruggleRightNearSuccess.anm")
  PreLoad("sk54_alvin_indifferentHeadSideToSide_add.anm")
  PreLoad("bg_riverWoods_struggle_clemPushWinstonChinStruggleLeftNearFail_1.chore")
  PreLoad("bg_riverWoods_struggle_clemPushWinstonChinStruggleLeft_1.chore")
  PreLoad("bg_riverWoods_struggle_clemPushWinstonChinStruggleLeftNearSuccess_1.chore")
  PreLoad("env_riverWoods_struggle_impaledZombie_2.chore")
  PreLoad("sk55_lillyHandOnHip_heavyBreathing_add.anm")
  PreLoad("sk54_idle_winstonSurprisedA.chore")
  PreLoad("sk54_peteSurprisedA.ptable")
  PreLoad("pete_phoneme_AA_surprisedA.anm")
  PreLoad("pete_phoneme_default_surprisedA.anm")
  PreLoad("pete_phoneme_EE_surprisedA.anm")
  PreLoad("pete_phoneme_FV_surprisedA.anm")
  PreLoad("pete_phoneme_I_surprisedA.anm")
  PreLoad("pete_phoneme_LL_surprisedA.anm")
  PreLoad("pete_phoneme_MM_surprisedA.anm")
  PreLoad("pete_phoneme_NN_surprisedA.anm")
  PreLoad("pete_phoneme_O_surprisedA.anm")
  PreLoad("pete_phoneme_SH_surprisedA.anm")
  PreLoad("pete_phoneme_TH_surprisedA.anm")
  PreLoad("pete_phoneme_U_surprisedA.anm")
  PreLoad("Mesh_1SKN_BMP_DTL_CC_TINT_SDTL_QHi.t3fxb")
  PreLoad("bg_riverWoods_struggle_zombieYankNearFail_1.chore")
  PreLoad("bg_riverWoods_struggle_zombieYank_1.chore")
  PreLoad("bg_riverWoods_struggle_zombieYankNearSuccess_1.chore")
  PreLoad("sk56_idle_clementine200StruggleZombieThruTree.chore")
  PreLoad("Zombie2_sk56_idle_clementine200StruggleZombieThruTree.anm")
  PreLoad("ZombieScavengerB_sk56_idle_clementine200StruggleZombieThruTree.anm")
  PreLoad("sk56_idle_clementine200StruggleZombieThruTree.anm")
  PreLoad("obj_trunksYRiverWoods_sk56_idle_clementine200StruggleZombieThruTree.anm")
  PreLoad("sk56_idle_clementine200StruggleZombieThruTreeNearSuccess.chore")
  PreLoad("ZombieScavengerB_sk56_idle_clementine200StruggleZombieThruTreeNearSuccess.anm")
  PreLoad("sk56_idle_clementine200StruggleZombieThruTreeNearSuccess.anm")
  PreLoad("obj_trunksYRiverWoods_sk56_idle_clementine200StruggleZombieThruTreeNearSuccess.anm")
  PreLoad("vox_susan_attack_lee_grabs.wav")
  PreLoad("cam_nav_clemDodgeZombieGround_horizontal_adv_riverWoods.chore")
  PreLoad("cam_nav_clemDodgeZombieGround_vertical_adv_riverWoods.chore")
  PreLoad("sk56_idle_clementine200Tense.chore")
  PreLoad("Mesh_1SKN_BMP_TOON_CC_TINT_QHi.t3fxb")
  PreLoad("ui_hud_prompt_keyboard_down.d3dtx")
  PreLoad("cam_nav_clemDodgeTreeZombie_horizontal_adv_riverWoods.chore")
  PreLoad("cam_nav_clemDodgeTreeZombie_vertical_adv_riverWoods.chore")
  PreLoad("cam_nav_clemThrowRock_horizontal_adv_riverWoods.chore")
  PreLoad("cam_nav_clemThrowRock_vertical_adv_riverWoods.chore")
  PreLoad("NV_Clem_Yell_Falling_01.wav")
  PreLoad("Mesh_1SKN_VCOL_CC_TINT_QHi.t3fxb")
  PreLoad("FX_GaussianBlurX1_QHi.t3fxb")
  PreLoad("FX_GaussianBlurX2_QHi.t3fxb")
  PreLoad("FX_DepthOfField_QHi.t3fxb")
  PreLoad("SceneShadowMap_1SKN_VCOL_QHi.t3fxb")
  PreLoad("SceneGlowAlphaBlend_1SKN_QHi.t3fxb")
  if Platform_NeedShaderPreload() then
    RenderPreloadShader("SceneShadowMap_QLo.t3fxb", "0")
    RenderPreloadShader("SceneShadowMapAlpha_QLo.t3fxb", "0")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "78")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_LGT_DTL_CC_TINT_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "326")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "326")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "327")
    RenderPreloadShader("FX_Null_QLo.t3fxb", "0")
    RenderPreloadShader("DirectionalLightShadow_QLo.t3fxb", "1024")
    RenderPreloadShader("SceneToonOutline2_CC_TINT_QLo.t3fxb", "0")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "7")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "3")
    RenderPreloadShader("Mesh_DTL_CC_TINT_SDTL_QLo.t3fxb", "3")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "259")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "135")
    RenderPreloadShader("Mesh_DTL_CC_TINT_QLo.t3fxb", "198")
    RenderPreloadShader("Mesh_DTL_CC_TINT_QLo.t3fxb", "196")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "135")
    RenderPreloadShader("SceneToonOutline2_CC_TINT_QLo.t3fxb", "64")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_DTL_CC_TINT_SDTL_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "323")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "14")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "263")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "78")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "70")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "195")
    RenderPreloadShader("Mesh_DTL_VCOL_CC_TINT_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_DTL_VCOL_CC_TINT_QLo.t3fxb", "196")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "142")
    RenderPreloadShader("Mesh_QLo.t3fxb", "134")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "7")
    RenderPreloadShader("Mesh_LGT_DTL_VCOL_CC_TINT_QLo.t3fxb", "7")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "334")
    RenderPreloadShader("SceneShadowMapAlpha_1SKN_QLo.t3fxb", "0")
    RenderPreloadShader("SceneShadowMap_1SKN_QLo.t3fxb", "0")
    RenderPreloadShader("SceneToonOutline2_1SKN_CC_TINT_QLo.t3fxb", "64")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "323")
    RenderPreloadShader("Mesh_LGT_DTL_CC_TINT_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "198")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "3")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "259")
    RenderPreloadShader("Mesh_LGT_DTL_VCOL_CC_TINT_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "7")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "262")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "14")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "263")
    RenderPreloadShader("Mesh_LGT_VCOL_CC_TINT_QLo.t3fxb", "7")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "263")
    RenderPreloadShader("Mesh_LGT_DTL_VCOL_CC_TINT_QLo.t3fxb", "70")
    RenderPreloadShader("Mesh_LGT_VCOL_CC_TINT_QLo.t3fxb", "70")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "70")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "6")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "262")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "258")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "326")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "322")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "2")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "0")
    RenderPreloadShader("Mesh_DTL_CC_TINT_SDTL_QLo.t3fxb", "2")
    RenderPreloadShader("Mesh_LGT_VCOL_CC_TINT_QLo.t3fxb", "198")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "198")
    RenderPreloadShader("Mesh_DTL_CC_TINT_SDTL_QLo.t3fxb", "70")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "68")
    RenderPreloadShader("Mesh_1SKN_DTL_CC_TINT_SDTL_QLo.t3fxb", "70")
    RenderPreloadShader("Mesh_1SKN_TOON_CC_TINT_QLo.t3fxb", "70")
    RenderPreloadShader("SceneToonOutline2_1SKN_CC_TINT_QLo.t3fxb", "0")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "4")
    RenderPreloadShader("Mesh_1SKN_DTL_CC_TINT_SDTL_QLo.t3fxb", "6")
    RenderPreloadShader("Mesh_DTL_CC_TINT_SDTL_QLo.t3fxb", "6")
    RenderPreloadShader("Mesh_SCM_DTL_CC_TINT_QLo.t3fxb", "195")
    RenderPreloadShader("Mesh_SCM_DTL_VCOL_CC_TINT_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_1SKN_VCOL_CC_TINT_QLo.t3fxb", "199")
  end
end

function RiverWoods_HideAllClemObjs()
  for key, value in pairs(clemAttachedObjs) do
    AgentHide(value, true)
  end
end

function RiverWoods_MultiAgents_Init()
  local multiAgentKey, multiAgentValue
  local actionTime = 0
  for multiAgentKey, multiAgentValue in pairs(multiAgents) do
    for key, value in pairs(multiAgentValue.agents) do
      local agent = value
      local MultiAgentsVisCheck = function(propKey, bVisible)
        if bVisible then
          if multiAgentValue.lastUpdateTime == GetTotalTime() then
            return
          end
          for key, value in pairs(multiAgents[multiAgentKey].agents) do
            if value ~= agent then
              AgentHide(value, true)
            else
            end
          end
          multiAgentValue.lastUpdateTime = GetTotalTime()
        end
      end
      PropertyAddKeyCallback(AgentGetProperties(agent), "Runtime: Visible", MultiAgentsVisCheck)
    end
  end
end

function RiverWoods_MultiAgents_Off()
  for multiAgentKey, multiAgentValue in pairs(multiAgents) do
    for key, value in pairs(multiAgentValue.agents) do
      PropertyClearKeyCallbacks(AgentGetProperties(value), "Runtime: Visible")
    end
  end
end

function RiverWoods_ClemTreeStruggleWait()
  local curTime = GetTotalTime()
  local targetTime = curTime + kClemTreeStruggleTime
  while targetTime > GetTotalTime() and not AgentGetProperty("struggle_tree", "Struggle - Complete") do
    Yield()
  end
end

function RiverWoods_ClemInLog_WinstonAmbience(delay1, delay2)
  if not delay1 or type(delay1) ~= "number" then
    delay1 = 0
  end
  Sleep(delay1)
  if not LogicGet("1RiverWoods - Clem Hiding in Log") then
    return
  end
  Dialog_Run(Game_GetSceneDialog(), "ambient_winstonAtLog", false)
  if not delay2 or type(delay2) ~= "number" then
    delay2 = 0
  end
  delay2 = delay2 - delay1
  if delay2 < 0 then
    delay2 = 0
  end
  Sleep(delay2)
  if not LogicGet("1RiverWoods - Clem Hiding in Log") then
    return
  end
  Dialog_Run(Game_GetSceneDialog(), "ambient_winstonAtLog", false)
end

function RiverWoods_MakeAllObjsUnselectable()
  for key, value in pairs(SceneGetAgents(kScene)) do
    if AgentHasProperty(value, "Game Selectable") then
      AgentSetSelectable(value, false)
    end
  end
end

function RiverWoods_PrintCurrentStartNode(bEnabled)
  if bEnabled then
    Callback_DialogOnStartNodeBegin:Add(StartNodeDebugPrint)
  else
    Callback_DialogOnStartNodeBegin:Remove(StartNodeDebugPrint)
  end
end

function RiverWoods_RunBGdialog(dlgNode)
  if not dlgNode then
    return
  end
  mBGdlgID = Game_RunSceneDialog(dlgNode, false)
  print("Starting BG dialog!  id is " .. tostring(mBGdlgID))
end

function RiverWoods_KillBGdialog()
  if DlgIsRunning(mBGdlgID) then
    print("Killing BG dialog!")
    DlgStop(mBGdlgID)
  end
end

function RiverWoods_DoTreeStruggle()
  AgentFind("struggle_zombieYank").mProps["Button Mash - Rate of Increase"] = 4.5
  Sleep(0.5)
  local bAvoidDeath = false
  local timeToFinish = GetTotalTime() + 1
  while AgentFind("struggle_zombieYank").mProps["Chore Scrubber - Enabled"] do
    Yield()
    if AgentFind("struggle_zombieYank").mProps["Button Mash - Current Percentage"] >= 0.8 then
      AgentFind("struggle_zombieYank").mProps["Button Mash - Current Percentage"] = 0.8
    end
    if bAvoidDeath and AgentFind("struggle_zombieYank").mProps["Button Mash - Current Percentage"] < 0.1 then
      AgentFind("struggle_zombieYank").mProps["Button Mash - Current Percentage"] = 0.15
    end
    if timeToFinish <= GetTotalTime() and AgentFind("struggle_zombieYank").mProps["Button Mash - Current Percentage"] > 0.15 then
      AgentFind("struggle_zombieYank").mProps["Button Mash - Rate of Increase"] = 0.3
      bAvoidDeath = true
      LogicSet("1RiverWoods - Tree Zombie Arm About to Rip Off", true)
    elseif not bAvoidDeath and AgentFind("struggle_zombieYank").mProps["Struggle - Complete"] and AgentFind("struggle_zombieYank").mProps["Button Mash - Current Percentage"] == 0 then
      Game_RunDialog("fail_treeZombie")
    end
  end
end

local OriginalTelltaleLevelStartLogic = function()
  Game_NewScene(kScene, kScript)
  PreloadAssets()
  if IsPlatformIOS() then
    AgentHide("fx_rainSphereWDFar", true)
    AgentSetProperty("cam_nav_secondDrag", "Pan Cam - Percentage Initial Horizontal", 0)
  end
  Navigate_Enable(false)
  Game_StartScene(true)
end

--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--Here is the main function that gets called when the level starts.
--This is where we will setup and execute everything that we want to do!

function RiverWoods()
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
    TLSE_Development_GUI_RelightLuaExportNamePrefix = "201_";
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
