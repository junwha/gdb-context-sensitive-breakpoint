#!/bin/sh
HOME="${GDB_HOME:=`pwd`}"
/usr/bin/gdb -q -x $HOME/.breakpoints.py $@