tests
doTest
	((0 to: 7) collect:[:e | 10 ** e]) collect:[:q |
			Stdio stdout << q asString.
			Stdio stdout << (q -> (ChatUpdateMeter new testWith:q)) asString.
			Stdio stdout crlf ; flush.		
	].

	Smalltalk garbageCollect.