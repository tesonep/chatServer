operations
processMessages
	| msgsToSend rnd |
	msgsToSend := (rooms size / 2) ceiling.
	rnd := Random new.
	
	self readMe.
	
	1 to: msgsToSend do:[ :i | | r |
		r := rooms at: (rnd nextInt: rooms size).
		self sendMessageTo: r.
	].

	self receiveMessages.
	
	self client close.