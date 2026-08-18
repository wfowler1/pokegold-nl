	const_def
	const PINK_PAGE   ; 0
	const GREEN_PAGE  ; 1
	const BLUE_PAGE   ; 2
	const ORANGE_PAGE ; 3
DEF NUM_STAT_PAGES EQU const_value

StatsScreenInit:
	ldh a, [hMapAnims]
	push af
	xor a
	ldh [hMapAnims], a ; disable overworld tile animations

	ld c, PINK_PAGE ; first_page
	call StatsScreenMain

	; restore old values
	pop af
	ldh [hMapAnims], a
	ret

StatsScreenMain:
	push bc
	ld a, [wMonType]
	cp TEMPMON
	jr nz, .not_tempmon
	ld a, [wBufferMonSpecies]
	ld [wCurSpecies], a
	call GetBaseData
	ld hl, wBufferMon
	ld de, wTempMon
	ld bc, PARTYMON_STRUCT_LENGTH
	call CopyBytes
	jr .got_stats

.not_tempmon
	call CopyMonToTempMon
	ld a, [wCurPartySpecies]
	cp EGG
	jp z, .got_stats
	ld a, [wMonType]
	cp BOXMON
	jr c, .got_stats
	call CalcTempmonStats

.got_stats
	call ClearBGPalettes
	call ClearTilemap
	call UpdateSprites
	callfar StatsScreen_LoadFont

	pop bc
	ld a, [wCurPartySpecies]
	cp EGG
	jp z, EggStatsInit
	call StatsScreen_InitUpperHalf
	ld b, 0
	jp StatsScreen_JumpToLoadPageFunction

StatsScreen_LoadPage:
	push bc
	ld de, .done_loading
	push de
	jp hl

.done_loading
	pop bc
	ld b, 1

.joypad_loop
	call GetJoypad
	ld a, [wMonType]
	cp TEMPMON
	jr nz, .not_tempmon
	push hl
	push de
	push bc
	farcall StatsScreenDPad
	pop bc
	pop de
	pop hl
	ld a, [wMenuJoypad]
	and PAD_DOWN | PAD_UP
	jr nz, StatsScreenMain
	ld a, [wMenuJoypad]
	jr .joypad_action

.not_tempmon
	ldh a, [hJoyPressed]

.joypad_action
	and PAD_CTRL_PAD | PAD_A | PAD_B
	jr z, .joypad_loop
	bit B_BUTTON_F, a
	jp nz, StatsScreen_Exit
	bit B_PAD_LEFT, a
	jr nz, .d_left
	bit B_PAD_RIGHT, a
	jr nz, .d_right
	bit A_BUTTON_F, a
	jr nz, .a_button
	bit B_PAD_UP, a
	jr nz, .d_up

; down
	ld a, [wMonType]
	cp BOXMON
	jr nc, .joypad_loop
	and a
	ld a, [wPartyCount]
	jr z, .next_mon
	ld a, [wOTPartyCount]
.next_mon
	ld b, a
	ld a, [wCurPartyMon]
	inc a
	cp b
	jr z, .joypad_loop
	ld [wCurPartyMon], a
	ld b, a
	ld a, [wMonType]
	and a
	jr nz, .load_mon
	ld a, b
	inc a
	ld [wPartyMenuCursor], a
	jr .load_mon

.d_up
	ld a, [wCurPartyMon]
	and a
	jr z, .joypad_loop
	dec a
	ld [wCurPartyMon], a
	ld b, a
	ld a, [wMonType]
	and a
	jr nz, .load_mon
	ld a, b
	inc a
	ld [wPartyMenuCursor], a
.load_mon
	jp StatsScreenMain

.a_button
	ld a, c
	cp ORANGE_PAGE ; last page
	jr z, StatsScreen_Exit

.d_right
	inc c
	ld a, ORANGE_PAGE ; last page
	cp c
	jr nc, StatsScreen_JumpToLoadPageFunction
	ld c, PINK_PAGE ; first page
	jr StatsScreen_JumpToLoadPageFunction

.d_left
	ld a, c
	cp PINK_PAGE ; first page
	jr nz, StatsScreen_JumpToLoadPageFunction_decC
	ld c, ORANGE_PAGE ; last page
	jr StatsScreen_JumpToLoadPageFunction

StatsScreen_JumpToLoadPageFunction_decC:
	dec c
