baselines
baseline: spec
	<baseline>

	spec
		for: #pharo
		do: [ spec baseline: 'AtomicClassInstaller' with: [ spec repository: 'github://tesonep/pharo-AtomicClassInstaller/mc:JOTpaperVersion' ].

			spec
				package: 'ChatServer-Model' with: [ spec requires: #('AtomicClassInstaller') ];
				package: 'ChatServer-Model-Tests' with: [ spec requires: #('ChatServer-Model') ];
				package: 'ChatServer-Server' with: [ spec requires: #('ChatServer-Model') ];
				package: 'ChatServer-Stress-Test' with: [ spec requires: #('ChatServer-Model') ].

			spec group: 'default' with: #('ChatServer-Model' 'ChatServer-Model-Tests' 'ChatServer-Server' 'ChatServer-Stress-Test') ]