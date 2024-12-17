	object_const_def
	const RUINSOFALPHOUTSIDE_YOUNGSTER1
	const RUINSOFALPHOUTSIDE_SCIENTIST
	const RUINSOFALPHOUTSIDE_FISHER
	const RUINSOFALPHOUTSIDE_YOUNGSTER2
	const RUINSOFALPHOUTSIDE_YOUNGSTER3

RuinsOfAlphOutside_MapScripts:
	def_scene_scripts
	scene_script RuinsOfAlphOutsideNoop1Scene, SCENE_RUINSOFALPHOUTSIDE_NOOP
	scene_script RuinsOfAlphOutsideNoop2Scene, SCENE_RUINSOFALPHOUTSIDE_GET_UNOWN_DEX

	def_callbacks
	callback MAPCALLBACK_OBJECTS, RuinsOfAlphOutsideScientistCallback

RuinsOfAlphOutsideNoop1Scene:
	end

RuinsOfAlphOutsideNoop2Scene:
	end

RuinsOfAlphOutsideScientistCallback:
	checkflag ENGINE_UNOWN_DEX
	iftrue .NoScientist
	checkevent EVENT_MADE_UNOWN_APPEAR_IN_RUINS
	iftrue .MaybeScientist
	sjump .NoScientist

.MaybeScientist:
	readvar VAR_UNOWNCOUNT
	ifgreater 2, .YesScientist
	sjump .NoScientist

.YesScientist:
	appear RUINSOFALPHOUTSIDE_SCIENTIST
	setscene SCENE_RUINSOFALPHOUTSIDE_GET_UNOWN_DEX
	endcallback

.NoScientist:
	disappear RUINSOFALPHOUTSIDE_SCIENTIST
	setscene SCENE_RUINSOFALPHOUTSIDE_NOOP
	endcallback

RuinsOfAlphOutsideScientistScene1:
	turnobject RUINSOFALPHOUTSIDE_SCIENTIST, UP
	turnobject PLAYER, DOWN
	sjump RuinsOfAlphOutsideScientistSceneContinue

RuinsOfAlphOutsideScientistScene2:
	turnobject RUINSOFALPHOUTSIDE_SCIENTIST, LEFT
	turnobject PLAYER, RIGHT
	sjump RuinsOfAlphOutsideScientistSceneContinue

RuinsOfAlphOutsideScientistScript:
	faceplayer
RuinsOfAlphOutsideScientistSceneContinue:
	opentext
	writetext RuinsOfAlphOutsideScientistText
	waitbutton
	closetext
	playmusic MUSIC_SHOW_ME_AROUND
	follow RUINSOFALPHOUTSIDE_SCIENTIST, PLAYER
	applymovement RUINSOFALPHOUTSIDE_SCIENTIST, RuinsOfAlphOutsideScientistWalkToLabMovement
	disappear RUINSOFALPHOUTSIDE_SCIENTIST
	stopfollow
	applymovement PLAYER, RuinsOfAlphOutsidePlayerEnterLabMovement
	setmapscene RUINS_OF_ALPH_RESEARCH_CENTER, SCENE_RUINSOFALPHRESEARCHCENTER_GET_UNOWN_DEX
	warpcheck
	end

TrainerPsychicNathan:
	trainer PSYCHIC_T, NATHAN, EVENT_BEAT_PSYCHIC_NATHAN, PsychicNathanSeenText, PsychicNathanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicNathanAfterBattleText
	waitbutton
	closetext
	end

TrainerSuperNerdEricUnused: ; unreferenced
	trainer SUPER_NERD, ERIC_UNUSED, EVENT_BEAT_SUPER_NERD_ERIC_UNUSED, SuperNerdEricUnusedSeenText, SuperNerdEricUnusedBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SuperNerdEricUnusedAfterBattleText
	waitbutton
	closetext
	end

RuinsOfAlphOutsideMysteryChamberSign:
	jumptext RuinsOfAlphOutsideMysteryChamberSignText

RuinsOfAlphSign:
	jumptext RuinsOfAlphSignText

RuinsOfAlphResearchCenterSign:
	jumptext RuinsOfAlphResearchCenterSignText

RuinsOfAlphOutsideScientistWalkToLabMovement:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step UP
	step RIGHT
	step RIGHT
	step UP
	step UP
	step_end

RuinsOfAlphOutsidePlayerEnterLabMovement:
	step UP
	step_end

