	object_const_def
	const OLIVINECAFE_SAILOR
	const OLIVINECAFE_FISHING_GURU

OlivineCafe_MapScripts:
	def_scene_scripts

	def_callbacks

OlivineCafeStrengthSailorScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_HM04_STRENGTH
	iftrue .GotStrength
	writetext OlivineCafeStrengthSailorText
	promptbutton
	verbosegiveitem HM_STRENGTH
	setevent EVENT_GOT_HM04_STRENGTH
.GotStrength:
	writetext OlivineCafeStrengthSailorText_GotStrength
	waitbutton
	closetext
	end

OlivineCafeFishingGuruScript:
	jumptextfaceplayer OlivineCafeFishingGuruText

OlivineCafeStrengthSailorText:
	text "Hah! Je #MON" ; "Hah! Your #MON"
	line "zien eruit als" ; "sure look like"
	cont "lichtgewichten!" ; "lightweights!"

	para "Ze hebben niet de" ; "They don't have"
	line "kracht om rotsen" ; "the power to move"
	cont "te verplaatsen." ; "boulders aside."

	para "Hier, gebruik dit" ; "Here, use this"
	line "en leer ze" ; "and teach them"
	cont "KRACHT!" ; "STRENGTH!"

	para "Je hebt een BADGE" ; "You'll need"
	line "GOLDENROD's GYM"

	para "nodig om 't" ; "BADGE to use that"
	line "buiten gevechten" ; "outside battles."
	cont "te gebruiken."
	done

OlivineCafeStrengthSailorText_GotStrength:
	text "Op zee kan" ; "On the sea, the"
	line "je alleen op" ; "only thing you can"

	para "je eigen rekenen!" ; "count on is your"
	;line "rekenen!" ; "own good self!"

	para "Ik ben zo trots" ; "I'm so proud of my"
	line "op m'n gespierde" ; "buff bod!"
	cont "lijf!" ; 
	done

OlivineCafeFishingGuruText:
	text "Ga je over zee?" ; "Crossing the sea?"
	line "Luister dan goed!" ; "Then listen up!"

	para "Er zijn draai-" ; "There are whirl-"
	line "kolken op weg" ; "pools on the way"
	cont "naar CIANWOOD." ; "to CIANWOOD."

	para "Je #MON moeten" ; "Your #MON must"
	line "een speciale" ; "know a special"

	para "aanval kennen om" ; "move to get over"
	line "er overheen te" ; "the whirlpools."
	cont "gaan."
	done

OlivineCafe_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, OLIVINE_CITY, 7
	warp_event  3,  7, OLIVINE_CITY, 7

	def_coord_events

	def_bg_events

	def_object_events
	object_event  4,  3, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineCafeStrengthSailorScript, -1
	object_event  1,  5, SPRITE_FISHING_GURU, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineCafeFishingGuruScript, -1
