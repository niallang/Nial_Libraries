# NialTk

This directory contains a work in progess implementation of an interface between Nial and TCl/Tk to allow for creation of GUIs for Nial programs. Nial starts a Tcl
shell and writes to the Tcl process over it's standard input. Communication back from Tcl to Nial is over a socket connection using a simple character oriented protocol.

Current development has been between Nial and ActiveState's open source version **ActiveTcl**. This system includes a production standard GUI Builder **GUIB**.
