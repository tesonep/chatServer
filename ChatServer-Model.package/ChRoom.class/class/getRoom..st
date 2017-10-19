adding
getRoom: aRoomName
	^ Rooms detect: [ :aRoom | aRoom name = aRoomName ]