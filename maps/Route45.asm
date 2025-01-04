	object_const_def
	const ROUTE45_POKEFAN_M1
	const ROUTE45_POKEFAN_M2
	const ROUTE45_POKEFAN_M3
	const ROUTE45_POKEFAN_M4
	const ROUTE45_BLACK_BELT
	const ROUTE45_COOLTRAINER_M
	const ROUTE45_COOLTRAINER_F
	const ROUTE45_FRUIT_TREE
	const ROUTE45_POKE_BALL1
	const ROUTE45_POKE_BALL2
	const ROUTE45_POKE_BALL3
	const ROUTE45_POKE_BALL4

Route45_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerBlackbeltKenji:
	trainer BLACKBELT_T, KENJI3, EVENT_BEAT_BLACKBELT_KENJI, BlackbeltKenjiSeenText, BlackbeltKenjiBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	checkevent EVENT_KENJI_READY_FOR_REMATCH
	iftrue .WantsBattle
	checkcellnum PHONE_BLACKBELT_KENJI
	iftrue Route45NumberAcceptedM
	checkevent EVENT_KENJI_ASKED_FOR_PHONE_NUMBER
	iftrue .AskedAlready
	writetext BlackbeltKenjiAfterBattleText
	waitbutton
	setevent EVENT_KENJI_ASKED_FOR_PHONE_NUMBER
	scall Route45AskNumber1M
	sjump .AskForNumber

.AskedAlready:
	scall Route45AskNumber2M
.AskForNumber:
	askforphonenumber PHONE_BLACKBELT_KENJI
	ifequal PHONE_CONTACTS_FULL, Route45PhoneFullM
	ifequal PHONE_CONTACT_REFUSED, Route45NumberDeclinedM
	gettrainername STRING_BUFFER_3, BLACKBELT_T, KENJI3
	scall Route45RegisteredNumberM
	sjump Route45NumberAcceptedM

.WantsBattle:
	scall Route45RematchM
	winlosstext BlackbeltKenjiBeatenText, 0
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue .LoadFight2
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight1
	loadtrainer BLACKBELT_T, KENJI3
	startbattle
	reloadmapafterbattle
	clearevent EVENT_KENJI_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer BLACKBELT_T, KENJI1
	startbattle
	reloadmapafterbattle
	clearevent EVENT_KENJI_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer BLACKBELT_T, KENJI2
	startbattle
	reloadmapafterbattle
	clearevent EVENT_KENJI_READY_FOR_REMATCH
	end

Route45AskNumber1M:
	jumpstd AskNumber1MScript
	end

Route45AskNumber2M:
	jumpstd AskNumber2MScript
	end

Route45RegisteredNumberM:
	jumpstd RegisteredNumberMScript
	end

Route45NumberAcceptedM:
	jumpstd NumberAcceptedMScript
	end

Route45NumberDeclinedM:
	jumpstd NumberDeclinedMScript
	end

Route45PhoneFullM:
	jumpstd PhoneFullMScript
	end

Route45RematchM:
	jumpstd RematchMScript
	end

TrainerHikerErik:
	trainer HIKER, ERIK, EVENT_BEAT_HIKER_ERIK, HikerErikSeenText, HikerErikBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerErikAfterBattleText
	waitbutton
	closetext
	end

TrainerHikerMichael:
	trainer HIKER, MICHAEL, EVENT_BEAT_HIKER_MICHAEL, HikerMichaelSeenText, HikerMichaelBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerMichaelAfterBattleText
	waitbutton
	closetext
	end

TrainerHikerParry:
	trainer HIKER, PARRY3, EVENT_BEAT_HIKER_PARRY, HikerParry3SeenText, HikerParry3BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	checkevent EVENT_PARRY_READY_FOR_REMATCH
	iftrue .WantsBattle
	checkcellnum PHONE_HIKER_PARRY
	iftrue Route45NumberAcceptedM
	checkevent EVENT_PARRY_ASKED_FOR_PHONE_NUMBER
	iftrue .AskedAlready
	writetext HikerParryAfterBattleText
	promptbutton
	setevent EVENT_PARRY_ASKED_FOR_PHONE_NUMBER
	scall Route45AskNumber1M
	sjump .AskForNumber

.AskedAlready:
	scall Route45AskNumber2M
