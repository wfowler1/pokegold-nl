; My terrible horrible no good very bad implementation of fishing while surfing graphics.
LoadFishingGFX:
	ld a, [wPlayerState]
	cp PLAYER_SURF
	jr z, .surfing0
	ld de, FishingGFX
	jr .load0
.surfing0
	ld de, SurfFishingGFX
.load0
	ld hl, vTiles0 tile $02
	lb bc, BANK(FishingGFX), 2
	call Get2bpp

	ld a, [wPlayerState]
	cp PLAYER_SURF
	jr z, .surfing1
	ld de, FishingGFX tile $02
	jr .load1
.surfing1
	ld de, SurfFishingGFX tile $02
.load1
	ld hl, vTiles0 tile $06
	lb bc, BANK(FishingGFX), 2
	call Get2bpp

	ld a, [wPlayerState]
	cp PLAYER_SURF
	jr z, .surfing2
	ld de, FishingGFX tile $04
	jr .load2
.surfing2
	ld de, SurfFishingGFX tile $04
.load2
	ld hl, vTiles0 tile $0a
	lb bc, BANK(FishingGFX), 2
	call Get2bpp

	ld de, FishingGFX tile $06
	ld hl, vTiles0 tile $fc
	lb bc, BANK(FishingGFX), 2
	call Get2bpp
	ret

FishingGFX:
INCBIN "gfx/overworld/chris_fish.2bpp"

SurfFishingGFX:
INCBIN "gfx/overworld/chris_surf_fish.2bpp"
