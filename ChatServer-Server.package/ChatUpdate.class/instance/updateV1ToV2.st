updates
updateV1ToV2
	patch := AtomicPatch new.
	patch operations add:(APModifyClass fromClassDefinition: self chMessageDefinitionV2).
	patch operations add:(APCreateClass fromClassDefinition: self chInfoMessageDefinitionV2).	
	patch operations add:(APCreateClass fromClassDefinition: self chUserMessageDefinitionV2).	
	
	self methodsToV2.
	
	patch
		whenMigrating: #ChMessage
		use: [ :new :old :migrator |
			 | newClass newObj | 
			
			 old from 
				ifNotNil: [ 
				 newClass := migrator newEnvironment at: #ChUserMessage.] 
			 	ifNil: [ 
 				 newClass := migrator newEnvironment at: #ChInfoMessage.].
				
			 newObj := newClass basicNew.
	 		 migrator basicMigrateInstance: newObj from: old.
			 newObj
		].	
	
	loader := AtomicLoader new.
	loader loadPatch: patch.