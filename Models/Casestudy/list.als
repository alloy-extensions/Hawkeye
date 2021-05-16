sig List {
    header: lone Node
}

sig Node {
    link: lone Node,
    elem: one Int
}

// Overconstraint.  Should allow no n.link
pred Sorted(This: List) {
    // Fix: replace "n.elem <= n.link.elem" with "some n.link => n.elem <= n.link.elem".
    all n:This.header.*link | n.elem <= n.link.elem
}

run {Sorted[List]} for 3 but exactly 1 Node
