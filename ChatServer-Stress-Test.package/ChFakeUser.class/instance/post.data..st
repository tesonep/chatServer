http-operations
post: aUrl data: aEntity
	self logRequest: [
		self client 
			url: aUrl;
			ifFail: [ :excp | excp halt ];
			entity: aEntity;
			post
	].