requests
createUser: req
	ChUser
		registerUser: (req at: #username)
		firstName: (req at: #firstName)
		lastName: (req at: #lastName).
	^ TeaResponse created