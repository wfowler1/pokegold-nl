	object_const_def
	const GOLDENRODPOKECENTER1F_NURSE
	const GOLDENRODPOKECENTER1F_GAMEBOY_KID
	const GOLDENRODPOKECENTER1F_FISHER
	const GOLDENRODPOKECENTER1F_TWIN

GoldenrodPokecenter1F_MapScripts:
	def_scene_scripts

	def_callbacks

GoldenrodPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

GoldenrodPokecenter1FGameboyKidScript:
	faceplayer
	opentext
	writetext GoldenrodPokecenter1FGameboyKidText
	waitbutton
	closetext
	turnobject GOLDENRODPOKECENTER1F_GAMEBOY_KID, DOWN
	end

GoldenrodPokecenter1FPersonScript:
	jumptextfaceplayer GoldenrodPokecenter1FPersonText

GoldenrodPokecenter1FLassScript:
	jumptextfaceplayer GoldenrodPokecenter1FLassText

GoldenrodPokecenter1FGameboyKidText:
	text "Het COLOSSEUM--" ; "The COLOSSEUM--"
	line "boven elk" ; "upstairs at any"

	para "#MONCENTRUM--" ; "#MON CENTER--is"
	line "is voor link-" ; "for link battles."

	para "gevechten." ; "Battle records are"
	line "Resultaten worden" ; "posted on the"

	para "aan de muur ge-" ; "wall, so I can't"
	line "hangen, dus ik kan" ; "afford to lose."
	cont "niet verliezen."
	done

GoldenrodPokecenter1FPersonText:
	text "Ik vraag me af" ; "I wonder how many"
	line "hoeveel soorten" ; "kinds of #MON"

	para "#MON er in de" ; "there are in the"
	line "wereld zijn." ; "world."

	para "Drie jaar geleden" ; "Three years ago,"
	line "zei PROF.OAK dat" ; "PROF.OAK said that"

	para "er 150 soorten" ; "there were 150"
	line "waren." ; "different kinds."
	done

GoldenrodPokecenter1FLassText:
	text "Een #MON van" ; "A higher level"
	line "een hoger level" ; "#MON doesn't"
	cont "wint niet altijd." ; "always win."

	para "Het type kan bij-" ; "After all, it may"
	line "voorbeeld niet" ; "have a type dis-"
	cont "gunstig zijn." ; "advantage."

	para "Ik denk dat er" ; "I don't think"
	line "niet één sterkste" ; "there is a single"

	para "#MON te vinden" ; "#MON that is"
	line "is." ; the toughest."
	done

GoldenrodPokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, GOLDENROD_CITY, 7
	warp_event  4,  7, GOLDENROD_CITY, 7
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodPokecenter1FNurseScript, -1
	object_event  7,  2, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodPokecenter1FGameboyKidScript, -1
	object_event  8,  6, SPRITE_FISHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodPokecenter1FPersonScript, -1
	object_event  0,  5, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodPokecenter1FLassScript, -1
