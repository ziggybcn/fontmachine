'This sample shows how to use the WordWrap functionality to scroll text up/down of a wordwrap area

Import fontmachine

Import mojo
Function Main()
	Local g:= New Game
End

Class Game Extends App

	Field font:BitmapFont
	
	'We use "wrappedtext" to handle wordwrap text:
	Field wrappedtext:WordWrappedText
	
	Field startingLine:Float = 0

	Method OnCreate()
		SetUpdateRate(60)
		font = New BitmapFont("ZooSmall.txt")
		
		'We load the text we're going to use for this sample:
		Local text:= LoadString("sampletext.txt")
		If text = "" Then Error("Could not load text!")

		'We create a new WrappedText area:
		wrappedtext = New WordWrappedText

		'We set the WrappedText area its font (so it can calculate wraping):
		wrappedtext.Font = font

		'We set it the text to show wrapped:
		wrappedtext.Text = text
		
		'We give it a default a width to calculate wrapping:
		wrappedtext.Width = 600
	End
	
	Method OnUpdate()
		'When A or S is pressed, we modify the startingLine variable. This will be used on the rendering to scroll up/down the text.
		If KeyDown(KEY_A) Then startingLine -= 1
		If KeyDown(KEY_S) Then startingLine += 1
		If startingLine < 0 Then startingLine = 0
	End
	
	Method OnRender()
	
		Const LinesToShow:Int = 10
		'We just render the whole thing:
		
		Cls(200, 190, 180)
		font.DrawText("Press A or S to scroll up/down", DeviceWidth / 2, 0, eDrawAlign.CENTER)
				
		'Now we render a background rectangle:
		SetColor(255, 255, 255)
		DrawRect(20, 40, wrappedtext.Width, LinesToShow * font.GetFontHeight)
		SetColor(255, 255, 255)
		
		'And now we render the wrapped text starting by the "startingLine" line. That's how we get scrolling!
		wrappedtext.PartialDraw(startingLine, LinesToShow, 20, 40, eDrawAlign.LEFT)
		
		'We show some additional information in a sort of footer:
		font.DrawText("Showing lines " + startingLine + " to " + (startingLine + LinesToShow) + " of " + wrappedtext.WrappedLinesCount, DeviceWidth / 2, 400, eDrawAlign.CENTER)
		
	End
End