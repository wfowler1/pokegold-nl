	object_const_def
	const HALLOFFAME_LANCE

HallOfFame_MapScripts:
	def_scene_scripts
	scene_script HallOfFameEnterScene, SCENE_HALLOFFAME_ENTER
	scene_script HallOfFameNoopScene,  SCENE_HALLOFFAME_NOOP

	def_callbacks

HallOfFameEnterScene:
	sdefer HallOfFameEnterScript
	end

HallOfFameNoopScene:
	end

HallOfFameEnterScript:
	follow HALLOFFAME_LANCE, PLAYER
	applymovement HALLOFFAME_LANCE, HallOfFame_WalkUpWithLance
	stopfollow
	turnobject PLAYER, RIGHT
	opentext
	writetext HallOfFame_LanceText
	waitbutton
	closetext
	turnobject HALLOFFAME_LANCE, UP
	applymovement PLAYER, HallOfFame_SlowlyApproachMachine
	setscene SCENE_HALLOFFAME_NOOP
	pause 15
	setval HEALMACHINE_HALL_OF_FAME
	special HealMachineAnim
	setevent EVENT_BEAT_ELITE_FOUR
	setevent EVENT_TELEPORT_GUY
	setevent EVENT_RIVAL_SPROUT_TOWER
	clearevent EVENT_RED_IN_MT_SILVER
	setevent EVENT_OLIVINE_PORT_SPRITES_BEFORE_HALL_OF_FAME
	clearevent EVENT_OLIVINE_PORT_SPRITES_AFTER_HALL_OF_FAME
	setmapscene SPROUT_TOWER_3F, SCENE_SPROUTTOWER3F_NOOP
	special HealParty
	checkevent EVENT_GOT_SS_TICKET_FROM_ELM
	iftrue .SkipPhoneCall
	specialphonecall SPECIALCALL_SSTICKET
.SkipPhoneCall:
	halloffame
	end

HallOfFame_WalkUpWithLance:
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step RIGHT
	turn_head LEFT
	step_end

HallOfFame_SlowlyApproachMachine:
	slow_step UP
	step_end

HallOfFame_LanceText:
	text "LANCE: Het is lang" ; "LANCE: It's been a"
	line "geleden sinds ik" ; "long time since I"
	cont "hier ben geweest." ; "last came here."

	para "Hier eren we de" ; "This is where we"
	line "LEAGUE KAMPIOENEN" ; "honor the LEAGUE"

	para "tot in de" ; "CHAMPIONS for all"
	line "eeuwigheid." ; "eternity."

	para "Hun dappere" ; "Their courageous"
	line "#MON zijn ook" ; "#MON are also"
	cont "inbegrepen." ; "inducted."

	para "Vandaag zagen we" ; "Here today, we"
	line "hier de komst" ; "witnessed the rise"

	para "van een nieuwe" ; "of a new LEAGUE"
	line "LEAGUE KAMPIOEN--" ; "CHAMPION--a"

	para "een trainer die" ; "trainer who feels"
	line "compassie voelt" ; "compassion for,"

	para "voor, en ver-" ; "and trust in, his"
	line "trouwt op zijn" ; "#MON."

	para "#MON." ; "A trainer who"
	line "Een trainer die" ; "succeeded through"

	para "slaagde dankzij" ; "perseverance and"
	line "doorzettings-" ; "determination."

	para "vermogen en" ; "The new LEAGUE"
	line "vastberadenheid." ; "CHAMPION who has"

	para "De nieuwe LEAGUE-" ; "all the makings"
	line "KAMPIOEN heeft" ; "of greatness!"

	para "alles in zich om" ; "<PLAYER>, allow me"
	line "een grote worden!" ; "to register you"

	para "<PLAYER>, laat me" ; "and your partners"
	line "jou en je partners" ; "as CHAMPIONS!"
	para "als KAMPIOENEN"
	line "registreren!"
	done

HallOfFame_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 13, LANCES_ROOM, 3
	warp_event  5, 13, LANCES_ROOM, 4

	def_coord_events

	def_bg_events

	def_object_events
	object_event  4, 12, SPRITE_LANCE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
