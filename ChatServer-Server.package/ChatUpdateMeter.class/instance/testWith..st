tests
testWith: numberOfInstances
	| user room duration |

	ChUser initialize.
	ChRoom initialize.

	(1 to: 3 do: [:e | Smalltalk garbageCollect ]).

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

	self assert: instances size = numberOfInstances.

	duration := [ChatUpdate new updateV1ToV2] timeToRun .
	
	(1 to: 3 do: [:e | Smalltalk garbageCollect ]).
	
	ChatUpdate new updateV2ToV1.
	
	^ duration.