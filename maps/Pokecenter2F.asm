	object_const_def
	const POKECENTER2F_TRADE_RECEPTIONIST
	const POKECENTER2F_BATTLE_RECEPTIONIST
	const POKECENTER2F_TIME_CAPSULE_RECEPTIONIST
	const POKECENTER2F_OFFICER

Pokecenter2F_MapScripts:
	def_scene_scripts
	scene_script Pokecenter2FCheckMysteryGiftScene, SCENE_POKECENTER2F_CHECK_MYSTERY_GIFT
	scene_script Pokecenter2FLeaveTradeCenterScene, SCENE_POKECENTER2F_LEAVE_TRADE_CENTER
	scene_script Pokecenter2FLeaveColosseumScene,   SCENE_POKECENTER2F_LEAVE_COLOSSEUM
	scene_script Pokecenter2FLeaveTimeCapsuleScene, SCENE_POKECENTER2F_LEAVE_TIME_CAPSULE

	def_callbacks

Pokecenter2FCheckMysteryGiftScene:
	special CheckMysteryGift
	ifequal $0, .done
	clearevent EVENT_MYSTERY_GIFT_DELIVERY_GUY
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftrue .done
	sdefer Pokecenter2F_AppearMysteryGiftDeliveryGuy
.done
	end

Pokecenter2FLeaveTradeCenterScene:
	sdefer Script_LeftCableTradeCenter
	end

Pokecenter2FLeaveColosseumScene:
	sdefer Script_LeftCableColosseum
	end

Pokecenter2FLeaveTimeCapsuleScene:
	sdefer Script_LeftTimeCapsule
	end

Pokecenter2F_AppearMysteryGiftDeliveryGuy:
	appear POKECENTER2F_OFFICER
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	end

Script_TradeCenterClosed:
	faceplayer
	opentext
	writetext Text_TradeRoomClosed
	waitbutton
	closetext
	end

Script_BattleRoomClosed:
	faceplayer
	opentext
	writetext Text_BattleRoomClosed
	waitbutton
	closetext
	end

LinkReceptionistScript_Trade:
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iffalse Script_TradeCenterClosed
	special SetBitsForLinkTradeRequest
	opentext
	writetext Text_TradeReceptionistIntro
	yesorno
	iffalse .AbortLink
	writetext Text_PleaseWait
	special WaitForLinkedFriend
	iffalse .FriendNotReady
	writetext Text_MustSaveGame
	yesorno
	iffalse .DidNotSave
	special TryQuickSave
	iffalse .DidNotSave
	writetext Text_PleaseWait
	special CheckLinkTimeout_Receptionist
	iffalse .LinkTimedOut
	readmem wOtherPlayerLinkMode
	iffalse .LinkedToFirstGen
	special CheckBothSelectedSameRoom
	iffalse .IncompatibleRooms
	writetext Text_PleaseComeIn
	waitbutton
	closetext
	applymovementlasttalked Pokecenter2FMovementData_ReceptionistWalksUpAndLeft_LookRight
	applymovement PLAYER, Pokecenter2FMovementData_PlayerTakesThreeStepsUp
	warpcheck
	end

.FriendNotReady:
	special WaitForOtherPlayerToExit
	writetext YourFriendIsNotReadyText
	closetext
	end

.LinkedToFirstGen:
	special FailedLinkToPast
	writetext Text_CantLinkToThePast
	special CloseLink
	closetext
	end

.IncompatibleRooms:
	writetext Text_IncompatibleRooms
	special CloseLink
	closetext
	end

.LinkTimedOut:
	writetext Text_LinkTimedOut
	sjump .AbortLink

.DidNotSave:
	writetext Text_PleaseComeAgain
.AbortLink:
	special WaitForOtherPlayerToExit
	closetext
	end

