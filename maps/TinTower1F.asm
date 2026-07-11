	object_const_def
	const TINTOWER1F_SAGE

TinTower1F_MapScripts:
	def_scene_scripts

	def_callbacks

TinTowerSageScript:
	jumptextfaceplayer TinTowerSageText

TinTowerSageText:
	text "Ik probeer het" ; "I'm trying to un-"
	line "geheim van de" ; "cover the secret"

	para "legendarische" ; "of the legendary"
	line "#MON die hier" ; "#MON that is"
	cont "zou zijn geland" ; "said to land here."

	para "te ontdekken." ; "They say that the"
	line "Men zegt dat de" ; "#MON has flown"

	para "#MON continu" ; "continuously ever"
	line "heeft gevlogen" ; "since the TOWER in"
	cont "sinds de brand" ; "the West burned."

	para "in de TOREN in" ; "So, I thought that"
	line "het westen." ; "if I had what the"

	para "Dus, ik dacht" ; "#MON has, it"
	line "als ik iets heb" ; "would be attracted"
	cont "dat die #MON" ; "by that item."

	para "heeft, het door" ; "I think that item"
	line "dat voorwerp wordt" ; "is probably…"

	para "aangetrokken." ; "A RAINBOW WING!"

	para "Dat voorwerp is" ; "But, where would"
	line "waarschijnlijk…" ; "I find one?"
	para "EEN REGENBOOGVEER!"
	para "Maar, waar"
	line "vind ik er een?"
	done

TinTower1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9, 15, ECRUTEAK_CITY, 12
	warp_event 10, 15, ECRUTEAK_CITY, 12
	warp_event 10,  2, TIN_TOWER_2F, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event 10,  2, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TinTowerSageScript, EVENT_TEAM_ROCKET_DISBANDED
