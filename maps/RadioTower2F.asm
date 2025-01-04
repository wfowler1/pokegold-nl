	object_const_def
	const RADIOTOWER2F_SUPER_NERD
	const RADIOTOWER2F_TEACHER
	const RADIOTOWER2F_ROCKET1
	const RADIOTOWER2F_ROCKET2
	const RADIOTOWER2F_ROCKET3
	const RADIOTOWER2F_ROCKET_GIRL
	const RADIOTOWER2F_BLACK_BELT1
	const RADIOTOWER2F_BLACK_BELT2
	const RADIOTOWER2F_JIGGLYPUFF

RadioTower2F_MapScripts:
	def_scene_scripts

	def_callbacks

RadioTower2FNoopScene: ; unreferenced
	end

RadioTower2FSuperNerdScript:
	jumptextfaceplayer RadioTower2FSuperNerdText

RadioTower2FTeacherScript:
	faceplayer
	opentext
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .Rockets
	writetext RadioTower2FTeacherText
	waitbutton
	closetext
	end

.Rockets:
	writetext RadioTower2FTeacherText_Rockets
	waitbutton
	closetext
	end

RadioTowerJigglypuff:
	opentext
	writetext RadioTowerJigglypuffText
	cry JIGGLYPUFF
	waitbutton
	closetext
	end

RadioTower2FBlackBelt1Script:
	jumptextfaceplayer RadioTower2FBlackBelt1Text

RadioTower2FBlackBelt2Script:
	jumptextfaceplayer RadioTower2FBlackBelt2Text

TrainerGruntM4:
	trainer GRUNTM, GRUNTM_4, EVENT_BEAT_ROCKET_GRUNTM_4, GruntM4SeenText, GruntM4BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM4AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntM5:
	trainer GRUNTM, GRUNTM_5, EVENT_BEAT_ROCKET_GRUNTM_5, GruntM5SeenText, GruntM5BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM5AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntM6:
	trainer GRUNTM, GRUNTM_6, EVENT_BEAT_ROCKET_GRUNTM_6, GruntM6SeenText, GruntM6BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM6AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntF2:
	trainer GRUNTF, GRUNTF_2, EVENT_BEAT_ROCKET_GRUNTF_2, GruntF2SeenText, GruntF2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntF2AfterBattleText
	waitbutton
	closetext
	end

RadioTower2FSalesSign:
	jumptext RadioTower2FSalesSignText

RadioTower2FOaksPKMNTalkSign:
	jumptext RadioTower2FOaksPKMNTalkSignText

RadioTower2FPokemonRadioSign:
	jumptext RadioTower2FPokemonRadioSignText

RadioTower2FBookshelf:
	jumpstd MagazineBookshelfScript

RadioTower2FSuperNerdText:
	text "Je kan overal" ; "You can listen to"
	line "naar de radio" ; "the radio any-"
	cont "luisteren." ; "where. Tune in!"
	done

RadioTower2FTeacherText:
	text "Slaapliedjes op" ; "Lullabies on the"
	line "de radio laten" ; "radio may make"
	cont "#MON slapen." ; "#MON sleep."
	done

RadioTower2FTeacherText_Rockets:
	text "Waarom zouden ze" ; "Why would they"
	line "de RADIOTOREN" ; "want to take over"
	cont "willen overnemen?" ; "the RADIO TOWER?"
	done

RadioTowerJigglypuffText:
	text "JIGGLYPUFF:"
	line "Jiggly…"
	done

RadioTower2FBlackBelt1Text:
	text "Sorry. Alleen ge-" ; "Sorry. Authorized"
	line "authoriseerd per-" ; "personnel only"
	cont "soneel hier." ; "beyond this point."

	para "Dat was eerst" ; "It wasn't that way"
	line "anders." ; "before."

	para "Er is iets mis" ; "There's something"
	line "met de" ; "wrong with the"
	cont "DIRECTEUR…" ; "DIRECTOR…"
	done

RadioTower2FBlackBelt2Text:
	text "Kijk gerust" ; "Feel free to look"
	line "overal rond." ; "around anywhere."

	para "De DIRECTEUR is" ; "The DIRECTOR is"
	line "weer aardig, net" ; "nice again, just"
	cont "als eerst." ; "as he was before."
	done

GruntM4SeenText:
	text "Drie jaar geleden" ; "Three years ago,"
	line "moest TEAM ROCKET" ; "TEAM ROCKET was"
	cont "ontbinden." ; "forced to disband."

	para "Maar we maken hier" ; "But we're making a"
	line "een terugkeer!" ; "comeback here!"
	done