StatsScreen_JumpToLoadPageFunction:
	ld hl, StatsScreen_LoadPageJumptable
	push bc
	;dec c
	ld b, 0
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop bc
	jp StatsScreen_LoadPage

EggStatsInit:
	push bc
	call EggStatsScreen
	pop bc
; fallthrough

EggStats_JoypadLoop:
	call GetJoypad
	ld a, [wMonType]
	cp TEMPMON
	jr nz, .not_tempmon
	push hl
	push de
	push bc
	farcall StatsScreenDPad
	pop bc
	pop de
	pop hl
	ld a, [wMenuJoypad]
	and PAD_DOWN | PAD_UP
	jp nz, StatsScreenMain
	ld a, [wMenuJoypad]
	jr .joypad_action

.not_tempmon
	ldh a, [hJoyPressed]
.joypad_action
	and PAD_DOWN | PAD_UP | PAD_A | PAD_B
	jr z, EggStats_JoypadLoop
	bit A_BUTTON_F, a
	jr nz, StatsScreen_Exit
	bit B_BUTTON_F, a
	jr nz, StatsScreen_Exit
	bit B_PAD_UP, a
	jr nz, EggStats_UpAction
	bit B_PAD_DOWN, a
	jp EggStats_DownAction

StatsScreen_Exit:
	call ClearBGPalettes
	call ClearTilemap
	ret

EggStats_DownAction:
	ld a, [wMonType]
	cp BOXMON
	jr nc, EggStats_JoypadLoop
	and a
	ld a, [wPartyCount]
	jr z, .next_mon
	ld a, [wOTPartyCount]
.next_mon
	ld b, a
	ld a, [wCurPartyMon]
	inc a
	cp b
	jr z, EggStats_JoypadLoop
	ld [wCurPartyMon], a
	ld b, a
	ld a, [wMonType]
	and a
	jr nz, EggStats_ScrollToLoadMon
	ld a, b
	inc a
	ld [wPartyMenuCursor], a
	jr EggStats_ScrollToLoadMon

EggStats_UpAction:
	ld a, [wCurPartyMon]
	and a
	jr z, EggStats_JoypadLoop
	dec a
	ld [wCurPartyMon], a
	ld b, a
	ld a, [wMonType]
	and a
	jr nz, EggStats_ScrollToLoadMon
	ld a, b
	inc a
	ld [wPartyMenuCursor], a
; fallthrough

EggStats_ScrollToLoadMon:
	jp StatsScreenMain

StatsScreen_LoadPageJumptable:
; entries correspond to *_PAGE constants
	table_width 2
	dw LoadPinkPage
	dw LoadGreenPage
	dw LoadBluePage
	dw LoadOrangePage
	assert_table_length NUM_STAT_PAGES

StatsScreen_InitUpperHalf:
	push bc
	xor a
	ldh [hBGMapMode], a
	ld a, [wBaseDexNo]
	ld [wTextDecimalByte], a
	ld [wCurSpecies], a
	hlcoord 8, 0
	ld [hl], '№'
	inc hl
	ld [hl], '.'
	inc hl
	ld de, wTextDecimalByte
	lb bc, PRINTNUM_LEADINGZEROS | 1, 3
	call PrintNum
	hlcoord 14, 0
	call PrintLevel
	ld hl, .NicknamePointers
	call GetNicknamePointer
; Nickname
	ld a, [wMonType]
	cp BOXMON
	ld a, BANK(sBoxMonNicknames)
	call z, OpenSRAM
	ld d, h
	ld e, l
	hlcoord 8, 2
	call PlaceString
	ld a, [wMonType]
	cp BOXMON
	call z, CloseSRAM
; Gender character
	call GetGender
	jr c, .next
	ld a, '♂'
	jr nz, .got_gender
	ld a, '♀'
.got_gender
	hlcoord 18, 0
	ld [hl], a
.next
	hlcoord 9, 4
	ld a, '/'
	ld [hli], a
	ld a, [wBaseDexNo]
	ld [wNamedObjectIndex], a
	call GetPokemonName
	call PlaceString
	call StatsScreen_PlaceHorizontalDivider
	call StatsScreen_PlacePageSwitchArrows
	call StatsScreen_PlaceShinyIcon
; Place HP bar
	ld hl, wTempMonHP
	ld a, [hli]
	ld b, a
	ld c, [hl]
	ld hl, wTempMonMaxHP
	ld a, [hli]
	ld d, a
	ld e, [hl]
	callfar ComputeHPBarPixels
	ld hl, wCurHPPal
	call SetHPPal
	ld b, SCGB_STATS_SCREEN_HP_PALS
	call GetSGBLayout
	pop bc
	ret

