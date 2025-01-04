DEF GOLDENRODGAMECORNER_TM25_COINS      EQU 5500
DEF GOLDENRODGAMECORNER_TM14_COINS      EQU 5500
DEF GOLDENRODGAMECORNER_TM38_COINS      EQU 5500
DEF GOLDENRODGAMECORNER_ABRA_COINS      EQU 200
DEF GOLDENRODGAMECORNER_SANDSHREW_COINS EQU 700
DEF GOLDENRODGAMECORNER_EKANS_COINS     EQU 700
DEF GOLDENRODGAMECORNER_DRATINI_COINS   EQU 2100

	object_const_def
	const GOLDENRODGAMECORNER_CLERK
	const GOLDENRODGAMECORNER_RECEPTIONIST1
	const GOLDENRODGAMECORNER_RECEPTIONIST2
	const GOLDENRODGAMECORNER_PHARMACIST1
	const GOLDENRODGAMECORNER_PHARMACIST2
	const GOLDENRODGAMECORNER_POKEFAN_M1
	const GOLDENRODGAMECORNER_COOLTRAINER_M
	const GOLDENRODGAMECORNER_POKEFAN_F
	const GOLDENRODGAMECORNER_COOLTRAINER_F
	const GOLDENRODGAMECORNER_GENTLEMAN
	const GOLDENRODGAMECORNER_POKEFAN_M2

GoldenrodGameCorner_MapScripts:
	def_scene_scripts

	def_callbacks

GoldenrodGameCornerCoinVendorScript:
	jumpstd GameCornerCoinVendorScript

GoldenrodGameCornerTMVendorScript:
	faceplayer
	opentext
	writetext GoldenrodGameCornerPrizeVendorIntroText
	waitbutton
	checkitem COIN_CASE
	iffalse GoldenrodGameCornerPrizeVendor_NoCoinCaseScript
	writetext GoldenrodGameCornerPrizeVendorWhichPrizeText
GoldenrodGameCornerTMVendor_LoopScript:
	special DisplayCoinCaseBalance
	loadmenu GoldenrodGameCornerTMVendorMenuHeader
	verticalmenu
	closewindow
	ifequal 1, .Thunder
	ifequal 2, .Blizzard
	ifequal 3, .FireBlast
	sjump GoldenrodGameCornerPrizeVendor_CancelPurchaseScript

.Thunder:
	checkcoins GOLDENRODGAMECORNER_TM25_COINS
	ifequal HAVE_LESS, GoldenrodGameCornerPrizeVendor_NotEnoughCoinsScript
	getitemname STRING_BUFFER_3, TM_THUNDER
	scall GoldenrodGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse GoldenrodGameCornerPrizeVendor_CancelPurchaseScript
	giveitem TM_THUNDER
	iffalse GoldenrodGameCornerPrizeMonVendor_NoRoomForPrizeScript
	takecoins GOLDENRODGAMECORNER_TM25_COINS
	sjump GoldenrodGameCornerTMVendor_FinishScript

.Blizzard:
	checkcoins GOLDENRODGAMECORNER_TM14_COINS
	ifequal HAVE_LESS, GoldenrodGameCornerPrizeVendor_NotEnoughCoinsScript
	getitemname STRING_BUFFER_3, TM_BLIZZARD
	scall GoldenrodGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse GoldenrodGameCornerPrizeVendor_CancelPurchaseScript
	giveitem TM_BLIZZARD
	iffalse GoldenrodGameCornerPrizeMonVendor_NoRoomForPrizeScript
	takecoins GOLDENRODGAMECORNER_TM14_COINS
	sjump GoldenrodGameCornerTMVendor_FinishScript

.FireBlast:
	checkcoins GOLDENRODGAMECORNER_TM38_COINS
	ifequal HAVE_LESS, GoldenrodGameCornerPrizeVendor_NotEnoughCoinsScript
	getitemname STRING_BUFFER_3, TM_FIRE_BLAST
	scall GoldenrodGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse GoldenrodGameCornerPrizeVendor_CancelPurchaseScript
	giveitem TM_FIRE_BLAST
	iffalse GoldenrodGameCornerPrizeMonVendor_NoRoomForPrizeScript
	takecoins GOLDENRODGAMECORNER_TM38_COINS
	sjump GoldenrodGameCornerTMVendor_FinishScript

