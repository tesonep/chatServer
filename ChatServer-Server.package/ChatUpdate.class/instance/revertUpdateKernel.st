core-updates
revertUpdateKernel
	| modifyOrderedCollection |
	patch := AtomicPatch new.

	modifyOrderedCollection := APModifyClass fromClass: OrderedCollection.
	modifyOrderedCollection
		slots: (modifyOrderedCollection slots reject: [ :e | e slotName = #freezedSize ]).

	patch addOperation: modifyOrderedCollection.

	loader := AtomicLoader new.
	loader loadPatch: patch