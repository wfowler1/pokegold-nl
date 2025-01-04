	object_const_def
	const ROUTE14_POKEFAN_M1
	const ROUTE14_YOUNGSTER
	const ROUTE14_POKEFAN_M2
	const ROUTE14_KIM

Route14_MapScripts:
	def_scene_scripts

	def_callbacks

Kim:
	faceplayer
	opentext
	trade NPC_TRADE_KIM
	waitbutton
	closetext
	end

TrainerPokefanmCarter:
	trainer POKEFANM, CARTER, EVENT_BEAT_POKEFANM_CARTER, PokefanmCarterSeenText, PokefanmCarterBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmCarterAfterBattleText
	waitbutton
	closetext
	end

TrainerBirdKeeperRoy:
	trainer BIRD_KEEPER, ROY, EVENT_BEAT_BIRD_KEEPER_ROY, BirdKeeperRoySeenText, BirdKeeperRoyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperRoyAfterBattleText
	waitbutton
	closetext
	end

TrainerPokefanmTrevor:
	trainer POKEFANM, TREVOR, EVENT_BEAT_POKEFANM_TREVOR, PokefanmTrevorSeenText, PokefanmTrevorBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmTrevorAfterBattleText
	waitbutton
	closetext
	end

PokefanmCarterSeenText:
	text "Ik zeg je, het was" ; "Let me tell you,"
	line "lastig om mijn" ; "I had a hard time"

	para "geprezen #MON" ; "catching my prized"
	line "te vangen." ; "#MON."
	done

PokefanmCarterBeatenText:
	text "Awaaah!"
	done

PokefanmCarterAfterBattleText:
	text "SQUIRTLE, CHARMAN-"
	line "DER en BULBASAUR…" ; "DER and BULBASAUR…"

	para "Ik denk dat het" ; "I think that's a"
	line "een goed gebalan-" ; "well-balanced mix."
	cont "ceerde mix is." ;
	done

BirdKeeperRoySeenText:
	text "Het is mijn droom" ; "My dream is to fly"
	line "om met mijn lieve" ; "with my beloved"
	cont "vogel-#MON te" ; "bird #MON."
	cont "vliegen." ;
	done

BirdKeeperRoyBeatenText:
	text "Ik kan dromen maar" ; "I can dream, but I"
	line "nooit vliegen…" ; "can't ever fly…"
	done

BirdKeeperRoyAfterBattleText:
	text "Je hebt #MON" ; "You have #MON"
	line "die de VM VLIEG" ; "that know the HM"

	para "kennen, toch?" ; "move FLY, don't"
	line "Ik ben jaloers." ; "you? I envy you."
	done

PokefanmTrevorSeenText:
	text "Did you battle all"
	line "the GYM trainers?"
	done

PokefanmTrevorBeatenText:
	text "Oh, wow! Too"
	line "strong for me!"
	done

PokefanmTrevorAfterBattleText:
	text "If you have KANTO"
	line "BADGES, they'll"

	para "help you in linked"
	line "battles."
	done

Route14_MapEvents:
	db 0, 0 ; filler

	def_warp_events

	def_coord_events

	def_bg_events

	def_object_events
	object_event 12, 14, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerPokefanmCarter, -1
	object_event 11, 27, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperRoy, -1
	object_event  5,  9, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerPokefanmTrevor, -1
	object_event  7,  5, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 4, Kim, -1
