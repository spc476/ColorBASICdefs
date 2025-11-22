; LGPL3+ Copyright 2025 by Sean Conner.
; Direct Page definitions for CB/ECB/DECB.
; PV 	- permanent variable---DO NOT USE
; TV 	- temporary variable---maybe use
; DV 	- double vairable---probably do not use
; Vhh	- free to use, but used by BASIC
; Uhh	- not used by BASIC at all
;
; Variables with uppercase names are also defined in basic.i

	;***********************************************
	; COLOR BASIC
	;***********************************************

CB.endflg	equ	$00	; stop/end flag; positive=stop, neg=end
CB.charac	equ	$01	; terminator flag 1
CB.endcur	equ	$02	; terminator flag 2
CB.tmploc	equ	$03	; scratch variable
CB.ifctr	equ	$04	; IF counter - how many IF statement in a line
CB.dimflg	equ	$05	; *DV* array flag 0=evaluate 1=dimentioning
CB.VALTYP	equ	$06	; *DV* *PV type flag; 0=numeric, $FF=string
CB.garbfl	equ	$07	; *TV string space housekeeping flag
CB.arydis	equ	$08	; disable array search; 0=allow search
CB.inpflg	equ	$09	; *TV input flag: read=0, input<>0
CB.relflg	equ	$0A	; *TV relational operator flag
CB.temppt	equ	$0B	; *PV temporary string stack pointer
CB.lastpt	equ	$0D	; *PV addr of last used string stack address
CB.temptr	equ	$0F	; temporary pointer
CB.tmptr1	equ	$11	; temporary descriptor storage (stack search)
CB.fpa2		equ	$13	; floating point accumulator #2 mantissa
CB.botstk	equ	$17	; bottom of stack at last check
CB.txttab	equ	$19	; *PV beginning of BASIC program
CB.vartab	equ	$1B	; *PV start of variables
CB.arytab	equ	$1D	; *PV start of arrays
CB.aryend	equ	$1F	; *PV end of arrays (+1)
CB.fretop	equ	$21	; *PV start of string storage (top of free RAM)
CB.strtab	equ	$23	; *PV start of string variables
CB.frespc	equ	$25	; utility string pointer
CB.memsiz	equ	$27	; *PV top of string space
CB.oldtxt	equ	$29	; saved line number during a "STOP"
CB.binval	equ	$2B	; binary value of a converted line number
CB.oldptr	equ	$2D	; saved input ptr during a "STOP"
CB.tinptr	equ	$2F	; temporary input pointer storage
CB.dattxt	equ	$31	; *PV "DATA" statement line number pointer
CB.datptr	equ	$33	; *PV "DATA" statement address pointer
CB.dattmp	equ	$35	; data pointer for "INPUT" & "READ"
CB.varnam	equ	$37	; *TV temp storage for a variable name
CB.varptr	equ	$39	; *TV pointer to a variable descriptor
CB.vardes	equ	$3B	; temp pointer to a variable descriptor
CB.relptr	equ	$3D	; pointer to relational operator processing routine
CB.trelfl	equ	$3F	; temporary relational operator flag byte
V40		equ	$40	; FP3 packed
V41		equ	$41
V42		equ	$42
V43		equ	$43
V44		equ	$44
V45		equ	$45	; FP4 packed
V46		equ	$46
V47		equ	$47
V48		equ	$48
V49		equ	$49
V4A		equ	$4A	; FP5 packed
V4B		equ	$4B
V4C		equ	$4C
V4D		equ	$4D
V4E		equ	$4E
CB.FP0EXP	equ	$4F	; FP0
CB.FP0		equ	$50
CB.fp0man	equ	$50	; FP0 mantissa
CB.fp0sgn	equ	$54	; FP0 sign
CB.coefct	equ	$55	; polynomial coefficient counter
CB.STRDES	equ	$56	; temporary string descriptor
CB.fpcary	equ	$5B	; floating point carry byte
CB.fp1		equ	$5C	; FP1
CB.fp1exp	equ	$5C	; FP1 exponent
CB.fp1man	equ	$5D	; FP1 mantissa
CB.fp1sgn	equ	$61	; FP1 sign
CB.ressgn	equ	$62	; sign of result of floating point operation
CB.fpsbyt	equ	$63	; floating point sub byte (fifth byte)
CB.coefpt	equ	$64	; polynomial coefficient pointer
CB.lsttxt	equ	$66	; current line pointer during list
CB.curlin	equ	$68	; *PV current line # of BASIC program, $FFFF = direct
CB.devcfw	equ	$6A	; *TV tab field width
CB.devlcf	equ	$6B	; *TV tab zone
CB.devpos	equ	$6C	; *TV print position
CB.devwid	equ	$6D	; *TV width
CB.prtdev	equ	$6E	; *TV print device: 0=not cassette, -1=cassette
CB.DEVNUM	equ	$6F	; *PV device number: 0=DLOAD, -2=PRINTER , -1=CASSETTE, 0=SCREEN, 1-15=DISK
CB.cinbfl	equ	$70	; *PV console in buffer flag: 00=not empty, $FF=empty
CB.rstflg	equ	$71	; *PV warm start flag: $55=warm, other=cold
CB.rstvec	equ	$72	; *PV warm start vector - jump address for warm start
CB.topram	equ	$74	; *PV top of RAM
U76		equ	$76
U77		equ	$77
CB.filsta	equ	$78	; *PV file status flag: 0=closed, 1=input, 2=output
CB.cinctr	equ	$79	; *PV console in buffer char counter
CB.cinptr	equ	$7A	; *PV console in buffer pointer
CB.BLKTYP	equ	$7C	; *TV cass block type: 0=header, 1=data, $FF=EOF
CB.BLKLEN	equ	$7D	; *TV cassette byte count
CB.CBUFAD	equ	$7E	; *TV cassette load buffer pointer
CB.ccksum	equ	$80	; *TV cassette checksum byte
CB.CSERR	equ	$81	; *TV error flag/character count
CB.cpulwd	equ	$82	; *TV pulse width count
CB.cpertm	equ	$83	; *TV bit counter
CB.cbtpha	equ	$84	; *TV bit phase flag
CB.clstsn	equ	$85	; *TV last sine table entry
CB.grblok	equ	$86	; *TV graphic block value for SET, RESET and POINT
CB.ikeyin	equ	$87	; *TV INKEY$ RAM image
CB.curpos	equ	$88	; *PV cursor location
CB.zero		equ	$8A	; *PV dummy - these two bytes are alwas zero
CB.sndton	equ	$8C	; *TV tone value for SOUND command
CB.snddur	equ	$8D	; *TV duration value for SOUND command
CB.cmpmid	equ	$8F	; *PV 1200/2400 Hertz partition		<-- moved from ROM
CB.cmp0		equ	$90	; *PV upper limit of 1200 Hz period	"
CB.cmp1		equ	$91	; *PV upper limit of 2400 Hz period	"
CB.syncln	equ	$92	; *PV number of $55s to cassette leader	"
CB.blkcnt	equ	$94	; *PV cursor blink delay		"
CB.lptbtd	equ	$95	; *PV Baud rate constant (600)		"
CB.lptlnd	equ	$97	; *PV Printer carriage return delay	"
CB.lptcfw	equ	$99	; *PV tab field width			"
CB.lptlcf	equ	$9A	; *PV last tab zone			"
CB.lptwid	equ	$9B	; *PV printer width			"
CB.lptpos	equ	$9C	; *PV line printer position		"
CB.execjp	equ	$9D	; *PV jump address for EXEC command	<-- moved from ROM
CB.getnch	equ	$9F	; *PV 	function			<-- moved from ROM
CB.getcch	equ	$A5	; *PV	function			"
CB.charad	equ	$A6	; *PV   function			<-- moved from ROM
VAB		equ	$AB	; low order four bytes of the product
VAC		equ	$AC	; of a floating point multiplication
VAD		equ	$AD	; these bytes are used as random data
VAE		equ	$AE	; by the RND statement

	;***********************************************
	; EXTENDED COLOR BASIC
	;***********************************************

