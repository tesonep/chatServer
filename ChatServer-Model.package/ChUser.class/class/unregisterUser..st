class initialization
unregisterUser: username
	| user |
	user := self getUser: username.
	
	ChRoom unregisterUser: user.
	
	Users remove: user.
	^user.