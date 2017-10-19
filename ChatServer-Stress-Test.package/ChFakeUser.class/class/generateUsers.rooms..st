as yet unclassified
generateUsers: numberOfUsers rooms: numberOfRooms
	| users roomsPerUser rnd rooms logger |
	users := Set new: numberOfUsers.
	roomsPerUser := numberOfRooms // 2.
	rnd := Random new.
	logger := ChRequestLogger new.
	rooms := (1 to: numberOfRooms) collect: [ :idx | 'room' , idx asString ].

	1 to: numberOfUsers do: [ :idx | 
		| u |
		u := self new.
		u username: 'user' , idx asString.
		u firstName: 'Name' , idx asString.
		u lastName: 'Last' , idx asString.
		u logger: logger.

		1 to: roomsPerUser do: [ :x | u rooms add: (rooms at: (Random new nextInt: numberOfRooms)) ].
		users add:u.
	].

	^ users.