GoldenrodGameCornerPrizeVendor_ConfirmPurchaseScript:
	writetext GoldenrodGameCornerPrizeVendorConfirmPrizeText
	yesorno
	end

GoldenrodGameCornerTMVendor_FinishScript:
	waitsfx
	playsound SFX_TRANSACTION
	writetext GoldenrodGameCornerPrizeVendorHereYouGoText
	waitbutton
	sjump GoldenrodGameCornerTMVendor_LoopScript

GoldenrodGameCornerPrizeVendor_NotEnoughCoinsScript:
	writetext GoldenrodGameCornerPrizeVendorNeedMoreCoinsText
	waitbutton
	closetext
	end

GoldenrodGameCornerPrizeMonVendor_NoRoomForPrizeScript:
	writetext GoldenrodGameCornerPrizeVendorNoMoreRoomText
	waitbutton
	closetext
	end

GoldenrodGameCornerPrizeVendor_CancelPurchaseScript:
	writetext GoldenrodGameCornerPrizeVendorQuitText
	waitbutton
	closetext
	end

GoldenrodGameCornerPrizeVendor_NoCoinCaseScript:
	writetext GoldenrodGameCornerPrizeVendorNoCoinCaseText
	waitbutton
	closetext
	end

GoldenrodGameCornerTMVendorMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 15, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "TM25    5500@"
	db "TM14    5500@"
	db "TM38    5500@"
	db "SLUITEN@" ; "CANCEL@"

GoldenrodGameCornerPrizeMonVendorScript:
	faceplayer
	opentext
	writetext GoldenrodGameCornerPrizeVendorIntroText
	waitbutton
	checkitem COIN_CASE
	iffalse GoldenrodGameCornerPrizeVendor_NoCoinCaseScript
	checkver
	iftrue .Silver_Loop

.Gold_Loop:
	writetext GoldenrodGameCornerPrizeVendorWhichPrizeText
	special DisplayCoinCaseBalance
	loadmenu .Gold_MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .Gold_Abra
	ifequal 2, .Gold_Ekans
	ifequal 3, .Gold_Dratini
	sjump GoldenrodGameCornerPrizeVendor_CancelPurchaseScript

.Gold_Abra:
	checkcoins GOLDENRODGAMECORNER_ABRA_COINS
	ifequal HAVE_LESS, GoldenrodGameCornerPrizeVendor_NotEnoughCoinsScript
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, GoldenrodGameCornerPrizeMonVendor_NoRoomForPrizeScript
	getmonname STRING_BUFFER_3, ABRA
	scall GoldenrodGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse GoldenrodGameCornerPrizeVendor_CancelPurchaseScript
	waitsfx
	playsound SFX_TRANSACTION
	writetext GoldenrodGameCornerPrizeVendorHereYouGoText
	waitbutton
	setval ABRA
	special GameCornerPrizeMonCheckDex
	givepoke ABRA, 10
	takecoins GOLDENRODGAMECORNER_ABRA_COINS
	sjump .Gold_Loop

.Gold_Ekans:
	checkcoins GOLDENRODGAMECORNER_EKANS_COINS
	ifequal HAVE_LESS, GoldenrodGameCornerPrizeVendor_NotEnoughCoinsScript
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, GoldenrodGameCornerPrizeMonVendor_NoRoomForPrizeScript
	getmonname STRING_BUFFER_3, EKANS
	scall GoldenrodGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse GoldenrodGameCornerPrizeVendor_CancelPurchaseScript
	waitsfx
	playsound SFX_TRANSACTION
	writetext GoldenrodGameCornerPrizeVendorHereYouGoText
	waitbutton
	setval EKANS
	special GameCornerPrizeMonCheckDex
	givepoke EKANS, 10
	takecoins GOLDENRODGAMECORNER_EKANS_COINS
	sjump .Gold_Loop

