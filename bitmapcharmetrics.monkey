#rem monkeydoc module fontmachine.bitmapcharmetrics
	header: This module contains the BitMapCharMetrics class.
	This class contains all the information about a character size and spacing.
#end

Import fontmachine.drawingpoint 


#rem monkeydoc
	This is the BitmapCharMetrics class used to store character size and spacing information.
#end
Class BitMapCharMetrics
	#rem monkeydoc 
		This drawing point contains the X and Y corrdinates of the character drawing offset.
	 #END
	Field drawingOffset:= new DrawingPoint
	#rem monkeydoc 
		This drawing point contains the Width and Height information of the character when it's drawn in the canvas.
	#END
	Field drawingSize:= new DrawingPoint
	#rem monkeydoc 
		This integer contains the character spacing to the next character.
	#END
	Field drawingWidth:Float
	#rem monkeydoc 
		This method returns a string representation of this class instance contents.
	#END
	Method DebugString:String()
		Return "Position " + drawingOffset.DebugString() + " Size: " + drawingSize.DebugString + " Drawing width: " + drawingWidth
End
End 


#rem
footer:This FontMachine library is released under the MIT license:
[quote]Copyright (c) 2011 Manel Ibáñez

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
[/quote]
#end