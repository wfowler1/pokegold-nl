	object_const_def
	const GOLDENRODFLOWERSHOP_TEACHER
	const GOLDENRODFLOWERSHOP_FLORIA

GoldenrodFlowerShop_MapScripts:
	def_scene_scripts

	def_callbacks

FlowerShopTeacherScript:
	checkevent EVENT_GOT_SQUIRTBOTTLE
	iftrue .Lalala
	checkflag ENGINE_PLAINBADGE
	iffalse .Lalala
	faceplayer
	opentext
	writetext GoldenrodFlowerShopTeacherBetterThanWhitneyText
	promptbutton
	verbosegiveitem SQUIRTBOTTLE
	setevent EVENT_GOT_SQUIRTBOTTLE
	closetext

.Lalala:
	turnobject GOLDENRODFLOWERSHOP_TEACHER, LEFT
	opentext
	writetext GoldenrodFlowerShopTeacherLalalaHavePlentyOfWaterText
	waitbutton
	closetext
	end

FlowerShopFloriaScript:
	faceplayer
	opentext
	checkflag ENGINE_PLAINBADGE
	iffalse .NoPlainBadge
	writetext GoldenrodFlowerShopFloriaJumpsInSurpriseText
	waitbutton
	closetext
	end

.NoPlainBadge:
	writetext GoldenrodFlowerShopFloriaMustBeAMonText
	waitbutton
	closetext
	end

FlowerShopShelf1: ; unreferenced
	jumpstd PictureBookshelfScript

FlowerShopShelf2: ; unreferenced
	jumpstd MagazineBookshelfScript

FlowerShopRadio: ; unreferenced
	jumpstd Radio2Script

GoldenrodFlowerShopTeacherBetterThanWhitneyText:
	text "Oh, je bent beter" ; "Oh, you're better"
	line "dan WHITNEY." ; "than WHITNEY."

	para "Weet je van die" ; "Do you know about"
	line "bewegende boom?" ; "that moving tree?"

	para "Als je die nat" ; "If you wet it with"
	line "maakt met een" ; "a SQUIRTBOTTLE, it"
	cont "SPUITFLES, gaat" ; "attacks."

	para "het in de aanval." ; "But since you"
	line "Maar gezien je" ; "have some BADGES,"
	cont "wat BADGES hebt," ; "you should be OK."
	cont "red je het vast."
	done

GoldenrodFlowerShopTeacherLalalaHavePlentyOfWaterText:
	text "Lalala lalalala." ; "Lalala lalalala."
	line "Hier, veel water" ; "Have plenty of"
	cont "voor jou, liefje!" ; "water, my lovely!"
	done

GoldenrodFlowerShopFloriaMustBeAMonText:
	text "Toen ik die" ; "When I watered"
	line "bewegende boom" ; "that moving tree"

	para "op ROUTE 36" ; "on ROUTE 36, it"
	line "water gaf, maakte" ; "jumped!"

	para "'t een sprongetje!" ; "I think it must be"
	line "Ik denk dat het" ; "a #MON."

	para "een #MON is." ; "But it would take"
	line "Maar enkel iemand" ; "someone like WHIT-"
	cont "als WHITNEY, onze" ; "NEY, our GYM LEAD-"
	cont "GYMLEIDER, kan" ; "ER, to beat it."
	cont "het verslaan."
	done

GoldenrodFlowerShopFloriaJumpsInSurpriseText:
	text "Weet je van die" ; "Do you know about"
	line "bewegende boom?" ; "the moving tree?"

	para "Als je die water" ; "If you water it,"
	line "geeft, doet ie" ; "it jumps up in"
	cont "een sprongetje!" ; "surprise!"
	done

GoldenrodFlowerShop_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, GOLDENROD_CITY, 6
	warp_event  3,  7, GOLDENROD_CITY, 6

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  4, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FlowerShopTeacherScript, -1
	object_event  5,  6, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, FlowerShopFloriaScript, -1
