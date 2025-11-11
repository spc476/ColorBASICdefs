; LGPL3+ Copyright 2025 by Sean Conner.
;************************************************************************
; To test routines interfacing with BASIC, we just set these routines to
; return immediately.  It is up to the testing code to set up the
; environment appropriately.  For RSVPSTR, it's intended that the test set
; up the following two bytes to an address to return an appropriate value.
;************************************************************************

	.opt	test	poke INTCVT ,$39 ; RTS
	.opt	test	poke GIVBF  ,$4F ; CLRA
	.opt	test	poke GIVABF ,$39 ; RTS
	.opt	test	poke CHKNUM ,$39 ; RTS
	.opt	test	poke STRCVT ,$39 ; RTS
	.opt	test	poke GIVSTR ,$39 ; RTS
	.opt	test	poke RSVPSTR,$7E ; JMP

	;-------------------------------------------------------------
	; set up memory protections.  For variables, read/write, For
	; routines, read/execute.  For vectors, read/write/execute.
	;-------------------------------------------------------------

	.opt	test	prot rw,VALTYP
	.opt	test	prot rw,FP0EXP  , FP0EXP + 6
	.opt	test	prot rw,STRDES  , STRDES + 4
	.opt	test	prot rw,DEVNUM
	.opt	test	prot rw,BLKTYP  , CSERR
	.opt	test	prot rw,POTVAL0 , POTVAL3

	.opt	test	prot rwx,POLCAT , WRTLDR + 1
	.opt	test	prot rwx,DSKCON , DOSVEC + 1

	.opt	test	prot rx,INTCVT
	.opt	test	prot rx,GIVBF
	.opt	test	prot rx,GIVABF
	.opt	test	prot rx,CHKNUM
	.opt	test	prot rx,STRCVT
	.opt	test	prot rx,GIVSTR
	.opt	test	prot rx,RSVPSTR
	.opt	test	prot rwx,RSVPSTR + 1 , RSVPSTR + 2
