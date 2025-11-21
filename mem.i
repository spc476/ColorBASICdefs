; LGPL3+ Copyright 2025 by Sean Conner.
; Memory map (addresses $0100 on up) of CB/ECB/DECB.

_CIT.cnum	equ	0	; # commands
_CIT.cword	equ	1	; command word array
_CIT.cjmp	equ	3	; command jump table
_CIT.fnum	equ	5	; # functions
_CIT.fword	equ	6	; function word array
_CIT.fjmp	equ	8	; function jump table
_CIT._size	equ	10

	;***********************************************
	; COLOR BASIC 
	;***********************************************
				; CB    ECB   DECB
CB.sw3vec	equ	$0100	; $---- $---- $3B3B SWI3 vector
CB.sw2vec	equ	$0103	; $---- $---- $3B3B SWI2 vector
CB.swivec	equ	$0106	; $---- $---- $---- SWI  vector
CB.nmivec	equ	$0109	; $---- $---- $D7AE NMI  vector
CB.irqvec	equ	$010C	; $A9B3 $894C $D7BC IRQ  vector
CB.frqvec	equ	$010F	; $A0F6 $A0F6 $A0F6 FIRQ vector
CB.usrjmp	equ	$0112	; jump address for CB USR function
CB.rvseed	equ	$0115	; FP random number seed ($804FC75259)
CB.casflg	equ	$011A	; upper/lower case flag $FF=upper, $00=lower
CB.debval	equ	$011B	; keyboard debounce delay ($045E)
CB.expjmp	equ	$011D	; jump address for expoentiation
CB.comvec	equ	$0120	; command interpretation vector tables (5 entries)
CB.keybuf	equ	$0152	; keyboard memory buffer
CB.POTVAL0	equ	$015A	; right horizontal joystick
CB.POTVAL1	equ	$015B	; right vertical joystick
CB.POTVAL2	equ	$015C	; left horizontal joystick
CB.POTVAL3	equ	$015D	; left vertical joystick

	;***********************************************
	; COLOR BASIC RAM vectors (aka "hooks")
	;***********************************************

CB.v_open	equ	$015E	;  0 OPEN command
CB.v_valid	equ	$0161	;  1 device number validity check
CB.v_prnparam	equ	$0164	;  2 set print parameters
CB.v_conout	equ	$0167	;  3 console out
CB.v_conin	equ	$016A	;  4 console in
CB.v_idevchk	equ	$016D	;  5 input device number check
CB.v_odevchk	equ	$0170	;  6 output device number check
CB.v_closeall	equ	$0173	;  7 close all files
CB.v_close	equ	$0176	;  8 CLOSE
CB.v_print	equ	$0179	;  9 PRINT
CB.v_input	equ	$017C	; 10 INPUT
CB.v_break	equ	$017F	; 11 Break check
CB.v_inbasic	equ	$0182	; 12 inputing a BASIC line
CB.v_termbasic	equ	$0185	; 13 terminating basic line input
CB.v_eof	equ	$0188	; 14 EOF
CB.v_eval	equ	$018B	; 15 evaluate expression
CB.v_onerrgoto	equ	$018E	; 16 RSVP for ON ERROR GOTO
CB.v_error	equ	$0191	; 17 error driver
CB.v_run	equ	$0194	; 18 RUN
CB.v_strtof	equ	$0197	; 19 ASCII to FP
CB.v_intloop	equ	$019A	; 20 BASIC command interpreter loop
CB.v_point	equ	$019D	; 21 RESET/SET/POINT
CB.v_cls	equ	$01A0	; 22 CLS
CB.v_crunch	equ	$01A3	; 23 crunch BASIC line
CB.v_uncrunch	equ	$01A6	; 24 uncrunch BASIC line

CB.strstk	equ	$01A9	; string descriptor stack (8 entries)
CB.cfnbuf	equ	$01D1	; cassette file name buffer
CB.casbuf	equ	$01DA	; cassette file data buffer
CB.linhdr	equ	$02DA	; line input buffer header
CB.linbuf	equ	$02DC	; BASIC line input buffer (251 bytes)
CB.strbuf	equ	$03D7	; string buffer (41)
CB.vidram	equ	$0400	; video display area

	;***********************************************
	; EXTENDED COLOR BASIC
	;***********************************************

ECB.timval	equ	$0112	; timver value for ECB
ECB.U0114	equ	$0114
ECB.comvec	equ	$012A	; ECB vector table

ECB.usr0	equ	$013E	; USR0 address
ECB.usr1	equ	$0140	; USR1 "
ECB.usr2	equ	$0142	; USR2 "
ECB.usr3	equ	$0144	; USR3 "
ECB.usr4	equ	$0146	; USR4 "
ECB.usr5	equ	$0148	; USR5 "
ECB.usr6	equ	$014A	; USR6 "
ECB.usr7	equ	$014C	; USR7 "
ECB.usr8	equ	$014E	; USR8 "
ECB.usr9	equ	$0150	; USR9 "

	;***********************************************
	; DISK [EXTENDED] COLOR BASIC
	;***********************************************