.NicknamePointers:
	dw wPartyMonNicknames
	dw wOTPartyMonNicknames
	dw sBoxMonNicknames
	dw wBufferMonNickname

LoadPinkPage:
	push bc
	push bc
	xor a
	ldh [hBGMapMode], a
	ld a, [wBaseDexNo]
	ld [wTextDecimalByte], a
	ld [wCurSpecies], a
	ld b, PINK_PAGE
	call StatsScreen_LoadPageIndicators

; Load graphics
	hlcoord 0, 8
	lb bc, 10, 20
	call ClearBox
	hlcoord 0, 9
	ld b, $0
	call DrawPlayerHP
	hlcoord 8, 9
	ld [hl], $41 ; right HP/exp bar end cap
	hlcoord 0, 12
	ld de, .Status_Type
	call PlaceString
	ld a, [wTempMonPokerusStatus]
	ld b, a
	and $f
	jr nz, .HasPokerus
	ld a, b
	and $f0
	jr z, .NotImmuneToPkrs
	hlcoord 8, 8
	ld [hl], '.' ; Pokérus immunity dot
.NotImmuneToPkrs:
	ld a, [wMonType]
	cp BOXMON
	jr z, .StatusOK
	hlcoord 6, 13
	push hl
	ld de, wTempMonStatus
	call PlaceStatusString
	pop hl
	jr .StatusOK
.HasPokerus:
	ld de, .PkrsStr
	hlcoord 1, 13
	call PlaceString
	jr .done_status
.StatusOK:
	ld de, .OK_str
	call z, PlaceString
.done_status
	hlcoord 1, 15
	call PrintMonTypes
	ld bc, 9
	decoord 0, 16
	hlcoord 0, 17
	call CopyBytes
	ld a, ' '
	ld bc, 9
	hlcoord 0, 17
	call ByteFill
	hlcoord 9, 8
	ld de, SCREEN_WIDTH
	ld b, 10
	ld a, $31 ; vertical divider
.vertical_divider
	ld [hl], a
	add hl, de
	dec b
	jr nz, .vertical_divider
	ld de, .ExpPointStr
	hlcoord 10, 8
	call PlaceString
	hlcoord 17, 13
	call .PrintNextLevel
	hlcoord 13, 9
	lb bc, 3, 7
	ld de, wTempMonExp
	call PrintNum
	call .CalcExpToNextLevel
	hlcoord 13, 12
	lb bc, 3, 7
	ld de, wExpToNextLevel
	call PrintNum
	ld de, .LevelUpStr
	hlcoord 10, 11
	call PlaceString
	ld de, .ToStr
	hlcoord 12, 13
	call PlaceString
	hlcoord 11, 14
	ld a, [wTempMonLevel]
	ld b, a
	ld de, wTempMonExp + 2
	predef FillInExpBar
	hlcoord 10, 14
	ld [hl], $40 ; left exp bar end cap
	hlcoord 19, 14
	ld [hl], $41 ; right exp bar end cap
	
	ld de, .HappinessStr
	hlcoord 10, 16
	call PlaceString
	ld a, [wTempMonHappiness]
	cp 0
	jr z, .HappinessZero
	hlcoord 15, 17
	ld [hl], '♥'
	cp 50
	jr c, .HappinessOne
	hlcoord 16, 17
	ld [hl], '♥'
	cp 100
	jr c, .HappinessTwo
	hlcoord 17, 17
	ld [hl], '♥'
	cp 150
	jr c, .HappinessThree
	hlcoord 18, 17
	ld [hl], '♥'
	cp $ff
	jr c, .HappinessFour
	hlcoord 19, 17
	ld [hl], '♥'
	jr .LoadPalettes
.HappinessZero
	hlcoord 15, 17
	ld [hl], '♦'
.HappinessOne
	hlcoord 16, 17
	ld [hl], '♦'
.HappinessTwo
	hlcoord 17, 17
	ld [hl], '♦'
.HappinessThree
	hlcoord 18, 17
	ld [hl], '♦'
.HappinessFour
	hlcoord 19, 17
	ld [hl], '♦'

.LoadPalettes
; Load palettes / place frontpic
	pop bc
	farcall LoadStatsScreenPals
	call WaitBGMap
	ld a, 1
	ldh [hBGMapMode], a
	pop bc
	ld a, b
	and a
	jp z, StatsScreen_PlaceFrontpic
	ret

