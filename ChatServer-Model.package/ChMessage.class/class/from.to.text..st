instance creation
from: aUser to: aRoom text: aText
	^ self new
		from: aUser;
		room: aRoom;
		text: aText;
		yourself.