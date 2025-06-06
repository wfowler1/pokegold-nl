	object_const_def
	const ROUTE30_YOUNGSTER1
	const ROUTE30_YOUNGSTER2
	const ROUTE30_YOUNGSTER3
	const ROUTE30_BUG_CATCHER
	const ROUTE30_YOUNGSTER4
	const ROUTE30_MONSTER1
	const ROUTE30_MONSTER2
	const ROUTE30_FRUIT_TREE1
	const ROUTE30_FRUIT_TREE2
	const ROUTE30_COOLTRAINER_F

Route30_MapScripts:
	def_scene_scripts

	def_callbacks

YoungsterJoey_ImportantBattleScript:
	waitsfx
	playmusic MUSIC_JOHTO_TRAINER_BATTLE
	opentext
	writetext Text_UseTackle
	pause 30
	closetext
	playsound SFX_TACKLE
	applymovement ROUTE30_MONSTER2, Route30_JoeysRattataAttacksMovement
	opentext
	faceplayer
	writetext Text_ThisIsABigBattle
	waitbutton
	turnobject ROUTE30_YOUNGSTER1, UP
	closetext
	playsound SFX_TACKLE
	applymovement ROUTE30_MONSTER1, Route30_MikeysRattataAttacksMovement
	special RestartMapMusic
	end

TrainerYoungsterJoey:
	trainer YOUNGSTER, JOEY1, EVENT_BEAT_YOUNGSTER_JOEY, YoungsterJoey1SeenText, YoungsterJoey1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	checkevent EVENT_JOEY_READY_FOR_REMATCH
	iftrue .Rematch
	checkcellnum PHONE_YOUNGSTER_JOEY
	iftrue .NumberAccepted
	checkevent EVENT_JOEY_ASKED_FOR_PHONE_NUMBER
	iftrue .AskAgain
	writetext YoungsterJoey1AfterText
	promptbutton
	setevent EVENT_JOEY_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjump .RequestNumber

.AskAgain:
	scall .AskNumber2
.RequestNumber:
	askforphonenumber PHONE_YOUNGSTER_JOEY
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	gettrainername STRING_BUFFER_3, YOUNGSTER, JOEY1
	scall .RegisteredNumber
	sjump .NumberAccepted

.Rematch:
	scall .RematchStd
	winlosstext YoungsterJoey1BeatenText, 0
	checkflag ENGINE_FLYPOINT_OLIVINE
	iftrue .LoadFight2
	checkflag ENGINE_FLYPOINT_GOLDENROD
	iftrue .LoadFight1
	loadtrainer YOUNGSTER, JOEY1
	startbattle
	reloadmapafterbattle
	clearevent EVENT_JOEY_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer YOUNGSTER, JOEY2
	startbattle
	reloadmapafterbattle
	clearevent EVENT_JOEY_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer YOUNGSTER, JOEY3
	startbattle
	reloadmapafterbattle
	clearevent EVENT_JOEY_READY_FOR_REMATCH
	end

.AskNumber1:
	jumpstd AskNumber1MScript
	end

.AskNumber2:
	jumpstd AskNumber2MScript
	end

.RegisteredNumber:
	jumpstd RegisteredNumberMScript
	end

.NumberAccepted:
	jumpstd NumberAcceptedMScript
	end

.NumberDeclined:
	jumpstd NumberDeclinedMScript
	end

.PhoneFull:
	jumpstd PhoneFullMScript
	end

.RematchStd:
	jumpstd RematchMScript
	end

TrainerYoungsterMikey:
	trainer YOUNGSTER, MIKEY, EVENT_BEAT_YOUNGSTER_MIKEY, YoungsterMikeySeenText, YoungsterMikeyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterMikeyAfterText
	waitbutton
	closetext
	end

TrainerBugCatcherDon:
	trainer BUG_CATCHER, DON, EVENT_BEAT_BUG_CATCHER_DON, BugCatcherDonSeenText, BugCatcherDonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BugCatcherDonAfterText
	waitbutton
	closetext
	end

Route30YoungsterScript:
	faceplayer
	opentext
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue .CompletedEggQuest
	writetext Route30YoungsterText_DirectionsToMrPokemonsHouse
	waitbutton
	closetext
	end

.CompletedEggQuest:
	writetext Route30YoungsterText_EveryoneIsBattling
	waitbutton
	closetext
	end

Route30CooltrainerFScript:
	jumptextfaceplayer Route30CooltrainerFText

Route30Sign:
	jumptext Route30SignText

MrPokemonsHouseDirectionsSign:
	jumptext MrPokemonsHouseDirectionsSignText

MrPokemonsHouseSign:
	jumptext MrPokemonsHouseSignText

Route30TrainerTips:
	jumptext Route30TrainerTipsText

Route30FruitTree1:
	fruittree FRUITTREE_ROUTE_30_1

Route30FruitTree2:
	fruittree FRUITTREE_ROUTE_30_2

Route30HiddenPotion:
	hiddenitem POTION, EVENT_ROUTE_30_HIDDEN_POTION

Route30_JoeysRattataAttacksMovement:
	fix_facing
	big_step UP
	big_step DOWN
	step_end

Route30_MikeysRattataAttacksMovement:
	fix_facing
	big_step DOWN
	big_step UP
	step_end

Text_UseTackle:
	text "Ga, RATTATA!" ; "Go, RATTATA!"

	para "TACKLE!"
	done

