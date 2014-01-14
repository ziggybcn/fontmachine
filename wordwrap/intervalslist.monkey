#Rem monkeydoc module fontmachine.wordwrap.intervalslist
	This module contains the [[FontMachine]] [[IntervalsList]] class. It's internaly used by the [[wordwrap]] engine on FontMachine
#END
Import txtinterval
Class IntervalsList
	#Rem monkeydoc
		This method clears all contents of the interval list
	#END
	Method Clear()
		contents.Clear()
	End

	#Rem monkeydoc
		This method can be used to add an interval to the internal list
	#END
	Method AddInterval(initPoint:Int, endPoint:Int)
		Local interval:= New TxtInterval
		interval.InitOffset = initPoint
		interval.EndOffset = endPoint
		contents.AddLast(interval)
	End
	#Rem monkeydoc
		This contents field contains the actual list of [[TxtInterval]]s
	#END
	Field contents:= New List<TxtInterval>
End
