	object_const_def
	const CELADONPOKECENTER1F_NURSE
	const CELADONPOKECENTER1F_GENTLEMAN
	const CELADONPOKECENTER1F_PHARMACIST
	const CELADONPOKECENTER1F_COOLTRAINER_F

CeladonPokecenter1F_MapScripts:
	def_scene_scripts

	def_callbacks

CeladonPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

CeladonPokecenter1FGentlemanScript:
	jumpstd HappinessCheckScript

CeladonPokecenter1FCooltrainerFScript:
	jumptextfaceplayer CeladonPokecenter1FCooltrainerFText

CeladonPokecenter1FPharmacistScript:
	jumptextfaceplayer CeladonPokecenter1FPharmacistText

CeladonPokecenter1FCooltrainerFText:
	text "ERIKA is een" ; "ERIKA is a master"
	line "meester van gras-" ; "of grass #MON."
	cont "#MON." ; 

	para "Ze rekent met je" ; "She'll make you"
	line "af als je niet" ; "pay if you don't"
	cont "uitkijkt." ; "watch yourself."
	done

CeladonPokecenter1FPharmacistText:
	text "TEAM ROCKET's"
	line "schuilplaats is" ; "hideout is in the"

	para "in de kelder van" ; "basement of the"
	line "de SPELHOEK." ; "GAME CORNER."

	para "Oh, wacht. Dat was" ; "Oh, wait. That was"
	line "drie jaar geleden." ; "three years ago."
	done

CeladonPokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, CELADON_CITY, 5
	warp_event  4,  7, CELADON_CITY, 5
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonPokecenter1FNurseScript, -1
	object_event  1,  5, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonPokecenter1FGentlemanScript, -1
	object_event  6,  1, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonPokecenter1FPharmacistScript, -1
	object_event  6,  5, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonPokecenter1FCooltrainerFScript, -1
