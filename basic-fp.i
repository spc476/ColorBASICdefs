; LGPL3+ Copyright 2025 by Sean Conner.
; Floating point routines in CB and ECB

	;***********************************************
	; Color BASIC 1.2 floating point routines
	;***********************************************

CB.FSUBx	equ	$B9B9	; FP0  = X   - FP0
CB.FSUB		equ	$B9BC	; FP0  = FP1 - FP0
CB.FADDx	equ	$B9C2	; FP0  = X   + FP0
CB.FADD		equ	$B9C5	; FP0  = FP1 + FP0
CB.FMULx	equ	$BACA	; FP0  = X   * FP0
CB.FMUL		equ	$BAD0	; FP0  = FP1 * FP0
CB.FDIVx	equ	$BB8F	; FP0  = X   / FP0
CB.FDIV		equ	$BB91	; FP0  = FP1 / FP0
CB.FABS		equ	$BC93	; FP0  = |FP0|
CB.FSIN		equ	$BF78	; FP0  = sin(FP0)

CB.FP1fx	equ	$BB2F	; FP1 = X
CB.FP0fx	equ	$BC14	; FP0 = X
CB.xfFP0	equ	$BC35	; X   = FP0
CB.FP0f1	equ	$BC4A	; FP0 = FP1
CB.FP1f0	equ	$BC5F	; FP1 = FP0

CB.FP0SGN	equ	$BC6D	; FP0 <=> 0, return in B
CB.FP0CMPx	equ	$BC96	; FP0 <=> X, return in B
CB.FP0txt	equ	$BDD9	; result in X, NUL terminated
CB.POLY		equ	$BEFF	; X - table (byte#,entries)

	;***********************************************
	; Extended Color BASIC 1.1 floating point routines
	;***********************************************

ECB.FATN	equ	$83B0	; FP0 = atan(FP0)
ECB.FCOS	equ	$8378	; FP0 = cos(FP0)
ECB.FTAN	equ	$8381	; FP0 = tan(FP0)
ECB.FEXP	equ	$84F2	; FP0 = exp(FP0) e^FP0
ECB.FLOG	equ	$8446	; FP0 = log(FP0) loge(FP0)
ECB.FSQR	equ	$8480	; FP0 = sqrt(FP0)
