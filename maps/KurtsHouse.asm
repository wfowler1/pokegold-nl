	object_const_def
	const KURTSHOUSE_KURT1
	const KURTSHOUSE_TWIN
	const KURTSHOUSE_SLOWPOKE
	const KURTSHOUSE_KURT2

KurtsHouse_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, KurtsHouseKurtCallback

KurtsHouseKurtCallback:
	checkevent EVENT_CLEARED_SLOWPOKE_WELL
	iffalse .Done
	checkflag ENGINE_KURT_MAKING_BALLS
	iftrue .MakingBalls
	disappear KURTSHOUSE_KURT2
	appear KURTSHOUSE_KURT1
	endcallback

.MakingBalls:
	disappear KURTSHOUSE_KURT1
	appear KURTSHOUSE_KURT2
.Done:
	endcallback

Kurt1:
	faceplayer
	opentext
	checkevent EVENT_KURT_GAVE_YOU_LURE_BALL
	iftrue .GotLureBall
	checkevent EVENT_CLEARED_SLOWPOKE_WELL
	iftrue .ClearedSlowpokeWell
	writetext KurtsHouseKurtMakingBallsMustWaitText
	waitbutton
	closetext
	special FadeOutMusic
	setevent EVENT_AZALEA_TOWN_SLOWPOKETAIL_ROCKET
	readvar VAR_FACING
	ifequal UP, .RunAround
	turnobject PLAYER, DOWN
	playsound SFX_FLY
	applymovement KURTSHOUSE_KURT1, KurtsHouseKurtExitHouseMovement
	playsound SFX_EXIT_BUILDING
	disappear KURTSHOUSE_KURT1
	waitsfx
	special RestartMapMusic
	end

.RunAround:
	turnobject PLAYER, DOWN
	playsound SFX_FLY
	applymovement KURTSHOUSE_KURT1, KurtsHouseKurtGoAroundPlayerThenExitHouseMovement
	playsound SFX_EXIT_BUILDING
	disappear KURTSHOUSE_KURT1
	waitsfx
	special RestartMapMusic
	end

.ClearedSlowpokeWell:
	writetext KurtsHouseKurtHonoredToMakeBallsText
	promptbutton
	verbosegiveitem LURE_BALL
	iffalse .NoRoomForBall
	setevent EVENT_KURT_GAVE_YOU_LURE_BALL
.GotLureBall:
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftrue .ThatTurnedOutGreat
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue .WaitForApricorns
	checkevent EVENT_GAVE_KURT_RED_APRICORN
	iftrue .GiveLevelBall
	checkevent EVENT_GAVE_KURT_BLU_APRICORN
	iftrue .GiveLureBall
	checkevent EVENT_GAVE_KURT_YLW_APRICORN
	iftrue .GiveMoonBall
	checkevent EVENT_GAVE_KURT_GRN_APRICORN
	iftrue .GiveFriendBall
	checkevent EVENT_GAVE_KURT_WHT_APRICORN
	iftrue .GiveFastBall
	checkevent EVENT_GAVE_KURT_BLK_APRICORN
	iftrue .GiveHeavyBall
	checkevent EVENT_GAVE_KURT_PNK_APRICORN
	iftrue .GiveLoveBall
	writetext KurtsHouseKurtBallsFromApricornsText
	promptbutton
	checkitem RED_APRICORN
	iftrue .AskApricorn
	checkitem BLU_APRICORN
	iftrue .AskApricorn
	checkitem YLW_APRICORN
	iftrue .AskApricorn
	checkitem GRN_APRICORN
	iftrue .AskApricorn
	checkitem WHT_APRICORN
	iftrue .AskApricorn
	checkitem BLK_APRICORN
	iftrue .AskApricorn
	checkitem PNK_APRICORN
	iftrue .AskApricorn
	closetext
	end

.AskApricorn:
	writetext KurtsHouseKurtAskYouHaveAnApricornText
	promptbutton
	special SelectApricornForKurt
	ifequal FALSE, .Cancel
	ifequal BLU_APRICORN, .Blu
	ifequal YLW_APRICORN, .Ylw
	ifequal GRN_APRICORN, .Grn
	ifequal WHT_APRICORN, .Wht
	ifequal BLK_APRICORN, .Blk
	ifequal PNK_APRICORN, .Pnk
; .Red
	setevent EVENT_GAVE_KURT_RED_APRICORN
	sjump .GaveKurtApricorns

