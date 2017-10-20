core-updates
updateKernel
	| modifyOrderedCollection |
	patch := AtomicPatch new.

	modifyOrderedCollection := APModifyClass fromClass: OrderedCollection.
	modifyOrderedCollection slots: (modifyOrderedCollection slots copyWith: (APSlotDefinition newInstanceVariable: #freezedSize)).
	
	patch
		whenMigrating: #OrderedCollection
		use: [ :new :old :migrator |
	 		 migrator basicMigrateInstance: new from: old.
			 new instVarNamed: #freezedSize put: (old size).
			 new
		].	

	
	patch addOperation: modifyOrderedCollection .
	
	loader := AtomicLoader new.
	loader loadPatch: patch.