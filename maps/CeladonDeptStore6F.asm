DEF CELADONDEPTSTORE6F_FRESH_WATER_PRICE EQU 200
DEF CELADONDEPTSTORE6F_SODA_POP_PRICE    EQU 300
DEF CELADONDEPTSTORE6F_LEMONADE_PRICE    EQU 350

	object_const_def
	const CELADONDEPTSTORE6F_SUPER_NERD
	const CELADONDEPTSTORE6F_YOUNGSTER

CeladonDeptStore6F_MapScripts:
	def_scene_scripts

	def_callbacks

CeladonDeptStore6FSuperNerdScript:
	jumptextfaceplayer CeladonDeptStore6FSuperNerdText

CeladonDeptStore6FYoungsterScript:
	jumptextfaceplayer CeladonDeptStore6FYoungsterText

CeladonDeptStore6FVendingMachine:
	opentext
	writetext CeladonVendingText
.Start:
	special PlaceMoneyTopRight
	loadmenu .MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .FreshWater
	ifequal 2, .SodaPop
	ifequal 3, .Lemonade
	closetext
	end

.FreshWater:
	checkmoney YOUR_MONEY, CELADONDEPTSTORE6F_FRESH_WATER_PRICE
	ifequal HAVE_LESS, .NotEnoughMoney
	giveitem FRESH_WATER
	iffalse .NotEnoughSpace
	takemoney YOUR_MONEY, CELADONDEPTSTORE6F_FRESH_WATER_PRICE
	getitemname STRING_BUFFER_3, FRESH_WATER
	sjump .VendItem

.SodaPop:
	checkmoney YOUR_MONEY, CELADONDEPTSTORE6F_SODA_POP_PRICE
	ifequal HAVE_LESS, .NotEnoughMoney
	giveitem SODA_POP
	iffalse .NotEnoughSpace
	takemoney YOUR_MONEY, CELADONDEPTSTORE6F_SODA_POP_PRICE
	getitemname STRING_BUFFER_3, SODA_POP
	sjump .VendItem

.Lemonade:
	checkmoney YOUR_MONEY, CELADONDEPTSTORE6F_LEMONADE_PRICE
	ifequal HAVE_LESS, .NotEnoughMoney
	giveitem LEMONADE
	iffalse .NotEnoughSpace
	takemoney YOUR_MONEY, CELADONDEPTSTORE6F_LEMONADE_PRICE
	getitemname STRING_BUFFER_3, LEMONADE
	sjump .VendItem

.VendItem:
	pause 10
	playsound SFX_ENTER_DOOR
	writetext CeladonClangText
	promptbutton
	itemnotify
	sjump .Start

.NotEnoughMoney:
	writetext CeladonVendingNoMoneyText
	waitbutton
	sjump .Start

.NotEnoughSpace:
	writetext CeladonVendingNoSpaceText
	waitbutton
	sjump .Start

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "VERS WATER   ¥{d:CELADONDEPTSTORE6F_FRESH_WATER_PRICE}@" ; "FRESH WATER  ¥{d:CELADONDEPTSTORE6F_FRESH_WATER_PRICE}@"
	db "FRISDRANK    ¥{d:CELADONDEPTSTORE6F_SODA_POP_PRICE}@" ; "SODA POP     ¥{d:CELADONDEPTSTORE6F_SODA_POP_PRICE}@"
	db "LIMONADE     ¥{d:CELADONDEPTSTORE6F_LEMONADE_PRICE}@" ; "LEMONADE     ¥{d:CELADONDEPTSTORE6F_LEMONADE_PRICE}@"
	db "SLUITEN@" ; "CANCEL@"

CeladonDeptStore6FDirectory:
	jumptext CeladonDeptStore6FDirectoryText

CeladonDeptStore6FElevatorButton: ; unreferenced
	jumpstd ElevatorButtonScript

CeladonVendingText:
	text "Een drankautomaat!" ; "A vending machine!"
	line "Dit is het menu." ; "Here's the menu."
	done

CeladonClangText:
	text "Kletter!" ; "Clang!"

	para "@" ; "@"
	text_ram wStringBuffer3 ; MaxLength MaxItemNameLength
	text_start
	line "kwam tevoorschijn." ; "popped out."
	done

CeladonVendingNoMoneyText:
	text "Oeps, niet genoeg" ; "Oops, not enough"
	line "geld…" ; "money…"
	done

CeladonVendingNoSpaceText:
	text "Er is geen ruimte" ; "There's no more"
	line "meer voor spullen…" ; "room for stuff…"
	done

CeladonDeptStore6FSuperNerdText:
	text "Een drankautomaat" ; "A vending machine"
	line "waarmee je prij-" ; "with a prize rou-"
	cont "zen kan winnen…" ; "lette…"

	para "Die zie je haast" ; "You never see"
	line "nooit meer." ; "those anymore."
	done

CeladonDeptStore6FYoungsterText:
	text "Aww! Er zijn hier" ; "Aww! There's no"
	line "geen spelletjes!" ; "games here!"

	para "Ik wilde spelen…" ; "I wanted to play…"
	done

CeladonDeptStore6FDirectoryText:
	text "5V: DAKTERRAS" ; "6F: ROOFTOP SQUARE"
	line "DRANKAUTOMATEN" ; "VENDING MACHINES"
	done

CeladonDeptStore6F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 15,  0, CELADON_DEPT_STORE_5F, 2
	warp_event  2,  0, CELADON_DEPT_STORE_ELEVATOR, 1

	def_coord_events

	def_bg_events
	bg_event 14,  0, BGEVENT_READ, CeladonDeptStore6FDirectory
	bg_event  3,  0, BGEVENT_READ, CeladonDeptStore1FElevatorButton
	bg_event  8,  1, BGEVENT_UP, CeladonDeptStore6FVendingMachine
	bg_event  9,  1, BGEVENT_UP, CeladonDeptStore6FVendingMachine
	bg_event 10,  1, BGEVENT_UP, CeladonDeptStore6FVendingMachine
	bg_event 11,  1, BGEVENT_UP, CeladonDeptStore6FVendingMachine

	def_object_events
	object_event  9,  2, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonDeptStore6FSuperNerdScript, -1
	object_event 12,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 2, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonDeptStore6FYoungsterScript, -1
