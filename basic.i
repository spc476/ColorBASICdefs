; LGPL3+ Copyright 2025 by Sean Conner.
; Definitions to interface with CB/ECB/DECB.
;************************************************************
; Defined vectors - these are defined for assembly langauge
; ---------------------------------------------------------------
;	POLCAT	Polls keyboard for character (CB)
;Entry:	none
;Exit:	A - 0 - if no key
;	  > 0 - key code
;	Zf - reflects A
; ---------------------------------------------------------------
;	CHROUT	Output a character to device (CB)
;Entry:	A - character to output
;	DEVNUM -  0 for screen
;	       - -2 for printer
;Exit:	none
; ---------------------------------------------------------------
;	CSRDON	Starts cassette (CB)
;Entry:	none
;Exit:	Ff - 1
;	If - 1
;	D - munged
;	X - munged
; ---------------------------------------------------------------
;	BLKIN	Reads a block from cassette (CB)
;Entry:	CSRDON called prior
;	CBUFAD - buffer address
;Exit	A - 0 no error
;	    1 checksum error
;	    2 memory error
;	B - undefined
;	X - CBUFAD + BLKKEN (or one past byte if memory error)
;	Zf - set per A
;	BLKTYP	 - $00 = file header
;		   $01 = data
;		   $FF = EOF
;	CSRERR - same as A
; ---------------------------------------------------------------
;	BLKOUT	Writes a block to cassette (CB)
;Entry:	CBUFAD - buffer
;	BLKTYP - block type
;	BLKLEN - length of block
;Exit:	Ff - 1
;	If - 1
;	X - CBUFAD + BLKLEN
; ---------------------------------------------------------------
;	JOYIN	Samples joystock pots (CB)
;Entry:	none
;Exit:	Y - saved
;	D - munged
;	X - munged
;	U - munged
;	POTVAL0	- right vertical
;	POTVAL1 - right horizontal
;	POTVAL2	- left vertical
;	POTVAL3 - left horizontal
; ---------------------------------------------------------------
;	WRTLDR	Turn cassette on and write leader
;Entry:	none
;Exit:	none
; ---------------------------------------------------------------
;	DSKCON	Disk IO (DECB)
;Entry:	DCOPCP - various fields initialized
;Exit:	DCSTA  - result
; ---------------------------------------------------------------
;	DSINIT	Disk Initializtion Vector
;Entry:	none
;Exit:	none
;
;Note:	This does a warn restart of BASIC
; ---------------------------------------------------------------
;	DOSVEC	Load operating system
;Entry:	none
;Exit:  none
;
;Note:	Loads track 34 into address $2600, then transfers execution to $2602
;	if $2600 contains 'OS'.  Otherwise, do a warm restart of BASIC.
;****************************************************************************

POLCAT		equ	$A000
CHROUT		equ	$A002
CSRDON		equ	$A004
BLKIN		equ	$A006
BLKOUT		equ	$A008
JOYIN		equ	$A00A
WRTLDR		equ	$A00C
DSKCON		equ	$C004
DCOPCP		equ	$C006	; pointer to DCOPC (Disk Operation Code)
DSINIT		equ	$C008	; 1.1
DOSVEC		equ	$C00A	; 1.1
SUPERVAR	equ	$E000
PRGTEXT		equ	$E002
PRGGRAPH	equ	$E004
PRGMMU		equ	$E006
GETTEXT		equ	$E008
GETBLOK0	equ	$E00A
GETTAST0	equ	$E00C
GETTASK1	equ	$E00E

DCOPC			equ	0
DCOPC.restore		equ	0
DCOPC.nop		equ	1
DCOPC.read		equ	2
DCOPC.write		equ	3
DCDRV			equ	1
DCTRK			equ	2
DSEC			equ	3
DCBPT			equ	4
DCSTA			equ	6
DCSTA.notready		equ	$80
DCSTA.writeprotect	equ	$40
DCSTA.writefault	equ	$20
DCSTA.seekerror		equ	$10
DCSTA.crcerror		equ	$08
DCSTA.lostdata		equ	$04