.Gold_Dratini:
	checkcoins GOLDENRODGAMECORNER_DRATINI_COINS
	ifequal HAVE_LESS, GoldenrodGameCornerPrizeVendor_NotEnoughCoinsScript
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, GoldenrodGameCornerPrizeMonVendor_NoRoomForPrizeScript
	getmonname STRING_BUFFER_3, DRATINI
	scall GoldenrodGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse GoldenrodGameCornerPrizeVendor_CancelPurchaseScript
	waitsfx
	playsound SFX_TRANSACTION
	writetext GoldenrodGameCornerPrizeVendorHereYouGoText
	waitbutton
	setval DRATINI
	special GameCornerPrizeMonCheckDex
	givepoke DRATINI, 10
	takecoins GOLDENRODGAMECORNER_DRATINI_COINS
	sjump .Gold_Loop

.Gold_MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 17, TEXTBOX_Y - 1
	dw .Gold_MenuData
	db 1 ; default option

.Gold_MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "ABRA        200@"
	db "EKANS       700@"
	db "DRATINI    2100@"
	db "CANCEL@"

.Silver_Loop:
	writetext GoldenrodGameCornerPrizeVendorWhichPrizeText
	special DisplayCoinCaseBalance
	loadmenu .Silver_MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .Silver_Abra
	ifequal 2, .Silver_Sandshrew
	ifequal 3, .Silver_Dratini
	sjump GoldenrodGameCornerPrizeVendor_CancelPurchaseScript

.Silver_Abra:
	checkcoins GOLDENRODGAMECORNER_ABRA_COINS
	ifequal HAVE_LESS, GoldenrodGameCornerPrizeVendor_NotEnoughCoinsScript
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, GoldenrodGameCornerPrizeMonVendor_NoRoomForPrizeScript
	getmonname STRING_BUFFER_3, ABRA
	scall GoldenrodGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse GoldenrodGameCornerPrizeVendor_CancelPurchaseScript
	waitsfx
	playsound SFX_TRANSACTION
	writetext GoldenrodGameCornerPrizeVendorHereYouGoText
	waitbutton
	setval ABRA
	special GameCornerPrizeMonCheckDex
	givepoke ABRA, 10
	takecoins GOLDENRODGAMECORNER_ABRA_COINS
	sjump .Silver_Loop

.Silver_Sandshrew:
	checkcoins GOLDENRODGAMECORNER_SANDSHREW_COINS
	ifequal HAVE_LESS, GoldenrodGameCornerPrizeVendor_NotEnoughCoinsScript
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, GoldenrodGameCornerPrizeMonVendor_NoRoomForPrizeScript
	getmonname STRING_BUFFER_3, SANDSHREW
	scall GoldenrodGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse GoldenrodGameCornerPrizeVendor_CancelPurchaseScript
	waitsfx
	playsound SFX_TRANSACTION
	writetext GoldenrodGameCornerPrizeVendorHereYouGoText
	waitbutton
	setval SANDSHREW
	special GameCornerPrizeMonCheckDex
	givepoke SANDSHREW, 10
	takecoins GOLDENRODGAMECORNER_SANDSHREW_COINS
	sjump .Silver_Loop

.Silver_Dratini:
	checkcoins GOLDENRODGAMECORNER_DRATINI_COINS
	ifequal HAVE_LESS, GoldenrodGameCornerPrizeVendor_NotEnoughCoinsScript
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, GoldenrodGameCornerPrizeMonVendor_NoRoomForPrizeScript
	getmonname STRING_BUFFER_3, DRATINI
	scall GoldenrodGameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse GoldenrodGameCornerPrizeVendor_CancelPurchaseScript
	waitsfx
	playsound SFX_TRANSACTION
	writetext GoldenrodGameCornerPrizeVendorHereYouGoText
	waitbutton
	setval DRATINI
	special GameCornerPrizeMonCheckDex
	givepoke DRATINI, 10
	takecoins GOLDENRODGAMECORNER_DRATINI_COINS
	sjump .Silver_Loop

