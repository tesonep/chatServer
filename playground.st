"To execute the validations there should be an live instances.
So the following line should be evaludated to generate the instances. 
In the Pharo Playground to evaluate a line, the line should be selected and with the context menu execute 'Do it'"

"Generate Instances"
ChatUpdate new generateInstances: 10000.

"Inspect User Instances"
ChUser allInstances inspect.
"Inspect Message Instances"
ChMessage allSubInstances inspect.

"Browse Model"
'ChatServer-Model' asPackage browse.

"Update Model"
ChatUpdate new updateV1ToV2.

"Revert Update Model"
ChatUpdate new updateV2ToV1.

"Update DSU"
ChatUpdate new updateAtomicProcess.

"Revert DSU"
ChatUpdate new revertUpdateAtomicProcess.

"Update Kernel libraries"
ChatUpdate new updateKernel.

"Revert Kernel Libraries"
ChatUpdate new revertUpdateKernel.

"Executing memory and time benchmark per instance quantity. (Long to execute)
It outputs in the Standard Output the different test executed, listing number of instances and time consumed
From 1 instance to 10.000.000"

ChatUpdateMeter new doTest.

"Starting the HTTP test to run the benchmark with JMeter. The REST server is listening in port 1701"

ChatServer uniqueInstance start.

"Stopping server"
ChatServer uniqueInstance stop.
