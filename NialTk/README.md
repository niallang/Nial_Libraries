# NialTk

This directory contains a work in progess implementation of an interface between Nial and TCl/Tk to allow for creation of GUIs for Nial programs. Nial starts a Tcl
shell and writes to the Tcl process over it's standard input. Communication back from Tcl to Nial is over a socket connection using a simple character oriented protocol contained in *nialconnector.tcl* which is loaded at the beginning of the interaction.

All interaction between the two processes is completely asynchronous although it is possible for one process to send a command to the other which will trigger a response command.

The Nial code is a single file *ntk.ndf* which creates the Tcl/Tk process, sends it basic commands to build or instantiate the interface, and then waits for responses. This file contains functions to build Tcl format commands from Nial arrays and send them to Tcl as well as code to handle the socket channel messages returned by the Tcl code.

Current development has been between Nial and ActiveState's open source version **ActiveTcl**. This system includes a production standard GUI Builder **GUIB**. It is possible to build a complex interface using GUIB and have that interact with Nial over the standard input and socket connection.

There are two very simple examples/tests, not using the GUI Builder, *ntk_test4.ndf* which is a simple conversion of feet to metres, and *ntk_test5.ndf* which is a simple line drawing canvas example.

At the moment the Tcl process can send back 3 types of messages

1. A command to execute as a list of strings
2. An information message to note
3. An asynchronous event as a list of strings

Commands and events are processed by taking the first string and treating it as the name of a function in the Nial program to call passing the rest of the string list as the arguments to that function.

Information messages are at the moment written to the Nial standard output.

## Nial Functions



## Tcl Commands

The *nialconnector.tcl* file defines 3 Tcl commands for sending information to Nial. These are

    nialCommand args...
    nialEvent args...
    nialInfo args...

The arguments are packed into the protocol format and sent back to Nial over the socket connection.
