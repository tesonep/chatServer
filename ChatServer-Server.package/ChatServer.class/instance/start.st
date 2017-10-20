service
start
	self stop.
	teapot := Teapot on.

	teapot
		GET: '/user/<username>' -> [ :req | self getUser: req. ]; output: #json;
		POST: '/user/<username>/pendingMessages' -> [ :req | self getPendingMessages: req. ]; output: #json;
		PUT: '/user/<username>' -> [ :req | self createUser: req. ]; 

		PUT: '/room/<name>' -> [ :req | self createRoom: req. ];

		PUT: '/room/<name>/<username>' -> [ :req | self addUserToRoom: req. ];
		DELETE: '/room/<name>/<username>' -> [ :req | self removeUserFromRoom: req. ];
		POST: '/room/<name>/<username>' -> [ :req | self postUserFromRoom: req. ];

		GET: '/rooms' -> [ :req | self getRooms: req. ]; output: #json;
		
		GET: '/updateV1ToV2' -> [ :req | ChatUpdate new updateV1ToV2. ];
		GET: '/updateV2ToV1' -> [ :req | ChatUpdate new updateV2ToV1. ];
	
		start.		