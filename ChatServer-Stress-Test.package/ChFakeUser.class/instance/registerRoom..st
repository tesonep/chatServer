operations
registerRoom: e
	self put: 'http://localhost:1701/room/' , e.
	self put: 'http://localhost:1701/room/' , e , '/' , username