.Blu:
	setevent EVENT_GAVE_KURT_BLU_APRICORN
	sjump .GaveKurtApricorns

.Ylw:
	setevent EVENT_GAVE_KURT_YLW_APRICORN
	sjump .GaveKurtApricorns

.Grn:
	setevent EVENT_GAVE_KURT_GRN_APRICORN
	sjump .GaveKurtApricorns

.Wht:
	setevent EVENT_GAVE_KURT_WHT_APRICORN
	sjump .GaveKurtApricorns

.Blk:
	setevent EVENT_GAVE_KURT_BLK_APRICORN
	sjump .GaveKurtApricorns

.Pnk:
	setevent EVENT_GAVE_KURT_PNK_APRICORN
	sjump .GaveKurtApricorns

.GaveKurtApricorns:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	setflag ENGINE_KURT_MAKING_BALLS
.WaitForApricorns:
	writetext KurtsHouseKurtItWillTakeADayText
	waitbutton
	closetext
	end

.Cancel:
	writetext KurtsHouseKurtThatsALetdownText
	waitbutton
	closetext
	end

.KurtMakingBallsScript:
	writetext KurtsHouseKurtDontBotherMeText
	waitbutton
	closetext
	end

._ThatTurnedOutGreat:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
.ThatTurnedOutGreat:
	writetext KurtsHouseKurtTurnedOutGreatText
	waitbutton
.NoRoomForBall:
	closetext
	end

.GiveLevelBall:
	checkflag ENGINE_KURT_MAKING_BALLS
	iftrue .KurtMakingBallsScript
	writetext KurtsHouseKurtJustFinishedYourBallText
	promptbutton
	verbosegiveitem LEVEL_BALL
	iffalse .NoRoomForBall
	clearevent EVENT_GAVE_KURT_RED_APRICORN
	sjump ._ThatTurnedOutGreat

.GiveLureBall:
	checkflag ENGINE_KURT_MAKING_BALLS
	iftrue .KurtMakingBallsScript
	writetext KurtsHouseKurtJustFinishedYourBallText
	promptbutton
	verbosegiveitem LURE_BALL
	iffalse .NoRoomForBall
	clearevent EVENT_GAVE_KURT_BLU_APRICORN
	sjump ._ThatTurnedOutGreat

.GiveMoonBall:
	checkflag ENGINE_KURT_MAKING_BALLS
	iftrue .KurtMakingBallsScript
	writetext KurtsHouseKurtJustFinishedYourBallText
	promptbutton
	verbosegiveitem MOON_BALL
	iffalse .NoRoomForBall
	clearevent EVENT_GAVE_KURT_YLW_APRICORN
	sjump ._ThatTurnedOutGreat

.GiveFriendBall:
	checkflag ENGINE_KURT_MAKING_BALLS
	iftrue .KurtMakingBallsScript
	writetext KurtsHouseKurtJustFinishedYourBallText
	promptbutton
	verbosegiveitem FRIEND_BALL
	iffalse .NoRoomForBall
	clearevent EVENT_GAVE_KURT_GRN_APRICORN
	sjump ._ThatTurnedOutGreat

.GiveFastBall:
	checkflag ENGINE_KURT_MAKING_BALLS
	iftrue .KurtMakingBallsScript
	writetext KurtsHouseKurtJustFinishedYourBallText
	promptbutton
	verbosegiveitem FAST_BALL
	iffalse .NoRoomForBall
	clearevent EVENT_GAVE_KURT_WHT_APRICORN
	sjump ._ThatTurnedOutGreat

.GiveHeavyBall:
	checkflag ENGINE_KURT_MAKING_BALLS
	iftrue .KurtMakingBallsScript
	writetext KurtsHouseKurtJustFinishedYourBallText
	promptbutton
	verbosegiveitem HEAVY_BALL
	iffalse .NoRoomForBall
	clearevent EVENT_GAVE_KURT_BLK_APRICORN
	sjump ._ThatTurnedOutGreat

.GiveLoveBall:
	checkflag ENGINE_KURT_MAKING_BALLS
	iftrue .KurtMakingBallsScript
	writetext KurtsHouseKurtJustFinishedYourBallText
	promptbutton
	verbosegiveitem LOVE_BALL
	iffalse .NoRoomForBall
	clearevent EVENT_GAVE_KURT_PNK_APRICORN
	sjump ._ThatTurnedOutGreat

