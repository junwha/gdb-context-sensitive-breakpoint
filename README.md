# gdb-context-sensitve-breakpoint
This is a gdb wrapper that supports callstack based breakpoint.

# Usage

`./insert_breakpoint.sh` <p1> <p2> ... <pn> <target>: it inserts breakpoint only if p1, p2, ... pn successively occurs in the target's stack frame (but other functions can be placed between the given parents)

`./insert_direct_breakpoint.sh` <p1> <p2> ... <pn> <target>: it inserts breakpoint only if p1, p2, ... pn successively occurs in the target's stack frame 

`./gdb` <args>: gdb wrapper with the breakpoints

`./reset_breakpoint.sh`: flush all breakpoints
