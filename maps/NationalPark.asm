	const_def 2 ; object constants
	const NATIONALPARK_LASS1
	const NATIONALPARK_POKEFAN_F1
	const NATIONALPARK_TEACHER1
	const NATIONALPARK_YOUNGSTER1
	const NATIONALPARK_YOUNGSTER2
	const NATIONALPARK_TEACHER2
	const NATIONALPARK_PERSIAN
	const NATIONALPARK_YOUNGSTER3
	const NATIONALPARK_POKEFAN_F2
	const NATIONALPARK_POKEFAN_M
	const NATIONALPARK_LASS2
	const NATIONALPARK_POKE_BALL1
	const NATIONALPARK_GAMEBOY_KID
	const NATIONALPARK_POKE_BALL2

NationalPark_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

NationalParkLassScript:
	jumptextfaceplayer NationalParkLassText

NationalParkPokefanFScript:
	jumptextfaceplayer NationalParkPokefanFText

NationalParkTeacher1Script:
	faceplayer
	opentext
	checkevent EVENT_GOT_QUICK_CLAW
	iftrue .GotQuickClaw
	writetext NationalParkTeacher1Text
	promptbutton
	verbosegiveitem QUICK_CLAW
	iffalse .NoRoom
	setevent EVENT_GOT_QUICK_CLAW
.GotQuickClaw:
	writetext NationalParkTeacher1Text_GotQuickClaw
	waitbutton
.NoRoom:
	closetext
	end

NationalParkYoungster1Script:
	jumptextfaceplayer NationalParkYoungster1Text

NationalParkYoungster2Script:
	jumptextfaceplayer NationalParkYoungster2Text

NationalParkTeacher2Script:
	jumptextfaceplayer NationalParkTeacher2Text

NationalParkPersian:
	faceplayer
	opentext
	writetext NationalParkPersianText
	cry PERSIAN
	waitbutton
	closetext
	end

NationalParkGameboyKidScript:
	faceplayer
	opentext
	writetext NationalParkGameboyKidText
	waitbutton
	closetext
	turnobject NATIONALPARK_GAMEBOY_KID, DOWN
	end

TrainerSchoolboyJack1:
	trainer SCHOOLBOY, JACK1, EVENT_BEAT_SCHOOLBOY_JACK, SchoolboyJack1SeenText, SchoolboyJack1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	checkevent EVENT_JACK_READY_FOR_REMATCH
	iftrue .Rematch
	checkcellnum PHONE_SCHOOLBOY_JACK
	iftrue .NumberAccepted
	checkevent EVENT_JACK_ASKED_FOR_PHONE_NUMBER
	iftrue .AskAgain
	writetext UnknownText_0x5c4f3
	promptbutton
	setevent EVENT_JACK_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjump .RequestNumber

.AskAgain:
	scall .AskNumber2
.RequestNumber:
	askforphonenumber PHONE_SCHOOLBOY_JACK
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	gettrainername STRING_BUFFER_3, SCHOOLBOY, JACK1
	scall .RegisteredNumber
	sjump .NumberAccepted

.Rematch:
	scall .RematchStd
	winlosstext SchoolboyJack1BeatenText, 0
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .LoadFight2
	checkflag EVENT_MANIA_TOOK_SHUCKIE_OR_LET_YOU_KEEP_HIM ; XXX ???
	iftrue .LoadFight1
	loadtrainer SCHOOLBOY, JACK1
	startbattle
	reloadmapafterbattle
	clearevent EVENT_JACK_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer SCHOOLBOY, JACK2
	startbattle
	reloadmapafterbattle
	clearevent EVENT_JACK_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer SCHOOLBOY, JACK3
	startbattle
	reloadmapafterbattle
	clearevent EVENT_JACK_READY_FOR_REMATCH
	end

.AskNumber1:
	jumpstd asknumber1m
	end

.AskNumber2:
	jumpstd asknumber2m
	end

.RegisteredNumber:
	jumpstd registerednumberm
	end

.NumberAccepted:
	jumpstd numberacceptedm
	end

.NumberDeclined:
	jumpstd numberdeclinedm
	end

.PhoneFull:
	jumpstd phonefullm
	end

.RematchStd:
	jumpstd rematchm
	end

TrainerPokefanmWilliam:
	trainer POKEFANM, WILLIAM, EVENT_BEAT_POKEFANM_WILLIAM, PokefanmWilliamSeenText, PokefanmWilliamBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmWilliamAfterBattleText
	waitbutton
	closetext
	end

