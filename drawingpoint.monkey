#rem monkeydoc module fontmachine.drawingpoint
	This module contains the DrawingPoint class.
	This class is a simple X and Y vector.
#end


#Rem monkeydoc
	This class represents a simple X and Y vector
 #END
Class DrawingPoint
	#Rem monkeydoc
		This field contains the X location of this point.
	 #END
	Field x:Float
	
	#rem monkeydoc
	This field contains the Y location of this point.
	#end
	Field y:Float
	
	#Rem monkeydoc
		This method returns a string with a representation of the vector contents.
	 #END
	Method DebugString:String(); Return "(" + x + ", " + y + ")"; End
	
	#Rem monkeydoc
		This method allows you to set the x and y value in a single call.
	 #END
	Method Set(x:Float, y:Float)
		Self.x = x; Self.y = y
	End
	
	Method New(x:Float, y:Float)
		Self.x = x
		Self.y = y
	End
End


