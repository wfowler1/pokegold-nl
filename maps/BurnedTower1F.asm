	object_const_def
	const BURNEDTOWER1F_FIREBREATHER_DICK
	const BURNEDTOWER1F_FIREBREATHER_NED
	const BURNEDTOWER1F_ROCK1
	const BURNEDTOWER1F_ROCK2
	const BURNEDTOWER1F_RIVAL
	const BURNEDTOWER1F_FIREBREATHER_DICK_ASHES
	const BURNEDTOWER1F_POKE_BALL1
	const BURNEDTOWER1F_POKE_BALL2

BurnedTower1F_MapScripts:
	def_scene_scripts
	scene_script BurnedTower1FRivalBattleScene, SCENE_BURNEDTOWER1F_RIVAL_BATTLE
	scene_script BurnedTower1FNoop1Scene,       SCENE_BURNEDTOWER1F_FIREBREATHER_DICK
	scene_script BurnedTower1FNoop2Scene,       SCENE_BURNEDTOWER1F_NOOP

	def_callbacks

BurnedTower1FRivalBattleScene:
	sdefer BurnedTower1FRivalBattleScript
	end

BurnedTower1FNoop1Scene:
	end

BurnedTower1FNoop2Scene:
	end

BurnedTower1FRivalBattleScript:
	turnobject PLAYER, UP
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	pause 15
	turnobject BURNEDTOWER1F_RIVAL, RIGHT
	pause 10
	turnobject BURNEDTOWER1F_RIVAL, LEFT
	pause 15
	turnobject BURNEDTOWER1F_RIVAL, DOWN
	pause 15
	applymovement BURNEDTOWER1F_RIVAL, BurnedTowerMovement_RivalWalksToPlayer
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext BurnedTowerRival_BeforeText
	waitbutton
	closetext
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftrue .totodile
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue .chikorita
	winlosstext BurnedTowerRival_WinText, BurnedTowerRival_LossText
	setlasttalked BURNEDTOWER1F_RIVAL
	loadtrainer RIVAL1, RIVAL1_3_TOTODILE
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .returnfrombattle

.totodile
	winlosstext BurnedTowerRival_WinText, BurnedTowerRival_LossText
	setlasttalked BURNEDTOWER1F_RIVAL
	loadtrainer RIVAL1, RIVAL1_3_CHIKORITA
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .returnfrombattle

.chikorita
	winlosstext BurnedTowerRival_WinText, BurnedTowerRival_LossText
	setlasttalked BURNEDTOWER1F_RIVAL
	loadtrainer RIVAL1, RIVAL1_3_CYNDAQUIL
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .returnfrombattle

.returnfrombattle
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext BurnedTowerRival_AfterText1
	waitbutton
	closetext
	turnobject PLAYER, UP
	turnobject PLAYER, RIGHT
	applymovement BURNEDTOWER1F_RIVAL, BurnedTowerMovement_RivalLeaves
	playsound SFX_EXIT_BUILDING
	disappear BURNEDTOWER1F_RIVAL
	setscene SCENE_BURNEDTOWER1F_FIREBREATHER_DICK
	waitsfx
	playmapmusic
	end

FirebreatherDickFight:
	playmusic MUSIC_HIKER_ENCOUNTER
	showemote EMOTE_SHOCK, BURNEDTOWER1F_FIREBREATHER_DICK, 30
	applymovement BURNEDTOWER1F_FIREBREATHER_DICK, FirebreatherDickMovement
	turnobject PLAYER, DOWN
	opentext
	writetext FirebreatherDickBeforeText
	waitbutton
	closetext
	winlosstext FirebreatherDickBeatenText, -1
	setlasttalked BURNEDTOWER1F_FIREBREATHER_DICK
	loadtrainer FIREBREATHER, DICK
	startbattle
	iftrue .next
	disappear BURNEDTOWER1F_FIREBREATHER_DICK
	appear BURNEDTOWER1F_FIREBREATHER_DICK_ASHES
	reloadmapafterbattle
	setevent EVENT_BEAT_FIREBREATHER_DICK
	setscene SCENE_BURNEDTOWER1F_NOOP
	clearevent EVENT_BURNED_TOWER_FIREBREATHER_DICK_NORMAL
	setevent EVENT_BURNED_TOWER_FIREBREATHER_DICK_ASHES
	end
.next
	reloadmapafterbattle
	end

FirebreatherDickPostBattle:
	faceplayer
	opentext
	writetext FirebreatherDickAfterText
	waitbutton
	closetext
	end

TrainerFirebreatherNed:
	trainer FIREBREATHER, NED, EVENT_BEAT_FIREBREATHER_NED, FirebreatherNedSeenText, FirebreatherNedBeatenText, 0, .Script

.Script
	endifjustbattled
	opentext
	writetext FirebreatherNedAfterText
	waitbutton
	closetext
	end

BurnedTower1FRock:
	jumpstd SmashRockScript

BurnedTower1FHiddenEther:
	hiddenitem ETHER, EVENT_BURNED_TOWER_1F_HIDDEN_ETHER

BurnedTower1FBurnHeal:
	itemball BURN_HEAL, 1

BurnedTower1FXSpeed:
	itemball X_SPEED, 1

BurnedTowerMovement_RivalWalksToPlayer:
	step DOWN
	step DOWN
	step_end

BurnedTowerMovement_RivalLeaves:
	step RIGHT
	step DOWN
	step_end

FirebreatherDickMovement:
	step UP
	step_end

