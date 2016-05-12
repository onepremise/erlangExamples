%%%-------------------------------------------------------------------
%%% @author Jason Huntley
%%%
%%% @doc fibonacci example.
%%%
%%% @end
%%% Created : 11. May 2016 2:07 PM
%%%-------------------------------------------------------------------
-module(fibonacci).
-author("jhuntley").

%% API
-export([printElements/1,fibonacci/1, fibonacci/3]).

printElements([H]) -> io:format("~w ",[H]);
printElements([H|T]) when length(T) >= 1 -> io:format("~w ",[H]), printElements(T).

fibonacci(N) ->
  L=fibonacci(N,1,[0,1]),
  printElements(L).
fibonacci(To, LastAdded, L) when LastAdded =< To ->
  io:format("Last added: ~w To: ~w~n", [LastAdded,To]),
  fibonacci(To, hd(lists:reverse(tl(L)))+hd(tl(lists:reverse(L))),
    L++[hd(lists:reverse(tl(L)))+hd(tl(lists:reverse(L)))]);
fibonacci(To, LastAdded, L) when LastAdded > To -> L.