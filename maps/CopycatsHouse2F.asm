	object_const_def
	const COPYCATSHOUSE2F_COPYCAT
	const COPYCATSHOUSE2F_DODRIO
	const COPYCATSHOUSE2F_FAIRYDOLL ; lost item
	const COPYCATSHOUSE2F_MONSTERDOLL
	const COPYCATSHOUSE2F_BIRDDOLL

CopycatsHouse2F_MapScripts:
	def_scene_scripts

	def_callbacks

Copycat:
	faceplayer
	checkevent EVENT_GOT_PASS_FROM_COPYCAT
	iftrue .GotPass
	checkevent EVENT_RETURNED_LOST_ITEM_TO_COPYCAT
	iftrue .TryGivePassAgain
	checkitem LOST_ITEM
	iftrue .ReturnLostItem
	applymovement COPYCATSHOUSE2F_COPYCAT, CopycatSpinAroundMovementData
	faceplayer
	variablesprite SPRITE_COPYCAT, SPRITE_CHRIS
	special LoadUsedSpritesGFX
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .TalkAboutLostItem
	opentext
	writetext CopycatText_Male_1
	waitbutton
	closetext
	applymovement COPYCATSHOUSE2F_COPYCAT, CopycatSpinAroundMovementData
	faceplayer
	variablesprite SPRITE_COPYCAT, SPRITE_LASS
	special LoadUsedSpritesGFX
	opentext
	writetext CopycatText_QuickMimicking
	waitbutton
	closetext
	end

.TalkAboutLostItem:
	opentext
	writetext CopycatText_Male_2
	waitbutton
	closetext
	applymovement COPYCATSHOUSE2F_COPYCAT, CopycatSpinAroundMovementData
	faceplayer
	variablesprite SPRITE_COPYCAT, SPRITE_LASS
	special LoadUsedSpritesGFX
	opentext
	writetext CopycatText_Worried
	waitbutton
	closetext
	setevent EVENT_MET_COPYCAT_FOUND_OUT_ABOUT_LOST_ITEM
	end

.ReturnLostItem:
	opentext
	writetext CopycatText_GiveDoll
	promptbutton
	takeitem LOST_ITEM
	setevent EVENT_RETURNED_LOST_ITEM_TO_COPYCAT
	clearevent EVENT_COPYCATS_HOUSE_2F_DOLL
	sjump .GivePass

.TryGivePassAgain:
	opentext
.GivePass:
	writetext CopycatText_GivePass
	promptbutton
	verbosegiveitem PASS
	iffalse .Cancel
	setevent EVENT_GOT_PASS_FROM_COPYCAT
	writetext CopycatText_ExplainPass
	waitbutton
	closetext
	end

.GotPass:
	applymovement COPYCATSHOUSE2F_COPYCAT, CopycatSpinAroundMovementData
	faceplayer
	variablesprite SPRITE_COPYCAT, SPRITE_CHRIS
	special LoadUsedSpritesGFX
	opentext
	writetext CopycatText_Male_3
	waitbutton
	closetext
	applymovement COPYCATSHOUSE2F_COPYCAT, CopycatSpinAroundMovementData
	faceplayer
	variablesprite SPRITE_COPYCAT, SPRITE_LASS
	special LoadUsedSpritesGFX
	opentext
	writetext CopycatText_ItsAScream
	waitbutton
.Cancel:
	closetext
	end

CopycatsDodrio:
	opentext
	writetext CopycatsDodrioText1
	cry DODRIO
	promptbutton
	writetext CopycatsDodrioText2
	waitbutton
	closetext
	end

CopycatsHouse2FDoll:
	jumptext CopycatsHouse2FDollText

CopycatsHouse2FBookshelf:
	jumpstd PictureBookshelfScript

CopycatSpinAroundMovementData:
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	step_end

CopycatText_Male_1:
	text "<PLAYER>: Hoi! Ben" ; "<PLAYER>: Hi! Do"
	line "je dol op #MON?" ; "you like #MON?"

	para "<PLAYER>: Uh, nee," ; "<PLAYER>: Uh, no, I"
	line "ik vroeg het jou." ; "just asked you."

	para "<PLAYER>: Huh? Wat" ; "<PLAYER>: Huh?"
	line "ben je raar!" ; "You're strange!"
	done

CopycatText_QuickMimicking:
	text "NA-APER: Hm? Stop-" ; "COPYCAT: Hmm?"
	line "pen met na-apen?" ; "Quit mimicking?"

	para "Maar dat is mijn" ; "But that's my"
	line "favoriete hobby!" ; "favorite hobby!"
	done

