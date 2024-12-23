	object_const_def
	const OLIVINELIGHTHOUSE2F_SAILOR
	const OLIVINELIGHTHOUSE2F_GENTLEMAN

OlivineLighthouse2F_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerGentlemanAlfred:
	trainer GENTLEMAN, ALFRED, EVENT_BEAT_GENTLEMAN_ALFRED, GentlemanAlfredSeenText, GentlemanAlfredBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GentlemanAlfredAfterBattleText
	waitbutton
	closetext
	end

TrainerSailorHuey:
	trainer SAILOR, HUEY1, EVENT_BEAT_SAILOR_HUEY, SailorHueySeenText, SailorHueyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	checkevent EVENT_HUEY_READY_FOR_REMATCH
	iftrue .WantsBattle
	checkcellnum PHONE_SAILOR_HUEY
	iftrue .NumberAccepted
	checkevent EVENT_HUEY_ASKED_FOR_PHONE_NUMBER
	iftrue .AskedBefore
	writetext SailorHueyAfterBattleText
	promptbutton
	setevent EVENT_HUEY_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjump .AskForNumber

.AskedBefore:
	scall .AskNumber2
.AskForNumber:
	askforphonenumber PHONE_SAILOR_HUEY
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	gettrainername STRING_BUFFER_3, SAILOR, HUEY1
	scall .RegisteredNumber
	sjump .NumberAccepted

.WantsBattle:
	scall .Rematch
	winlosstext SailorHueyBeatenText, 0
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight2
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .LoadFight1
	loadtrainer SAILOR, HUEY1
	startbattle
	reloadmapafterbattle
	clearevent EVENT_HUEY_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer SAILOR, HUEY2
	startbattle
	reloadmapafterbattle
	clearevent EVENT_HUEY_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer SAILOR, HUEY3
	startbattle
	reloadmapafterbattle
	clearevent EVENT_HUEY_READY_FOR_REMATCH
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

.Rematch:
	jumpstd RematchMScript
	end

SailorHueySeenText:
	text "Zeemannen zijn" ; "Men of the sea are"
	line "altijd in voor" ; "always spoiling"
	cont "een goed gevecht!" ; "for a good fight!"
	done

SailorHueyBeatenText:
	text "Oef!" ; "Urf!"
	line "Ik verlies!" ; "I lose!"
	done

SailorHueyAfterBattleText: ; ReplaceWith SailorHueyUnusedText:
	text "Wat een kracht!" ; "What power!"
	line "Wil je anders met" ; "How would you like"

	para "mij de zeeën" ; "to sail the seas"
	line "bevaren?" ; "with me?"
	done

GentlemanAlfredSeenText:
	text "Hm? Dit is geen" ; "Hm? This is no"
	line "plek om te spelen." ; "place for playing."
	done

GentlemanAlfredBeatenText:
	text "Ah! Ik zie dat" ; "Ah! I can see that"
	line "het menens is." ; "you're serious."
	done

GentlemanAlfredAfterBattleText:
	text "Boven is een" ; "Up top is a #-"
	line "#MON die de" ; "MON that keeps the"
	cont "VUURTOREN" ; "LIGHTHOUSE lit."
	cont "brandend houdt." ; 

	para "Maar ik hoor dat" ; "But I hear that"
	line "die nu ziek is" ; "it's sick now and"

	para "en niet kan worden" ; "can't be cured by"
	line "genezen met nor-" ; "ordinary medicine."
	cont "male medicijnen." ; 
	done

OlivineLighthouse2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3, 11, OLIVINE_LIGHTHOUSE_1F, 3
	warp_event  5,  3, OLIVINE_LIGHTHOUSE_3F, 2
	warp_event 16, 13, OLIVINE_LIGHTHOUSE_1F, 4
	warp_event 17, 13, OLIVINE_LIGHTHOUSE_1F, 5
	warp_event 16, 11, OLIVINE_LIGHTHOUSE_3F, 4
	warp_event 17, 11, OLIVINE_LIGHTHOUSE_3F, 5

	def_coord_events

	def_bg_events

	def_object_events
	object_event  9,  3, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSailorHuey, -1
	object_event 17,  8, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerGentlemanAlfred, -1
