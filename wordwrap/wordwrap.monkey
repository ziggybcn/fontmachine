#REM monkeydoc Module fontmachine.wordwrap
This module is part of the FontMachine library. 
The FontMachine library provides a complete bitmap font system for its use in the Monkey programming language.
#END

Import textline
Private
Const CR:= "~n"
Public
#rem monkeydoc
	This class represents a square drawing area where text can be displayed adjusted.
	This class makes it easy to implement wordwrap functionality in FontMachine. 
	Use this class to display large areas of text on screen, with automatic adjusting of words.
#END
Class WordWrappedText

	#rem monkeydoc
		Use this property to get the Text associated with this WordWrappedText instance.
	#END
	Method Text:String() Property
		Return text
	End

	#rem monkeydoc
		Use this property to set the Text associated with this WordWrappedText instance.
		When a new text is set, the adjustment of words in the draw area is recalculated.
	#END
	Method Text:Void(value:String) Property
		If text = value Then Return
		text = value
		Recalculate()
	End
	
	#rem monkeydoc
		Use this property to get the width of the drawing area associated with this WordWrappedText instance.
	#END
	Method Width:Int() Property
		Return width
	End
	
	#rem monkeydoc
		Use this property to set the width of the drawing area associated with this WordWrappedText instance.
	#END
	Method Width:Void(value:Int) Property
		width = value
		Recalculate()
	End
	
	#rem monkeydoc
		Use this property to get the [[BitmapFont]] associated with this WordWrappedText instance.
	#END
	Method Font:BitmapFont() Property
		Return font
	End
	
	#rem monkeydoc
		Use this property to set the [[BitmapFont]] associated with this WordWrappedText instance.
	#END
	Method Font:Void(value:BitmapFont) Property
		font = value
		Recalculate()
	End
	
	#rem monkeydoc
		This method will return the number of text lines in the text that is being handled by this WordWrappedText instance.
	#END	
	Method Lines:Int()
		Return linesCount + 1
	End
	
	#rem monkeydoc
		This method will return the number of lines that are displayed into the drawing canvas when the text is drawn into the screen.
		This includes the lines that are created in order to adjust text to the available space.
	#END	
	Method WrappedLinesCount:Int()
		Local sum:Int = 0
		For Local i:= 0 To linesCount
			sum += lines[i].Lines()
		Next
		Return sum
	End
	
	#rem monkeydoc
		This method will return the height in graphic units that the wrapped text takes to be drawn.
	#END	
	Method WrappedTextHeight:Int()
		Return (Font.GetFontHeight + Font.Kerning.y) * WrappedLinesCount
	End
	
	#rem monkeydoc
		This method returns a TextLine in the given index.
		When a text is meant to be wrapped, it's split in [[TextLine]]s, and each line contains a set of text intervals that can be used to represent portions of the text that needs to be drawn in an adjusted text line.		
	#END	
	Method GetLine:TextLine(index:Int)
		If index <= linesCount Then
			Return lines[index]
		Else
			Return Null
		EndIf
	End

	#Rem monkeydoc
		This method can be used to reset the contents of the WordWrappedText component.
	#END
	Method Clear()
		linesCount = -1
	End
	
	
	#Rem monkeydoc
		This method draws the WordWrappedText at the given location.
	#END
	Method Draw(x:Float, y:Float, align:Int = eDrawAlign.LEFT)
		
		Local i:int = 0
		Local drawpos:= New DrawingPoint
		drawpos.x = x; drawpos.y = y

		Local curline = 0
		For Local index:Int = 0 Until Self.Lines '- 1
			Local tl:TextLine = GetLine(index)
			For Local interval:TxtInterval = EachIn tl.Intervals.contents
				
				Self.Font.DrawText(tl.text, drawpos.x, drawpos.y + i * Font.GetFontHeight, align, interval.InitOffset + 1, interval.EndOffset)
				i += 1
			Next
			curline += 1
		Next
	End
	#Rem monkeydoc
		This method Draws part of the wrapped lines on a wordwrapp instance, starting with "firstLine" and draws "count" number of lines at the given X and Y position.
	#END
	Method PartialDraw(firstLine:Int, count:Int, x:Int, y:Int, align:Int = eDrawAlign.LEFT)
		Local curline:Int = 0
		For Local i:= 0 To linesCount
			For Local inter:TxtInterval = EachIn lines[i].Intervals.contents
				If curline >= firstLine And curline < firstLine + count
					Font.DrawText(lines[i].text, x, y, align, inter.InitOffset + 1, inter.EndOffset)
					y += Font.GetFontHeight + Font.Kerning.y
				EndIf
				curline += 1
			Next
		Next
		
	End
	
	Private
	Method AppendLine:TextLine()
		linesCount += 1
		If linesCount >= lines.Length - 1 Then
			lines = lines.Resize(linesCount + 100)
		EndIf
		If lines[linesCount] = Null Then lines[linesCount] = New TextLine
		lines[linesCount].text = ""
		Return lines[linesCount]
	End

	Method RemoveLastLine()
		linesCount -= 1
		If linesCount < - 1 Then linesCount = -1
	End

	
	Field lines:= New TextLine[100]
	Field linesCount:Int = -1

	Method Recalculate()
		If font = Null Then Return
		If width = 0 Then Return
		Clear()
		Local Stringlines:= text.Split(CR)
		For Local s:String = EachIn Stringlines
			Local tl:= AppendLine()
			tl.text = s
'			DebugStop()
			tl.AdjustLine(Self.Font, width)
		Next
	End
	

	Field text:String
	Field width:Int
	Field font:BitmapFont
End