CopycatText_Male_2:
	text "<PLAYER>: Hoi!" ; "<PLAYER>: Hi!"
	line "Ik hoor dat je" ; "I heard that you"

	para "jouw favoriete" ; "lost your favorite"
	line "#POP kwijt was." ; "# DOLL."

	para "<PLAYER>: Als ik" ; "<PLAYER>: If I find"
	line "die vind, mag ik" ; "it, you'll give me"
	cont "een TREINKAARTJE?" ; "a rail PASS?"

	para "<PLAYER>: Ik ga" ; "<PLAYER>: I'll go"
	line "voor je zoeken." ; "find it for you."

	para "Raakte je hem" ; "You think you lost"
	line "kwijt op bezoek in" ; "it when you went"
	cont "VERMILLION CITY?" ; "to VERMILION CITY?"
	done

CopycatText_Worried:
	text "NA-APER: Pardon?" ; "COPYCAT: Pardon?"

	para "Ik moet niet" ; "I shouldn't decide"
	line "beslissen wat je" ; "what you should"
	cont "moet doen?" ; "do?"

	para "Maar ik maak me" ; "But I'm really"
	line "zorgen… Wat als" ; "worried… What if"
	cont "iemand hem vindt?" ; "someone finds it?"
	done

CopycatText_GiveDoll:
	text "NA-APER: Hoera!" ; "COPYCAT: Yay!"
	line "Dat is de #POP" ; "That's my CLEFAIRY"
	cont "van CLEFAIRY!" ; "# DOLL!"

	para "Zie je waar de" ; "See the tear where"
	line "rechterpoot weer" ; "the right leg is"

	para "is vastgenaaid?" ; "sewn on? That's"
	line "Dat is bewijs!" ; "proof!"
	done

CopycatText_GivePass:
	text "OK. Hier is het" ; "OK. Here's the"
	line "TREINKAARTJE zoals" ; "MAGNET TRAIN PASS"
	cont "ik had beloofd!" ; "like I promised!"
	done

CopycatText_ExplainPass:
	text "NA-APER: Dat is" ; "COPYCAT: That's"
	line "een KAARTJE voor" ; "the PASS for the"
	cont "de MAGNEETTREIN." ; "MAGNET TRAIN."

	para "De treinmaatschap-" ; "The rail company"
	line "pij gaf mij dat" ; "man gave me that"

	para "toen ze ons oude" ; "when they tore"
	line "huis sloopten voor" ; "down our old house"
	cont "het STATION." ; "for the STATION."
	done

CopycatText_Male_3:
	text "<PLAYER>: Hoi!" ; "<PLAYER>: Hi!"
	line "Bedankt voor het" ; "Thanks a lot for"
	cont "TREINKAARTJE!" ; "the rail PASS!"

	para "<PLAYER>: Pardon?"

	para "<PLAYER>: Is het" ; "<PLAYER>: Is it"
	line "zo leuk om alles" ; "that fun to mimic"
	cont "na te apen?" ; "my every move?"
	done

CopycatText_ItsAScream:
	text "NA-APER: Echt wel!" ; "COPYCAT: You bet!"
	line "Het is dikke lol!" ; "It's a scream!"
	done

CopycatsDodrioText1:
	text "DODRIO: Gii giii!"
	done

CopycatsDodrioText2:
	text "SPIEGELTJE," ; "MIRROR, MIRROR ON"
	line "SPIEGELTJE AAN DE" ; "THE WALL, WHO'S"

	para "WAND, WIE IS DE" ; "THE FAIREST ONE OF"
	line "MOOISTE VAN HET" ; "ALL?"
	cont "LAND?"
	done

CopycatsHouse2FDollText:
	text "Een zeldzame" ; "This is a rare"
	line "#MON! Huh?"

	para "Het is een pop…" ; "It's only a doll…"
	done

CopycatsHouse2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  0, COPYCATS_HOUSE_1F, 3

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, CopycatsHouse2FBookshelf
	bg_event  1,  1, BGEVENT_READ, CopycatsHouse2FBookshelf

	def_object_events
	object_event  4,  3, SPRITE_COPYCAT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Copycat, -1
	object_event  6,  4, SPRITE_MOLTRES, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CopycatsDodrio, -1
	object_event  6,  1, SPRITE_FAIRY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CopycatsHouse2FDoll, EVENT_COPYCATS_HOUSE_2F_DOLL
	object_event  2,  1, SPRITE_MONSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CopycatsHouse2FDoll, -1
	object_event  7,  1, SPRITE_BIRD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CopycatsHouse2FDoll, -1