.PrintNextLevel:
	ld a, [wTempMonLevel]
	push af
	cp MAX_LEVEL
	jr z, .AtMaxLevel
	inc a
	ld [wTempMonLevel], a
.AtMaxLevel:
	call PrintLevel
	pop af
	ld [wTempMonLevel], a
	ret

.CalcExpToNextLevel:
	ld a, [wTempMonLevel]
	cp MAX_LEVEL
	jr z, .AlreadyAtMaxLevel
	inc a
	ld d, a
	farcall CalcExpAtLevel
	ld hl, wTempMonExp + 2
	ld hl, wTempMonExp + 2
	ldh a, [hQuotient + 3]
	sub [hl]
	dec hl
	ld [wExpToNextLevel + 2], a
	ldh a, [hQuotient + 2]
	sbc [hl]
	dec hl
	ld [wExpToNextLevel + 1], a
	ldh a, [hQuotient + 1]
	sbc [hl]
	ld [wExpToNextLevel], a
	ret

.AlreadyAtMaxLevel:
	ld hl, wExpToNextLevel
	xor a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ret

.Status_Type:
	db   "STATUS/" ; "STATUS/"
	next "TYPE/@" ; "TYPE/@"

.OK_str:
	db "OK @" ; "OK @"

.ExpPointStr:
	db "ERV PUNTEN@" ; "EXP POINTS@"

.LevelUpStr:
	db "LVL OMHOOG@" ; "LEVEL UP@"

.ToStr:
	db "NAAR@" ; "TO@"

.PkrsStr:
	db "#RUS@" ; "#RUS@"

.HappinessStr:
	db "BLIJDSCHAP@" ; "HAPPINESS@"

StatsScreen_PlaceVerticalDivider: ; unreferenced
; The Japanese stats screen has a vertical divider.
	hlcoord 7, 0
	ld bc, SCREEN_WIDTH
	ld d, SCREEN_HEIGHT
.loop
	ld a, $31 ; vertical divider
	ld [hl], a
	add hl, bc
	dec d
	jr nz, .loop
	ret

StatsScreen_PlaceHorizontalDivider:
	hlcoord 0, 7
	ld b, SCREEN_WIDTH
	ld a, $62 ; horizontal divider (empty HP/exp bar)
.loop
	ld [hli], a
	dec b
	jr nz, .loop
	ret

StatsScreen_PlacePageSwitchArrows:
	hlcoord 10, 6
	ld [hl], '◀'
	hlcoord 19, 6
	ld [hl], '▶'
	ret

StatsScreen_PlaceShinyIcon:
	ld bc, wTempMonDVs
	callfar CheckShininess
	ret nc
	hlcoord 19, 0
	ld [hl], '⁂'
	ret

LoadGreenPage:
	push bc
	push bc
	xor a
	ldh [hBGMapMode], a
	ld b, GREEN_PAGE
	call StatsScreen_LoadPageIndicators

; Load graphics
	hlcoord 0, 8
	lb bc, 10, 20
	call ClearBox
; item info
	hlcoord 0, 8
	ld de, .Item
	call PlaceString
	ld a, [wTempMonItem]
	and a
	ld de, .ThreeDashes
	jr z, .got_item_name
	ld b, a
	farcall TimeCapsule_ReplaceTeruSama
	ld a, b
	ld [wNamedObjectIndex], a
	call GetItemName
.got_item_name
	hlcoord 8, 8
	call PlaceString
; move info
	ld hl, wTempMonMoves
	ld de, wListMoves_MoveIndicesBuffer
	ld bc, NUM_MOVES
	call CopyBytes
	hlcoord 0, 10
	ld de, .Move
	call PlaceString
	hlcoord 8, 10
	ld a, SCREEN_WIDTH * 2
	ld [wListMovesLineSpacing], a
	call ListMoves
	hlcoord 12, 11
	ld a, SCREEN_WIDTH * 2
	ld [wListMovesLineSpacing], a
	call ListMovePP

; Load palettes / place frontpic
	pop bc
	farcall LoadStatsScreenPals
	call WaitBGMap
	ld a, 1
	ldh [hBGMapMode], a
	pop bc
	ld a, b
	and a
	jp z, StatsScreen_PlaceFrontpic
	ret

.Item:
	db "VOORW.@" ; "ITEM@"

