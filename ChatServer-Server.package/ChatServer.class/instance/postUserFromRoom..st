requests
postUserFromRoom: req
	| room user text |
	room := ChRoom getRoom: (req at: #name).
	user := ChUser getUser: (req at: #username).
	text := req contents.

	room sendMessage: (ChMessage from: user to: room text: text).