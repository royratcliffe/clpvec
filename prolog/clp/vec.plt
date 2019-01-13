:- begin_tests(clp_vec).

:- use_module(library(clpvec)).

test(vec_translate, [true(W == [1.0, 1.0]), nondet]) :-
    vec_translate([0, 0], [1, 1], W).
test(vec_translate, [true(U == [0.0, 0.0]), nondet]) :-
    vec_translate(U, [1, 1], [1, 1]).

test(vec_translate, [true(W == [3.0, 3.0]), nondet]) :-
    vec_translate([1, 1], [2, 2], W).
test(vec_translate, [true(V == [2.0, 2.0]), nondet]) :-
    vec_translate([1, 1], V, [3, 3]).
test(vec_translate, [true(U == [1.0, 1.0]), nondet]) :-
    vec_translate(U, [2, 2], [3, 3]).

test(vec_scale, [true(V == [10.0, 10.0, 10.0]), nondet]) :-
    vec_scale(10, [1, 1, 1], V).
test(vec_scale, [true(U == [1.0, 1.0, 1.0]), nondet]) :-
    vec_scale(10, U, [10, 10, 10]).
test(vec_scale, [true(Scalar == 10.0), nondet]) :-
    vec_scale(Scalar, [1, 1, 1], [10, 10, 10]).

:- end_tests(clp_vec).
