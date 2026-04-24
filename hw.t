; LGPL3+ Copyright 2025 by Sean Conner
;************************************************************************

	.opt	test	prot r, PIA0A		; input only port
	.opt	test	prot rw,PIA0AC		; control port
	.opt	test	prot w, PIA0B		; output only port
	.opt	test	prot rw,PIA0BC		; control port

	.opt	test	prot rw,PIA1A,PIA1BC + 1
	.opt	test	prot rw,DSKCTRL
	.opt	test	prot rw,DSKCMD
	.opt	test	prot w, SAM,SAM.RAM	; no meaning when read
