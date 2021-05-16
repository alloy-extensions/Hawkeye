abstract sig Listing { }
sig Address extends Listing { }
sig Name extends Listing { }
sig Book {
	entry: set Name, // T1
	listed: entry ->set Listing // T2
}
fun lookup [b: Book, n: Name] : set Listing {n.^(b.listed)}

// A name entry maps to at most one name or address.
fact {all b:Book | all n:b.entry | some b.listed[n] }
// All names reachable from any name entry in the book are themselves entries.
fact { all b:Book | all n,l:Name | l in lookup[b,n] implies l in b.entry }
// Acyclic
fact { all b:Book | all n:b.entry | not n in lookup[b,n] }


/* Refinement Task */ 
// A. assertion (universal statement over constraints; in this case, C1)
pred lookupEndsInAddr {
	all b:Book | all n:b.entry | some (lookup[b,n]&Address)
}
run lookupEndsInAddr for 3
