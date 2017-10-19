operations
sendMessageTo: room
	self post: 'http://localhost:1701/room/' , room , '/' , username data: (ZnStringEntity text: 'Hello I''m ' , username)