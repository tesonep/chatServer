accessing
neoJsonMapping: mapper
	mapper for: self do: [ :mapping |
		mapping mapInstVars: #(name).
		mapping mapProperty: #members getter: #registeredUsers  setter: nil].
