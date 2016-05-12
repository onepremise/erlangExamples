%%%-------------------------------------------------------------------
%%% @author Jason Huntley
%%%
%%% @doc
%%%
%%% @end
%%% Created : 09. May 2016 4:18 PM
%%%-------------------------------------------------------------------
-module(quicksort).
-author("jhuntley").

%% API
-export([quicksort/1,partition/4]).

quicksort([]) -> [];
quicksort([Piv|Rest]) ->
  {SmallValues,LargeValues}=partition(Piv, Rest, [], []),
  io:format('SmallList: ~w, Piv: ~w, LargeList: ~w~n', [SmallValues, Piv, LargeValues]),
  quicksort(SmallValues) ++ [Piv] ++ quicksort(LargeValues).

partition(_,[],SmallValues,LargeValues) ->
  {SmallValues,LargeValues};
partition(Piv, [H|T], SmallValues, LargeValues) ->
  if H =< Piv -> partition(Piv, T, [H|SmallValues], LargeValues);
    H > Piv -> partition(Piv, T, SmallValues, [H|LargeValues])
  end.
