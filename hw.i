; LGPL3+ Copyright 2025 by Sean Conner.
; Hardware definitions for Color Computer 1 & 2.
;************************************************************************
;	Color Computer 1&2 hardware registers
;************************************************************************
; PIA0
; Port A:	INPUT
;	bit 7 - joystick comparison input
;	bit 6 - keyboard row 7
;	bit 5 - keyboard row 6
;	bit 4 - keyboard row 5
;	bit 3 - keyboard row 4 and left joystick switch 2
;	bit 2 - keyboard row 3 and right joystick switch 2
;	bit 1 - keyboard row 2 and left joystick switch 1
;	bit 0 - keyboard row 1 and right joystik switch 1
; Control A:
;	bit 7 - horizontal sync interrupt flag (IRQ) (63.5 micro seconds)
;	bit 6 - N/U
;	bit 5 - always 1
;	bit 4 - always 1
;	bit 3 - SEL1 LSB of two analog MUX select lines
;	bit 2 - 0 - port A direction,    1 - normal operation
;	bit 1 - 0 - IRQ on falling edge, 1 - rising edge
;	bit 0 - 0 - HSYNC disabled,      1 - enabled
; Port B:	OUTPUT           ; row   7  6  5  4 3 2 1
;	bit 7 - keyboard column 8	sh /? 7' sp W O G
;	bit 6 - keyboard column 7	   .> 6& -> V N F
;	bit 5 - keyboard column 6	   -= 5% <- U M E
;	bit 4 - keyboard column 5	   .< 4$ dn T L D
;	bit 3 - keyboard column 4	   ;+ 3# up S K C
;	bit 2 - keyboard column 3	br :* 2" Z  R J B
;	bit 1 - keyboard column 2	cl 9) 1! Y  Q I A
;	bit 0 - keyboard column 1	en 8( 0  X  P H @
; Control B:
;	bit 7 - vertical sync interrupt flag (IRQ) (1/60 sec)
;	bit 6 - N/U
;	bit 5 - always 1
;	bit 4 - always 1
;	bit 3 - SEL2 MSB of two analog MUX select lines
;	bit 2 - 0 - port B direction,    1 - normal operation
;	bit 1 - 0 - IRQ on falling edge, 1 - rising edge
;	bit 0 - 0 - VSYNC disabled,      1 - enabled
;
; NOTE:	to scan keyboard, column select = 0 , row read = 0
;	MUX select lines SEL2 SEL1
;			 0    0		6-bit DAC
;			 0    1		cassette
;			 1    0		cartridge
;			 1    1		N/U
;
;	They are also used to select the joysticks if sound
;	is disabled (PIA1B)
;			 0    0		left, up/down
;			 0    1		left, left/right
;			 1    0		right, up/down
;			 1    1		right, left/right
;
;	double check it isn't
;			0	0	right left/right
;			0	1	right up/down
;			1	0	left  right/left
;			1	1	left  up/down
;
;************************************************************************

PIA0A		equ	$FF00
PIA0AC		equ	$FF01
PIA0B		equ	$FF02
PIA0BC		equ	$FF03

;************************************************************************
; PIA1
; Port A:	Mixed I/O
;	bit 7 - 6-bit DAC MSB
;	bit 6 - 	"
;	bit 5 - 	"
;	bit 4 - 	"
;	bit 3 - 	"
;	bit 2 - 6-bit DAC LSB
;	bit 1 - RS-232C data output
;	bit 0 - cassette data input
; Control A:
;	bit 7 - CD interrupt flag (FIRQ)
;	bit 6 - N/U
;	bit 5 - always 1
;	bit 4 - always 1
;	bit 3 - cassette motor control 0 - off 1 - on
;	bit 2 - 0 port A direction , 1 - normal operation
;	bit 1 - 0 - IRQ on falling edge, 1 - rising edge
;	bit 0 - 0 - CD disabled , 1 - enabled
; Port B:	Mixed I/O
;	bit 7 - VDG control output A*/G
;	bit 6 - VDG control output GM2
;	bit 5 - VDG control output GM1
;	bit 4 - VDG control output GM0 & *INT/EXT
;	bit 3 - VDG control output CSS
;	bit 2 - RAM size input
;	bit 1 - single bit sound output
;	bit 0 - RS-232 data input
; Control B:
;	bit 7 - cartridge IRQ flag (FIRQ)
;	bit 6 - N/U
;	bit 5 - always 1
;	bit 4 - always 1
;	bit 3 - 6-bit sound enable
;	bit 2 - 0 - port B direction , 1 - normal operation
;	bit 1 - 0 - IRQ on falling edge, 1 - rising edge
;	bit 0 - 0 - cartridge IRQ disabled , 1 - enabled
;************************************************************************

PIA1A		equ	$FF20
PIA1AC		equ	$FF21
PIA1B		equ	$FF22
PIA1BC		equ	$FF23

;************************************************************************
; DISK Controller
;************************************************************************

DSKCTRL		equ	$FF40
DSKCTRL.D0	equ	1<<0
DSKCTRL.D1	equ	1<<1
DSKCTRL.D2	equ	1<<2
DSKCTRL.MOTOR	equ	1<<3
DSKCTRL.PRECOMP	equ	1<<4
DSKCTRL.DENSITY	equ	1<<5
DSKCTRL.D3	equ	1<<6
DSKCTRL.HALT	equ	1<<7

DSKCMD		equ	$FF48	; type
DSKCMD.RESTORE	equ	$03	; I
DSKCMD.SEEK	equ	$17	; I
DSKCMD.STEP	equ	$23	; I
DSKCMD.STEPIN	equ	$43	; I
DSKCMD.STEPOUT	equ	$53	; I
DSKCMD.RSECTOR	equ	$80	; II
DSKCMD.WSECTOR	equ	$A0	; II
DSKCMD.RADDR	equ	$C0	; III
DSKCMD.RTRACK	equ	$E4	; III
DSKCMD.WTRACK	equ	$F4	; III
DSKCMD.FORCEIRQ	equ	$D0	; IV

DSKSTATUS		equ	$FF48
DSKSTATUS.BUSY		equ	1<<0
DSKSTATUS.INDEX		equ	1<<1
DSKSTATUS.TRACK0	equ	1<<2
DSKSTATUS.CRCERR	equ	1<<3
DSKSTATUS.SEEKERR	equ	1<<4
DSKSTATUS.HEADLOAD	equ	1<<5
DSKSTATUS.WRITEFAULT	equ	1<<5
DSKSTATUS.WRITEPROT	equ	1<<6
DSKSTATUS.NOTREADY	equ	1<<7
DSKTRACK		equ	$FF49
DSKSECTOR		equ	$FF4A
DSKDATA			equ	$FF4B

;************************************************************************
; X-PAD
;************************************************************************

TRACKPAD.X	equ	$FF60
TRACKPAD.Y	equ	$FF61
TRACKPAD.STATUS	equ	$FF62

;************************************************************************
; RS-232 Pack
;************************************************************************

ACIA.DATA	equ	$FF68
ACIA.STATUS	equ	$FF69
ACIA.CMD	equ	$FF6A
ACIA.CTRL	equ	$FF6B

;************************************************************************
; SOUND/SPEECH
;************************************************************************

SPEECH.RESET	equ	$FF7D
SPEECH.DATA	equ	$FF7E
SPEECH.PROGRAM	equ	$FF7F

;************************************************************************
; GIME
;************************************************************************

INIT0		equ	$FF90
INIT0.I16E16	equ	0
INIT0.I32	equ	2
INIT0.E32	equ	3
INIT0.MC2	equ	1<<2
INIT0.MC3	equ	1<<3
INIT0.FEN	equ	1<<4
INIT0.IEN	equ	1<<5
INIT0.MMU	equ	1<<6
INIT0.COCO	equ	1<<7

INIT1		equ	$FF91
INIT1.TINS	equ	1<<5
INIT1.TR	equ	1<<0

IRQENR		equ	$FF92
IRQENR.TMR	equ	1<<5
IRQENR.HBORD	equ	1<<4
IRQENR.VBORD	equ	1<<3
IRQENR.SERIAL	equ	1<<2
IRQENR.KBD	equ	1<<1
IRQENR.CART	equ	1<<0

FIRQENR		equ	$FF93
FIRQENR.TMR	equ	1<<5
FIRQENR.HBORD	equ	1<<4
FIRQENR.VBORD	equ	1<<3
FIRQENR.SERIAL	equ	1<<2
FIRQENR.KBD	equ	1<<1
FIRQENR.CARD	equ	1<<0

TIMER		equ	$FF94
VIDEOMODE	equ	$FF98
VIDEOREG	equ	$FF99
VBORDER		equ	$FF9A
VSCROLL		equ	$FF9C
VOFFSET1	equ	$FF9D
VOFFSET0	equ	$FF9E
HOFFSET0	equ	$FF9F
MMUREG		equ	$FFA0
PALETREG	equ	$FFB0

;************************************************************************
; SAM 
;************************************************************************

SAM		equ	$FFC0
SAM.V0		equ	$FFC0	; mode bit 0
SAM.V1		equ	$FFC2	; mode bit 1
SAM.V2		equ	$FFC4	; mode bit 2
SAM.F0		equ	$FFC6	; frame buffer address bit  9
SAM.F1		equ	$FFC8	; frame buffer address bit 10
SAM.F2		equ	$FFCA	; frame buffer address bit 11
SAM.F3		equ	$FFCC	; frame buffer address bit 12
SAM.F4		equ	$FFCE	; frame buffer address bit 13
SAM.F5		equ	$FFD0	; frame buffer address bit 14
SAM.F6		equ	$FFD2	; frame buffer address bit 15
SAM.P1		equ	$FFD4	; page bit
SAM.R0		equ	$FFD6	; rate bit 0
SAM.R1		equ	$FFD8	; rate bit 1
SAM.M0		equ	$FFDA	; memory size bit 0 ; 00 - 4k  01 - 16k
SAM.M1		equ	$FFDC	; memory size bit 1 ; 10 - 64k 11 - 64k static
SAM.TY		equ	$FFDE	; type ; 0 - RAM/ROM 1 - RAM/RAM

SAM.SLOW	equ	$FFD6
SAM.FAST	equ	$FFD7
SAM.ROM		equ	$FFDE
SAM.RAM		equ	$FFDF

VM.PIA		equ	%0_000_0_111	; mask
A.PIA		equ	%0_000_0_000
SG4.PIA		equ	%0_000_0_000
SG6.PIA		equ	%0_001_0_000
SG8.PIA		equ	%0_000_0_000
SG12.PIA	equ	%0_000_0_000
SG24.PIA	equ	%0_000_0_000
CSS.PIA		equ	%0_000_1_000

A.V		equ	0
SG4.V		equ	0
SG6.V		equ	0
SG8.V		equ	2
SG12.V		equ	4
SG24.V		equ	6

			;G VDG I xxx	  resolution size bytes/line pmode
G1C.PIA		equ	%1_000_0_000	; 64x64x4    1k   16
G1R.PIA		equ	%1_001_0_000	; 128x64x2   1k   16
G2C.PIA		equ	%1_010_0_000	; 128x64x4   1.5k 32
G2R.PIA		equ	%1_011_0_000	; 128x96x2   1.5k 16	     0
G3C.PIA		equ	%1_100_0_000	; 128x96x4   3k   32	     1
G3R.PIA		equ	%1_101_0_000	; 128x192x2  3k   16	     2
G6C.PIA		equ	%1_110_0_000	; 128x192x4  6k   32	     3
G6R.PIA		equ	%1_111_0_000	; 256x192x2  6k   32	     4

G1C.V		equ	1
G1R.V		equ	1
G2C.V		equ	2
G2R.V		equ	3
G3C.V		equ	4
G3R.V		equ	5
G6C.V		equ	6
G6R.V		equ	6