RuinsOfAlphOutsideScientistText:
	text "Is dat een #-" ; "Hm? That's a #-"
	line "DEX? Meg ik hem" ; "DEX, isn't it?"
	cont "eens bekijken?" ; "May I see it?"

	para "Er zijn heel veel" ; "There are so many"
	line "verschillende" ; "kinds of #MON."
	cont "soorten #MON."

	para "Maar… Wat is dit?" ; "Hm? What's this?"

	para "Wat is dit voor" ; "What is this"
	line "#MON?" ; "#MON?"

	para "Het lijkt op de" ; "It looks like the"
	line "vreemde tekens" ; "strange writing on"

	para "op de muren van" ; "the walls of the"
	line "de RUÏNES." ; "RUINS."

	para "Als die tekeningen" ; "If those drawings"
	line "echt van #MON," ; "are really #-"
	cont "zijn, moeten er" ; "MON, there should"
	cont "veel meer zijn." ; "be many more."

	para "Ideetje! Laat mij" ; "I know! Let me up-"
	line "je #DEX upgra-" ; "grade your #-"
	cont "den. Kom mee." ; "DEX. Follow me."
	done

SuperNerdEricUnusedSeenText: ; ReplaceWith SuperNerdStanSeenText:
	text "Wat wil je? Ik ben" ; "What do you want?"
	line "aan het studeren," ; "I'm studying--"
	cont "laat me met rust!" ; "don't disturb me!"
	done

SuperNerdEricUnusedBeatenText: ; ReplaceWith SuperNerdStanBeatenText:
	text "Sorry… Ik"
	line "ben gefrustreerd" ; "I'm frustrated by"

	para "omdat we er niks" ; "our lack of real"
	line "van snappen…" ; "understanding…"
	done

SuperNerdEricUnusedAfterBattleText: ; ReplaceWith SuperNerdStanAfterBattleText:
	text "De RUÏNES zijn" ; "The RUINS are from"
	line "ongeveer 1500 jaar" ; "about 1500 years"
	cont "oud." ; "ago."

	para "We weten niet wie" ; "Nobody knows who"
	line "ze heeft gebouwd." ; "built them."

	para "We weten ook niet" ; "It's also not"
	line "of de #MON-" ; "known if the #-"
	cont "beelden iets" ; "MON statues have"
	cont "betekenen." ; "any meaning."

	para "Het is één groot" ; "It's all one big"
	line "mysterie…" ; "mystery…"
	done

PsychicNathanSeenText:
	text "Hmm… Dit is een" ; "Hmmm… This is a"
	line "vreemde plek." ; "strange place."
	done

PsychicNathanBeatenText:
	text "…"
	done

PsychicNathanAfterBattleText:
	text "Ik denk hier" ; "I like thinking"
	line "graag na." ; "here."
	done

RuinsOfAlphOutsideMysteryChamberSignText:
	text "MYSTERIESTEEN" ; "MYSTERY STONE"
	line "PANELENKAMER" ; "PANEL CHAMBER"
	done

RuinsOfAlphSignText:
	text "RUÏNES VAN ALF" ; "RUINS OF ALPH"
	line "Bezoekers Welkom" ; "Visitors Welcome"
	done

RuinsOfAlphResearchCenterSignText:
	text "RUÏNES VAN ALF" ; "RUINS OF ALPH"
	line "ONDERZOEKSCENTRUM" ; "RESEARCH CENTER"

	para "De Kenner van de" ; "The Authority on"
	line "RUÏNES VAN ALF" ; "the RUINS OF ALPH"
	done


RuinsOfAlphOutside_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2, 17, RUINS_OF_ALPH_HO_OH_CHAMBER, 1
	warp_event 14,  7, RUINS_OF_ALPH_KABUTO_CHAMBER, 1
	warp_event  2, 29, RUINS_OF_ALPH_OMANYTE_CHAMBER, 1
	warp_event 16, 33, RUINS_OF_ALPH_AERODACTYL_CHAMBER, 1
	warp_event 10, 13, RUINS_OF_ALPH_INNER_CHAMBER, 1
	warp_event 17, 11, RUINS_OF_ALPH_RESEARCH_CENTER, 1
	warp_event  6, 19, UNION_CAVE_B1F, 1
	warp_event  6, 27, UNION_CAVE_B1F, 2
	warp_event  7,  5, ROUTE_36_RUINS_OF_ALPH_GATE, 3
	warp_event 13, 20, ROUTE_32_RUINS_OF_ALPH_GATE, 1
	warp_event 13, 21, ROUTE_32_RUINS_OF_ALPH_GATE, 2

	def_coord_events
	coord_event 11, 14, SCENE_RUINSOFALPHOUTSIDE_GET_UNOWN_DEX, RuinsOfAlphOutsideScientistScene1
	coord_event 10, 15, SCENE_RUINSOFALPHOUTSIDE_GET_UNOWN_DEX, RuinsOfAlphOutsideScientistScene2

	def_bg_events
	bg_event 16,  8, BGEVENT_READ, RuinsOfAlphOutsideMysteryChamberSign
	bg_event 12, 16, BGEVENT_READ, RuinsOfAlphSign
	bg_event 18, 12, BGEVENT_READ, RuinsOfAlphResearchCenterSign

	def_object_events
	object_event  4, 20, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerPsychicNathan, -1
	object_event 11, 15, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphOutsideScientistScript, EVENT_RUINS_OF_ALPH_OUTSIDE_SCIENTIST
