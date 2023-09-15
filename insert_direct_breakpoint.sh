#!/bin/bash
GDB_HOME="${GDB_HOME:=`pwd`}"

if [ ! -f $GDB_HOME/.breakpoints.py ]; then
    cat $GDB_HOME/callstack_breakpoint.py > $GDB_HOME/.breakpoints.py
fi

# Check if at least one argument is provided
if [ $# -lt 1 ]; then
    echo "Usage: $0 <parent1> <parent2> ..."
    exit 1
fi

# Start the callstack
callstack="["

# Iterate through the arguments and add them to the callstack
for arg in "$@"; do
    # Add a comma before each element (except the first one)
    if [ "$callstack" != "[" ]; then
        callstack+=", "
    fi
    callstack+="\"$arg\""
done

# Close the callstack
callstack+="]"

echo "CallstackBreakpoint($callstack, True)" >> $GDB_HOME/.breakpoints.py