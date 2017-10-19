requests
addUserToRoom: req
	| room user |
	room := ChRoom getRoom: (req at: #name).
	user := ChUser getUser: (req at: #username).
	
	room registerUser: user.