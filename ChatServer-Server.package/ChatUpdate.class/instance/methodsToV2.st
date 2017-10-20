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