LinkReceptionistScript_Battle:
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iffalse Script_BattleRoomClosed
	special SetBitsForBattleRequest
	opentext
	writetext Text_BattleReceptionistIntro
	yesorno
	iffalse .AbortLink
	writetext Text_PleaseWait
	special WaitForLinkedFriend
	iffalse .FriendNotReady
	writetext Text_MustSaveGame
	yesorno
	iffalse .DidNotSave
	special TryQuickSave
	iffalse .DidNotSave
	writetext Text_PleaseWait
	special CheckLinkTimeout_Receptionist
	iffalse .LinkTimedOut
	readmem wOtherPlayerLinkMode
	iffalse .LinkedToFirstGen
	special CheckBothSelectedSameRoom
	iffalse .IncompatibleRooms
	writetext Text_PleaseComeIn
	waitbutton
	closetext
	applymovementlasttalked Pokecenter2FMovementData_ReceptionistWalksUpAndLeft_LookRight
	applymovement PLAYER, Pokecenter2FMovementData_PlayerTakesThreeStepsUp
	warpcheck
	end

.FriendNotReady:
	special WaitForOtherPlayerToExit
	writetext YourFriendIsNotReadyText
	closetext
	end

.LinkedToFirstGen:
	special FailedLinkToPast
	writetext Text_CantLinkToThePast
	special CloseLink
	closetext
	end

.IncompatibleRooms:
	writetext Text_IncompatibleRooms
	special CloseLink
	closetext
	end

.LinkTimedOut:
	writetext Text_LinkTimedOut
	sjump .AbortLink

.DidNotSave:
	writetext Text_PleaseComeAgain
.AbortLink:
	special WaitForOtherPlayerToExit
	closetext
	end

Script_TimeCapsuleClosed:
	faceplayer
	opentext
	writetext Text_TimeCapsuleClosed
	waitbutton
	closetext
	end

LinkReceptionistScript_TimeCapsule:
	checkevent EVENT_MET_BILL
	iftrue Script_TimeCapsuleClosed
	checkflag ENGINE_TIME_CAPSULE
	iftrue Script_TimeCapsuleClosed
	special SetBitsForTimeCapsuleRequest
	faceplayer
	opentext
	writetext Text_TimeCapsuleReceptionistIntro
	yesorno
	iffalse .Cancel
	special CheckTimeCapsuleCompatibility
	ifequal $1, .MonTooNew
	ifequal $2, .MonMoveTooNew
	ifequal $3, .MonHasMail
	writetext Text_PleaseWait
	special WaitForLinkedFriend
	iffalse .FriendNotReady
	writetext Text_MustSaveGame
	yesorno
	iffalse .DidNotSave
	special TryQuickSave
	iffalse .DidNotSave
	writetext Text_PleaseWait
	special CheckLinkTimeout_Receptionist
	iffalse .LinkTimedOut
	readmem wOtherPlayerLinkMode
	iffalse .OK
	special CheckBothSelectedSameRoom
	writetext Text_IncompatibleRooms
	special CloseLink
	closetext
	end

.OK:
	special EnterTimeCapsule
	writetext Text_PleaseComeIn
	waitbutton
	closetext
	readvar VAR_FACING
	ifequal LEFT, .FacingLeft
	ifequal RIGHT, .FacingRight
	applymovementlasttalked Pokecenter2FMovementData_ReceptionistStepsLeftLooksDown
	applymovement PLAYER, Pokecenter2FMovementData_PlayerTakesTwoStepsUp
	warpcheck
	end

.FriendNotReady:
	special WaitForOtherPlayerToExit
	writetext YourFriendIsNotReadyText
	closetext
	end

.LinkTimedOut:
	writetext Text_LinkTimedOut
	sjump .Cancel

.DidNotSave:
	writetext Text_PleaseComeAgain
.Cancel:
	special WaitForOtherPlayerToExit
	closetext
	end

.MonTooNew:
	writetext Text_RejectNewMon
	closetext
	end

.MonMoveTooNew:
	writetext Text_RejectMonWithNewMove
	closetext
	end

