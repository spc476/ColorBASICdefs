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
CB.noerr	equ	$A3FB	;	; NO error file not open
CB.devoutchk	equ	$A406	; A
CB.close	equ	$A42D	; A
CB.breakp	equ	$A549	; A
CB.ch2str	equ	$A56B
CB.fmerr	equ	$A616	;	; FM error bad file mode
CB.ioerr	equ	$A61F	;	; IO error
CB.aoerr	equ	$A61C	;	; AO error already open
CB.dnerr	equ	$A61F	;	; DN error
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
CB.runtoken	equ	$ADD4	; A,X	; run tokens via jmp table
CB.ulerr	equ	$AED2	;	; UL error undefined line
CB.putstr	equ	$AFA4	; A,B,X,Y
CB.CHKNUM	equ	$B143	;
CB.evalnum	equ	$B141
CB.CHKSTR	equ	$B146	;
CB.tmerr	equ	$B151	;	; TM error type mismatch
CB.eval		equ	$B156	; 	; evaluate expression
CB.pevalp	equ	$B262	; A,B	; parse '(' <expr> ')'
CB.evalcpar	equ	$B267	; A,B	; check for ')'
CB.evalopar	equ	$B26A	; A,B	; check for '('
CB.evalcomma	equ	$B26D	; A,B	; check for ','
CB.evalchar	equ	$B26F	; A,B	; check for character in B
CB.syntaxerr	equ	$B277	;	; SN error signal syntax error
CB.getvar	equ	$B357	; X	; return variable
CB.INTCVT	equ	$B3ED	; A,B,X
CB.uintcvt	equ	$B3FE
CB.fcerr	equ	$B44A	;	; FC error function call
CB.GIVBF	equ	$B4F3	; A,B,X
CB.GIVABF	equ	$B4F4	; A,B,X
CB.STR		equ	$B4FD	; A,B,X,U
CB.GIVSTR	equ	$B54C	; A,B,X
CB.RSVPSTR	equ	$B50F	; A,B,X
CB.cberr	equ	$B555	;	; ST error string formula too long
CB.lserr	equ	$B625	;	; LS error string too long
CB.evalexpb	equ	$B70B	; A,B,X	; return expr in B, err > 255
CB.addrcvt	equ	$B740	; X
CB.strinout	equ	$B99C	; A,B,X,U
CB.putdescr	equ	$B99F	; A,B,X,U
CB.overr	equ	$BA92	;	; OV error overflow error
CB.d0err	equ	$BC06	;	; /0 error
CB.unknwn	equ	$BDD9
CB.decout	equ	$BDCC	; A,B,X,U

	;***********************************************
	; Extended Color BASIC 1.1
	;***********************************************

ECB.notdirect	equ	$8866	;	; error if in direct mode
ECB.iderr	equ	$886C	;	; ID error indirect mode
ECB.neerr	equ	$8CDD	;	; NE error file not found
ECB.evalrect	equ	$938F	;	; (x1,y1)-(x2,y2)
ECB.evalpoint	equ	$93B2	;	; (x,y)
ECB.memcpy16	equ	$9736	; X,Y,U	; X=src U=dest Y=#words

	;***********************************************
	; Disk Extended Color BASIC 1.1
	;***********************************************

DECB.brerr	equ	$C30B	;	; BR error bad record
DECB.oberr	equ	$C504	;	; OB error out of buffer space
DECB.fserr	equ	$C653	;	; FS error bad file structure
DECB.dferr	equ	$C7F8	;	; DF error disk full
DECB.fnerr	equ	$C978	;	; FN error bad file name
DECB.ererr	equ	$CDCB	;	; ER error read/write past EOR
DECB.foerr	equ	$D0DA	;	; FO error field overflow
DECB.seerr	equ	$D119	;	; SE error set to non-fielded string