.Silver_MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 17, TEXTBOX_Y - 1
	dw .Silver_MenuData
	db 1 ; default option

.Silver_MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "ABRA        200@"
	db "SANDSHREW   700@"
	db "DRATINI    2100@"
	db "CANCEL@"

GoldenrodGameCornerPharmacistScript:
	faceplayer
	opentext
	writetext GoldenrodGameCornerPharmacistText
	waitbutton
	closetext
	turnobject LAST_TALKED, LEFT
	end

GoldenrodGameCornerPokefanM1Script:
	faceplayer
	opentext
	writetext GoldenrodGameCornerPokefanM1Text
	waitbutton
	closetext
	turnobject GOLDENRODGAMECORNER_POKEFAN_M1, RIGHT
	end

GoldenrodGameCornerCooltrainerMScript:
	faceplayer
	opentext
	writetext GoldenrodGameCornerCooltrainerMText
	waitbutton
	closetext
	turnobject GOLDENRODGAMECORNER_COOLTRAINER_M, LEFT
	end

GoldenrodGameCornerPokefanFScript:
	faceplayer
	opentext
	writetext GoldenrodGameCornerPokefanFText
	waitbutton
	closetext
	turnobject GOLDENRODGAMECORNER_POKEFAN_F, RIGHT
	end

GoldenrodGameCornerCooltrainerFScript:
	jumptextfaceplayer GoldenrodGameCornerCooltrainerFText

GoldenrodGameCornerGentlemanScript:
	faceplayer
	opentext
	writetext GoldenrodGameCornerGentlemanText
	waitbutton
	closetext
	turnobject GOLDENRODGAMECORNER_GENTLEMAN, RIGHT
	end

GoldenrodGameCornerPokefanM2Script:
	jumptextfaceplayer GoldenrodGameCornerPokefanM2Text

GoldenrodGameCornerSlotsMachineScript:
	random 6
	ifequal 0, GoldenrodGameCornerLuckySlotsMachineScript
	reanchormap
	setval FALSE
	special SlotMachine
	closetext
	end

GoldenrodGameCornerLuckySlotsMachineScript:
	reanchormap
	setval TRUE
	special SlotMachine
	closetext
	end

GoldenrodGameCornerCardFlipMachineScript:
	reanchormap
	special CardFlip
	closetext
	end

GoldenrodGameCornerPrizeVendorIntroText:
	text "Welkom!" ; "Welcome!"

	para "Wij ruilen je" ; "We exchange your"
	line "spelmunten voor" ; "game coins for"
	cont "fantastische" ; "fabulous prizes!"
	cont "prijzen!" ; 
	done

GoldenrodGameCornerPrizeVendorWhichPrizeText:
	text "Welke prijs" ; "Which prize would"
	line "wil je?" ; "you like?"
	done

GoldenrodGameCornerPrizeVendorConfirmPrizeText:
	text_ram wStringBuffer3 ; MaxLength MaxItemNameLength
	text "."
	line "Klopt dat?" ; "Is that right?"
	done

GoldenrodGameCornerPrizeVendorHereYouGoText:
	text "Alsjeblieft!" ; "Here you go!"
	done

GoldenrodGameCornerPrizeVendorNeedMoreCoinsText:
	text "Sorry! Je hebt" ; "Sorry! You need"
	line "meer munten nodig." ; "more coins."
	done

GoldenrodGameCornerPrizeVendorNoMoreRoomText:
	text "Sorry. Je kan" ; "Sorry. You can't"
	line "niet meer dragen." ; "carry any more."
	done

GoldenrodGameCornerPrizeVendorQuitText:
	text "Oké. Spaar je" ; "OK. Please save"
	line "munten en kom" ; "your coins and"
	cont "dan terug!" ; "come again!"
	done