ECB.trcflg	equ	$AF	; *PV trace flag 0=off else on
ECB.usradr	equ	$B0	; *PV address of the start of usr vectors
ECB.forcol	equ	$B2	; *PV foreground color
ECB.bakcol	equ	$B3	; *PV background color
ECB.wcolor	equ	$B4	; *TV wofking color being used by ECB
ECB.allcol	equ	$B5	; *TV all pixels in the byte set to color of bakcol
ECB.pmode	equ	$B6	; *PV PMODE's mode argument
ECB.endgrp	equ	$B7	; *PV end of current graphic page
ECB.horbyt	equ	$B9	; *PV number of bytes/horizontal grpahic line
ECB.beggrp	equ	$BA	; *PV start of graphc page
ECB.grpram	equ	$BC	; *PV start of graphic RAM (MSB)
ECB.horbeg	equ	$BD	; *DV* *PV horizontal coordinate start point
ECB.verbeg	equ	$BF	; *DV* *PV vertical coordinate start point
ECB.cssyal	equ	$C1	; *PV SCREEN's color set argument
ECB.setflg	equ	$C2	; *PV PRESET/PSET flag: 0=PRESET, 1=PSET
ECB.horend	equ	$C3	; *DV* *PV horizontal coordinate ending point
ECB.verend	equ	$C5	; *DV* *PV vertical coordinate ending point
ECB.hordef	equ	$C7	; *PV horizontal coordinate default coordinate
ECB.verdef	equ	$C9	; *PV vertical coordiate default coordiate
VCB		equ	$CB
VCC		equ	$CC
VCD		equ	$CD
VCE		equ	$CE
VCF		equ	$CF
VD0		equ	$D0
VD1		equ	$D1
VD2		equ	$D2
VD3		equ	$D3
VD4		equ	$D4
VD5		equ	$D5
VD6		equ	$D6
VD7		equ	$D7
VD8		equ	$D8
VD9		equ	$D9
VDA		equ	$DA
ECB.chgflg	equ	$DB	; *TV flag to indicate if graphic data has been changed
ECB.tmpstk	equ	$DC	; *TV stack pointer storage during paint
ECB.octave	equ	$DE	; *PV octage value (PLAY)
ECB.volhi	equ	$DF	; *DV* *PV volume high value (PLAY)
ECB.vollow	equ	$E0	; *DV* *PV volume low value (PLAY)
ECB.noteln	equ	$E1	; *PV note length (PLAY)
ECB.tempo	equ	$E2	; *PV tempo value (PLAY)
ECB.plytmr	equ	$E3	; *TV timer for the PLAY command
ECB.dotyal	equ	$E5	; *TV dotted note timer scale factor
ECB.dlbaud	equ	$E6	; *DV* *PV DLOAD baud rate constant $B0=300, $2C=1200
ECB.timout	equ	$E7	; *DV* *PV DLOAD timeout constant
ECB.angle	equ	$E8	; *DV* *PV angle value (DRAW)
ECB.scale	equ	$E9	; *DV* *PV scale value (DRAW)

	;***********************************************
	; DISK [EXTENDED] COLOR BASIC
	;***********************************************

DECB.dcopc	equ	$EA	; *PV DSKCON operation code 0-3
DECB.dcdrv	equ	$EB	; *PV DSKCON drive nubmer 0-3
DECB.dctrk	equ	$EC	; *PV DSKCON track number 0-34
DECB.dsec	equ	$ED	; *PV DSKCON sector number 1-18
DECB.dcbpt	equ	$EE	; *PV DSKCON data pointer
DECB.dcsta	equ	$F0	; *PV DSKCON status byte
DECB.fcbtmp	equ	$F1	; temporary FCB pointer
UF3		equ	$F3
UF4		equ	$F4
UF5		equ	$F5
UF6		equ	$F6
UF7		equ	$F7
UF8		equ	$F8
UF9		equ	$F9
UFA		equ	$FA
UFB		equ	$FB
UFC		equ	$FC
UFD		equ	$FD
UFE		equ	$FE
UFF		equ	$FF

	;***********************************************
	; SUPER EXTENDED COLOR BASIC
	;***********************************************

SECB.hrmode	equ	$E6
SECB.hrwidth	equ	$E7
