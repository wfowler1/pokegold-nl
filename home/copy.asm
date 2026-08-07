CopyBytes::
; copy bc bytes from hl to de
	inc b ; we bail the moment b hits 0, so include the last run
	inc c ; same thing; include last byte
	jr .HandleLoop
.CopyByte:
	ld a, [hli]
	ld [de], a
	inc de
.HandleLoop:
	dec c
	jr nz, .CopyByte
	dec b
	jr nz, .CopyByte
	ret

GetFarByte::
; retrieve a single byte from a:hl, and return it in a.
	; bankswitch to new bank
	ld [wTempBank], a
	ldh a, [hROMBank]
	push af
	ld a, [wTempBank]
	rst Bankswitch

	; get byte from new bank
	ld a, [hl]
	ld [wFarByte], a

	; bankswitch to previous bank
	pop af
	rst Bankswitch

	; return retrieved value in a
	ld a, [wFarByte]
	ret

GetFarWord::
; retrieve a halfword from a:hl, and return it in hl.
	; bankswitch to new bank
	ld [wTempBank], a
	ldh a, [hROMBank]
	push af
	ld a, [wTempBank]
	rst Bankswitch

	; get halfword from new bank, put it in hl
	ld a, [hli]
	ld h, [hl]
	ld l, a

	; bankswitch to previous bank and return
	pop af
	rst Bankswitch
	ret

FarCopyWRAM::
; copy bc bytes from hl to a:de
	ldh [hTempBank], a
	ldh a, [rWBK]
	push af
	ldh a, [hTempBank]
	ldh [rWBK], a

	call CopyBytes

	pop af
	ldh [rWBK], a
	ret

ByteFill::
; fill bc bytes with the value of a, starting at hl
	inc b ; we bail the moment b hits 0, so include the last run
	inc c ; same thing; include last byte
	jr .HandleLoop
.PutByte:
	ld [hli], a
.HandleLoop:
	dec c
	jr nz, .PutByte
	dec b
	jr nz, .PutByte
	ret
