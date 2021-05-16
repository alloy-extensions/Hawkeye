sig List {
  header : lone Node
}

sig Node {
  link: lone Node
}

pred Acyclic () {
  all l : List | no l.header or some n: l.header.*link | no n.link
}

run Acyclic for 3 but exactly 1 List
