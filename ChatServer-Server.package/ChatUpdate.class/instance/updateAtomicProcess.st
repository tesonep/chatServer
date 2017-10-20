self-update
updateAtomicProcess
	| modifyClassBuilder |
	patch := AtomicPatch new.

	patch addOperation: ((APAddMethod fromSource: 'make: aBlock
	| builder result announcements |
	Autocommit ifNil: [ Autocommit := true ].
	self autocommit ifTrue: [ self reset ].
	
	Transcript << Time now asString.
	
	self uniqueInstance storedAnnouncements addAll:(SystemAnnouncer uniqueInstance
		suspendAllWhileStoring: [ 
			builder := self uniqueInstance builder.
			aBlock value: builder.
			result := builder build 
		]).
	
	self autocommit ifTrue: [ self commit ].
	^ result
	' selector: #make: onClassNamed: #AtomicClassInstaller ) isMeta: true; yourself).
	
	patch addOperation: (APAddMethod fromSource: 'waitAllQuiescent
	| nonQuiescents |
	nonQuiescents := self nonQuiescentProcess.
	nonQuiescents ifEmpty: [ ^self ].
	
	nonQuiescents do:[:e | self addSignalContextAndWait: e ].
	
	(semaphore waitTimeoutSeconds: 2) ifTrue:[ 
		numberOfWaits := numberOfWaits + 1.
		numberOfWaits = 5 ifTrue:[ self error: ''Waiting for too long :('' ]	
	].
	
	^ self waitAllQuiescent.' selector: #waitAllQuiescent onClassNamed: #ACIProcessTool). 
	
	modifyClassBuilder := APModifyClass fromClass: Smalltalk classBuilder class.
	modifyClassBuilder slots: (modifyClassBuilder slots copyWith: (APSlotDefinition newInstanceVariable: #anotherVariable)).
	
	patch addOperation: modifyClassBuilder .
	
	loader := AtomicLoader new.
	loader loadPatch: patch.