Import fontmachine
'Import fontmachine.wordwrap
Import mojo
Function Main()
	Local g:= New Game
End

Class Game Extends App
	Field font:BitmapFont
	
	Field wrappedtext:WordWrappedText
	Method OnCreate()
		SetUpdateRate(60)
		font = New BitmapFont("smallfont.txt")
		wrappedtext = New WordWrappedText
		wrappedtext.Font = font
		Local text:= LoadString("sampletext.txt")
		If text = "" Then Error("Could not load text!")
		wrappedtext.Text = text
		
		wrappedtext.Width = 50
	End
	
	Method OnUpdate()
		If KeyDown(KEY_A) Then wrappedtext.Width += 1
		If KeyDown(KEY_S) Then wrappedtext.Width -= 1
	End
	
	Method OnRender()
		Cls(255,255,255)
		font.DrawText("Press A or S to modify the wordwrapp area width", 0, 0)
		font.DrawText("Wrapped lines = " + wrappedtext.WrappedLinesCount, 0, 20)
		SetColor(200, 200, 200)
		DrawRect(100, 100, wrappedtext.Width, 5000)
		SetColor(255, 255, 255)
		wrappedtext.Draw(100, 100)
	End
End