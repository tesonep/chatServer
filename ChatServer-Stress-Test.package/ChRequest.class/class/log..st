logging-Deprecated
log: aBlock
	^ self new
		time: Time now;
		timeToRun: (Time microsecondsToRun: aBlock);
		yourself.