messages
consumePendingMessages
	| msgs |
	msgs := self pendingMessages copy. 
	self pendingMessages removeAll.
	^ msgs.