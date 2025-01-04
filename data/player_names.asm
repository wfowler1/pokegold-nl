NameMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 10, TEXTBOX_Y - 1
	dw .Names
	db 1 ; default option

.Names:
	db STATICMENU_CURSOR | STATICMENU_PLACE_TITLE | STATICMENU_DISABLE_B ; flags
	db 5 ; items
	db "NIEUW@" ; "NEW NAME@"

PlayerNameArray:
IF DEF(_GOLD)
	db "GOLD@"
	db "ALEX@" ; "HIRO@"
	db "BAS@" ; "TAYLOR@"
	db "KAREL@" ; "KARL@"
ELIF DEF(_SILVER)
	db "SILVER@"
	db "FREEK@" ; "KAMON@"
	db "ADRIAAN@" ; "OSCAR@"
	db "THOMAS@" ; "MAX@"
ENDC
	db 2 ; title indent
	db "NAAM@" ; "NAME@" ; title
