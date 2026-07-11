	object_const_def
	const VERMILIONFISHINGSPEECHHOUSE_FISHING_GURU

VermilionFishingSpeechHouse_MapScripts:
	def_scene_scripts

	def_callbacks

FishingDude:
	jumptextfaceplayer FishingDudeText

FishingDudesHousePhoto:
	jumptext FishingDudesHousePhotoText

FishingDudesHouseBookshelf: ; unreferenced
	jumpstd PictureBookshelfScript

FishingDudeText:
	text "Ik ben de VIS-" ; "I am the FISHING"
	line "GOEROE, de oudste" ; "GURU, the elder of"
	cont "VISBROEDER." ; "the FISHING BROS."

	para "Ken je toe-" ; "Do you happen to"
	line "vallig VISSER" ; "know FISHERMAN"

	para "WILTON? Hij vist" ; "WILTON? He fishes"
	line "op ROUTE 44." ; "on ROUTE 44."

	para "Hij gaf een ge-" ; "He came through"
	line "weldige tip via" ; "with an amazing"
	cont "de telefoon." ; "tip on the phone."

	para "Dankzij hem heb" ; "Thanks to him, I"
	line "ik 'n hoop zeld-" ; "caught a whole lot"

	para "zame #MON ge-" ; "of a rare #MON."
	line "vangen. Wat een" ; "What a day it was!"
	cont "dag!"
	done

FishingDudesHousePhotoText:
	text "Het is een foto" ; "It's a photo of"
	line "van wat vissers…" ; "people fishing…"

	para "Ze hebben het naar" ; "They're having a"
	line "hun zin…" ; "great time…"
	done

VermilionFishingSpeechHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, VERMILION_CITY, 1
	warp_event  3,  7, VERMILION_CITY, 1

	def_coord_events

	def_bg_events
	bg_event  3,  0, BGEVENT_READ, FishingDudesHousePhoto

	def_object_events
	object_event  2,  4, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, FishingDude, -1