.ThreeDashes:
	db "---@" ; "---@"

.Move:
	db "AANVAL@" ; "MOVE@"

LoadBluePage:
	push bc
	push bc
	xor a
	ldh [hBGMapMode], a
	ld b, BLUE_PAGE
	call StatsScreen_LoadPageIndicators

; Load graphics
	hlcoord 0, 8
	lb bc, 10, 20
	call ClearBox
	call .PlaceOTInfo
	ld de, MetAtMapString
	hlcoord 0, 11
	call PlaceString
	call .placeCaughtLevel
	call .placeCaughtLocationAndTime
	call .placeEggHatch
	hlcoord 10, 8
	ld de, SCREEN_WIDTH
	ld b, 10
	ld a, $31 ; vertical divider
.vertical_divider
	ld [hl], a
	add hl, de
	dec b
	jr nz, .vertical_divider
	hlcoord 11, 8
	ld bc, 6
	call PrintTempMonStats

; Load palettes / place frontpic
	pop bc
	farcall LoadStatsScreenPals
	call WaitBGMap
	ld a, 1
	ldh [hBGMapMode], a
	pop bc
	ld a, b
	and a
	jp z, StatsScreen_PlaceFrontpic
	ret

.PlaceOTInfo:
	ld de, OTString
	hlcoord 0, 8
	call PlaceString
	ld hl, .OTNamePointers
	call GetNicknamePointer
	call CopyNickname
	farcall CorrectNickErrors
	hlcoord 3, 8
	call PlaceString
	ld de, IDNoString
	hlcoord 0, 9
	call PlaceString
	hlcoord 3, 9
	lb bc, PRINTNUM_LEADINGZEROS | 2, 5
	ld de, wTempMonID
	call PrintNum
	ld a, [wTempMonCaughtGender]
	and a
	jr z, .done
	cp $7f
	jr z, .done
	and CAUGHT_GENDER_MASK
	ld a, '♂'
	jr z, .got_gender
	ld a, '♀'
.got_gender
	hlcoord 9, 9
	ld [hl], a
.done
	ret

.OTNamePointers:
	dw wPartyMonOTs
	dw wOTPartyMonOTs
	dw sBoxMonOTs
	dw wBufferMonOT

.placeCaughtLocationAndTime
	ld a, [wTempMonCaughtLocation]
	and CAUGHT_LOCATION_MASK
	jr z, .unknown_location_and_time
	cp LANDMARK_EVENT
	jr z, .unknown_location_and_time
	cp LANDMARK_GIFT
	jr z, .unknown_location_and_time
	ld e, a
	farcall GetLandmarkName
	farcall TownMap_ConvertLineBreakCharacters
	ld de, wStringBuffer1
	hlcoord 0, 12
	call PlaceString
	ld a, [wTempMonCaughtTime]
	and CAUGHT_TIME_MASK
	ret z ; no time
	rlca
	rlca
	dec a
	ld hl, .times
	call GetNthString
	ld d, h
	ld e, l
	call CopyName1
	ld de, wStringBuffer2
	hlcoord 1, 15
	call PlaceString
	ret

.unknown_location_and_time:
	ld de, MetUnknownMapString
	hlcoord 0, 12
	call PlaceString
	ret

.times
	db "OCHTEND@" ; "MORNING@"
	db "DAG@" ; "DAY@"
	db "NACHT@" ; "NIGHT@"

.placeCaughtLevel
	hlcoord 1, 14
	call PrintMetLevel
	ret

.placeEggHatch
	ld a, [wTempMonCaughtLevel]
	and CAUGHT_LEVEL_MASK
	ret z
	cp CAUGHT_EGG_LEVEL ; egg marker value
	ret nz
	ld de, FromAnEggString
	hlcoord 0, 16
	call PlaceString
	ret

IDNoString:
	db "<ID>№.@"

OTString:
	db "OT/@"

MetAtMapString:
	db "ONTMOET/@" ; "MET/@"
	
MetUnknownMapString:
	db "ONBEKEND@" ; "UNKNOWN@"
	
FromAnEggString:
	db "UIT EEN EI@" ; "FROM EGG@"

LoadOrangePage:
	push bc
	push bc
	xor a
	ldh [hBGMapMode], a
	ld b, ORANGE_PAGE
	call StatsScreen_LoadPageIndicators

