; LGPL3+ Copyright 2025 by Sean Conner.
;************************************************************************
; Variables marked as V* or U* are marked as read/write, so mark them as
; such for testing purposes.
;************************************************************************

	.opt	test	prot r ,$00 , $FF	; read DP

	.opt	test	prot rw,V40 , V4E	; read/write certain
	.opt	test	prot rw,U76 , U77	; portions of DP
	.opt	test	prot rw,VAB , VAE
	.opt	test	prot rw,VCB , VDA
	.opt	test	prot rw,UF3 , UFF
