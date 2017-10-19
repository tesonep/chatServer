users
removeUser: aUser
	self registeredUsers remove: aUser ifAbsent: [ ^ self ].

	self sendMessage: (ChMessage in: self text: 'User ' , aUser fullName , ' has left the room.')