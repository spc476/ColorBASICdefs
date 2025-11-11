; LGPL3+ Copyright 2025 by Sean Conner.
; Internal routines in CB, ECB, DECB
; Those in all caps are also defined in basic.i

	;***********************************************
	; Color BASIC 1.2
	;***********************************************

; name				  registers modified
CB.resvec	equ	$A027	; all
CB.bacdst	equ	$A074	; all
CB.bawmst	equ	$A0E8	; all
CB.consin	equ	$A171	; A
CB.devin	equ	$A176	; A
CB.cursorpos	equ	$A199	; A,B,X uses CB.curpos
CB.polcat	equ	$A1B1	; A
CB.KEYIN	equ	$A1CB	; A
CB.PUTCHR	equ	$A282
CB.serialout	equ	$A2BF
CB.charat	equ	$A30A	; uses CB.curpos
CB.prnparam	equ	$A35F
CB.inputBASIC	equ	$A38D	; A,B,X
CB.devinchk	equ	$A3ED	; A
CB.devoutchk	equ	$A406	; A
CB.close	equ	$A42D	; A
CB.breakp	equ	$A549	; A
CB.stblkin	equ	$A701	; A,B,X
CB.GETBLK	equ	$A70B	; A,B,X
CB.CASON	equ	$A77C	; A,B,X
CB.maxdelay	equ	$A7D1	; X
CB.delay	equ	$A7D3	; X
CB.WRLDR	equ	$A7D8	; A,B,X,Y
CB.SNDBLK	equ	$A7F4	; A,B,X,Y
CB.wrbyte	equ	$A82A	; A,B,X,Y
CB.clearscreen	equ	$A928	; B,X
CB.disaux	equ	$A974	; A
CB.enaux	equ	$A976	; A
CB.setmux	equ	$A9A2	; A,U
CB.GETJOY	equ	$A9DE	; A,B,X,U
CB.chkstk	equ	$AC33	; B (# 16 bit values)
CB.error	equ	$AC46	; B (ERR# * 2)
CB.putstr	equ	$AFA4	; A,B,X,Y
CB.CHKNUM	equ	$B143	;
CB.CHKSTR	equ	$B146	;
CB.eval		equ	$B156	; 	; evaluate expression
CB.syncpar	equ	$B267	; A,B	; check for ')'
CB.synopar	equ	$B26A	; A,B	; check for '('
CB.syncomma	equ	$B26D	; A,B	; check for ','
CB.INTCVT	equ	$B3ED	; A,B,X
CB.uintcvt	equ	$B3FE
CB.fcerr	equ	$B44A
CB.GIVBF	equ	$B4F3	; A,B,X
CB.GIVABF	equ	$B4F4	; A,B,X
CB.STR		equ	$B4FD	; A,B,X,U
CB.GIVSTR	equ	$B54C	; A,B,X
CB.RSVPSTR	equ	$B56D	; A,B,X
CB.evalexpb	equ	$B70B	; A,B,X	; return expr in B, err > 255
CB.addrcvt	equ	$B750	; X
CB.strinout	equ	$B99C	; A,B,X,U
CB.decout	equ	$BDCC	; A,B,X,U

	;***********************************************
	; Extended Color BASIC 1.1
	;***********************************************

ECB.evalrect	equ	$938F	;	(x1,y1)-(x2,y2)
ECB.evalpoint	equ	$93B2	;	(x,y)