TrainerPokefanfBeverly1:
	trainer POKEFANF, BEVERLY1, EVENT_BEAT_POKEFANF_BEVERLY, PokefanfBeverly1SeenText, PokefanfBeverly1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	checkevent EVENT_BEVERLY_READY_FOR_REMATCH
	iftrue .Rematch
	checkcellnum PHONE_POKEFAN_BEVERLY
	iftrue .NumberAccepted
	checkevent EVENT_BEVERLY_ASKED_FOR_PHONE_NUMBER
	iftrue .AskAgain
	writetext UnknownText_0x5c68a
	promptbutton
	setevent EVENT_BEVERLY_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjump .RequestNumber

.AskAgain:
	scall .AskNumber2
.RequestNumber:
	askforphonenumber PHONE_POKEFAN_BEVERLY
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	gettrainername STRING_BUFFER_3, POKEFANF, BEVERLY1
	scall .RegisteredNumber
	sjump .NumberAccepted

.Rematch:
	scall .RematchStd
	winlosstext PokefanfBeverly1BeatenText, 0
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .LoadFight2
	checkflag EVENT_GOT_PINK_BOW_FROM_MARY
	iftrue .LoadFight1
	loadtrainer POKEFANF, BEVERLY1
	startbattle
	reloadmapafterbattle
	clearevent EVENT_BEVERLY_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer POKEFANF, BEVERLY2
	startbattle
	reloadmapafterbattle
	clearevent EVENT_BEVERLY_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer POKEFANF, BEVERLY3
	startbattle
	reloadmapafterbattle
	clearevent EVENT_BEVERLY_READY_FOR_REMATCH
	end

.AskNumber1:
	jumpstd asknumber1f
	end

.AskNumber2:
	jumpstd asknumber2f
	end

.RegisteredNumber:
	jumpstd registerednumberf
	end

.NumberAccepted:
	jumpstd numberacceptedf
	end

.NumberDeclined:
	jumpstd numberdeclinedf
	end

.PhoneFull:
	jumpstd phonefullf
	end

.RematchStd:
	jumpstd rematchf
	end

TrainerLassKrise:
	trainer LASS, KRISE, EVENT_BEAT_LASS_KRISE, LassKriseSeenText, LassKriseBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassKriseAfterBattleText
	waitbutton
	closetext
	end

NationalParkRelaxationSquareSign:
	jumptext NationalParkRelaxationSquareText

NationalParkBattleNoticeSign:
	jumptext NationalParkBattleNoticeText

NationalParkTrainerTipsSign:
	jumptext NationalParkTrainerTipsText

NationalParkParlyzHeal:
	itemball PARLYZ_HEAL

NationalParkTMDig:
	itemball TM_DIG

NationalParkHiddenFullHeal:
	hiddenitem FULL_HEAL, EVENT_NATIONAL_PARK_HIDDEN_FULL_HEAL

NationalParkLassText:
	text "Look! Check out my"
	line "bag!"

	para "I printed out my"
	line "favorites from my"

	para "#DEX and stuck"
	line "them on my bag."
	done

NationalParkPokefanFText:
	text "This is MAIL I got"
	line "from my daughter."
	cont "It cheers me up."
	done

NationalParkTeacher1Text:
	text "Pay attention,"
	line "please!"

	para "…Oops, I have to"
	line "quit thinking like"

	para "a teacher all the"
	line "time."

	para "You must be a"
	line "#MON trainer."

	para "Since you're work-"
	line "ing so hard, I"

	para "want you to have"
	line "this."
	done

NationalParkTeacher1Text_GotQuickClaw:
	text "Let a #MON hold"
	line "that QUICK CLAW."

	para "Sometimes it will"
	line "strike first"
	cont "during battle."
	done

NationalParkYoungster1Text:
	text "I'm playing with"
	line "stickers I printed"
	cont "from my #DEX."
	done

NationalParkYoungster2Text:
	text "I get the other"
	line "guy's #DEX"
	cont "sticker if I win."
	done

NationalParkTeacher2Text:
	text "I take walks in"
	line "the PARK, but I"

	para "never go into the"
	line "grass."

	para "Trainers always"
	line "want to battle…"
	done

NationalParkPersianText:
	text "PERSIAN: Fufushaa!"
	done

