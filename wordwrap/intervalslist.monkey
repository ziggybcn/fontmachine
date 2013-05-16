Import txtinterval
Class IntervalsList

	Field count:Int = 0
	Method Clear()
		contents.Clear()
		count = 0
	End

	Method AddInterval(initPoint:Int, endPoint:Int)
		Local interval:= New TxtInterval
		interval.InitOffset = initPoint
		interval.EndOffset = endPoint
		contents.AddLast(interval)
	End
	Field contents:= New List<TxtInterval>
End
