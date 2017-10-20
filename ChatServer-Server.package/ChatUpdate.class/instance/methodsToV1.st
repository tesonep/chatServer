v1
methodsToV1
	patch addOperation: (APAddMethod fromSource: 'from
	^ from' selector: #from onClassNamed: #ChMessage).
	
	patch addOperation: (APAddMethod fromSource: 'from: anObject
	from := anObject' selector: #from: onClassNamed: #ChMessage).