http-operations
get: aUrl 
	self logRequest: [
		self client 
			url: aUrl;
			ifFail: [ :excp | excp halt ];
			get
	]