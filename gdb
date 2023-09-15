#!/bin/bash
GDB_HOME="${GDB_HOME:=`pwd`}"
/usr/bin/gdb -q -x $GDB_HOME/.breakpoints.py $@