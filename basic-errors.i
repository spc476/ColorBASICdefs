; LGPL3+ Copyright 2025 by Sean Conner.
; Error number used by Color BASIC.
; The number is multiplied by 2 as that is how the values are used
; internally by Color BASIC.

CB.ERR_NF	equ	0  * 2	; next without for
CB.ERR_SN	equ	1  * 2	; syntax error
CB.ERR_RG	equ	2  * 2	; return without gosub
CB.ERR_OD	equ	3  * 2	; out of data
CB.ERR_FC	equ	4  * 2	; function call
CB.ERR_OV	equ	5  * 2	; overflow
CB.ERR_OM	equ	6  * 2	; out of memory
CB.ERR_UL	equ	7  * 2	; undefined line number
CB.ERR_BS	equ	8  * 2	; bad subscript
CB.ERR_DD	equ	9  * 2	; redimentioned array
CB.ERR_D0	equ	10 * 2	; division by 0
CB.ERR_ID	equ	11 * 2	; illegal direct statement
CB.ERR_TM	equ	12 * 2	; type mismatch
CB.ERR_OS	equ	13 * 2	; out of string space
CB.ERR_LS	equ	14 * 2	; string too long
CB.ERR_ST	equ	15 * 2	; string formula too complex
CB.ERR_CN	equ	16 * 2	; can't continue
CB.ERR_FD	equ	17 * 2	; file data
CB.ERR_AO	equ	18 * 2	; file already open
CB.ERR_DN	equ	19 * 2	; device number error
CB.ERR_IO	equ	20 * 2	; I/O error
CB.ERR_FM	equ	21 * 2	; bad file mode
CB.ERR_NO	equ	22 * 2	; file not open
CB.ERR_IE	equ	23 * 2	; input past end of file
CB.ERR_DS	equ	24 * 2	; direct statement in file