.MonHasMail:
	writetext Text_RejectMonWithMail
	closetext
	end

.FacingLeft:
	applymovementlasttalked Pokecenter2FMovementData_ReceptionistStepsLeftLooksDown
	applymovement PLAYER, Pokecenter2FMovementData_PlayerWalksLeftAndUp
	warpcheck
	end

.FacingRight:
	applymovementlasttalked Pokecenter2FMovementData_ReceptionistStepsRightLooksDown
	applymovement PLAYER, Pokecenter2FMovementData_PlayerWalksRightAndUp
	warpcheck
	end

Script_LeftCableTradeCenter:
	special WaitForOtherPlayerToExit
	applymovement POKECENTER2F_TRADE_RECEPTIONIST, Pokecenter2FMovementData_ReceptionistStepsRightLooksDown_3
	applymovement PLAYER, Pokecenter2FMovementData_PlayerTakesThreeStepsDown
	applymovement POKECENTER2F_TRADE_RECEPTIONIST, Pokecenter2FMovementData_ReceptionistStepsRightAndDown
	setscene SCENE_POKECENTER2F_CHECK_MYSTERY_GIFT
	setmapscene TRADE_CENTER, SCENE_TRADECENTER_INITIALIZE
	end

Script_LeftCableColosseum:
	special WaitForOtherPlayerToExit
	applymovement POKECENTER2F_BATTLE_RECEPTIONIST, Pokecenter2FMovementData_ReceptionistStepsRightLooksDown_3
	applymovement PLAYER, Pokecenter2FMovementData_PlayerTakesThreeStepsDown
	applymovement POKECENTER2F_BATTLE_RECEPTIONIST, Pokecenter2FMovementData_ReceptionistStepsRightAndDown
	setscene SCENE_POKECENTER2F_CHECK_MYSTERY_GIFT
	setmapscene COLOSSEUM, SCENE_COLOSSEUM_INITIALIZE
	end

Script_LeftTimeCapsule:
	special WaitForOtherPlayerToExit
	applymovement POKECENTER2F_TIME_CAPSULE_RECEPTIONIST, Pokecenter2FMovementData_ReceptionistStepsLeftLooksRight
	applymovement PLAYER, Pokecenter2FMovementData_PlayerTakesTwoStepsDown
	applymovement POKECENTER2F_TIME_CAPSULE_RECEPTIONIST, Pokecenter2FMovementData_ReceptionistStepsRightLooksDown_2
	setscene SCENE_POKECENTER2F_CHECK_MYSTERY_GIFT
	setmapscene TIME_CAPSULE, SCENE_TIMECAPSULE_INITIALIZE
	end

Pokecenter2FLinkRecordSign:
	reanchormap
	special DisplayLinkRecord
	closetext
	end

Pokecenter2FOfficerScript:
	faceplayer
	opentext
	checkevent EVENT_MYSTERY_GIFT_DELIVERY_GUY
	iftrue .AlreadyGotGift
	writetext Text_MysteryGiftDeliveryGuy_Intro
	yesorno
	iffalse .RefusedGift
	writetext Text_MysteryGiftDeliveryGuy_HereYouGo
	promptbutton
	waitsfx
	special GetMysteryGiftItem
	iffalse .BagIsFull
	itemnotify
	setevent EVENT_MYSTERY_GIFT_DELIVERY_GUY
.AlreadyGotGift:
	writetext Text_MysteryGiftDeliveryGuy_Outro
	waitbutton
	closetext
	end

.BagIsFull:
	writetext Text_MysteryGiftDeliveryGuy_NoRoom
	waitbutton
	closetext
	end

.RefusedGift:
	writetext Text_MysteryGiftDeliveryGuy_SaidNo
	waitbutton
	closetext
	end

Pokecenter2FMovementData_ReceptionistWalksUpAndLeft_LookRight:
	slow_step UP
Pokecenter2FMovementData_ReceptionistStepsLeftLooksDown:
	slow_step LEFT
	turn_head DOWN
	step_end

