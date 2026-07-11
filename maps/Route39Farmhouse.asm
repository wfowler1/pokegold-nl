DEF ROUTE39FARMHOUSE_MILK_PRICE EQU 500

	object_const_def
	const ROUTE39FARMHOUSE_POKEFAN_M
	const ROUTE39FARMHOUSE_POKEFAN_F

Route39Farmhouse_MapScripts:
	def_scene_scripts

	def_callbacks

PokefanM_DairyFarmer:
	faceplayer
	opentext
	checkevent EVENT_HEALED_MOOMOO
	iftrue FarmerMScript_SellMilk
	writetext FarmerMText_SickCow
	waitbutton
	closetext
	setevent EVENT_TALKED_TO_FARMER_ABOUT_MOOMOO
	end

FarmerMScript_SellMilk:
	checkitem MOOMOO_MILK
	iftrue FarmerMScript_Milking
	writetext FarmerMText_BuyMilk
	special PlaceMoneyTopRight
	yesorno
	iffalse FarmerMScript_NoSale
	checkmoney YOUR_MONEY, ROUTE39FARMHOUSE_MILK_PRICE
	ifequal HAVE_LESS, FarmerMScript_NoMoney
	giveitem MOOMOO_MILK
	iffalse FarmerMScript_NoRoom
	takemoney YOUR_MONEY, ROUTE39FARMHOUSE_MILK_PRICE
	special PlaceMoneyTopRight
	waitsfx
	playsound SFX_TRANSACTION
	writetext FarmerMText_GotMilk
	promptbutton
	itemnotify
	closetext
	end

FarmerMScript_NoMoney:
	writetext FarmerMText_NoMoney
	waitbutton
	closetext
	end

FarmerMScript_NoRoom:
	writetext FarmerMText_NoRoom
	waitbutton
	closetext
	end

FarmerMScript_NoSale:
	writetext FarmerMText_NoSale
	waitbutton
	closetext
	end

FarmerMScript_Milking:
	writetext FarmerMText_Milking
	waitbutton
	closetext
	end

PokefanF_SnoreFarmer:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM13_SNORE_FROM_MOOMOO_FARM
	iftrue FarmerFScript_GotSnore
	checkevent EVENT_HEALED_MOOMOO
	iftrue FarmerFScript_GiveSnore
	writetext FarmerFText_InTrouble
	waitbutton
	closetext
	end

FarmerFScript_GiveSnore:
	writetext FarmerFText_HealedMiltank
	promptbutton
	verbosegiveitem TM_SNORE
	iffalse FarmerFScript_NoRoomForSnore
	setevent EVENT_GOT_TM13_SNORE_FROM_MOOMOO_FARM
FarmerFScript_GotSnore:
	writetext FarmerFText_SnoreSpeech
	waitbutton
FarmerFScript_NoRoomForSnore:
	closetext
	end

FarmhouseBookshelf:
	jumpstd PictureBookshelfScript

FarmerMText_SickCow:
	text "Mien MILTANK geft" ; "My MILTANK ain't"
	line "gien drup melk" ; "givin' me milk"
	cont "meer." ; "nomore."

	para "Deze BOERDERIJ hef" ; "This here FARM's"
	line "beroem'n melk." ; "got famous milk."

	para "Alleman wil d'r" ; "Most everyone"
	line "'n slok van." ; "wants a drink."

	para "Geft mie veul melk" ; "It'll give me lots"
	line "as'k d'r" ; "o' milk if'n I"

	para "veul BESJES in" ; "feed it lots o'"
	line "kieper, denk'k." ; "BERRIES, I reckon."
	done

FarmerMText_BuyMilk:
	text "Wa vind'ie van m'n" ; "How'd you like my"
	line "MOOMOO MELK?" ; "MOOMOO MILK?"

	para "'t is mien" ; "It's my pride and"
	line "trots, mien jong." ; "joy, son."

	para "Gef 't aan" ; "Give it to #MON"
	line "#MON, dan" ; "to restore HP!"

	para "kriegen ze de" ; "I'll give it to ya"
	line "HP weer vol!" ; "fer just ¥{d:ROUTE39FARMHOUSE_MILK_PRICE}."
	para "En veur joe,"
	line "veur maar ¥{d:ROUTE39FARMHOUSE_MILK_PRICE}"
	done

FarmerMText_GotMilk:
	text "Hiero! Drink 'n" ; "Here ya go!"
	line "geniet!" ; "Drink up'n enjoy!"
	done

FarmerMText_NoMoney:
	text "Sorry, mien jong." ; "Sorry, son."
	line "Geun geld," ; "No cash, no sale!"
	cont "geun verkoop!"
	done

FarmerMText_NoRoom:
	text "Je TAS zit" ; "I reckon yer"
	line "vol, mien jong." ; "PACK's full, son."
	done

FarmerMText_NoSale:
	text "Geun interesse?" ; "You don't want it?"
	line "Kom nog 'ns, ja?" ; "Come again, hear?"
	done

FarmerMText_Milking:
	text "Beter ga'k 'em" ; "I best go do my"
	line "melken." ; "milkin'."
	done

FarmerFText_InTrouble:
	text "We bezorg'n zelfs" ; "Our milk even goes"
	line "in KANTO." ; "out to KANTO."

	para "Dus als MILTANK" ; "So if our own"
	line "geun melk gef," ; "MILTANK won't give"

	para "hebb'n we 'n dik" ; "us any milk, we're"
	line "probleem." ; "in trouble."
	done

FarmerFText_HealedMiltank:
	text "Je hebt MILTANK" ; "You fixed our"
	line "gefixt, jong. Nu" ; "MILTANK, hon. Now"

	para "hebb'n we weur" ; "it gives MOOMOO"
	line "MOOMOO-melk." ; "MILK again."

	para "Hier is iets veur" ; "Here's somethin'"
	line "de moeite." ; "fer your trouble."
	done

Text_ReceivedTM13: ; unreferenced
	text "<PLAYER> ontving" ; "<PLAYER> received"
	line "TM13."
	done

FarmerFText_SnoreSpeech:
	text "Dat daar is" ; "That there's"
	line "SNURK." ; "SNORE."

	para "'n zeldzame aan-" ; "It's a rare move"
	line "val die alleen" ; "that only works"

	para "werkt als de" ; "while the #MON"
	line "#MON slaapt." ; "is asleep."

	para "Denk maar goed na" ; "You best think how"
	line "over wat joe ermee" ; "you ought to use"
	cont "kan, jong." ; "it, hon."
	done

Route39Farmhouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, ROUTE_39, 2
	warp_event  3,  7, ROUTE_39, 2

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, FarmhouseBookshelf
	bg_event  1,  1, BGEVENT_READ, FarmhouseBookshelf

	def_object_events
	object_event  3,  2, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PokefanM_DairyFarmer, -1
	object_event  5,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PokefanF_SnoreFarmer, -1