DECB.comvec	equ	$0134	; DECB vector table
USR.comvec	equ	$013E	; user command vector interpretation table

DECB.dbuf0	equ	$0600	; I/O buffer #0
DECB.dbuf1	equ	$0700	; I/O buffer #1
DECB.fatbl0	equ	$0800	; FAT drive 0
DECB.fatbl1	equ	$084A	; FAT drive 1
DECB.fatbl2	equ	$0894	; FAT drive 2
DECB.fatbl3	equ	$08DE	; FAT drive 3
DECB.fcbv1	equ	$0928	; file buffer vectors (16 user, 1 system)
DECB.rndfad	equ	$0948	; start of free random file buffer area
DECB.fcbadr	equ	$094A	; start of File Control Blocks
DECB.dnambf	equ	$094C	; disk file name buffer
DECB.dextbf	equ	$0954	; disk file extension buffer
DECB.dfltyp	equ	$0957	; *DV* file type: 0=BASIC, 1=DATA, 2=CODE, 3=TEXT
DECB.dascfl	equ	$0958	; *DV* ASCII flag, 0=binary, 1=ASCII
DECB.drunfl	equ	$0959	; run flag bit1=1 run, bit0=1 close files before running
DECB.defdrv	equ	$095A	; default drive number
DECB.fcbact	equ	$095B	; number of active FCB
DECB.dresfl	equ	$095C	; reset flag, <>0 cause a 'new', close all files
DECB.dloadfl	equ	$095D	; load flag, cause 'new' following load error
DECB.dmrgfl	equ	$095E	; merge flag, 0=no merge, $FF=merge

DECB.usr0	equ	$095F	; USR0 address (moved by DECB)
DECB.usr1	equ	$0961	; USR1 "
DECB.usr2	equ	$0963	; USR2 "
DECB.usr3	equ	$0965	; USR3 "
DECB.usr4	equ	$0967	; USR4 "
DECB.usr5	equ	$0969	; USR5 "
DECB.usr6	equ	$096B	; USR6 "
DECB.usr7	equ	$096D	; USR7 "
DECB.usr8	equ	$096F	; USR8 "
DECB.usr9	equ	$0971	; USR9 "

	;************************************
	; Disk file work area for directory search
	;***********************************

V973		equ	$0973	; FILE - sector number
V974		equ	$0974	; FILE - RAM directory image address
V976		equ	$0976	; FILE - first granual number
V977		equ	$0977	; UNUSED - sector number
V978		equ	$0978	; UNUSED - RAM directory image address

DECB.wfatvl	equ	$097A	; write FAT value: #grans updated before write
DECB.dfflen	equ	$097C	; direct access file record length
DECB.dr0trk	equ	$097E	; current track number drives 0..3
DECB.nmiflg	equ	$0982	; NMI flag: 0=don't vector, <>0=vector out
DECB.dnmivc	equ	$0983	; NMI vector: jump here if NMI flag is set
DECB.rdytmr	equ	$0985	; motor turn off timer
DECB.drgram	equ	$0986	; RAM image of DSKCTRL ($FF40)
DECB.dverfl	equ	$0987	; verify flag, 0=off, $FF=on
DECB.attctr	equ	$0988	; RW attempt counter
DECB.dflbuf	equ	$0989	; 256 byte buffer

	;************************************
	; Super Extended BASIC variables
	;************************************

SECB.crsloc	equ	$FE00	; currrent location of cursor
SECB.cursx	equ	$FE02	; X position of cursor
SECB.cursy	equ	$FE03	; Y position of cursor
SECB.column	equ	$FE04	; colunns on hi-res alpha screen
SECB.row	equ	$FE05	; rows on hi-res alpha screen
SECB.dispen	equ	$FE06	; end of hi-res display screen
SECB.crsatt	equ	$FE08	; current cursor's attributes
UFE09		equ	$FE09
SECB.fcolor	equ	$FE0A	; foreground color
SECB.bcolor	equ	$FE0B	; background color
SECB.onbrk	equ	$FE0C	; ON BRK GOTO line
SECB.onerr	equ	$FE0E	; ON ERR GOTO line
SECB.error	equ	$FE10	; error number (or $FF no error)
SECB.onerrs	equ	$FE11	; ON ERR source line
SECB.erline	equ	$FE13	; line number where error occured
SECB.onbrks	equ	$FE15	; ON BRK source line
SECB.errbrk	equ	$FE17	; ? maybe with ERR, BRK?
SECB.pcount	equ	$FE18	; print count, characters to be printed
SECB.pbuf	equ	$FE19	; print buffer

SECB.int_flag	equ	$FEED	; interrupt valid flag, 0=invalid $55=valid
SECB.int_swi3	equ	$FEEE
SECB.int_swi2	equ	$FEF1
SECB.int_firq	equ	$FEF4
SECB.int_irq	equ	$FEF7
SECB.int_swi	equ	$FEFA
SECB.int_nmi	equ	$FEFD
