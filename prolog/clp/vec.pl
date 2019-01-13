:- module(clp_vec,
          [   vec_translate/3           % ?U, ?V, ?W
          ]).

:- use_module(library(clpr)).

%!  vec_translate(?U, ?V, ?W) is nondet.

vec_translate([], [], []).
vec_translate([H0|T0], [H1|T1], [H|T]) :-
    {H =:= H0 + H1},
    vec_translate(T0, T1, T).
