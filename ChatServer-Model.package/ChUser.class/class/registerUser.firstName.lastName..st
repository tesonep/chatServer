class initialization
registerUser: username firstName: firstName lastName: lastName
	| newUser |
	
	newUser := Users detect: [ :usr | usr username = username ] ifNone:[ self new username: username; yourself ].
	
	newUser 
		firstName: firstName;
		lastName: lastName.
		
	Users add: newUser.
	
	^newUser.