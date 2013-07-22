Import textline
Private
Const CR:= "~n"
Public
Class WordWrappedText

	Method Text:String() Property
		Return text
		'Local result:String, done:Bool = False
		'For Local tl:TextLine = EachIn lines
		'	If not done Then
		'		result = tl.text
		'		done = True
		'	Else
		'		result += CR + tl.text
		'	EndIf
		'Next
	End

	Method Text:Void(value:String) Property
		text = value
		Recalculate()
	End
	
	Method Width:Int() Property
		Return width
	End
	
	Method Width:Void(value:Int) Property
		width = value
		Recalculate()
	End
	
	Method Font:BitmapFont() Property
		Return font
	End
	
	Method Font:Void(value:BitmapFont) Property
		font = value
		Recalculate()
	End
	
	
	Method Lines:Int()
		Return linesCount + 1
	End
	
	Method GetLine:TextLine(index:Int)
		If index <= linesCount Then
			Return lines[index]
		Else
			Return Null
		EndIf
	End

	Method Clear()
		linesCount = -1
	End
	
	
	Method Draw(x:Float, y:Float)
		
		Local i:int = 0
		Local drawpos:= New DrawingPoint
		drawpos.x = x; drawpos.y = y

		Local curline = 0
		For Local index:Int = 0 Until Self.Lines '- 1
			Local tl:TextLine = GetLine(index)
			For Local interval:TxtInterval = EachIn tl.Intervals.contents
				
				Self.Font.DrawText(tl.text, drawpos.x, drawpos.y + i * Font.GetFontHeight, eDrawAlign.LEFT, interval.InitOffset + 1, interval.EndOffset)
				i += 1
			Next
			curline += 1
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