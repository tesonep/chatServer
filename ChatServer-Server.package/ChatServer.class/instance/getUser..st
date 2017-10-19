requests
getUser: req
	^ ChUser getUser: (req at:#username)