Pokecenter2FMovementData_ReceptionistStepsRightLooksDown:
	slow_step RIGHT
	turn_head DOWN
	step_end

Pokecenter2FMovementData_PlayerTakesThreeStepsUp:
	step UP
Pokecenter2FMovementData_PlayerTakesTwoStepsUp:
	step UP
	step UP
	step_end

Pokecenter2FMovementData_PlayerWalksLeftAndUp:
	step LEFT
	step UP
	step_end

Pokecenter2FMovementData_PlayerWalksRightAndUp:
	step RIGHT
	step UP
	step_end

Pokecenter2FMovementData_PlayerTakesThreeStepsDown:
	step DOWN
	step DOWN
	step DOWN
	step_end

Pokecenter2FMovementData_PlayerTakesTwoStepsDown:
	step DOWN
	step DOWN
	step_end

Pokecenter2FMovementData_ReceptionistStepsRightAndDown:
	slow_step RIGHT
	slow_step DOWN
	step_end

Pokecenter2FMovementData_ReceptionistStepsRightLooksDown_2:
	slow_step RIGHT
	turn_head DOWN
	step_end

Pokecenter2FMovementData_ReceptionistStepsRightLooksDown_3:
	slow_step UP
	slow_step LEFT
	turn_head RIGHT
	step_end

Pokecenter2FMovementData_ReceptionistStepsLeftLooksRight:
	slow_step LEFT
	turn_head RIGHT
	step_end

Text_BattleReceptionistIntro:
	text "Welkom bij het" ; "Welcome to CABLE"
	line "KABELCOLOSSEUM." ; "CLUB COLOSSEUM."

	para "Hier mag je tegen" ; "You may battle a"
	line "vrienden vechten." ; "friend here."

	para "Wil je op dit" ; "Would you like to"
	line "moment vechten?" ; "battle?"
	done

Text_TradeReceptionistIntro:
	text "Welcome to CABLE"
	line "CLUB TRADE CENTER."

	para "You may trade your"
	line "#MON here with"
	cont "a friend."

	para "Would you like to"
	line "trade?"
	done

Text_TimeCapsuleReceptionistIntro:
	text "Dit is de KABEL-" ; "Welcome to CABLE"
	line "CLUBTIJDCAPSULE." ; "CLUB TIME CAPSULE."

	para "Je kunt naar het" ; "You can travel to"
	line "verleden reizen en" ; "the past and trade"
	cont "je #MON ruilen." ; "your #MON."

	para "Wil je door de" ; "Would you like to"
	line "tijd reizen?" ; "trade across time?"
	done

YourFriendIsNotReadyText:
	text "Je vriend is nog" ; "Your friend is not"
	line "niet klaar." ; "ready."
	prompt

Text_MustSaveGame:
	text "Voor je de link" ; "Before opening the"
	line "opent, moet je" ; "link, you must"
	cont "de game opslaan." ; "save your game."
	done

Text_PleaseWait:
	text "Even geduld." ; "Please wait."
	done

Text_LinkTimedOut:
	text "De link is" ; "The link has been"
	line "gesloten wegens" ; "closed because of"
	cont "inactiviteit." ; "inactivity."

	para "Neem contact met" ; "Please contact"
	line "je vriend en" ; "your friend and"
	cont "probeer nog eens." ; "come again."
	prompt

Text_PleaseComeAgain:
	text "Graag tot snel." ; "Please come again."
	prompt

Text_PleaseComeInDuplicate: ; unreferenced
	text "Kom maar binnen." ; "Please come in."
	prompt

Text_TemporaryStagingInLinkRoom: ; unreferenced
	text "We stoppen je voor" ; "We'll put you in"
	line "dit moment in de" ; "the link room for"
	cont "linkkamer." ; "the time being."
	done

Text_CantLinkToThePast:
	text "Je kunt niet naar" ; "You can't link to"
	line "het verleden." ; "the past here."
	prompt

