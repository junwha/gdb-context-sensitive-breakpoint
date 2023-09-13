'''
it will insert a breakpoint with callstack
Usage: gdb -x callstack_breakpoint.py 
'''

callstack = ["c", "b", "a"] # it means that we will break the callstack x -> b -> y -> a

class CallstackBreakpoint (gdb.Breakpoint):
    def __init__(self, callstack, direct_callers=False):
      self.callstack = callstack[:-1]
      self.direct_callers = direct_callers
      super(CallstackBreakpoint, self).__init__(callstack[-1])
    
    def stop (self):
        frame = gdb.selected_frame()
        callstack = self.callstack.copy()

        while frame.older() != None and len(callstack) > 0:
          frame = frame.older()
          if frame.name() == callstack[-1]: # match
            callstack.pop()
          elif self.direct_callers:
            break
        
        return False if len(callstack) > 0 else True

CallstackBreakpoint(callstack, True)
