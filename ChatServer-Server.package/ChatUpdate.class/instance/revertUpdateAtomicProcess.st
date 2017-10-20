self-update
revertUpdateAtomicProcess
	| modifyClassBuilder |
	patch := AtomicPatch new.

	patch addOperation: ((APAddMethod fromSource: 'make: aBlock
	| builder result announcements |
	Autocommit ifNil: [ Autocommit := true ].
	self autocommit ifTrue: [ self reset ].
		
	self uniqueInstance storedAnnouncements addAll:(SystemAnnouncer uniqueInstance
		suspendAllWhileStoring: [ 
			builder := self uniqueInstance builder.
			aBlock value: builder.
			result := builder build 
		]).
	
	self autocommit ifTrue: [ self commit ].
	^ result
	' selector: #make: onClassNamed: #AtomicClassInstaller ) isMeta: true; yourself).

	modifyClassBuilder := APModifyClass fromClass: Smalltalk classBuilder class.
	modifyClassBuilder slots: (modifyClassBuilder slots reject: [:each | each slotName = #anotherVariable]).
	
	loader := AtomicLoader new.
	loader loadPatch: patch.