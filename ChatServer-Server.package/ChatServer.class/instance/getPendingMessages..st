requests
getPendingMessages: req
	| user |
	user := ChUser getUser: (req at:#username).
	^ user consumePendingMessages 