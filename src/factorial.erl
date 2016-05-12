%%%-------------------------------------------------------------------
%%% @author Jason Huntley
%%%
%%% @doc factorial example
%%%
%%% @end
%%% Created : 11. May 2016 2:09 PM
%%%-------------------------------------------------------------------
-module(factorial).
-author("jhuntley").

%% API
-export([factorial/1]).

factorial(0) ->
  1;
factorial(N) ->
  N * factorial(N-1).