KurtsGranddaughter:
	faceplayer
	opentext
	checkevent EVENT_FAST_SHIP_FIRST_TIME
	iftrue .Dad
	checkevent EVENT_CLEARED_SLOWPOKE_WELL
	iftrue .SlowpokeBack
	checkevent EVENT_AZALEA_TOWN_SLOWPOKETAIL_ROCKET
	iftrue .Lonely
	writetext KurtsGranddaughterSlowpokeGoneText
	waitbutton
	closetext
	end

.SlowpokeBack:
	writetext KurtsGranddaughterSlowpokeBackText
	waitbutton
	closetext
	end

.Lonely:
	writetext KurtsGranddaughterLonelyText
	waitbutton
	closetext
	end

.Dad:
	writetext KurtsGranddaughterDadText
	waitbutton
	closetext
	end

KurtsHouseSlowpoke:
	faceplayer
	opentext
	writetext KurtsHouseSlowpokeText
	cry SLOWPOKE
	waitbutton
	closetext
	end

KurtsHouseOakPhoto:
	jumptext KurtsHouseOakPhotoText

KurtsHouseCelebiStatue:
	jumptext KurtsHouseCelebiStatueText

KurtsHouseBookshelf:
	jumpstd DifficultBookshelfScript

KurtsHouseRadio:
	jumpstd Radio2Script

KurtsHouseKurtExitHouseMovement:
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	step_end

KurtsHouseKurtGoAroundPlayerThenExitHouseMovement:
	big_step RIGHT
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	step_end

KurtsHouseKurtMakingBallsMustWaitText:
	text "Hm? Wie ben jij?" ; "Hm? Who are you?"

	para "<PLAYER>, eh? Je" ; "<PLAYER>, eh? You"
	line "wil dat ik wat" ; "want me to make"
	cont "BALLEN maak?" ; "some BALLS?"

	para "Sorry, maar dat" ; "Sorry, but that'll"
	line "moet wachten." ; "have to wait."

	para "Ken je TEAM" ; "Do you know TEAM"
	line "ROCKET? Ah, geen" ; "ROCKET? Ah, don't"

	para "zorgen. Ik vertel" ; "worry. I'll tell"
	line "het je sowieso." ; "you anyhow."

	para "TEAM ROCKET is een" ; "TEAM ROCKET's an"
	line "kwaadaardige bende" ; "evil gang that"

	para "die #MON voor" ; "uses #MON for"
	line "vuil werk inzet." ; "their dirty work."

	para "Ze zouden drie" ; "They're supposed"
	line "jaar terug zijn" ; "to have disbanded"
	cont "ontbonden." ; "three years ago."

	para "Hoe dan ook, ze" ; "Anyway, they're at"
	line "zijn in de PUT, en" ; "the WELL, cutting"

	para "hakken SLOWPOKE-" ; "off SLOWPOKETAILS"
	line "STAARTEN af om te" ; "for sale!"
	cont "verkopen!"

	para "Dus ik ga er heen" ; "So I'm going to"
	line "om ze een lesje te" ; "go give them a"
	cont "leren!" ; "lesson in pain!"

	para "Hou vol, SLOWPOKE!" ; "Hang on, SLOWPOKE!"
	line "Ouwe KURT komt" ; "Old KURT is on his"
	cont "er aan!" ; "way!"
	done

KurtsHouseKurtHonoredToMakeBallsText:
	text "KURT: Ha <PLAYER>!" ; "KURT: Hi, <PLAYER>!"

	para "Je gedroeg je als" ; "You handled your-"
	line "een ware held in" ; "self like a real"
	cont "de PUT." ; "hero at the WELL."

	para "Ik mag jou wel!" ; "I like your style!"

	para "Het zou een eer" ; "I would be honored"
	line "zijn om BALLEN" ; "to make BALLS for"

	para "te maken voor een" ; "a trainer like"
	line "trainer als jij." ; "you."

	para "Dit is alles dat" ; "This is all I have"
	line "ik nu heb, maar" ; "now, but take it."
	cont "neem het."
	done

KurtsHouseKurtBallsFromApricornsText:
	text "KURT: Ik maak" ; "KURT: I make BALLS"
	line "BALLEN van ABRIK-" ; "from APRICORNS."
	cont "HORNS."

	para "Pluk ze uit bomen" ; "Collect them from"
	line "en breng ze dan" ; "trees and bring"
	cont "naar mij." ; "'em to me."

	para "Dan maak ik er" ; "I'll make BALLS"
	line "BALLEN van." ; "out of them."
	done

