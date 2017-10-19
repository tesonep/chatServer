adding
unregisterUser: aUser
	Rooms do: [ :aRoom | aRoom removeUser: aUser ]