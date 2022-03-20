# The Nial Libraries Repository

The main repository for official Nial Libraries, some of which are maintained by the community.

This repository contains:
- `NialTk`: Tcl/Tk bindings
- `Sound`: Audio manipulation library
- `Unicode`: Unicode library

## How To Use
The instructions for each library (and their dependencies, if any) are given in their folders.

The common method of importing a library is: `loaddefs 'path/to/file.ndf'`. If the path is relative, then `./path/to/file` must be specified.

`loaddefs` must be done for all required library files.
