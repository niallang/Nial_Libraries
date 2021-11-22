# Implements a simple communication link between a Tcl process and Nial
# which can receive commands or send information back to Nial
#
# All actions are coded in a simple ascii protocol
#
#  c:command to execute
#  i:information to note
#  r:response from a previous message
#  e:asynchronous event

set ::nialChannel -1

# Receive a message from Nial

proc recvNial schan {
    puts "Receiving from Nial"
    puts [gets $schan]
}


proc nialEncodeString s {
    set sl [format "%d" [string length $s]]
    return "$sl:$s"
}


proc sendNial msg {
    set ml [format "%4d" [string length $msg]]
    puts -nonewline $::nialChannel "$ml:$msg"
    flush $::nialChannel
}
    

proc nialCommand args {
    set msg "c"
    foreach a $args {set msg "$msg:[nialEncodeString $a]"}
    sendNial $msg
}


proc nialEvent args {
    set msg "e"
    foreach a $args {set msg "$msg:[nialEncodeString $a]"}
    sendNial $msg
}


proc nialInfo args {
    set msg "i"
    foreach a $args {set msg "$msg:[nialEncodeString $a]"}
    sendNial $msg
}


proc nialResponse args {
    set msg "r"
    foreach a $args {set msg "$msg:[nialEncodeString $a]"}
    sendNial $msg
}


# Connect to a Nial process. This creates a global Tcl entry of the
# form ::nialChannel that can be accessed from anywhere

proc connectNial {id host port} {
    puts "*** Connecting to Nial"
    set schan [socket $host $port]
    fconfigure $schan -buffering full -buffersize 16384
    set ::nialChannel $schan
    nialInfo $id $host $port
    fileevent $schan readable [list recvNial $schan]
    puts "*** Connected to Nial"
}    


