baselines
baseline: spec
	<baseline>

	spec
		for: #pharo
		do: [ 
			spec baseline: 'AtomicClassInstaller' with: [ 
				spec loads: 'core'.
				spec repository: 'github://tesonep/pharo-AtomicClassInstaller:JOTpaperVersion/mc' ].
			
			spec project: 'Teapot' with: [
				spec
					className: #ConfigurationOfTeapot;
					versionString: #stable;
					repository: 'http://smalltalkhub.com/mc/zeroflag/Teapot/main'
			].

			spec
				package: 'ChatServer-Model' with: [ spec requires: #('AtomicClassInstaller') ];
				package: 'ChatServer-Model-Tests' with: [ spec requires: #('ChatServer-Model') ];
				package: 'ChatServer-Server' with: [ spec requires: #('ChatServer-Model' 'Teapot') ];
				package: 'ChatServer-Stress-Test' with: [ spec requires: #('ChatServer-Model') ].

			spec group: 'default' with: #('ChatServer-Model' 'ChatServer-Model-Tests' 'ChatServer-Server' 'ChatServer-Stress-Test') ]