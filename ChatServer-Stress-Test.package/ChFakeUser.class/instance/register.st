operations
register
	self registerUser.

	rooms do: [ :e | self registerRoom: e ]