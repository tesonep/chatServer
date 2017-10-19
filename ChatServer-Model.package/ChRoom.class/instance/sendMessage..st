messages
sendMessage: aMessage
	self messages add:aMessage.
	self registeredUsers do:[:e | e sendMessage: aMessage].