.AskForNumber:
	askforphonenumber PHONE_HIKER_PARRY
	ifequal PHONE_CONTACTS_FULL, Route45PhoneFullM
	ifequal PHONE_CONTACT_REFUSED, Route45NumberDeclinedM
	gettrainername STRING_BUFFER_3, HIKER, PARRY1
	scall Route45RegisteredNumberM
	sjump Route45NumberAcceptedM

.WantsBattle:
	scall Route45RematchM
	winlosstext HikerParry3BeatenText, 0
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue .LoadFight2
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight1
	loadtrainer HIKER, PARRY3
	startbattle
	reloadmapafterbattle
	clearevent EVENT_PARRY_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer HIKER, PARRY1
	startbattle
	reloadmapafterbattle
	clearevent EVENT_PARRY_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer HIKER, PARRY2
	startbattle
	reloadmapafterbattle
	clearevent EVENT_PARRY_READY_FOR_REMATCH
	end

TrainerHikerTimothy:
	trainer HIKER, TIMOTHY, EVENT_BEAT_HIKER_TIMOTHY, HikerTimothySeenText, HikerTimothyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerTimothyAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainermRyan:
	trainer COOLTRAINERM, RYAN, EVENT_BEAT_COOLTRAINERM_RYAN, CooltrainermRyanSeenText, CooltrainermRyanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermRyanAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainerfKelly:
	trainer COOLTRAINERF, KELLY, EVENT_BEAT_COOLTRAINERF_KELLY, CooltrainerfKellySeenText, CooltrainerfKellyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfKellyAfterBattleText
	waitbutton
	closetext
	end

Route45Sign:
	jumptext Route45SignText

Route45FruitTree:
	fruittree FRUITTREE_ROUTE_45

Route45XSpecial:
	itemball X_SPECIAL

Route45Revive:
	itemball REVIVE

Route45Elixer:
	itemball ELIXER

Route45MaxPotion:
	itemball MAX_POTION

Route45HiddenPpUp:
	hiddenitem PP_UP, EVENT_ROUTE_45_HIDDEN_PP_UP

HikerErikSeenText:
	text "Wees op alles" ; "Be prepared for"
	line "voorbereid!" ; "anything!"

	para "Eens kijken of jij" ; "Let me see if your"
	line "je #MON goed" ; "#MON have been"
	cont "hebt opgevoed!" ; "raised properly!"
	done

HikerErikBeatenText:
	text "Oh, verloren!" ; "Oh, I lost that!"
	done

HikerErikAfterBattleText:
	text "Ik ga naar BLACK-" ; "I'll head back to"
	line "THORN's IJSPAD om" ; "BLACKTHORN's ICE"

	para "nog wat meer te" ; "PATH and train"
	line "trainen." ; "some more."
	done

HikerMichaelSeenText:
	text "Yo! Jij hebt pit!" ; "Yo! You're spunky!"
	line "Maar weet je?" ; "But you know what?"

	para "Als het draait om" ; "When it comes to"
	line "pure pittigheid," ; "sheer spunkiness,"
	cont "ben ik de man!" ; "I'm the man!"
	done

HikerMichaelBeatenText:
	text "M'n #MON hadden" ; "My #MON weren't"
	line "te weinig pit!" ; "spunky enough!"
	done

HikerMichaelAfterBattleText:
	text "Joh, wat ben ik" ; "Boy, do I love"
	line "dol op LP-PLUS!" ; "HP UP! Mmmm, yum!"

	para "Ik blijf die van" ; "I keep drinking my"
	line "mijn #MON" ; "#MON's!"
	cont "steeds opdrinken!"

	para "Houd me tegen!" ; "I can't help it!"
	done

HikerParry3SeenText:
	text "M'n #MON zitten" ; "My #MON are"
	line "vol met kracht!" ; "power packed!"
	done

HikerParry3BeatenText:
	text "Wahahah! Ik ben de" ; "Wahahah! I'm the"
	line "grote verliezer!" ; "big loser!"
	done

HikerParryAfterBattleText:
	text "Ik ben niet echt" ; "I'm not much good"
	line "een denker, he?" ; "at thinking, see?"

	para "Dus ik ram gewoon" ; "So, I just plow"
	line "hard vooruit!" ; "ahead with power!"
	done

