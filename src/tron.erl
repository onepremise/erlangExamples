%%%-------------------------------------------------------------------
%%% @author jhuntley
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 13. May 2016 3:01 PM
%%%-------------------------------------------------------------------
-module(tron).
-author("jhuntley").

%% API
-export([start/1,test/0]).

-behavoiur(wx_object).

-include_lib("wx/include/wx.hrl").

%% wx_object callbacks
-export([init/1, terminate/2,  code_change/3,
  handle_info/2, handle_call/3, handle_event/2, handle_sync_event/3]).

-record(program, {name,
  type=user,
  status=rectify,
  health,
  position={0,0},
  hasDisk
  }).

-record(grid, {name,
  type=light,
  size={60,60}}).

-record(state, {
  parent,
  config,
  canvas,
  bitmap
}).

start(Config) ->
  wx_object:start_link(?MODULE, Config, []).

init(Config) ->
  wx:batch(fun() -> do_init(Config) end).

do_init(Config) ->
  Parent = proplists:get_value(parent, Config),
  Panel = wxPanel:new(Parent, []).

handle_sync_event(#wx{event = #wxPaint{}}, _wxObj,
    #state{canvas=Canvas, bitmap=Bitmap}) ->
  DC = wxPaintDC:new(Canvas),
  redraw(DC, Bitmap),
  wxPaintDC:destroy(DC),
  ok.

handle_event(#wx{event = #wxSize{size={W,H}}},
    State = #state{bitmap=Prev}) ->
  {noreply, State};

handle_event(Ev = #wx{}, State = #state{}) ->
  {noreply, State}.

handle_info(Msg, State) ->
  {noreply, State}.

handle_call(Msg, _From, State) ->
  {reply,{error, nyi}, State}.

code_change(_, _, State) ->
  {stop, ignore, State}.

terminate(_Reason, _State) ->
  ok.

draw(Canvas, Bitmap, Fun) -> ok.

redraw(DC, Bitmap) -> ok.

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
    position={0,0},
    hasDisk=true}.

load_sam() ->
  #program{name="Sam",
    type=user,
    status=games,
    health=100,
    position={0,0},
    hasDisk=true}.

load_grid() ->
  #grid{name="light",
    type=light,
    size={60,60}}.

test() ->
  Tron=load_tron(),
  Clue=load_clue(),
  Sam=load_sam(),
  Grid=load_grid(),

  Proplist = [{Tron#program.name, Tron}, {Clue#program.name, Clue}, {Sam#program.name, Sam}],

  [io:format("Entry: ~w~n", [X]) ||X <- Proplist],

  io:format("Tron: ~s, Clue: ~s, Sam: ~s~n", [Tron#program.status,Clue#program.status,Sam#program.status]).