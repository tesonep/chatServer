running
testAddUser
	| user |
	
	ChUser registerUser: 'aUsername' firstName: 'FirstName'  lastName: 'LastName'.
	user := ChUser getUser: 'aUsername'. 
	self assert: user fullName equals: 'FirstName LastName'.