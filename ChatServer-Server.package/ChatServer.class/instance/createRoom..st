requests
createRoom: req
	ChRoom addRoom: (req at: #name).
	^ TeaResponse created