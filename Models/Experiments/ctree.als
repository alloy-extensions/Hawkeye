abstract sig Color {}
one sig Red extends Color {}
one sig Blue extends Color {}

sig Node {
  neighbors: set Node,
  color: one Color 
} 	

fact undirected {
  neighbors = ~neighbors
  no iden & neighbors
}

fact graphIsConnected {
  all n1: Node | all n2: Node-n1 | 
    n1 in n2.^neighbors }

run {} for 5 Node
