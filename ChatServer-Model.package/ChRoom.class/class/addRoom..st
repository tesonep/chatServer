adding
addRoom: roomName
	| room |
	Rooms detect: [ :aRoom | aRoom name = roomName ] ifFound: [ :e | ^ e ].

	room := self new
		name: roomName;
		yourself.

	Rooms add: room.

	^ room