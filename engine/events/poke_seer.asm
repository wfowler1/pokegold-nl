GetCaughtGender:
	ld hl, MON_CAUGHTGENDER
	add hl, bc

	ld a, [hl]
	and CAUGHT_LOCATION_MASK
	jr z, .genderless
	cp LANDMARK_EVENT
	jr z, .genderless

	ld a, [hl]
	and CAUGHT_GENDER_MASK
	jr nz, .male
	ld c, CAUGHT_BY_GIRL
	ret

.male
	ld c, CAUGHT_BY_BOY
	ret

.genderless
	ld c, CAUGHT_BY_UNKNOWN
	ret
