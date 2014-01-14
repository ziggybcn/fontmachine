#rem monkeydoc module fontmachine.drawingrectangle
	header:This module contains the DrawingRectangle class.
	This class is a simple X and Y vector, with additional Width and Height
#end
Import fontmachine.drawingpoint 
#rem monkeydoc
	This class contains the math representation of a rectangle.
#end
Class DrawingRectangle 
	#Rem monkeydoc
		This field contains the X location of this point.
	#END
	Field x:Float
	#Rem monkeydoc
		This field contains the Y location of this point.
	#END
	Field y:Float
	#Rem monkeydoc
		This is the width representation of the DrawingRectangle class
	#END
	Field width:Int
	#Rem monkeydoc
		This is the height representation of the DrawingRectangle class
	#END
	Field height:Int
	#Rem monkeydoc
		This method returns a string with a representation of the rectangle coordinates.
	#END
	Method DebugString:String() ; Return "(" + x + ", " + y + ", " + width + ", " + height +  ")" ;	End
End Class 

