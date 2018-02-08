utility
generateInstances: numberOfInstances

	| user room  instances |
	ChUser initialize.
	ChRoom initialize.

	user := ChUser registerUser: 'username' firstName: 'firstName' lastName: 'lastName'.
	room := ChRoom addRoom: 'roomName'.

	instances := OrderedCollection new: numberOfInstances.
	1 to:numberOfInstances do:[:i |
		instances add:(i % 2	= 0 ifTrue:[
			ChMessage from: user to: room text: 'Generic user message'
		] ifFalse:[
			ChMessage in: room text: 'Generic info message'.
		])	
	].

	instances do: [ :e | room sendMessage: e ].

	self assert: instances size = numberOfInstances.