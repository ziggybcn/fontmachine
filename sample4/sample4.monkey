Import fontmachine
Import mojo
Function Main()
	Local g:= New Game
End

Class Game Extends App
	Field font:BitmapFont
	
	Field wrapedtext:WordWrapedText
	Method OnCreate()
		SetUpdateRate(60)
		font = New BitmapFont("smallfont.txt")
		wrapedtext = New WordWrapedText
		wrapedtext.Font = font
		Local text:= LoadString("sampletext.txt")
		If text = "" Then Error("Could not load text!")
		wrapedtext.Text = text
		
		wrapedtext.Width = 50
	End
	
	Method OnUpdate()
		If KeyDown(KEY_A) Then wrapedtext.Width += 1
		If KeyDown(KEY_S) Then wrapedtext.Width -= 1
	End
	
	Method OnRender()
		Cls(255,255,255)
		font.DrawText("Press A or S to modify the wordwrapp area width", 0, 0)
		SetColor(200, 200, 200)
		DrawRect(100, 100, wrapedtext.Width, 5000)
		SetColor(255, 255, 255)
		wrapedtext.Draw(100, 100)
	End
End