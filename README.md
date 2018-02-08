This is a test application to validate the [gDSU](https://github.com/tesonep/pharo-AtomicClassInstaller).
This application represents a stateful chat server. 

This bench application can be used to:

* Validate updates on application code while migrating live instances.
* Validate updates to the kernel libraries of the environment.
* Validate updates to the DSU tool itself.
* Execute benchmarks on the DSU implementation.

#Installation

This benchmark should run in [Pharo 6.1](https://get.pharo.org).
Cloning this repository and executing will download all the dependencies and install them in a fresh Pharo 6.1 image in the *build* directory.

```
./install.sh
```

#Running

To run the application just execute:

```
./run.sh
```

Following the instructions in the open Pharo Playground.

#Running Benchmark

The HTTP benchmarks has been performed using [JMeter](http://jmeter.apache.org/)
A script for JMeter is present in the root of this repository.
It is called *chatServer.jmx*

This file has a test plan called "Chat Server Update test". This is the test plan to run to generate load in the server. 
To execute the update a HTTP request to the server should be performed (this is not done by the test plan) from a web browser. 

The possible urls are the following:

* http://localhost:1701/updateV1ToV2 which updates from V1 to V2.
* http://localhost:1701/updateV2ToV1 which updates from V2 to V1.

* http://localhost:1701/updateV1ToV2 which updates from V1 to V2.
* http://localhost:1701/updateV1ToV2 which updates from V1 to V2.

* http://localhost:1701/updateKernel which updates the Kernel implementation of OrderedCollection.
* http://localhost:1701/revertUpdateKernel which reverts the Kernel implementation of OrderedCollection.

* http://localhost:1701/updateAtomicProcess which updates the DSU implementation.
* http://localhost:1701/revertUpdateAtomicProcess which reverts the DSU implementation.
