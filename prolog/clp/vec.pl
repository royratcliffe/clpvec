:- module(clp_vec,
          [   vec_translate/3,          % ?U, ?V, ?W
              vec_scale/3               % ?Scalar, ?U, ?V
          ]).

:- use_module(library(clpr)).

%!  vec_translate(?U, ?V, ?W) is nondet.
%
%   Vector addition.

vec_translate([], [], []).
vec_translate([H0|T0], [H1|T1], [H|T]) :-
    {H =:= H0 + H1},
    vec_translate(T0, T1, T).

%!  vec_scale(?Scalar, ?U, ?V) is nondet.
%
%   Scalar multiplication. Scaling  by  a   negative  scalar  flips  the
%   direction, as well as scales by the magnitude.

vec_scale(_, [], []).
vec_scale(Scalar, [H0|T0], [H|T]) :-
    {H =:= Scalar * H0},
    vec_scale(Scalar, T0, T).
