running
testAddRoom
	| room other |
	
	room := ChRoom addRoom: 'aRoom'.
	other := ChRoom getRoom: 'aRoom'.
	self assert: room equals: other.