KurtsHouseKurtAskYouHaveAnApricornText:
	text "KURT: Heb jij een" ; "KURT: You have an"
	line "ABRIKHORN voor me?" ; "APRICORN for me?"

	para "Prima! Ik maak er" ; "Fine! I'll turn it"
	line "een BAL van." ; "into a BALL."
	done

KurtsHouseKurtItWillTakeADayText:
	text "KURT: Het duurt 'n" ; "KURT: It'll take a"
	line "dag om er een BAL" ; "day to make you a"

	para "van te maken. Kom" ; "BALL. Come back"
	line "later maar terug." ; "for it later."
	done

KurtsHouseKurtThatsALetdownText:
	text "KURT: Oh… Wat een" ; "KURT: Oh…"
	line "teleurstelling." ; "That's a letdown."
	done

KurtsHouseKurtDontBotherMeText:
	text "KURT: Ik werk hier" ; "KURT: I'm working!"
	line "nu! Stoor me niet!" ; "Don't bother me!"
	done

KurtsHouseKurtJustFinishedYourBallText:
	text "KURT: Ah, <PLAYER>!"
	line "Ik was net klaar" ; "I just finished"
	cont "met je BAL. Hier!" ; "your BALL. Here!"
	done

KurtsHouseKurtTurnedOutGreatText:
	text "KURT: Die is best" ; "KURT: That turned"
	line "goed gelukt." ; "out great."

	para "Probeer maar een" ; "Try catching"
	line "#MON te vangen." ; "#MON with it."
	done

KurtsGranddaughterSlowpokeGoneText:
	text "De SLOWPOKE zijn" ; "The SLOWPOKE are"
	line "weg… Hebben" ; "gone… Were they"

	para "slechte mensen ze" ; "taken away by bad"
	line "meegenomen?" ; "people?"
	done

KurtsGranddaughterLonelyText:
	text "Opa is weg…" ; "Grandpa's gone…"
	line "Ik ben zo eenzaam…" ; "I'm so lonely…"
	done

KurtsGranddaughterSlowpokeBackText: ; AlwaysReplace
	text "De SLOWPOKE die" ; "The SLOWPOKE my"
	line "mijn vader gaf" ; "dad gave me came"

	para "kwam terug! De" ; "back! Its TAIL is"
	line "STAART groeit ook" ; "growing back too!"
	cont "weer terug!"
	done

KurtsGranddaughterDadText:
	text "Papa werkte bij" ; "Dad works at SILPH"
	line "SILPH en onder-" ; "where he studies"
	cont "zocht #BALLEN." ; "# BALLS."

	para "Ik moet bij Opa" ; "I have to stay"
	line "en SLOWPOKE" ; "home with Grandpa"
	cont "thuisblijven." ; "and SLOWPOKE."
	done

KurtsHouseSlowpokeText:
	text "SLOWPOKE: …"
	line "Gaap?" ; "Yawn?"
	done

KurtsHouseOakPhotoText:
	text "…Een jonge PROF." ; "…A young PROF."
	line "OAK?"
	done

KurtsHouseCelebiStatueText:
	text "Een standbeeld van" ; "It's a statue of"
	line "de wachter van het" ; "the forest's pro-"
	cont "woud." ; "tector."
	done

KurtsHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, AZALEA_TOWN, 4
	warp_event  4,  7, AZALEA_TOWN, 4

	def_coord_events

	def_bg_events
	bg_event  6,  1, BGEVENT_READ, KurtsHouseRadio
	bg_event  8,  0, BGEVENT_READ, KurtsHouseOakPhoto
	bg_event  9,  0, BGEVENT_READ, KurtsHouseOakPhoto
	bg_event  5,  1, BGEVENT_READ, KurtsHouseBookshelf
	bg_event  2,  1, BGEVENT_READ, KurtsHouseBookshelf
	bg_event  3,  1, BGEVENT_READ, KurtsHouseBookshelf
	bg_event  4,  1, BGEVENT_READ, KurtsHouseCelebiStatue

	def_object_events
	object_event  3,  2, SPRITE_KURT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Kurt1, EVENT_KURTS_HOUSE_KURT_1
	object_event  5,  3, SPRITE_TWIN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KurtsGranddaughter, -1
	object_event  6,  3, SPRITE_SLOWPOKE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KurtsHouseSlowpoke, EVENT_KURTS_HOUSE_SLOWPOKE
	object_event 14,  3, SPRITE_KURT, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Kurt1, EVENT_KURTS_HOUSE_KURT_2
