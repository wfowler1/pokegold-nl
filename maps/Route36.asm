	object_const_def
	const ROUTE36_YOUNGSTER1
	const ROUTE36_YOUNGSTER2
	const ROUTE36_WEIRD_TREE
	const ROUTE36_LASS1
	const ROUTE36_FISHER
	const ROUTE36_FRUIT_TREE
	const ROUTE36_ARTHUR

Route36_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, Route36ArthurCallback

Route36ArthurCallback:
	readvar VAR_WEEKDAY
	ifequal THURSDAY, .ArthurAppears
	disappear ROUTE36_ARTHUR
	endcallback

.ArthurAppears:
	appear ROUTE36_ARTHUR
	endcallback

SudowoodoScript:
	checkitem SQUIRTBOTTLE
	iftrue .Fight

	waitsfx
	playsound SFX_SANDSTORM
	applymovement ROUTE36_WEIRD_TREE, SudowoodoShakeMovement
	end

.Fight:
	opentext
	writetext UseSquirtbottleText
	yesorno
	iffalse DidntUseSquirtbottleScript
	closetext
WateredWeirdTreeScript:: ; export (for when you use Squirtbottle from pack)
	opentext
	writetext UsedSquirtbottleText
	waitbutton
	closetext
	waitsfx
	playsound SFX_SANDSTORM
	applymovement ROUTE36_WEIRD_TREE, SudowoodoShakeMovement
	opentext
	writetext SudowoodoAttackedText
	waitbutton
	closetext
	loadwildmon SUDOWOODO, 20
	startbattle
	setevent EVENT_FOUGHT_SUDOWOODO
	ifequal DRAW, DidntCatchSudowoodo
	disappear ROUTE36_WEIRD_TREE
	variablesprite SPRITE_WEIRD_TREE, SPRITE_TWIN
	reloadmapafterbattle
	end

DidntUseSquirtbottleScript:
	closetext
	end

DidntCatchSudowoodo:
	reloadmapafterbattle
	applymovement ROUTE36_WEIRD_TREE, WeirdTreeMovement_Flee
	disappear ROUTE36_WEIRD_TREE
	variablesprite SPRITE_WEIRD_TREE, SPRITE_TWIN
	special LoadUsedSpritesGFX
	end

Route36RockSmashGuyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM08_ROCK_SMASH
	iftrue .AlreadyGotRockSmash
	checkevent EVENT_FOUGHT_SUDOWOODO
	iftrue .ClearedSudowoodo
	writetext RockSmashGuyText1
	waitbutton
	closetext
	end

.ClearedSudowoodo:
	writetext RockSmashGuyText2
	promptbutton
	verbosegiveitem TM_ROCK_SMASH
	iffalse .NoRoomForTM
	setevent EVENT_GOT_TM08_ROCK_SMASH
.AlreadyGotRockSmash:
	writetext RockSmashGuyText3
	waitbutton
.NoRoomForTM:
	closetext
	end

Route36LassScript:
	faceplayer
	opentext
	checkevent EVENT_FOUGHT_SUDOWOODO
	iftrue .ClearedSudowoodo
	writetext Route36LassText
	waitbutton
	closetext
	end

.ClearedSudowoodo:
	writetext Route36LassText_ClearedSudowoodo
	waitbutton
	closetext
	end

TrainerSchoolboyAlan1:
	trainer SCHOOLBOY, ALAN1, EVENT_BEAT_SCHOOLBOY_ALAN, SchoolboyAlan1SeenText, SchoolboyAlan1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	checkevent EVENT_ALAN_READY_FOR_REMATCH
	iftrue .ChooseRematch
	checkcellnum PHONE_SCHOOLBOY_ALAN
	iftrue .NumberAccepted
	checkevent EVENT_ALAN_ASKED_FOR_PHONE_NUMBER
	iftrue .AskAgainForPhoneNumber
	writetext SchoolboyAlanBooksText
	promptbutton
	setevent EVENT_ALAN_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjump .ContinueAskForPhoneNumber

.AskAgainForPhoneNumber:
	scall .AskNumber2
.ContinueAskForPhoneNumber:
	askforphonenumber PHONE_SCHOOLBOY_ALAN
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	gettrainername STRING_BUFFER_3, SCHOOLBOY, ALAN1
	scall .RegisteredNumber
	sjump .NumberAccepted

.ChooseRematch:
	scall .Rematch
	winlosstext SchoolboyAlan1BeatenText, 0
	checkflag ENGINE_FLYPOINT_BLACKTHORN
	iftrue .LoadFight2
	checkflag ENGINE_FLYPOINT_OLIVINE
	iftrue .LoadFight1
	loadtrainer SCHOOLBOY, ALAN1
	startbattle
	reloadmapafterbattle
	clearevent EVENT_ALAN_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer SCHOOLBOY, ALAN2
	startbattle
	reloadmapafterbattle
	clearevent EVENT_ALAN_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer SCHOOLBOY, ALAN3
	startbattle
	reloadmapafterbattle
	clearevent EVENT_ALAN_READY_FOR_REMATCH
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

