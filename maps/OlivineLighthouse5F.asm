	object_const_def
	const OLIVINELIGHTHOUSE5F_SAILOR
	const OLIVINELIGHTHOUSE5F_YOUNGSTER
	const OLIVINELIGHTHOUSE5F_POKE_BALL1
	const OLIVINELIGHTHOUSE5F_POKE_BALL2
	const OLIVINELIGHTHOUSE5F_POKE_BALL3

OlivineLighthouse5F_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerBirdKeeperDenis:
	trainer BIRD_KEEPER, DENIS, EVENT_BEAT_BIRD_KEEPER_DENIS, BirdKeeperDenisSeenText, BirdKeeperDenisBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperDenisAfterBattleText
	waitbutton
	closetext
	end

TrainerSailorErnest:
	trainer SAILOR, ERNEST, EVENT_BEAT_SAILOR_ERNEST, SailorErnestSeenText, SailorErnestBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SailorErnestAfterBattleText
	waitbutton
	closetext
	end

OlivineLighthouse5FRareCandy:
	itemball RARE_CANDY

OlivineLighthouse5FGreatBall:
	itemball GREAT_BALL

OlivineLighthouse5FTMSwagger:
	itemball TM_SWAGGER

OlivineLighthouse5FHiddenHyperPotion:
	hiddenitem HYPER_POTION, EVENT_OLIVINE_LIGHTHOUSE_5F_HIDDEN_HYPER_POTION

SailorErnestSeenText:
	text "Ik wou met" ; "I wanted to battle"
	line "JASMINE vechten," ; "JASMINE, but she's"

	para "maar ze kan niet." ; "not up to it now."
	line "Dus, jij wel dan?" ; "So, how about you?"
	done

SailorErnestBeatenText:
	text "Wow, wow. Je bent" ; "Whoa, whoa. You're"
	line "overweldigend!" ; "overwhelming!"
	done

SailorErnestAfterBattleText:
	text "Een GYMLEIDER is" ; "A GYM LEADER isn't"
	line "niet alleen sterk." ; "just about being"

	para "Een LEIDER moet" ; "strong. A LEADER"
	line "ook meelevend" ; "also needs to be"
	cont "zijn." ; "compassionate."
	done

BirdKeeperDenisSeenText:
	text "We zitten best" ; "We're pretty high"
	line "hoog hier. Mijn" ; "up here. My bird"

	para "vogel-#MON zijn" ; "#MON are in"
	line "in topvorm." ; "prime form."
	done

BirdKeeperDenisBeatenText:
	text "Oeps… Ze zijn" ; "Oops…They crashed…"
	line "neergestort…" ;
	done

BirdKeeperDenisAfterBattleText:
	text "Mijn #MON" ; "My #MON learned"
	line "leerde VLIEG in" ; "how to use FLY in"
	cont "CIANWOOD." ; "CIANWOOD."

	para "Nou, omdat ik een" ; "Well, since I'm a"
	line "loser ben, zal" ; "loser, I'll FLY"
	cont "ik over de zee" ; "across the sea…"
	cont "VLIEGEN…" ; 
	done

OlivineLighthouse5F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9, 15, OLIVINE_LIGHTHOUSE_6F, 1
	warp_event  3,  5, OLIVINE_LIGHTHOUSE_4F, 2
	warp_event  9,  7, OLIVINE_LIGHTHOUSE_4F, 3
	warp_event 16,  7, OLIVINE_LIGHTHOUSE_4F, 9
	warp_event 17,  7, OLIVINE_LIGHTHOUSE_4F, 10
	warp_event 16,  5, OLIVINE_LIGHTHOUSE_6F, 2
	warp_event 17,  5, OLIVINE_LIGHTHOUSE_6F, 3

	def_coord_events

	def_bg_events
	bg_event  3, 13, BGEVENT_ITEM, OlivineLighthouse5FHiddenHyperPotion

	def_object_events
	object_event  8, 11, SPRITE_SAILOR, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSailorErnest, -1
	object_event  8,  3, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerBirdKeeperDenis, -1
	object_event 15, 12, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, OlivineLighthouse5FRareCandy, EVENT_OLIVINE_LIGHTHOUSE_5F_RARE_CANDY
	object_event  6, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, OlivineLighthouse5FGreatBall, EVENT_OLIVINE_LIGHTHOUSE_5F_GREAT_BALL
	object_event  2, 13, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, OlivineLighthouse5FTMSwagger, EVENT_OLIVINE_LIGHTHOUSE_5F_TM_SWAGGER
