v2
methodsToV2
	patch addOperation: (APRemoveMethod fromSource: 'from
	^ from' selector: #from onClassNamed: #ChMessage).
	
	patch addOperation: (APRemoveMethod fromSource: 'from: anObject
	from := anObject' selector: #from: onClassNamed: #ChMessage).

	patch addOperation: (APAddMethod fromSource: 'from
	^ from' selector: #from onClassNamed: #ChUserMessage).
	
	patch addOperation: (APAddMethod fromSource: 'from: anObject
	from := anObject' selector: #from: onClassNamed: #ChUserMessage).

	patch addOperation: (APAddMethod fromSource: 'from: anObject
	^ self' selector: #from onClassNamed: #ChInfoMessage).
	
	patch addOperation: (APAddMethod fromSource: 'from
	^ nil' selector: #from onClassNamed: #ChInfoMessage).
	
	patch addOperation: ((APAddMethod fromSource: 'from: aUser to: aRoom text: aText
	^ ChUserMessage new
		from: aUser;
		room: aRoom;
		text: aText;
		yourself.' selector: #from:to:text: onClassNamed: #ChMessage) isMeta: true; yourself).
	
	patch addOperation: ((APAddMethod fromSource: 'in: aRoom text: aText
	^ ChInfoMessage new
		room: aRoom;
		text: aText;
		yourself.' selector: #in:text: onClassNamed: #ChMessage) isMeta: true; yourself).	
