	object_const_def
	const CELADONGAMECORNER_CLERK
	const CELADONGAMECORNER_RECEPTIONIST
	const CELADONGAMECORNER_POKEFAN_M
	const CELADONGAMECORNER_TEACHER
	const CELADONGAMECORNER_FISHING_GURU
	const CELADONGAMECORNER_FISHER1
	const CELADONGAMECORNER_FISHER2
	const CELADONGAMECORNER_GYM_GUIDE
	const CELADONGAMECORNER_GRAMPS

CeladonGameCorner_MapScripts:
	def_scene_scripts

	def_callbacks

CeladonGameCornerClerkScript:
	jumpstd GameCornerCoinVendorScript

CeladonGameCornerReceptionistScript:
	jumptextfaceplayer CeladonGameCornerReceptionistText

CeladonGameCornerPokefanMScript:
	faceplayer
	opentext
	writetext CeladonGameCornerPokefanMText
	waitbutton
	closetext
	turnobject CELADONGAMECORNER_POKEFAN_M, LEFT
	end

CeladonGameCornerTeacherScript:
	faceplayer
	opentext
	writetext CeladonGameCornerTeacherText
	waitbutton
	closetext
	turnobject CELADONGAMECORNER_TEACHER, RIGHT
	end

CeladonGameCornerFishingGuruScript:
	faceplayer
	opentext
	writetext CeladonGameCornerFishingGuruText
	waitbutton
	closetext
	turnobject CELADONGAMECORNER_FISHING_GURU, RIGHT
	end

CeladonGameCornerFisherScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_COINS_FROM_GAMBLER_AT_CELADON
	iftrue .GotCoins
	writetext CeladonGameCornerFisherText1
	promptbutton
	checkitem COIN_CASE
	iffalse .NoCoinCase
	checkcoins MAX_COINS - 1
	ifequal HAVE_MORE, .FullCoinCase
	getstring STRING_BUFFER_4, .coinname
	scall .GiveCoins
	givecoins 18
	setevent EVENT_GOT_COINS_FROM_GAMBLER_AT_CELADON
.GotCoins:
	writetext CeladonGameCornerFisherText2
	waitbutton
	closetext
	turnobject LAST_TALKED, LEFT
	end

.GiveCoins:
	jumpstd ReceiveItemScript
	end

.coinname
	db "MUNT@" ; "COIN@"

.NoCoinCase:
	writetext CeladonGameCornerFisherNoCoinCaseText
	waitbutton
	closetext
	turnobject LAST_TALKED, LEFT
	end

.FullCoinCase:
	writetext CeladonGameCornerFisherFullCoinCaseText
	waitbutton
	closetext
	turnobject LAST_TALKED, LEFT
	end

CeladonGymGuideScript:
	jumptextfaceplayer CeladonGymGuideText

CeladonGameCornerGrampsScript:
	faceplayer
	opentext
	writetext CeladonGameCornerGrampsText
	waitbutton
	closetext
	turnobject CELADONGAMECORNER_GRAMPS, LEFT
	end

CeladonGameCornerPoster1Script:
	jumptext CeladonGameCornerPoster1Text

CeladonGameCornerPoster2Script:
	jumptext CeladonGameCornerPoster2Text

CeladonGameCornerLuckySlotMachineScript:
	random 6
	ifequal 0, CeladonGameCornerSlotMachineScript
	reanchormap
	setval FALSE
	special SlotMachine
	closetext
	end

CeladonGameCornerSlotMachineScript:
	reanchormap
	setval TRUE
	special SlotMachine
	closetext
	end

CeladonGameCornerCardFlipScript:
	reanchormap
	special CardFlip
	closetext
	end

CeladonGameCornerLighterScript:
	jumptext CeladonGameCornerLighterText

CeladonGameCornerSodaCanScript:
	opentext
	writetext CeladonGameCornerSodaCanText
	waitbutton
	special CardFlip
	closetext
	end

CeladonGameCornerUnusedMovementData: ; unreferenced
	step RIGHT
	turn_head LEFT
	step_end

CeladonGameCornerReceptionistText:
	text "Welkom!" ; "Welcome!"

	para "Hiernaast mag je" ; "You may exchange"
	line "jouw munten in-" ; "your coins for"

	para "wisselen voor" ; "fabulous prizes"
	line "prachtige prijzen." ; "next door."
	done

CeladonGameCornerPokefanMText:
	text "Deze spelautomaten" ; "The slot machines"
	line "zijn het modernst" ; "are all state of"
	cont "van allemaal." ; "the art."
	done

CeladonGameCornerTeacherText:
	text "Deze spelautomaat" ; "It's this machine"
	line "wil ik." ; "I want."

	para "Gister verloor ik" ; "It cleaned me out"
	line "telkens, dus van-" ; "yesterday, so it"

	para "daag zal hij" ; "should pay out"
	line "vast uitbetalen." ; "today."
	done

CeladonGameCornerFishingGuruText:
	text "Ik denk dat deze" ; "I think this slot"
	line "spelautomaat zal" ; "machine will pay"
	cont "uitbetalen…" ; "out…"

	para "De winkansen ver-" ; "The odds vary"
	line "schillen nogal.";  "among machines."
	done

CeladonGameCornerFisherText1:
	text "Gahahaha!" ; "Gahahaha!"

	para "De munten blijven" ; "The coins just"
	line "maar rollen!" ; "keep popping out!"

	para "Wat zeg je? Wil" ; "Hm? What, kid? You"
	line "je ook spelen?" ; "want to play?"

	para "Ik zal mijn geluk" ; "I'll share my luck"
	line "met je delen!" ; "with you!"
	done

