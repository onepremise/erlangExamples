%%%-------------------------------------------------------------------
%%% @author jhuntley
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 13. May 2016 3:01 PM
%%%-------------------------------------------------------------------
-module(records).
-author("jhuntley").

%% API
-export([test/0]).

-record(program, {name,
  type=user,
  status=rectify,
  health,
  hasDisk
  }).

load_tron() ->
  #program{name="Tron",
    type=ai,
    status=games,
    health=100,
    hasDisk=true}.

load_clue() ->
  #program{name="Clue",
    type=leader,
    status=processing,
    health=100,
    hasDisk=true}.

load_sam() ->
  #program{name="Sam",
    type=user,
    status=games,
    health=100,
    hasDisk=true}.

test() ->
  Tron=load_tron(),
  Clue=load_clue(),
  Sam=load_sam(),
  io:format("Tron: ~s, Clue: ~s, Sam: ~s~n", [Tron#program.status,Clue#program.status,Sam#program.status]).