Text_IncompatibleRooms:
	text "Your friend chose"
	line "a different room."
	prompt

Text_PleaseComeIn:
	text "Kom maar binnen." ; "Please come in."
	done

Text_PleaseEnter: ; unreferenced
	text "Treed toe." ; "Please enter."
	prompt

Text_RejectNewMon:
	text "Sorry--@"
	text_ram wStringBuffer1 ; MaxLength MaxPokemonNameLength
	text_start
	line "mag niet mee." ; "can't be taken."
	prompt

Text_RejectMonWithNewMove:
	text "Je mag niet" ; "You can't take the"
	line "@"
	text_ram wStringBuffer1 ; MaxLength MaxPokemonNameLength
	text " mee met" ; " with a"
	cont "@"
	text_ram wStringBuffer2 ; MaxLength MaxItemNameLength
	text "."
	prompt

Text_RejectMonWithMail:
	text "Je mag niet de" ; "You can't take the"
	line "@"
	text_ram wStringBuffer1 ; MaxLength MaxPokemonNameLength
	text " met" ; " that"
	cont "POST meenemen." ; "has MAIL with you."
	prompt

Text_TimeCapsuleClosed:
	text "Het spijt me--de" ; "I'm sorry--the"
	line "TIJDCAPSULE wordt" ; "TIME CAPSULE is"
	cont "aangepast." ; "being adjusted."
	done

Text_TradeRoomClosed:
	text "Het spijt me--de" ; "I'm sorry--the"
	line "RUILMACHINE wordt" ; "TRADE MACHINE is"
	cont "aangepast." ; "being adjusted."
	done

Text_BattleRoomClosed:
	text "Het spijt me--de" ; "I'm sorry--the"
	line "VECHTMACHINE wordt" ; "BATTLE MACHINE is"
	cont "aangepast." ; "being adjusted."
	done

Text_MysteryGiftDeliveryGuy_Intro:
	text "Hallo! Jij bent" ; "Hello! You're"
	line "<PLAYER>, toch?" ; "<PLAYER>, right?"

	para "Ik heb iets voor" ; "I have some-"
	line "je." ; "thing for you."
	done

Text_MysteryGiftDeliveryGuy_HereYouGo:
	text "Alsjeblieft!" ; "Here you go!"
	done

Text_MysteryGiftDeliveryGuy_Outro:
	text "We hopen je weer" ; "We hope to serve"
	line "te bedienen." ; "you again."
	done

Text_MysteryGiftDeliveryGuy_NoRoom:
	text "Oh, je hebt hier" ; "Oh, you have no"
	line "geen plek voor." ; "space for this."

	para "Ga naar een" ; "Stop in at any"
	line "#MONCENTRUM in" ; "#MON CENTER"

	para "het land om het" ; "across the country"
	line "op te pikken." ; "to pick it up."
	done

Text_MysteryGiftDeliveryGuy_SaidNo:
	text "Nee? Dat is erg" ; "No? That's very"
	line "vreemd…" ; "strange…"
	done

Pokecenter2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0,  7, POKECENTER_2F, -1
	warp_event  5,  0, TRADE_CENTER, 1
	warp_event  9,  0, COLOSSEUM, 1
	warp_event 13,  2, TIME_CAPSULE, 1

	def_coord_events

	def_bg_events
	bg_event  7,  3, BGEVENT_READ, Pokecenter2FLinkRecordSign

	def_object_events
	object_event  5,  2, SPRITE_LINK_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, LinkReceptionistScript_Trade, -1
	object_event  9,  2, SPRITE_LINK_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, LinkReceptionistScript_Battle, -1
	object_event 13,  3, SPRITE_LINK_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, LinkReceptionistScript_TimeCapsule, -1
	object_event  1,  1, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Pokecenter2FOfficerScript, EVENT_MYSTERY_GIFT_DELIVERY_GUY
