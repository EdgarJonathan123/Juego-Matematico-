main	proc
			mov	ax,seg strMessage
			mov	ds,ax
			mov	ah,09
			lea	dx,strMessage
			int	21h					; Call DOS interrupt 21h

			mov	ax,4c00h
			int	21h					; Call DOS interrupt 21h
			
	main	endp
