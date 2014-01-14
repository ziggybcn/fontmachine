#rem monkeydoc module fontmachine.edrawalign
This module is part of the FontMachine library. 
The FontMachine library provides a complete bitmap font system for its use in the Monkey programming language.

This module contains a base-class with all available aligment constants
#end

#rem monkeydoc
	This abstract class contains all available aligment flags
#end
Class eDrawAlign abstract
	#Rem monkeydoc
		 Use this constant for left aligment of text on draw operations.
	 #END
	Const LEFT:Int = 1
	#Rem monkeydoc
		 Use this constant for centered aligment of text on draw operations.
	 #END
	Const CENTER:Int = 2
	#Rem monkeydoc
		 Use this constant for right aligment of text on draw operations.
	 #END
	Const RIGHT:Int = 3
End