GoldenrodGameCornerPrizeVendorNoCoinCaseText:
	text "Oh? Je hebt" ; "Oh? You don't have"
	line "geen GELDKISTJE." ; "a COIN CASE."
	done

GoldenrodGameCornerPharmacistText: ; AlwaysReplace
if DEF(_CRYSTAL_AU)
	text "Deze machine ziet" ; "This machine looks"
	line "er hetzelfde uit" ; "the same as the"
	cont "als de anderen." ; "others."
	done
else
	text "Ik speel altijd" ; "I always play this"
	line "deze spelautomaat." ; "slot machine. It"

	para "Hij betaalt meer" ; "pays out more than"
	line "uit dan anderen," ; "others, I think."
	cont "denk ik." ; 
	done
endc

GoldenrodGameCornerPokefanM1Text: ; AlwaysReplace
if DEF(_CRYSTAL_AU)
	text "Deze automaten" ; "These machines"
	line "lijken anders" ; "seem different"

	para "dan die in" ; "from the ones at"
	line "CELADON CITY!"
	done
else
	text "Ik hou van deze" ; "I just love this"
	line "nieuwe automaat." ; "new slot machine."

	para "Hij is uitdagender" ; "It's more of a"
	line "dan de automaat" ; "challenge than the"
	cont "in CELADON." ; "ones in CELADON."
	done
endc

GoldenrodGameCornerCooltrainerMText: ; AlwaysReplace
if DEF(_CRYSTAL_AU)
	text "Niets is zeker" ; "Nothing is certain"
	line "op dit gebied." ; "in this area."
	done
else
	text "Het leven is een" ; "Life is a gamble."
	line "gok. Ik ga kaarten" ; "I'm going to flip"
	cont "flippen tot ik er" ; "cards till I drop!"
	cont "bij neerval!"
	done
endc

GoldenrodGameCornerPokefanFText: ; AlwaysReplace
	text "Kaartflipper…" ; "Card flip…"

if DEF(_CRYSTAL_AU)
	para "Anders dan de" ; "Different from the"
	line "andere automaten." ; "other machines."
	done
else
	para "Ik heb dit liever" ; "I prefer it over"
	line "dan de automaten," ; "the slots because"

	para "het is simpeler" ; "it's easier to"
	line "om de kansen te" ; "figure the odds."

	para "berekenen. Maar de" ; "But the payout is"
	line "bedragen zijn " ; "much lower."
	cont "lager." ;
	done
endc

GoldenrodGameCornerCooltrainerFText:
	text "Ik stop niet tot" ; "I won't quit until"
	line "ik win!" ; "I win!"
	done

GoldenrodGameCornerGentlemanText:
	text "Ik heb m'n #MON" ; "I taught BLIZZARD"
	line "SNEEUWSTORM" ; "to my #MON."
	cont "geleerd." ;

	para "Het was lastig" ; "It was hard to get"
	line "genoeg munten te" ; "enough coins for"

	para "krijgen, maar het" ; "it, but it was"
	line "was het waard." ; "worth it."
	done

GoldenrodGameCornerPokefanM2Text:
	text "Ik kon niet win-" ; "I couldn't win at"
	line "nen bij de auto-" ; "the slots, and I"

	para "maten, en ik heb" ; "blew it on card"
	line "het bij kaarten" ; "flipping…"
	cont "flippen verpest…"

	para "Ik werd zo kwaad," ; "I got so furious,"
	line "dat ik m'n GELD-" ; "I tossed out my"

	para "KISTJE in het" ; "COIN CASE in the"
	line "ONDERGRONDSE heb" ; "UNDERGROUND."
	cont "gegooid." ;
	done