Text_ThisIsABigBattle:
	text "Wat? Dit is een" ; "What? This is a"
	line "groots gevecht!" ; "big battle!"
	cont "Laat me met rust!" ; "Leave me alone!"
	done

YoungsterJoey1SeenText:
	text "Ik heb net ver-" ; "I just lost, so"
	line "loren, dus zoek nu" ; "I'm trying to find"
	cont "nieuwe #MON." ; "more #MON."

	para "Wacht! Jij ziet er" ; "Wait! You look"
	line "zwak uit! Kom," ; "weak! Come on,"
	cont "laten we knokken!" ; "let's battle!"
	done

YoungsterJoey1BeatenText:
	text "Ugh. I don't have"
	line "any more #MON."
	done

YoungsterJoey1AfterText:
	text "I have to have"
	line "more #MON for"
	cont "battles."

	para "I'm going to catch"
	line "some more!"
	done

YoungsterMikeySeenText:
	text "Je bent een #-" ; "You're a #MON"
	line "MON-trainer, toch?" ; "trainer, right?"

	para "Dan moet je met" ; "Then you have to"
	line "mij vechten!" ; "battle!"
	done

YoungsterMikeyBeatenText:
	text "Wat raar." ; "That's strange."
	line "Eerder won ik nog." ; "I won before."
	done

YoungsterMikeyAfterText:
	text "Een goede trainer" ; "Becoming a good"
	line "worden is erg" ; "trainer is really"
	cont "lastig." ; "tough."

	para "Ik ga met andere" ; "I'm going to bat-"
	line "mensen vechten om" ; "tle other people"
	cont "beter te worden." ; "to get better."
	done

BugCatcherDonSeenText:
	text "In plaats van een" ; "Instead of a bug"
	line "insect-#MON," ; "#MON, I found"
	cont "vond ik jou!" ; "a trainer!"
	done

BugCatcherDonBeatenText:
	text "Argh! Je bent te" ; "Argh! You're too"
	line "sterk!" ; "strong!"
	done

BugCatcherDonAfterText:
	text "Mijn #BALLEN" ; "I ran out of #"
	line "raakten op tij-" ; "BALLS while I was"
	cont "dens het vangen." ; "catching #MON."

	para "Ik had meer moeten" ; "I should've bought"
	line "kopen…" ; "some more…"
	done

Route30YoungsterText_DirectionsToMrPokemonsHouse:
	text "MR.#MON's" ; "MR.#MON's"
	line "huis? Die staat" ; "house? It's a bit"
	cont "iets verderop." ; "farther ahead."
	done

Route30YoungsterText_EveryoneIsBattling:
	text "Iedereen heeft lol" ; "Everyone's having"
	line "tijdens het" ; "fun battling!"
	cont "vechten! Doe mee!" ; "You should too!"
	done

Route30CooltrainerFText:
	text "Ik ben geen" ; "I'm not a trainer."
	line "trainer."

	para "Kijk een trainer" ; "But if you look"
	line "in de ogen, en je" ; "one in the eyes,"
	cont "moet vechten." ; "prepare to battle.
	done

Route30SignText:
	text "ROUTE 30"

	para "VIOLET CITY -"
	line "CHERRYGROVE CITY"
	done

MrPokemonsHouseDirectionsSignText:
	text "MR.#MON's HUIS" ; "MR.#MON'S HOUSE"
	line "Recht Vooruit!" ; "Straight Ahead!"
	done

MrPokemonsHouseSignText:
	text "MR.#MON'S HUIS" ; "MR.#MON'S HOUSE"
	done

Route30TrainerTipsText:
	text "TRAINERTIPS" ; "TRAINER TIPS"

	para "Niet andermans" ; "No stealing other"
	line "#MON stelen!" ; "people's #MON!"

	para "#BALLEN zijn" ; "# BALLS are to"
	line "voor wilde" ; "be thrown only at"
	cont "#MON!" ; "wild #MON!"
	done

Route30_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  7, 39, ROUTE_30_BERRY_HOUSE, 1
	warp_event 17,  5, MR_POKEMONS_HOUSE, 1

	def_coord_events

	def_bg_events
	bg_event  9, 43, BGEVENT_READ, Route30Sign
	bg_event 13, 29, BGEVENT_READ, MrPokemonsHouseDirectionsSign
	bg_event 15,  5, BGEVENT_READ, MrPokemonsHouseSign
	bg_event  3, 21, BGEVENT_READ, Route30TrainerTips
	bg_event 14,  9, BGEVENT_ITEM, Route30HiddenPotion

	def_object_events
	object_event  5, 26, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, YoungsterJoey_ImportantBattleScript, EVENT_ROUTE_30_BATTLE
	object_event  6, 29, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerYoungsterJoey, EVENT_ROUTE_30_YOUNGSTER_JOEY
	object_event  5, 23, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerYoungsterMikey, -1
	object_event  4,  7, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerBugCatcherDon, -1
	object_event  7, 31, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route30YoungsterScript, -1
	object_event  5, 24, SPRITE_MONSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROUTE_30_BATTLE
	object_event  5, 25, SPRITE_MONSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROUTE_30_BATTLE
	object_event  5, 39, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route30FruitTree1, -1
	object_event 11,  5, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route30FruitTree2, -1
	object_event  2, 13, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route30CooltrainerFScript, -1