NationalParkGameboyKidText:
	text "I'm printing out"
	line "my #DEX."

	para "You can also print"
	line "out stuff like"

	para "MAIL and your PC"
	line "BOXES."
	done

SchoolboyJack1SeenText:
	text "The world of"
	line "#MON is deep."

	para "There are still"
	line "lots of things we"
	cont "don't know."

	para "But I know more"
	line "than you do!"
	done

SchoolboyJack1BeatenText:
	text "Wha-wha-what?"
	done

UnknownText_0x5c4f3:
	text "There is a lot"
	line "to learn."

	para "For example…"

	para "There are 50 kinds"
	line "of TM."

	para "Traded #MON"
	line "level up faster."
	done

PokefanfBeverly1SeenText:
	text "My #MON are so"
	line "cute. Let me show"
	cont "them off to you."
	done

PokefanfBeverly1BeatenText:
	text "Maybe I can't beat"
	line "you in battle…"

	para "But mine look a"
	line "lot nicer."
	done

UnknownText_0x5c68a:
	text "My friend has a"
	line "MARILL. It's so"

	para "cute! I wish I had"
	line "a MARILL."
	done

PokefanmWilliamSeenText:
	text "We adore our #-"
	line "MON, even if they"
	cont "dislike us."

	para "That's what being"
	line "a FAN is about."
	done

PokefanmWilliamBeatenText:
	text "M-my #MON!"
	done

PokefanmWilliamAfterBattleText:
	text "I lost the battle,"
	line "but my #MON win"

	para "the prize for"
	line "being most lovely."
	done

LassKriseSeenText:
	text "Hello? Why are you"
	line "staring at me?"

	para "Oh, a battle?"
	done

LassKriseBeatenText:
	text "…Hmmm…"
	done

LassKriseAfterBattleText:
	text "The way you were"
	line "looking, I thought"
	cont "you liked me."

	para "After all, I am"
	line "cute!"
	done

NationalParkRelaxationSquareText:
	text "RELAXATION SQUARE"
	line "NATIONAL PARK"
	done

NationalParkBattleNoticeText:
	text "What is this"
	line "notice?"

	para "Please battle only"
	line "in the grass."

	para "NATIONAL PARK"
	line "WARDEN'S OFFICE"
	done

NationalParkTrainerTipsText:
	text "TRAINER TIPS"

	para "Print out MAIL by"
	line "opening it then"
	cont "pressing START."
	done

NationalPark_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 33, 18, ROUTE_36_NATIONAL_PARK_GATE, 1
	warp_event 33, 19, ROUTE_36_NATIONAL_PARK_GATE, 2
	warp_event 10, 47, ROUTE_35_NATIONAL_PARK_GATE, 1
	warp_event 11, 47, ROUTE_35_NATIONAL_PARK_GATE, 2

	db 0 ; coord events

	db 4 ; bg events
	bg_event 14, 44, BGEVENT_READ, NationalParkRelaxationSquareSign
	bg_event 27, 31, BGEVENT_READ, NationalParkBattleNoticeSign
	bg_event  6, 47, BGEVENT_ITEM, NationalParkHiddenFullHeal
	bg_event 12,  4, BGEVENT_READ, NationalParkTrainerTipsSign

	db 14 ; object events
	object_event 15, 24, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, NationalParkLassScript, -1
	object_event 14,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, NationalParkPokefanFScript, -1
	object_event 27, 40, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, NationalParkTeacher1Script, -1
	object_event 11, 41, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, NationalParkYoungster1Script, -1
	object_event 10, 41, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, NationalParkYoungster2Script, -1
	object_event 17, 41, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 1, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, NationalParkTeacher2Script, -1
	object_event 26, 40, SPRITE_GROWLITHE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, NationalParkPersian, -1
	object_event 27, 23, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSchoolboyJack1, -1
	object_event 18, 29, SPRITE_POKEFAN_F, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerPokefanfBeverly1, -1
	object_event 16,  9, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerPokefanmWilliam, -1
	object_event  8, 14, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerLassKrise, -1
	object_event 35, 12, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, NationalParkParlyzHeal, EVENT_NATIONAL_PARK_PARLYZ_HEAL
	object_event 26,  6, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, NationalParkGameboyKidScript, -1
	object_event  1, 43, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, NationalParkTMDig, EVENT_NATIONAL_PARK_TM_DIG
