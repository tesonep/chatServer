users
registerUser: aUser
	(self registeredUsers includes: aUser) ifTrue: [ ^ self ].

	self registeredUsers add: aUser.
	self messages do:[:e | aUser sendMessage: e].
	
	self sendMessage: (ChMessage in: self text: 'User ' , aUser fullName , ' has entered to the room.')