class initialization
getUser: username
	^ Users detect: [ :usr | usr username = username ]