%%%-------------------------------------------------------------------
%%% @author Jason Huntley
%%%
%%% @doc Examples of binary arithmetic in Erlang
%%%
%%% @end
%%% Created : 11. May 2016 2:56 PM
%%%-------------------------------------------------------------------
-module(binaryMath).
-author("jhuntley").

%% API
-export([add/2, neg/1, sub/2, mult/2, mult/3, bindiv/2, test/0]).

add(X,Y) when <<Y>> =/= <<0>> ->
  %%io:format("~w,~w~n",[X,Y]),
  add(X bxor Y, (X band Y) bsl 1);
add(X,Y) when <<Y>> =:= <<0>> -> X.

neg(X) ->
  <<Dec>> = <<bnot(X)>>, Dec.

sub(X, Y) ->
  add(X, add(neg(Y),1)).

mult(X, Y) ->
  mult(X, Y, 0).
mult(X, Y, R) when <<Y>> =/= <<0>>, Y band 1 =:= 1 ->
  %%io:format("1 ~w,~w, ~w~n",[X,Y,R]),
  mult(X bsl 1, Y bsr 1, add(R,X));
mult(X, Y, R) when <<Y>> =/= <<0>> ->
  %%io:format("~w,~w, ~w~n",[X,Y,R]),
  mult(X bsl 1, Y bsr 1, R);
mult(_, _, R) -> R.

neg_sign(V, S) ->
  case V<0 of true -> {neg(V), S bxor 1}; false -> {V, S} end.

bindiv(X, Y) ->
  {Px, Ps}=neg_sign(X,0),
  {Py, Pss}=neg_sign(Y,Ps),
  bindiv(Px,Py,0,Pss).
bindiv(X, Y, C, S) when <<Y>> =/= <<0>>, X >= Y ->
  bindiv(sub(X,Y), Y, C+1, S);
bindiv(_, _, C, S) when S < 0 ->
  neg(C);
bindiv(_, _, C, _) ->
  C.

test() ->
  io:format("8+2=~w~n", [add(8,2)]),
  io:format("8-2=~w~n", [sub(8,2)]),
  io:format("4*3=~w~n", [mult(4,3)]),
  io:format("8*2=~w~n", [mult(8,2)]),
  io:format("4/2=~w~n", [bindiv(4,2)]),
  io:format("6/3=~w~n", [bindiv(6,3)]),
  io:format("16/4=~w~n", [bindiv(16,4)]).