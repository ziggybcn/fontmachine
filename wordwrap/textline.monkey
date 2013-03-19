Import intervalslist
Import fontmachine
Class TextLine
	Field text:String
	Field Intervals:= New IntervalsList
	
	Method Lines:Int()
		'Optimize later:
		Return Intervals.count
	End
	
	Method AdjustLine(font:bitmapfont.BitmapFont, maxwidth:Int)
		Local tokeninit:Int = 0
		Local linestart:Int = 0
		Local linesize:Int = 0
		Local previousIsSeparator:Bool = False
		Intervals.Clear()
		For Local i:Int = 0 Until text.Length
			Local char:Int = text[i]
			'This calculates the drawing VISUAL size, but not spacing (kerning, overlapping of chars, etc.)
			Local tokensize:Int = font.GetTxtWidth(text, tokeninit, i) '- font.GetTxtWidth(text, i, i)

			If (char >= "a"[0] And char <= "z"[0]) or (char >= "A"[0] And char <= "Z"[0]) or (char >= "0"[0] And char <= "9"[0]) Then
				If previousIsSeparator Then
					previousIsSeparator = False
					linesize += GetTxtSpacing(text, font, tokeninit, i)
					tokeninit = i
					tokensize = font.GetTxtWidth(text, tokeninit, i) '- font.GetTxtWidth(text, i, i)
				EndIf
			Else
				'This calculates text spacing:
				tokensize = GetTxtSpacing(text, font, tokeninit, i)
				linesize += tokensize
				tokeninit = i  	'We begin next token
				
				tokensize = 0	'No token, it was a separator
				previousIsSeparator = True
			EndIf
			
			
			If linesize + tokensize > maxwidth Then	'Slip the line!
				Intervals.AddInterval(linestart, tokeninit)	'previous line starts BEFORE splitting token
				linesize = 0
				linestart = tokeninit	'next line Starts at spliting token
			End
			
		Next
		Intervals.AddInterval(linestart, text.Length)	'previous line starts BEFORE splitting token
	End
	
	Method GetTxtSpacing:Int(text:String, font:BitmapFont, init:Int, ending:Int)
		Local size:Int = 0
		For Local i:Int = init Until Min(ending, text.Length)
			Local charinfo:= font.GetFaceInfo(text[i])
			If charinfo = Null Continue
			size += charinfo.drawingWidth + font.Kerning.x
		Next
		Return size
	End
	
End
