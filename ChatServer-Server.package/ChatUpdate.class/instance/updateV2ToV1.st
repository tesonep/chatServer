updates
updateV2ToV1
	patch := AtomicPatch new.
	patch operations add:(APRemoveClass fromClassDefinition: self chInfoMessageDefinitionV2).	
	patch operations add:(APRemoveClass fromClassDefinition: self chUserMessageDefinitionV2).	
	patch operations add:(APModifyClass fromClassDefinition: self chMessageDefinitionV1).
	
	self methodsToV1.
	
	patch
		whenMigrating: #ChUserMessage
		use: [ :new :old :migrator |
			 | newClass newObj | 
			 newClass := migrator newEnvironment at: #ChMessage.
			 newObj := newClass basicNew.
	 		 migrator basicMigrateInstance: newObj from: old.
			 newObj
		].	
	
	patch
		whenMigrating: #ChInfoMessage
		use: [ :new :old :migrator |
			 | newClass newObj | 
			 newClass := migrator newEnvironment at: #ChMessage.
			 newObj := newClass basicNew.
	 		 migrator basicMigrateInstance: newObj from: old.
			 newObj
		].	

	
	loader := AtomicLoader new.
	loader loadPatch: patch.