#Rem monkeydoc module fontmachine.wordwrap.txtinterval
	This module represents a text interval. That is, a starting char and ending char into a string. Both are represented as two integer values.
#end

#rem monkeydoc
	This class is used to represent a substring (a text interval). That is, it just contains an initial and final characters and can be used to refer to a portion of a string.
	This is internaly used by the [[WordWrappedText]] component.
#END
Class TxtInterval
	Field InitOffset:Int
	Field EndOffset:Int
End