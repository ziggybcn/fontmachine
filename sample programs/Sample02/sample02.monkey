'This sample shows the DrawBorder and DrawShadow properties of a BitmapFont.

'We import the required modukes:
Import mojo
Import fontmachine
 
'Start the program:
Function Main() 
	New Sample02
End


Class Sample02 extends App
	
	Field smallFont:BitmapFont
	Field sportsFont:BitmapFont

	Field instructions:String 
	
	Method OnCreate()
	
		SetUpdateRate(60) 

		'We load the Sport Fonts. It's a complete font, and as 
		'we don't want to load ALL the characters at once consuming lots of VRam (and download time),
		'we set the font to dynamicload (latest True parameter).
		sportsFont = New BitmapFont("SportsFont/SportsFont.txt", True)


		'We load the basic small font. We use also a Dynamic load:
		smallFont = New BitmapFont("basicsmallfont/basicsmallfont.txt", True)
		
		'We don't want this font to have a shadow, we set the DrawShadow property to false:
		smallFont.DrawShadow = False
		
		'Those are the instructions that will be printed on screen:
		instructions = "Instructions:~nQ-Toggle border On/Off~nW-Toggle shadow On/Off"
			
	End
	
	Method OnUpdate()
		'In case desired keys are pressed, we toggle the DrawBorder or DrawShadow properties.
		'(from false to true or from true to false)
		If KeyHit(KEY_Q) Then sportsFont.DrawBorder = Not sportsFont.DrawBorder
		If KeyHit(KEY_W) Then sportsFont.DrawShadow = Not sportsFont.DrawShadow 
	End Method
	
	Method OnRender()
	
		'Clear background screen:
		Cls(255,255,255)
		
		'We draw the sample text:
		sportsFont.DrawText("This is the sample~ntext!",5,5)
		
		'We draw the instructions:
		smallFont.DrawText(instructions,5,210)

	End
End

