running
testRemoveUserFromSystem
	| user room msgs m |
	
	ChUser registerUser: 'aUsername' firstName: 'FirstName'  lastName: 'LastName'.
	room := ChRoom addRoom: 'aRoom'.
	user := ChUser getUser: 'aUsername'. 

	room registerUser: user.

	self assert: user pendingMessages size equals: 1.
	
	msgs := user consumePendingMessages.
	self assert: msgs size equals: 1.
	
	m := msgs at:1.

	self assert: m room equals: room.
	self assert: m text equals: 'User FirstName LastName has entered to the room.'.
	
	self assert: user pendingMessages size equals: 0.
	
	ChUser unregisterUser: 'aUsername'.

	m := room messages at:2.

	self assert: room messages size equals: 2.
	self assert: m text equals: 'User FirstName LastName has left the room.'.
	