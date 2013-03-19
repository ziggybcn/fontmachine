'This sample shows how build a simple input text

'We import the required modukes:
Import mojo
Import fontmachine
 
'Start the program:
Function Main() 
	New Sample03
End


Class Sample03 Extends App
	
	Field basicFont:BitmapFont 
	Field name:String 
	
	Method OnCreate()
				
		SetUpdateRate(60)

		basicFont = New BitmapFont("smallfont.txt")
		Print "Fonts loaded!"
		
	End
	
	Method OnUpdate()
	
		'We add the current pressed character to the "name" field:
		
		Local char:Int = GetChar()
		
		If char=0 Then 'No key has been pressed
			'We do nothing
		ElseIf char = CHAR_BACKSPACE 'backspace key has been pressed
			'We remove latest char i:
			If name.Length >0 Then name = name[.. name.Length()-1]
			
		ElseIf char = CHAR_DELETE
		
		Else	'Any other key has been pressed:
			name += String.FromChar(char)
		Endif
	End Method
	
	Method OnRender()
	
		'Clear background screen:
		Cls(255,255,255)
		
		Local text:String = "Enter your name>"+ name
		
		'We draw the instructions:
		basicFont.DrawText(text,5,10)
		
		basicFont.DrawText("Text width: " + basicFont.GetTxtWidth(text),5,25)
		basicFont.DrawText("Text width: " + (basicFont.GetTxtWidth(text + "A") - basicFont.GetTxtWidth("A")),5,45)
		basicFont.DrawText("Text height: " + basicFont.GetTxtHeight(text),5,65)

		'We draw a text caret every half second:
		If (Millisecs() Mod 1000 < 500) Then
			SetColor(0,0,0)
			DrawRect(5 + basicFont.GetTxtWidth(text), 5 + basicFont.GetFontHeight(), 7, 3)
		Endif

	End
End