; Load graphics
	hlcoord 0, 8
	lb bc, 10, 20
	call ClearBox

	hlcoord 8, 8
	ld de, SCREEN_WIDTH
	ld b, 10
	ld a, $31 ; vertical divider
.vertical_divider
	ld [hl], a
	add hl, de
	dec b
	jr nz, .vertical_divider
	
	ld de, .DV_Stat_Names
	hlcoord 0, 8
	call PlaceString
	
	ld a, [wTempMonDVs]
	and a, %11110000
	swap a
	ld b, a
	push bc
	hlcoord 6, 11
	ld de, wTextDecimalByte
	ld [de], a
	lb bc, 1, 2
	call PrintNum
	hlcoord 9, 11
	pop bc
	ld a, b
	call .Print_Judge_String
	
.print_def_judge
	ld a, [wTempMonDVs]
	and a, %00001111
	ld b, a
	push bc
	hlcoord 6, 13
	ld de, wTextDecimalByte
	ld [de], a
	lb bc, 1, 2
	call PrintNum
	hlcoord 9, 13
	pop bc
	ld a, b
	call .Print_Judge_String
	
.print_spc_judge
	ld a, [wTempMonDVs + 1]
	and a, %00001111
	ld b, a
	push bc
	hlcoord 6, 15
	ld de, wTextDecimalByte
	ld [de], a
	lb bc, 1, 2
	call PrintNum
	hlcoord 9, 15
	pop bc
	ld a, b
	call .Print_Judge_String

.print_spd_judge
	ld a, [wTempMonDVs + 1]
	and a, %11110000
	swap a
	ld b, a
	push bc
	hlcoord 6, 17
	ld de, wTextDecimalByte
	ld [de], a
	lb bc, 1, 2
	call PrintNum
	hlcoord 9, 17
	pop bc
	ld a, b
	call .Print_Judge_String

.print_hp_judge
	ld c, 0
	ld a, [wTempMonDVs]
	swap a
	and 1
	jr z, .atk_not_odd
	ld a, 0
	add 8
	ld c, a
.atk_not_odd
	ld a, [wTempMonDVs]
	and 1
	jr z, .def_not_odd
	ld a, c
	add 4
	ld c, a
.def_not_odd
	ld a, [wTempMonDVs + 1]
	swap a
	and 1
	jr z, .spd_not_odd
	ld a, c
	add 2
	ld c, a
.spd_not_odd
	ld a, [wTempMonDVs + 1]
	and 1
	jr z, .spc_not_odd
	ld a, c
	add 1
	ld c, a
.spc_not_odd
	ld a, c
	ld b, a
	push bc
	hlcoord 6, 9
	ld de, wTextDecimalByte
	ld [de], a
	lb bc, 1, 2
	call PrintNum
	hlcoord 9, 9
	pop bc
	ld a, b
	call .Print_Judge_String

; Stat EXP bars and DV values
	ld a, [wTempMonHPExp + 1]
	cp $ff
	ld a, [wTempMonHPExp]
	jr nz, .hp_exp_not_full
	cp $ff
	jr nz, .hp_exp_not_full
	ld a, 64
	jr .hp_exp_cont
.hp_exp_not_full
	srl a
	srl a
.hp_exp_cont
	ld b, a
	hlcoord 9, 8
	call PlaceStatExpBar
	
	ld a, [wTempMonHPExp]
	cp $ff
	jr nz, .atk_exp_bar
	ld a, [wTempMonHPExp + 1]
	cp $ff
	jr nz, .atk_exp_bar
	hlcoord 19, 8
	ld [hl], '⁂'

.atk_exp_bar
	ld a, [wTempMonAtkExp + 1]
	cp $ff
	ld a, [wTempMonAtkExp]
	jr nz, .atk_exp_not_full
	cp $ff
	jr nz, .atk_exp_not_full
	ld a, 64
	jr .atk_exp_cont
.atk_exp_not_full
	srl a
	srl a
.atk_exp_cont
	ld b, a
	hlcoord 9, 10
	call PlaceStatExpBar
	
	ld a, [wTempMonAtkExp]
	cp $ff
	jr nz, .def_exp_bar
	ld a, [wTempMonAtkExp + 1]
	cp $ff
	jr nz, .def_exp_bar
	hlcoord 19, 10
	ld [hl], '⁂'

.def_exp_bar
	ld a, [wTempMonDefExp + 1]
	cp $ff
	ld a, [wTempMonDefExp]
	jr nz, .def_exp_not_full
	cp $ff
	jr nz, .def_exp_not_full
	ld a, 64
	jr .def_exp_cont
