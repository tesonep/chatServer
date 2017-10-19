accessing
neoJsonMapping: mapper
	mapper for: self do: [ :mapping |
		mapping mapInstVars: #(username).
		mapping mapProperty: #fullName getter: #fullName  setter: nil. 
		mapping mapProperty: #pendingMessages getter: [ :x | x pendingMessages size ] setter: nil].
