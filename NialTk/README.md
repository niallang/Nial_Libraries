# NialTk

This directory contains a work in progess implementation of an interface between Nial and TCl/Tk to allow for creation of GUIs for Nial programs. Nial starts a Tcl
shell and writes to the Tcl process over it's standard input. Communication back from Tcl to Nial is over a socket connection using a simple character oriented protocol contained in *nialconnector.tcl* which is loaded at the beginning of the interaction.

The Nial code is a single file *ntk.ndf* which creates the Tcl/Tk process, sends it basic commands to build or instantiate the interface, and then waits for responses.

Current development has been between Nial and ActiveState's open source version **ActiveTcl**. This system includes a production standard GUI Builder **GUIB**. It is possible to build a complex interface using GUIB and have that interact with Nial over the standard input and socket connection.

There are two very simple examples/tests *ntk_test4.ndf*, a simple conversion of feet to metres, and *ntk_test5.ndf* which is a simple line drawing canvas example.