BurnedTowerRival_BeforeText:
	text "<……> <……> <……>"

	para "…Oh, jij bent het." ; "…Oh, it's you."

	para "Je wilde sterker" ; "You wanted to get"
	line "worden, dus je" ; "stronger, so you"

	para "kwam hier om de" ; "came for the leg-"
	line "legendarische" ; "endary #MON"

	para "#MON te vinden." ; "that's supposed to"
	line "Dat is je verhaal," ; "be here. That's"
	cont "of niet soms?" ; "your story, right?"

	para "Nou, dat gaat niet" ; "Well, that's not"
	line "gebeuren." ; "going to happen."

	para "Want die ga ik" ; "Because I'm going"
	line "vangen!" ; "to get it!"

	para "Ik word de beste" ; "I'm going to be"
	line "trainer op aarde," ; "the world's great-"
	cont "een legendarische" ; "est trainer, so a"
	cont "#MON is dus" ; "legendary #MON"
	cont "perfect voor mij." ; "would be perfect"
	cont #"for me."

	para "…Hoe dan ook," ; "…Well, anyway,"
	line "het is vermoeiend" ; "I'm getting tired"

	para "dat watjes zoals" ; "of having a wimp"
	line "jij steeds komen" ; "like you always"
	cont "opdagen." ; "showing up."
	done

BurnedTowerRival_WinText:
	text "…Pff!" ; "…Humph!"

	para "Dit is waarom ik" ; "This is why I hate"
	line "vechten met watjes" ; "battling wimps."

	para "haat. Gebrek aan" ; "There's no"
	line "uitdaging." ; "challenge in it."
	done

BurnedTowerRival_AfterText1:
	text "…Aw, boeien." ; "…Aw, whatever."

	para "Je zal toch nooit" ; "You would never be"
	line "een legendarische" ; "able to catch a"

	para "#MON kunnen" ; "legendary #MON"
	line "vangen." ; "anyway."
	done

BurnedTowerRival_LossText:
	text "…Pff!" ; "…Humph!"

	para "Dit is waarom ik" ; "This is why I hate"
	line "vechten met watjes" ; "battling wimps."

	para "haat. Zonde van" ; "It's just a waste"
	line "mijn tijd." ; "of my time."
	done

FirebreatherDickBeforeText:
	text "He, ik train hier" ; "Hey, I'm training"
	line "in het geheim!" ; "secretly here!"

	para "Geneer me niet" ; "Don't embarrass me"
	line "door zo te kijken!" ; "by looking!"
	done

FirebreatherDickBeatenText:
	text "Ik ben helemaal" ; "I burned down to"
	line "afgebrand…" ; "white ashes…"
	done

FirebreatherDickAfterText:
	text "Ik was zo druk met" ; "I was so into my"
	line "trainen dat ik in" ; "training that I"

	para "dit gat ben" ; "fell down this"
	line "gevallen." ; "hole."
	done

FirebreatherNedSeenText:
	text "Mijn ziel staat in" ; "My soul is on"
	line "lichterlaaie. Ik" ; "fire. I'll show"

	para "laat zien hoe hard" ; "you how hot it"
	line "hij brandt!" ; "burns!"
	done

FirebreatherNedBeatenText:
	text "Nog steeds niet" ; "Still not hot"
	line "heet genoeg…" ; "enough…"
	done

FirebreatherNedAfterText:
	text "Vroeger waren er" ; "In the past, there"
	line "#MON die met" ; "were these #MON"

	para "extreem hoge" ; "that ran through"
	line "snelheid renden" ; "grass at super-"
	cont "door het gras." ; "high speed."

	para "Ze bewogen voort" ; "They say that they"
	line "als de wind." ; "run like the wind."

	para "Kom je één tegen," ; "If you run into"
	line "dan rent deze" ; "one in grass, it"
	cont "vermoedelijk weg." ; "will likely bolt."
	done

BurnedTower1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9, 15, ECRUTEAK_CITY, 13
	warp_event 10, 15, ECRUTEAK_CITY, 13
	warp_event  5,  4, BURNED_TOWER_B1F, 1
	warp_event  5,  5, BURNED_TOWER_B1F, 1
	warp_event  5,  6, BURNED_TOWER_B1F, 1
	warp_event  4,  6, BURNED_TOWER_B1F, 1
	warp_event 15,  4, BURNED_TOWER_B1F, 2
	warp_event 15,  5, BURNED_TOWER_B1F, 2
	warp_event 10,  7, BURNED_TOWER_B1F, 3
	warp_event  5, 14, BURNED_TOWER_B1F, 4
	warp_event  4, 14, BURNED_TOWER_B1F, 4
	warp_event 14, 14, BURNED_TOWER_B1F, 5
	warp_event 15, 14, BURNED_TOWER_B1F, 5
	warp_event  7, 15, BURNED_TOWER_B1F, 6

	def_coord_events
	coord_event 8,  1, SCENE_BURNEDTOWER1F_FIREBREATHER_DICK, FirebreatherDickFight

	def_bg_events
	bg_event  8,  7, BGEVENT_ITEM, BurnedTower1FHiddenEther

	def_object_events
	object_event 8, 3, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, FirebreatherDickPostBattle, EVENT_BURNED_TOWER_FIREBREATHER_DICK_NORMAL
	object_event 16, 8, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerFirebreatherNed, -1
	object_event 4, 3, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BurnedTower1FRock, -1
	object_event 16, 13, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BurnedTower1FRock, -1
	object_event 9, 12, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, ObjectEvent, EVENT_RIVAL_BURNED_TOWER
	object_event 8, 2, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_EMOTE, OBJECTTYPE_SCRIPT, 0, FirebreatherDickPostBattle, EVENT_BURNED_TOWER_FIREBREATHER_DICK_ASHES
	object_event 15, 2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, BurnedTower1FBurnHeal, EVENT_BURNED_TOWER_1F_X_SPEED
	object_event 7, 5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, BurnedTower1FXSpeed, EVENT_BURNED_TOWER_1F_BURN_HEAL