.def_exp_not_full
	srl a
	srl a
.def_exp_cont
	ld b, a
	hlcoord 9, 12
	call PlaceStatExpBar
	
	ld a, [wTempMonDefExp]
	cp $ff
	jr nz, .spc_exp_bar
	ld a, [wTempMonDefExp + 1]
	cp $ff
	jr nz, .spc_exp_bar
	hlcoord 19, 12
	ld [hl], '⁂'

.spc_exp_bar
	ld a, [wTempMonSpcExp + 1]
	cp $ff
	ld a, [wTempMonSpcExp]
	jr nz, .spc_exp_not_full
	cp $ff
	jr nz, .spc_exp_not_full
	ld a, 64
	jr .spc_exp_cont
.spc_exp_not_full
	srl a
	srl a
.spc_exp_cont
	ld b, a
	hlcoord 9, 14
	call PlaceStatExpBar
	
	ld a, [wTempMonSpcExp]
	cp $ff
	jr nz, .spd_exp_bar
	ld a, [wTempMonSpcExp + 1]
	cp $ff
	jr nz, .spd_exp_bar
	hlcoord 19, 14
	ld [hl], '⁂'

.spd_exp_bar
	ld a, [wTempMonSpdExp + 1]
	cp $ff
	ld a, [wTempMonSpdExp]
	jr nz, .spd_exp_not_full
	cp $ff
	jr nz, .spd_exp_not_full
	ld a, 64
	jr .spd_exp_cont
.spd_exp_not_full
	srl a
	srl a
.spd_exp_cont
	ld b, a
	hlcoord 9, 16
	call PlaceStatExpBar
	
	ld a, [wTempMonSpdExp]
	cp $ff
	jr nz, .finish
	ld a, [wTempMonSpdExp + 1]
	cp $ff
	jr nz, .finish
	hlcoord 19, 16
	ld [hl], '⁂'
	jr .finish

; Prints judgment string based on the value in "a"
.Print_Judge_String
	cp 15
	jr nz, .check_fantastic
	ld de, BestString
	jr .done
.check_fantastic
	cp 14
	jr nz, .check_very_good
	ld de, FantasticString
	jr .done
.check_very_good
	cp 12
	jr c, .check_pretty_good
	ld de, VeryGoodString
	jr .done
.check_pretty_good
	cp 8
	jr c, .check_decent
	ld de, PrettyGoodString
	jr .done
.check_decent
	cp 1
	jr c, .no_good
	ld de, DecentString
	jr .done
.no_good
	ld de, NoGoodString
.done
	call PlaceString
	ret

.DV_Stat_Names:
	db "LP" ; "HP"
	next "AANVAL" ; "ATTACK"
	next "AFWEER" ; "DEFENSE"
	next "SPECIAAL" ; "SPECIAL"
	next "SNELHEID@" ; "SPEED@"

.finish
; Load palettes / place frontpic
	pop bc
	farcall LoadStatsScreenPals
	call WaitBGMap
	ld a, 1
	ldh [hBGMapMode], a
	pop bc
	ld a, b
	and a
	jp z, StatsScreen_PlaceFrontpic
	ret



NoGoodString:
	db "Niet goed@" ; "No good@"

DecentString:
	db "Redelijk@" ; "Decent@"

PrettyGoodString:
	db "Goed@" ; "Pretty good@"

VeryGoodString:
	db "Heel goed@" ; "Very good@"

FantasticString:
	db "Fantastisch@" ; "Fantastic@"

BestString:
	db "Best@"

PlaceStatExpBar:
	ld a, $40
	ld [hli], a ; left exp bar end cap
	ld c, $8 ; number of tiles
.loop1
	ld a, b
	sub $8
	jr c, .next
	ld b, a
	ld a, $6a ; full bar
	ld [hli], a
	dec c
	jr z, .finish
	jr .loop1

.next
	add $8
	jr z, .loop2
	add $62
	jr .skip

.loop2
	ld a, $62 ; empty bar

.skip
	ld [hli], a
	ld a, $62 ; empty bar
	dec c
	jr nz, .loop2

.finish
	ld [hl], $41 ; right exp bar end cap
	ret

StatsScreen_PlaceFrontpic:
	push bc
	call SetDefaultBGPAndOBP
	ld hl, wTempMonDVs
	call GetUnownLetter
	hlcoord 0, 0
	ld a, [wCurPartySpecies]
	cp UNOWN
	jr z, .unown

	call PrepMonFrontpic
	jr .play_cry