HikerTimothySeenText:
	text "Waarom ik bergen" ; "Why do I climb"
	line "beklim?" ; "mountains?"

	para "Gewoon, omdat ze" ; "Because they're"
	line "er zijn." ; "there."

	para "Waarom train ik" ; "Why do I train"
	line "#MON?"

	para "Gewoon, omdat ze" ; "Because they're"
	line "er zijn!" ; "there!"
	done

HikerTimothyBeatenText:
	text "Verliezen…" ; "Losses…"
	line "Die zijn er ook!" ; "They're there too!"
	done

HikerTimothyAfterBattleText:
	text "Het beste wat mij" ; "The best thing to"
	line "ooit overkwam was" ; "ever happen to me"

	para "de ontdekking van" ; "was discovering"
	line "#MON."
	done

BlackbeltKenjiSeenText:
	text "I was training"
	line "here alone."

	para "Behold the fruits"
	line "of my labor!"
	done

BlackbeltKenjiBeatenText:
	text "Waaaargh!"
	done

BlackbeltKenjiAfterBattleText:
	text "Dit vergt extreme" ; "This calls for"
	line "maatregelen." ; "extreme measures."

	para "Ik moet de heuvels" ; "I must take to the"
	line "in en eenzaam" ; "hills and train in"
	cont "trainen." ; "solitude."
	done

CooltrainermRyanSeenText:
	text "Wat vind jij van" ; "What are your"
	line "het opvoeden van" ; "thoughts on rais-"
	cont "#MON?" ; "ing #MON?"
	done

CooltrainermRyanBeatenText:
	text "Je hebt mijn" ; "You've won my"
	line "respect verdiend." ; "respect."
	done

CooltrainermRyanAfterBattleText:
	text "Je voedt je #-" ; "I see you're rais-"
	line "MON duidelijk met" ; "ing your #MON"
	cont "zorg op." ; "with care."

	para "Jullie band zal je" ; "The bond you build"
	line "redden in lastige" ; "will save you in"
	cont "situaties." ; "tough situations."
	done

CooltrainerfKellySeenText:
	text "Wat is je" ; "What is your"
	line "gevechtsstrategie?" ; "battle strategy?"

	para "Het is dom om" ; "It is foolish to"
	line "alleen maar sterke" ; "use strong moves"
	cont "aanvallen te doen." ; "indiscriminately."
	done

CooltrainerfKellyBeatenText:
	text "Prima. Ik verloor." ; "Fine. I lost."
	done

CooltrainerfKellyAfterBattleText:
	text "Ik heb het niet op" ; "I'm not in favor"
	line "veel te sterke" ; "of overly power-"
	cont "aanvallen." ; "ful moves."

	para "Ik wil winnen," ; "I want to win, but"
	line "maar wil #MON" ; "I also don't want"
	cont "geen pijn doen." ; "to harm #MON."
	done

Route45DummyText: ; unreferenced
	text "I'm pretty good at"
	line "#MON too."
	done

Route45SignText:
	text "ROUTE 45"
	line "BERGPAD NABIJ" ; "MOUNTAIN RD. AHEAD"
	done

Route45_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  5, DARK_CAVE_BLACKTHORN_ENTRANCE, 1

	def_coord_events

	def_bg_events
	bg_event 10,  4, BGEVENT_READ, Route45Sign
	bg_event 13, 80, BGEVENT_ITEM, Route45HiddenPpUp

	def_object_events
	object_event 10, 16, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerHikerErik, -1
	object_event 15, 64, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerHikerMichael, -1
	object_event  5, 28, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerHikerParry, -1
	object_event  9, 64, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerHikerTimothy, -1
	object_event 11, 50, SPRITE_BLACK_BELT, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerBlackbeltKenji, -1
	object_event 17, 18, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerCooltrainermRyan, -1
	object_event  4, 36, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainerfKelly, -1
	object_event 16, 82, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route45FruitTree, -1
	object_event  6, 51, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route45XSpecial, EVENT_ROUTE_45_X_SPECIAL
	object_event  6, 66, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route45Revive, EVENT_ROUTE_45_REVIVE
	object_event  4, 21, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route45Elixer, EVENT_ROUTE_45_ELIXER
	object_event  8, 33, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route45MaxPotion, EVENT_ROUTE_45_MAX_POTION
