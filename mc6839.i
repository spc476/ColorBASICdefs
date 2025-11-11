; LGPL3+ Copyright 2025 by Sean Conner.
; Definitions of the MC6839 IEEE-754 ROM.
FADD		equ	$00	; X = U + Y
FSUB		equ	$02	; X = U - Y
FMUL		equ	$04	; X = U * Y
FDIV		equ	$06	; X = U / Y

FREM		equ	$08	; X = rem Y
FSQRT		equ	$12	; X = qrt Y
FINT		equ	$14	; X = int Y
FFIXS		equ	$16	; X = fixs Y
FFIXD		equ	$18	; X = fixd Y
FABS		equ	$1E	; X = abs Y
FNEG		equ	$20	; X = neg Y
FFLTS		equ	$24	; X = flts Y
FFLTD		equ	$26	; X = fltd Y

FCMP		equ	$0A	; U cmp Y	X = parameter
FTCMP		equ	$0C	; U tcmp Y	X = parameter
FPCMP		equ	$0E	; U pcmp Y	X = parameter
FTPCMP		equ	$10	; U tpcmp Y	X = parameter

FMOV		equ	$1A	; X = Y 	U = precision
BINDEC		equ	$1C	; X = Y		U = k
DECBIN		equ	$22	; X = U(BCD string)

FPCB.control	equ	0
FPCB.trap	equ	1
FPCB.status	equ	2
FPCB.stat2	equ	3
FPCB.trapf	equ	4

FPCTL.single	equ	%000_0_0_00_0
FPCTL.double	equ	%001_0_0_00_0
FPCTL.ext	equ	%010_0_0_00_0
FPCTL.exts	equ	%011_0_0_00_0
FPCTL.extd	equ	%100_0_0_00_0
FPCTL.normalize	equ	%000_0_1_00_0
FPCTL.rn	equ	%000_0_0_00_0
FPCTL.rz	equ	%000_0_0_01_0
FPCTL.rp	equ	%000_0_0_10_0
FPCTL.rm	equ	%000_0_0_11_0
FPCTL.proj	equ	%000_0_0_00_0
FPCTL.affine	equ	%000_0_0_00_1

FPTRAP.na	equ	$80
FPTRAP.inexact	equ	$40
FPTRAP.iov	equ	$20
FPTRAP.unorder	equ	$10
FPTRAP.div0	equ	$08
FPTRAP.uv	equ	$04
FPTRAP.ov	equ	$02
FPTRAP.invalid	equ	$01

FPERR.ok	equ	0
FPERR.sqrt	equ	1
FPERR.NaN2i	equ	2
FPERR.pimi	equ	3		; +inf + -inf in affine mode
FPERR.0div0	equ	4
FPERR.NaN	equ	5
FPERR.eq	equ	6
FPERR.range	equ	7
FPERR.inf	equ	8
FPERR.inf0	equ	9
FPERR.rem0	equ	10
FPERR.bindec	equ	13
FPERR.decbin	equ	14
FPERR.mov	equ	15
FPERR.inv	equ	16
FPERR.div0	equ	17