CeladonGameCornerFisherText2:
	text "Gahahaha!" ; "Gahahaha!"

	para "Het voelt goed om" ; "It makes me feel"
	line "andere mensen een" ; "good to do nice"

	para "gunst te verlenen!" ; "things for other"
	; line "mensen!" ; "people!"
	done

CeladonGameCornerFisherNoCoinCaseText:
	text "Hey, je hebt geen" ; "Hey, you don't"
	line "GELDKISTJE." ; "have a COIN CASE."

	para "Hoe moet ik je" ; "How am I supposed"
	line "nu munten geven," ; "to give you any"
	cont "kind?" ; "coins, kid?"
	done

CeladonGameCornerFisherFullCoinCaseText:
	text "Hey kind, je GELD-" ; "Hey, your COIN"
	line "KISTJE zit vol." ; "CASE is full, kid."

	para "Je bent vast ook" ; "You must be riding"
	line "de hele tijd aan" ; "a winning streak"
	cont "het winnen." ; "too."
	done

CeladonGymGuideText:
	text "He! KAMPIOEN in" ; "Hey! CHAMP in"
	line "wording!" ; "making!"

	para "Speel jij ook met" ; "Are you playing"
	line "de spelautomaten?" ; "the slots too?"

	para "Ik wil genoeg" ; "I'm trying to get"
	line "munten hebben voor" ; "enough coins for a"
	cont "een prijs-#MON." ; "prize #MON."
	
	para "Maar ik mis nog" ; "But I don't have"
	line "munten…" ; "enough coins yet…"
	done

CeladonGameCornerGrampsText:
	text "Hm. De kansen zijn" ; "Hmmm… The odds are"
	line "vast beter bij" ; "surely better for"

	para "PIKACHU's baan," ; "PIKACHU's line,"
	line "maar… Wat nu?" ; "but… What to do?"
	done

CeladonGameCornerPoster1Text:
	text "He!" ; "Hey!"

	para "Onder deze" ; "Underneath this"
	line "poster…" ; "poster…"

	para "Zit niets!" ; "There's nothing!"
	done

CeladonGameCornerPoster2Text:
	text "He!" ; "Hey!"

	para "Onder deze" ; "Underneath this"
	line "poster…" ; "poster…"

	para "Zit niets!" ; "There's nothing!"
	done

CeladonGameCornerLighterText:
	text "Er is hier een" ; "There's a lighter"
	line "aansteker." ; "here."
	done

CeladonGameCornerSodaCanText:
	text "Blikje frisdrank…" ; "A can of soda…"

	para "Er komt vast ie-" ; "Someone must be"
	line "mand voor terug…" ; "coming back…"

	para "Huh? Leeg!" ; "Huh? It's empty!"
	done

CeladonGameCorner_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 14, 13, CELADON_CITY, 6
	warp_event 15, 13, CELADON_CITY, 6

	def_coord_events

	def_bg_events
	bg_event  1,  6, BGEVENT_READ, CeladonGameCornerCardFlipScript
	bg_event  1,  7, BGEVENT_READ, CeladonGameCornerCardFlipScript
	bg_event  1,  8, BGEVENT_READ, CeladonGameCornerCardFlipScript
	bg_event  1,  9, BGEVENT_READ, CeladonGameCornerCardFlipScript
	bg_event  1, 10, BGEVENT_READ, CeladonGameCornerCardFlipScript
	bg_event  1, 11, BGEVENT_LEFT, CeladonGameCornerCardFlipScript
	bg_event  6,  6, BGEVENT_READ, CeladonGameCornerCardFlipScript
	bg_event  6,  7, BGEVENT_READ, CeladonGameCornerCardFlipScript
	bg_event  6,  8, BGEVENT_READ, CeladonGameCornerCardFlipScript
	bg_event  6,  9, BGEVENT_READ, CeladonGameCornerSodaCanScript
	bg_event  6, 10, BGEVENT_READ, CeladonGameCornerCardFlipScript
	bg_event  6, 11, BGEVENT_RIGHT, CeladonGameCornerCardFlipScript
	bg_event  7,  6, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event  7,  7, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event  7,  8, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event  7,  9, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event  7, 10, BGEVENT_READ, CeladonGameCornerSlotMachineScript
	bg_event  7, 11, BGEVENT_LEFT, CeladonGameCornerLuckySlotMachineScript
	bg_event 12,  6, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event 12,  7, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event 12,  8, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event 12,  9, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event 12, 10, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event 12, 11, BGEVENT_RIGHT, CeladonGameCornerLuckySlotMachineScript
	bg_event 13,  6, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event 13,  7, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event 13,  8, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event 13,  9, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event 13, 10, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event 13, 11, BGEVENT_LEFT, CeladonGameCornerLuckySlotMachineScript
	bg_event 18,  6, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event 18,  7, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event 18,  8, BGEVENT_READ, CeladonGameCornerLighterScript
	bg_event 18,  9, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event 18, 10, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event 18, 11, BGEVENT_RIGHT, CeladonGameCornerLuckySlotMachineScript
	bg_event 15,  0, BGEVENT_READ, CeladonGameCornerPoster1Script
	bg_event  9,  0, BGEVENT_READ, CeladonGameCornerPoster2Script

	def_object_events
	object_event  5,  2, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonGameCornerClerkScript, -1
	object_event  3,  2, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonGameCornerReceptionistScript, -1
	object_event 14, 10, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonGameCornerPokefanMScript, -1
	object_event 17,  7, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonGameCornerTeacherScript, -1
	object_event 11,  7, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonGameCornerFishingGuruScript, -1
	object_event  8, 10, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, DAY, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonGameCornerFisherScript, -1
	object_event  8, 10, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, NITE, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonGameCornerFisherScript, -1
	object_event 11,  3, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonGymGuideScript, -1
	object_event  2,  8, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonGameCornerGrampsScript, -1