GoldenrodGameCorner_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2, 13, GOLDENROD_CITY, 11
	warp_event  3, 13, GOLDENROD_CITY, 11

	def_coord_events

	def_bg_events
	bg_event  6,  6, BGEVENT_READ, GoldenrodGameCornerSlotsMachineScript
	bg_event  6,  7, BGEVENT_READ, GoldenrodGameCornerSlotsMachineScript
	bg_event  6,  8, BGEVENT_READ, GoldenrodGameCornerSlotsMachineScript
	bg_event  6,  9, BGEVENT_READ, GoldenrodGameCornerSlotsMachineScript
	bg_event  6, 10, BGEVENT_READ, GoldenrodGameCornerSlotsMachineScript
	bg_event  6, 11, BGEVENT_RIGHT, GoldenrodGameCornerSlotsMachineScript
	bg_event  7,  6, BGEVENT_READ, GoldenrodGameCornerSlotsMachineScript
	bg_event  7,  7, BGEVENT_READ, GoldenrodGameCornerLuckySlotsMachineScript
	bg_event  7,  8, BGEVENT_READ, GoldenrodGameCornerSlotsMachineScript
	bg_event  7,  9, BGEVENT_READ, GoldenrodGameCornerSlotsMachineScript
	bg_event  7, 10, BGEVENT_READ, GoldenrodGameCornerSlotsMachineScript
	bg_event  7, 11, BGEVENT_LEFT, GoldenrodGameCornerSlotsMachineScript
	bg_event 12,  6, BGEVENT_READ, GoldenrodGameCornerSlotsMachineScript
	bg_event 12,  7, BGEVENT_READ, GoldenrodGameCornerSlotsMachineScript
	bg_event 12,  8, BGEVENT_READ, GoldenrodGameCornerSlotsMachineScript
	bg_event 12,  9, BGEVENT_READ, GoldenrodGameCornerSlotsMachineScript
	bg_event 12, 10, BGEVENT_READ, GoldenrodGameCornerSlotsMachineScript
	bg_event 12, 11, BGEVENT_RIGHT, GoldenrodGameCornerSlotsMachineScript
	bg_event 13,  6, BGEVENT_READ, GoldenrodGameCornerCardFlipMachineScript
	bg_event 13,  7, BGEVENT_READ, GoldenrodGameCornerCardFlipMachineScript
	bg_event 13,  8, BGEVENT_READ, GoldenrodGameCornerCardFlipMachineScript
	bg_event 13,  9, BGEVENT_READ, GoldenrodGameCornerCardFlipMachineScript
	bg_event 13, 10, BGEVENT_READ, GoldenrodGameCornerCardFlipMachineScript
	bg_event 13, 11, BGEVENT_LEFT, GoldenrodGameCornerCardFlipMachineScript
	bg_event 18,  6, BGEVENT_READ, GoldenrodGameCornerCardFlipMachineScript
	bg_event 18,  7, BGEVENT_READ, GoldenrodGameCornerCardFlipMachineScript
	bg_event 18,  8, BGEVENT_READ, GoldenrodGameCornerCardFlipMachineScript
	bg_event 18,  9, BGEVENT_READ, GoldenrodGameCornerCardFlipMachineScript
	bg_event 18, 10, BGEVENT_READ, GoldenrodGameCornerCardFlipMachineScript
	bg_event 18, 11, BGEVENT_RIGHT, GoldenrodGameCornerCardFlipMachineScript

	def_object_events
	object_event  3,  2, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodGameCornerCoinVendorScript, -1
	object_event 16,  2, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodGameCornerTMVendorScript, -1
	object_event 18,  2, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodGameCornerPrizeMonVendorScript, -1
	object_event  8,  7, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, DAY, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GoldenrodGameCornerPharmacistScript, -1
	object_event  8,  7, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, NITE, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GoldenrodGameCornerPharmacistScript, -1
	object_event 11, 10, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, GoldenrodGameCornerPokefanM1Script, -1
	object_event 14,  8, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GoldenrodGameCornerCooltrainerMScript, -1
	object_event 17,  6, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodGameCornerPokefanFScript, -1
	object_event 10,  3, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WANDER, 2, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodGameCornerCooltrainerFScript, -1
	object_event  5, 10, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GoldenrodGameCornerGentlemanScript, -1
	object_event  2,  9, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, GoldenrodGameCornerPokefanM2Script, -1