TrainerPsychicMark:
	trainer PSYCHIC_T, MARK, EVENT_BEAT_PSYCHIC_MARK, PsychicMarkSeenText, PsychicMarkBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicMarkAfterBattleText
	waitbutton
	closetext
	end

ArthurScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_HARD_STONE_FROM_ARTHUR
	iftrue .AlreadyGotStone
	readvar VAR_WEEKDAY
	ifnotequal THURSDAY, ArthurNotThursdayScript
	checkevent EVENT_MET_ARTHUR_OF_THURSDAY
	iftrue .MetArthur
	writetext MeetArthurText
	promptbutton
	setevent EVENT_MET_ARTHUR_OF_THURSDAY
.MetArthur:
	writetext ArthurGivesGiftText
	promptbutton
	verbosegiveitem HARD_STONE
	iffalse .BagFull
	setevent EVENT_GOT_HARD_STONE_FROM_ARTHUR
	writetext ArthurGaveGiftText
	waitbutton
	closetext
	end

.AlreadyGotStone:
	writetext ArthurThursdayText
	waitbutton
.BagFull:
	closetext
	end

ArthurNotThursdayScript:
	writetext ArthurNotThursdayText
	waitbutton
	closetext
	end

Route36Sign:
	jumptext Route36SignText

RuinsOfAlphNorthSign:
	jumptext RuinsOfAlphNorthSignText

Route36TrainerTips1:
	jumptext Route36TrainerTips1Text

Route36TrainerTips2:
	jumptext Route36TrainerTips2Text

Route36FruitTree:
	fruittree FRUITTREE_ROUTE_36

SudowoodoShakeMovement:
	tree_shake
	step_end

WeirdTreeMovement_Flee:
	fast_jump_step UP
	fast_jump_step UP
	step_end

UseSquirtbottleText:
	text "Een vreemde boom." ; "It's a weird tree."
	line "Gebruik SPUITFLES?" ; "Use SQUIRTBOTTLE?"
	done

UsedSquirtbottleText:
	text "<PLAYER> gebruikte" ; "<PLAYER> used the"
	line "de SPUITFLES." ; "SQUIRTBOTTLE."
	done

SudowoodoAttackedText:
	text "De vreemde boom" ; "The weird tree"
	line "vindt de SPUITFLES" ; "doesn't like the"
	cont "niet leuk!" ; "SQUIRTBOTTLE!"

	para "De vreemde boom" ; "The weird tree"
	line "viel aan!" ; "attacked!"
	done

RockSmashGuyText1:
	text "Wa-hey!"

	para "Ik ging die boom" ; "I was going to"
	line "omhakken met" ; "snap that tree"

	para "mijn keiharde" ; "with my straight-"
	line "karateslag." ; "arm punch."

	para "Maar het mislukte!" ; "But I couldn't!"
	line "Ik ben een kluns!" ; "I'm a failure!"
	done

RockSmashGuyText2:
	text "Haalde jij die" ; "Did you clear that"
	line "boom weg?" ; "wretched tree?"

	para "Indrukwekkend!" ; "I'm impressed!"
	line "Hier, dit mag je" ; "I want you to"
	cont "hebben." ; "have this."
	done

Text_ReceivedTM08: ; unreferenced
	text "<PLAYER> ontving" ; "<PLAYER> received"
	line "TM08."
	done

RockSmashGuyText3:
	text "Dat is toevallig" ; "That happens to be"
	line "STEENKNAL." ; "ROCK SMASH."

	para "Het verbrijzelt" ; "You can shatter"
	line "stenen met een" ; "rocks with just a"

	para "goed gerichte" ; "single well-aimed"
	line "smak." ; "smack."

	para "Als rotsen in de" ; "If any rocks are"
	line "weg staan, ram" ; "in your way, just"
	cont "ze kapot!" ; "smash 'em up!"
	done

Route36LassText:
	text "Een vreemde boom" ; "An odd tree is"
	line "blokkeert de weg" ; "blocking the way"
	cont "naar GOLDENROD." ; "to GOLDENROD CITY."

	para "Daardoor kan ik" ; "It's preventing"
	line "er niet shoppen." ; "me from shopping."

	para "Iemand zou er iets" ; "Something should"
	line "aan moeten doen." ; "be done about it."
	done

Route36LassText_ClearedSudowoodo:
	text "Die vreemde boom" ; "That odd tree dis-"
	line "is spoorloos" ; "appeared without a"
	cont "verdwenen." ; "trace."

	para "Oh! Was het eigen-" ; "Oh! That tree was"
	line "lijkt een #MON?" ; "really a #MON?"
	done

PsychicMarkSeenText:
	text "Ik ga je gedachten" ; "I'm going to read"
	line "lezen!" ; "your thoughts!"
	done

