'We import the required modules:
Import mojo
Import fontmachine

'Start the program:
Function Main() 
	New Tutorial
End


Class Tutorial extends App

	'We create a BitmapFont variable called font. Our font will be loaded here:  
	Field font:BitmapFont

	Method OnCreate()
		SetUpdateRate(60)
		'We load the sample font (called bluesky) into our variable called font.
		'The first parameter is the name (and path) of the font description file (txt file generated on the FontMachine editor) 
		'The second parameter indicates if the font glipths will be loaded dynamically (true) or statically (false).
		'If the font characters are loaded dynamically, the application will load (and download on HTML5) only required characters.
		'Otherwise, the full font will be required. For more information about dynamic or static fonts, see the documentation.
		font = New BitmapFont("bluesky/bluesky.txt", False)
	End
	Method OnRender()
	
		Cls(255,255,255) 
		'We just draw some text: 
		font.DrawText("Hello~nworld", 210, 10, eDrawAlign.CENTER)
		 
	End
	
	Method OnUpdate()
		If KeyDown(KEY_A) Then font.Kerning.x-=.4
		If KeyDown(KEY_D) Then font.Kerning.x+=.4
		If KeyDown(KEY_W) Then font.Kerning.y-=.4
		If KeyDown(KEY_S) Then font.Kerning.y+=.4
		if KeyDown(KEY_SPACE) Then DebugStop()
	End
End