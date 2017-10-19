requests
removeUserFromRoom: req
	| room user |
	room := ChRoom getRoom: (req at: #name).
	user := ChUser getUser: (req at: #username).

	room removeUser: user