PsychicMarkBeatenText:
	text "Verkeerd gelezen!" ; "I misread you!"
	done

PsychicMarkAfterBattleText:
	text "Als ik wist wat" ; "I'd be strong if"
	line "de ander denkt," ; "only I could tell"

	para "zou ik sterker" ; "what my opponent"
	line "zijn." ; "was thinking."
	done

SchoolboyAlan1SeenText:
	text "Dankzij mijn" ; "Thanks to my stud-"
	line "studie ben ik" ; "ies, I'm ready for"
	cont "klaar voor elke" ; "any #MON!"
	cont "#MON!"
	done

SchoolboyAlan1BeatenText:
	text "Oeps! Rekenfout" ; "Oops! Computation"
	line "gemaakt?" ; "error?"
	done

SchoolboyAlanBooksText:
	text "Darn. I study five"
	line "hours a day too."

	para "There's a lot you"
	line "can't learn just"
	cont "by reading books."
	done

MeetArthurText:
	text "ARTHUR: Wie ben" ; "ARTHUR: Who are"
	line "jij?" ; "you?"

	para "Ik ben donderdagse" ; "I'm ARTHUR of"
	line "ARTHUR." ; "Thursday."
	done

ArthurGivesGiftText:
	text "Hier. Dit mag je" ; "Here. You can have"
	line "hebben." ; "this."
	done

ArthurGaveGiftText:
	text "ARTHUR: Een #-" ; "ARTHUR: A #MON"
	line "MON met rots-type" ; "that uses rock-"

	para "aanvallen moet dat" ; "type moves should"
	line "vasthouden." ; "hold on to that."

	para "Het maakt rots-" ; "It pumps up rock-"
	line "aanvallen sterker." ; "type attacks."
	done

ArthurThursdayText:
	text "ARTHUR: Ik ben" ; "ARTHUR: I'm ARTHUR"
	line "donderdagse" ; "of Thursday. I'm"

	para "ARTHUR. Tweede van" ; "the second son out"
	line "zeven kinderen." ; "of seven children."
	done

ArthurNotThursdayText:
	text "ARTHUR: Het is" ; "ARTHUR: Today's"
	line "vandaag geen don-" ; "not Thursday. How"
	cont "derdag. Helaas." ; "disappointing."
	done

Route36SignText:
	text "ROUTE 36"
	done

RuinsOfAlphNorthSignText:
	text "RUÏNES VAN ALF" ; "RUINS OF ALPH"
	line "NOORDELIJKE INGANG" ; "NORTH ENTRANCE"
	done

Route36TrainerTips1Text:
	text "TRAINERTIPS"

	para "Statistieken van" ; "#MON stats"
	line "#MON variëren," ; "vary--even within"
	cont "zelfs binnen" ; "the same species."
	cont "dezelfde soort."

	para "In het begin zijn" ; "Their stats may be"
	line "ze vrij gelijk," ; "similar at first."

	para "maar het verschil" ; "However, differ-"
	line "groeit naarmate de" ; "ences will become"

	para "#MON sterker" ; "pronounced as the"
	line "wordt." ; "#MON grow."
	done

Route36TrainerTips2Text:
	text "TRAINERTIPS"

	para "Gebruik GRAVEN om" ; "Use DIG to return"
	line "terug te gaan naar" ; "to the entrance of"
	cont "een ingang." ; "any place."

	para "Handig bij verken-" ; "It is convenient"
	line "ning van grotten" ; "for exploring"

	para "en sommige andere" ; "caves and other"
	line "locaties." ; "landmarks."
	done

Route36_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 18,  8, ROUTE_36_NATIONAL_PARK_GATE, 3
	warp_event 18,  9, ROUTE_36_NATIONAL_PARK_GATE, 4
	warp_event 47, 13, ROUTE_36_RUINS_OF_ALPH_GATE, 1
	warp_event 48, 13, ROUTE_36_RUINS_OF_ALPH_GATE, 2

	def_coord_events

	def_bg_events
	bg_event 29,  1, BGEVENT_READ, Route36TrainerTips2
	bg_event 45, 11, BGEVENT_READ, RuinsOfAlphNorthSign
	bg_event 55,  7, BGEVENT_READ, Route36Sign
	bg_event 21,  7, BGEVENT_READ, Route36TrainerTips1

	def_object_events
	object_event 20, 12, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerPsychicMark, -1
	object_event 31, 14, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 5, TrainerSchoolboyAlan1, -1
	object_event 35,  9, SPRITE_WEIRD_TREE, SPRITEMOVEDATA_SUDOWOODO, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SudowoodoScript, EVENT_ROUTE_36_SUDOWOODO
	object_event 51,  8, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route36LassScript, -1
	object_event 44,  9, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route36RockSmashGuyScript, -1
	object_event 21,  4, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route36FruitTree, -1
	object_event 46,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ArthurScript, EVENT_ROUTE_36_ARTHUR_OF_THURSDAY
