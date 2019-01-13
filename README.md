# Constraint Logic Programming over Vectors, CLP(V)

Is it possible, advisable, sensible to describe vector and matrix
operations using Constraint Logic Programming (CLP) techniques? That is,
since vectors and matrices are basically columns and rows of
real-numeric scalars, their operators amount to constrained
relationships between real numbers and hence open to the application of
CLP over reals. The simple answer is yes, CLP(V) lets you express vector
operators using real-number constraints.

Contraint logic adds some important features to vector operations.
Suppose for instance that you have a simple addition of two vectors, a
vector translation of U+V=W. Add U to V giving W. The following
statements all hold true. Note that the CLP-based translation unifies
correctly when W is unknown but also when U or V is unknown. Given any
two, you can ask for the missing vector.

    ?- vec_translate([1, 1], [2, 2], W).
    W = [3.0, 3.0] ;
    false.
    ?- vec_translate([1, 1], V, [3, 3]).
    V = [2.0, 2.0] ;
    false.
    ?- vec_translate(U, [2, 2], [3, 3]).
    U = [1.0, 1.0] ;
    false.

Note also that the predicate answers non-deterministically with
back-tracking until no alternative answer exists. This presumes that
alternatives could exist at least in theory if not in practice.