GruntM4BeatenText:
	text "Hè gèt!" ; "Gwah! Don't get"
	line "Kappen nou!" ; "cute!"
	done

GruntM4AfterBattleText:
	text "We laten je niet" ; "We won't let you"
	line "onze terugkeer" ; "ruin our plans"
	cont "dwarsbomen!" ; "for our comeback!"
	done

GruntM5SeenText:
	text "Wij zijn TEAM" ; "We're TEAM ROCKET,"
	line "ROCKET, uitbuters" ; "the exploiters of"
	cont "van #MON!"

	para "We zijn graag" ; "We love being"
	line "kwaadaardig! Bang?" ; "evil! Scared?"
	done

GruntM5BeatenText:
	text "Denk je dat je" ; "You think you're a"
	line "een held bent?" ; "hero?"
	done

GruntM5AfterBattleText:
	text "We zijn niet al-" ; "We're not always"
	line "tijd slecht. We" ; "evil. We just do"
	cont "doen gewoon wat we" ; "whatever we like."
	cont "willen." ;
	done

GruntM6SeenText:
	text "Hé, hé!" ; "Hey, hey! Keep out"
	line "Uit de weg!" ; "of our way!"
	done

GruntM6BeatenText:
	text "Arggh. Ik geef op." ; "Arggh. I give up."
	done

GruntM6AfterBattleText:
	text "Onze MANAGERS pro-" ; "Our EXECUTIVES are"
	line "beren deze plek" ; "trying to take"
	cont "over te nemen." ; "this place over."

	para "Ze hebben een of" ; "They have some big"
	line "ander groot plan." ; "plan. I wonder"
	cont "Wat zou 't zijn?" ; "what that is?"
	done

GruntF2SeenText:
	text "Hahaha!"

	para "Saai. Het was veel" ; "How boring."
	line "te makkelijk om" ; "It was far too"

	para "deze tent over te" ; "easy to take over"
	line "nemen!" ; "this place!"

	para "Kom, vermaak" ; "Come on, keep me"
	line "me een beetje!" ; "amused!"
	done

GruntF2BeatenText:
	text "W-wie ben je?" ; "Wh-who are you?"
	done

GruntF2AfterBattleText:
	text "Je hebt me ver-" ; "You beat me, and"
	line "slagen, dat ver-" ; "I won't forget it!"
	cont "geet ik niet!" ;
	done

RadioTower2FSalesSignText:
	text "1V SALES" ; "2F SALES"
	done

RadioTower2FOaksPKMNTalkSignText:
	text "PROF.OAK'S" ; "PROF.OAK'S #MON"
	line "#MONPRAAT" ; "TALK"

	para "De meest spraak-" ; "The Hottest Show"
	line "makende show" ; "on the Air!"
	cont "in de ether!" ;
	done

RadioTower2FPokemonRadioSignText:
	text "Overal, Altijd" ; "Anywhere, Anytime"
	line "#MON-Radio"
	done

RadioTower2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0,  0, RADIO_TOWER_3F, 1
	warp_event 15,  0, RADIO_TOWER_1F, 3

	def_coord_events

	def_bg_events
	bg_event  3,  0, BGEVENT_READ, RadioTower2FSalesSign
	bg_event  5,  0, BGEVENT_READ, RadioTower2FOaksPKMNTalkSign
	bg_event  9,  1, BGEVENT_READ, RadioTower2FBookshelf
	bg_event 10,  1, BGEVENT_READ, RadioTower2FBookshelf
	bg_event 11,  1, BGEVENT_READ, RadioTower2FBookshelf
	bg_event 13,  0, BGEVENT_READ, RadioTower2FPokemonRadioSign

	def_object_events
	object_event  5,  6, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RadioTower2FSuperNerdScript, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 13,  2, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RadioTower2FTeacherScript, -1
	object_event  1,  4, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM4, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  8,  4, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM5, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  4,  1, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerGruntM6, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 10,  5, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerGruntF2, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  0,  1, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RadioTower2FBlackBelt1Script, EVENT_RADIO_TOWER_BLACKBELT_BLOCKS_STAIRS
	object_event  1,  1, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RadioTower2FBlackBelt2Script, EVENT_RADIO_TOWER_CIVILIANS_AFTER
	object_event 12,  1, SPRITE_JIGGLYPUFF, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RadioTowerJigglypuff, -1
