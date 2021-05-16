one sig FSM {
  start: set State,
  stop: set State
}

sig State {
  transition: set State
}

// Part (a)
fact OneStartAndStop {
  // FSM only has one start state.
  -- TODO: Your code starts here.
  // Fix: replace "some s1: State | s1 in FSM.start" with "one s1: State | s1 = FSM.start"
  some s1: State | s1 in FSM.start
  all s1, s2: State | s1 = FSM.start and s2 = FSM.start => s1 = s2
  // FSM only has one stop state.
  -- TODO: Your code starts here.
  // Fix: replace "some s1: State | s1 in FSM.stop" with "one s1: State | s1 = FSM.stop"
  some s1: State | s1 in FSM.stop
  all s1, s2: State | s1 = FSM.stop and s2 = FSM.stop => s1 = s2
}

run {} for 5