;****************************************************************************
; The entry point for USR (CB) and USRn (ECB/DECB) are defined as follows:
;
;	USR	Entry point to user-callable machine language subroutine
;Entry: VALTYP        - 0 if numeric parameter, $FF if string parameter
;	FP0 + _STRPTR - string descriptor if A=$FF
;Exit:	none
;
;Note:	While both numeric and string values are accepted, Color BASIC will
;	only accept numeric values as a result.  Therefore, the last thing
;	this routine should do is transfer control to either GIVBF or
;	GIVABF.
;
;	Changing the characters of the string pointer is undefined; changing
;	the contents of the string descriptor is allowed.
; ---------------------------------------------------------------
;	USRn	Entry point to user-callable machine language subroutine
;Entry:	A - 0   if paramater in FP0 is a number
;	  - 255 if parameter in FP0 is a string descriptor
;	B - length if string descriptor
;	X - FP0EXP if A=0
;	  - string descriptor if A=255
;	Zf - 1 if A = 0
;	Zn - 1 if A = 255
;	FP0 + _STRPTR - string descriptor if A=$FF
;	VALTYP - same as A
;
;Note:	ECB/DECB allow returning a string value.
;
;	Changing the characters of the string pointer is undefined; changing
;	the contents of the string descriptor is allowed.
;
;****************************************************************************
;
; The following routines are documented by Tandy as being available for
; user-defined machine language subroutines, for use by both CB and ECB/DECB
; routines.
;
; ---------------------------------------------------------------
;	INTCVT		Convert FP0 to 16-bit integer value
;Entry:	none
;Exit:	D - integer value of FP0.
;
;Note:	does not return if FP0 is string
; ---------------------------------------------------------------
;	GIVBF		Convert 8-bit value to FP0.
;Entry:	B - numeric value to give back to BASIC
;Exit:	none
;
;Note:	value is 0-extended
; ---------------------------------------------------------------
;	GIVABF		Convert 16-bit value to FP0.
;Entry:	D - numeric value to give back to BASIC
;Exit:	none
;****************************************************************************

INTCVT		equ	$B3ED	; convert CB.fpa0 to register D
GIVBF		equ	$B4F3	; convert register B to CB.fpa0
GIVABF		equ	$B4F4	; convert register D to CB.fpa0

;****************************************************************************
; Color Computer BASIC string descriptor.  Five bytes, only three are used,
; which are defined below:
;****************************************************************************

_STRLEN		equ	0	; length of string (0-255)
_STRPTR		equ	2	; pointer to actual string

;****************************************************************************
; The following direct page variables are useful for user-defined
; subroutines.
;****************************************************************************

VALTYP		equ	$06	; current value type
FP0EXP		equ	$4F	; floating point accumulator
FP0		equ	$50	; FP0
STRDES		equ	$56	; temporary string descriptor

DEVNUM		equ	$6F	; device number (-2 printer, 0 screen)
BLKTYP		equ	$7C	; cassette block type (BLKIN, BLKOUT)
BLKLEN		equ	$7D	; cassette block length (BLKIN, BLKOUT)
CBUFAD		equ	$7E	; cassette buffer (BLKIN, BLKOUT)
CSERR		equ	$81	; cassette error

POTVAL0		equ	$15A	; JOYIN right, left/right
POTVAL1		equ	$15B	; JOYIN right, up/down
POTVAL2		equ	$15C	; JOYIN left, left/right
POTVAL3		equ	$15D	; JOYIN left, up/down

;****************************************************************************
; The following subroutines are useful when interfacing with CB/ECB/DECB,
; but the only documentation is from the Unravelled series, and are largely
; unnamed.  I've given them names based on the established naming convention
; used by both Tandy and the Unravalled series.
;
; ---------------------------------------------------------------
;	CHKNUM		Check if given paramter is a number
;Entry:	none
;Exit:	none, only returns when FP0 is of type number
;
;Note:	don't need to call if using INTCVT
; ---------------------------------------------------------------
;	CHKSTR		Convert FP0 to string
;Entry:	none
;Exit:	none, only returns when FP0 is of type string
;
;Note:	does not return if FP0 is a number
; ---------------------------------------------------------------
;	GIVSTR		Return a string descriptor to BASIC
;Entry:	STRDES + _STRLEN - length of string
;	STRDES + _STRPTR - pointer to string
;Exit:	X - undefined
;	A - undefined
;	B - undefined
; ---------------------------------------------------------------
;	RSVPSTR		Reserve space for a string
;Entry:	B - length required
;Exit:	X - pointer for string (should be stored in STRDES + _STRPTR)
;	B - length (should be stored in STRDES + _STRLEN)
;	STRDES + _STRLEN - length
;	STRDES + _STRPTR - pointer
;	Zf - 0 if B > 0, 1 if B == 0
;
;Note:	The _STRPTR value in the passed in string descriptor may change
;	as a result of this call.  Assume it always changes.
;****************************************************************************

CHKNUM		equ	$B143	; ensure parameter is a number
CHKSTR		equ	$B146	; ensure parameter is a string
GIVSTR		equ	$B54C	; return string in STRDES
RSVPSTR		equ	$B50F	; reserve string space
