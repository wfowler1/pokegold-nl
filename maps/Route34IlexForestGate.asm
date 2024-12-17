	object_const_def
	const ROUTE34ILEXFORESTGATE_TEACHER
	const ROUTE34ILEXFORESTGATE_BUTTERFREE
	const ROUTE34ILEXFORESTGATE_LASS

Route34IlexForestGate_MapScripts:
	def_scene_scripts

	def_callbacks

Route34IlexForestGateTeacherScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM12_SWEET_SCENT
	iftrue .GotSweetScent
	writetext Route34IlexForestGateTeacherText
	promptbutton
	verbosegiveitem TM_SWEET_SCENT
	iffalse .NoRoom
	setevent EVENT_GOT_TM12_SWEET_SCENT
.GotSweetScent:
	writetext Route34IlexForestGateTeacher_GotSweetScent
	waitbutton
.NoRoom:
	closetext
	end

Route34IlexForestGateButterfreeScript:
	opentext
	writetext Route34IlexForestGateButterfreeText
	cry BUTTERFREE
	waitbutton
	closetext
	end

Route34IlexForestGateLassScript:
	jumptextfaceplayer Route34IlexForestGateLassText

Route34IlexForestGateTeacherText:
	text "Och, schatje. Je" ; "Oh, honey. You're"
	line "vult je #DEX?" ; "making a #DEX?"

	para "Vast lastig als" ; "It must be hard if"
	line "#MON maar niet" ; "#MON won't"

	para "verschijnen. Pro-" ; "appear. Try using"
	line "beer deze TM." ; "this TM."
	done

Route34IlexForestGateTeacher_GotSweetScent:
	text "Het is ZOETE GEUR." ; "It's SWEET SCENT."

	para "Gebruik deze waar" ; "Use it wherever"
	line "je #MON vindt." ; "#MON appear."

	para "#MON worden" ; "#MON will be"
	line "erdoor gelokt." ; "enticed by it."
	done

Route34IlexForestGateButterfreeText:
	text "BUTTERFREE: Freeh!" ; "BUTTERFREE: Freeh!"
	done

Route34IlexForestGateLassText:
	text "Zag je het altaar" ; "Did you see the"
	line "ter ere van de" ; "shrine honoring"
	cont "beschermer?" ; "the protector?"

	para "Die waakt voor" ; "It watches over"
	line "eeuwig over" ; "the FOREST from"
	cont "het WOUD." ; "across time."

	para "Ik denk dat het" ; "I think that it"
	line "een grastype-" ; "must be a grass-"
	cont "#MON moet zijn." ; "type #MON."
	done

Route34IlexForestGate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  0, ROUTE_34, 1
	warp_event  5,  0, ROUTE_34, 2
	warp_event  4,  7, ILEX_FOREST, 1
	warp_event  5,  7, ILEX_FOREST, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  9,  3, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route34IlexForestGateTeacherScript, -1
	object_event  9,  4, SPRITE_BUTTERFREE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route34IlexForestGateButterfreeScript, -1
	object_event  3,  4, SPRITE_LASS, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route34IlexForestGateLassScript, -1
