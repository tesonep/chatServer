v1
methodsToV1
	patch addOperation: (APAddMethod fromSource: 'from
	^ from' selector: #from onClassNamed: #ChMessage).
	
	patch addOperation: (APAddMethod fromSource: 'from: anObject
	from := anObject' selector: #from: onClassNamed: #ChMessage).
	
	patch addOperation: ((APAddMethod fromSource: 'from: aUser to: aRoom text: aText
	^ self new
		from: aUser;
		room: aRoom;
		text: aText;
		yourself.' selector: #from:to:text: onClassNamed: #ChMessage) isMeta: true; yourself).
	
	patch addOperation: ((APAddMethod fromSource: 'in: aRoom text: aText
	^ self new
		room: aRoom;
		text: aText;
		yourself.' selector: #in:text: onClassNamed: #ChMessage) isMeta: true; yourself).