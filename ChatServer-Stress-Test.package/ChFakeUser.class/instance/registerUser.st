operations
registerUser
	self
		put: 'http://localhost:1701/user/' , username
		data:
			(ZnApplicationFormUrlEncodedEntity new
				at: 'firstName' put: firstName;
				at: 'lastName' put: lastName;
				yourself)