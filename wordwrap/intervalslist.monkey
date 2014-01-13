Import txtinterval
Class IntervalsList

	Method Clear()
		contents.Clear()
	End

	Method AddInterval(initPoint:Int, endPoint:Int)
		Local interval:= New TxtInterval
		interval.InitOffset = initPoint
		interval.EndOffset = endPoint
		contents.AddLast(interval)
	End
	Field contents:= New List<TxtInterval>
End
