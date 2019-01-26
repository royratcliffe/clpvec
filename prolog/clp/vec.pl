:- module(clp_vec,
          [   vec_translate/3,          % ?U, ?V, ?W
              vec_scale/3,              % ?Scalar, ?U, ?V
              vec_rotate/3
          ]).

/** <module> Vectors

"The  introduction  of  numbers   as   coordinates    is   an   act   of
violence."--Hermann Weyl, 1885-1955

Vectors are just lists of numbers, i.e.  scalars. These scalars apply to
arbitrary abstract dimensions. For example, a two-dimensional vector [1,
2] applies two scalars, 1 and 2, to  dimensional units _i_ and _j_; also
known as the basis vectors for the coordinate system.

@author Roy Ratcliffe <roy@ratcliffe.me>

*/

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

%!  vec_rotate(?Angle, ?U, ?V) is nondet.
%
%   Rotates vector U by Angle in radians, unifying the result with V.
%   Positive angles rotate anti-clockwise, negative clockwise.
%
%   @arg Angle to rotate by, in radians.
%   @arg U vector to rotate from.
%   @arg V vector to rotate to.

vec_rotate(Angle, [X0, Y0], [X, Y]) :-
    {   Cos =:= cos(Angle),
        Sin =:= sin(Angle),
        X =:= X0 * Cos - Y0 * Sin,
        Y =:= X0 * Sin + Y0 * Cos
    }.