.unown
	xor a
	ld [wBoxAlignment], a
	call _PrepMonFrontpic

.play_cry
	ld a, [wCurPartySpecies]
	call PlayMonCry
	pop bc
	ld b, 1
	ret

EggStatsScreen:
	ld hl, wCurHPPal
	call SetHPPal
	ld b, SCGB_STATS_SCREEN_HP_PALS
	call GetSGBLayout
	call StatsScreen_PlaceHorizontalDivider
	hlcoord 8, 1
	ld de, EggString
	call PlaceString
	hlcoord 8, 3
	ld de, IDNoString
	call PlaceString
	hlcoord 8, 5
	ld de, OTString
	call PlaceString
	hlcoord 11, 3
	ld de, FiveQMarkString
	call PlaceString
	hlcoord 11, 5
	ld de, FiveQMarkString
	call PlaceString
	ld a, [wTempMonHappiness] ; egg status
	ld de, EggSoonString
	cp $6
	jr c, .picked
	ld de, EggCloseString
	cp $b
	jr c, .picked
	ld de, EggMoreTimeString
	cp $29
	jr c, .picked
	ld de, EggALotMoreTimeString
.picked
	hlcoord 1, 9
	call PlaceString
	call WaitBGMap
	ld a, 1
	ldh [hBGMapMode], a
	call SetDefaultBGPAndOBP
	hlcoord 0, 0
	call PrepMonFrontpic
	ld a, [wTempMonHappiness]
	cp 6
	ret nc
	ld de, SFX_2_BOOPS
	call PlaySFX
	call WaitSFX
	ret

EggString:
	db "EI@" ; "EGG@"

FiveQMarkString:
	db "?????@" ; "?????@"

EggSoonString:
	db   "Het maakt geluid" ; "It's making sounds"
	next "van binnen. Het" ; "inside. It's going"
	next "komt bijna uit!@" ; "to hatch soon!@"

EggCloseString:
	db   "Het beweegt soms" ; "It moves around"
	next "van binnen. Zal" ; "inside sometimes."
	next "vast bijna uit-" ; "It must be close"
	next "komen.@" ; "to hatching.@"

EggMoreTimeString:
	db   "Wat zou er in" ; "Wonder what's"
	next "zitten? Heeft nog" ; "inside? It needs"
	next "meer tijd nodig.@" ; "more time, though.@"

EggALotMoreTimeString:
	db   "Dit EI heeft meer" ; "This EGG needs a"
	next "tijd nodig om uit" ; "lot more time to"
	next "te komen.@" ; "hatch.@"

StatsScreen_LoadPageIndicators:
	hlcoord 11, 5
	ld a, $36 ; first of 4 small square tiles
	call .load_square
	hlcoord 13, 5
	ld a, $36 ; " " " "
	call .load_square
	hlcoord 15, 5
	ld a, $36 ; " " " "
	call .load_square
	hlcoord 17, 5
	ld a, $36 ; " " " "
	call .load_square
	ld a, b
	cp PINK_PAGE
	hlcoord 11, 5
	jr z, .load_highlighted_square
	cp GREEN_PAGE
	hlcoord 13, 5
	jr z, .load_highlighted_square
	cp BLUE_PAGE
	hlcoord 15, 5
	jr z, .load_highlighted_square
	; must be ORANGE_PAGE
	hlcoord 17, 5
.load_highlighted_square
	ld a, $3a ; first of 4 large square tiles
.load_square
	ld [hli], a
	inc a
	ld [hld], a
	push bc
	ld bc, SCREEN_WIDTH
	add hl, bc
	pop bc
	inc a
	ld [hli], a
	inc a
	ld [hl], a
	ret

CopyNickname:
	ld de, wStringBuffer1
	ld bc, MON_NAME_LENGTH
	jr .okay ; utterly pointless
.okay
	ld a, [wMonType]
	cp BOXMON
	jr nz, .partymon
	ld a, BANK(sBoxMonNicknames)
	call OpenSRAM
	push de
	call CopyBytes
	pop de
	call CloseSRAM
	ret

.partymon
	push de
	call CopyBytes
	pop de
	ret

GetNicknamePointer:
	ld a, [wMonType]
	add a
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wMonType]
	cp TEMPMON
	ret z
	ld a, [wCurPartyMon]
	jp SkipNames
