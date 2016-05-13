%%%-------------------------------------------------------------------
%%% @author jhuntley
%%%
%%% @doc Lambda example.
%%%
%%% @end
%%% Created : 12. May 2016 3:34 PM
%%%-------------------------------------------------------------------
-module(lambdas).
-author("jhuntley").

%% API
-export([pow/1, bang/1, kaboom/2, getOperation/1, test/0]).

%%High Order Functions
pow(S) -> lists:concat(["POW! ", S]).

bang(S) -> lists:concat(["BANG! ", S]).

kaboom(_, []) -> nil;
kaboom(F, [H|T]) ->
  io:format("~s~n",[F(H)]),
  kaboom(F,T).

%%Anonymous
getOperation(X) when X > 0 ->
  fun() -> io:format("MAKE ~w~n", [X]) end;
getOperation(X) when X =< 0 ->
  fun() -> io:format("TAKE ~w~n", [X]) end.

test() ->
  kaboom(fun lambdaFun:pow/1, ["a", "b", "c"]),
  kaboom(fun lambdaFun:bang/1, ["a", "b", "c"]),
  Make=getOperation(50),
  Make(),
  Take=getOperation(-25),
  Take().