%%%-------------------------------------------------------------------
%%% @author Jason Huntley
%%%
%%% @doc This is just random tests; specific examples of simple
%%%      features provided by Erlang.
%%%
%%% @end
%%% Created : 09. May 2016 4:18 PM
%%%-------------------------------------------------------------------
-module(useless).
-export([add/2,hello/0,greet_and_add_two/1,greet/2,head/1,
  second/1,heh_fine/1,oh_god/1,reverse/1,checksize/1,checksizeb/1,
  check_letter/1]).

add(A,B) ->
 A + B.

%% Shows Greetings.
hello() ->
 io:format("Hello, world!~n").

greet_and_add_two(X) ->
 hello(),
 add(X,2).

greet(male, Name) ->
 io:format("Hello, Mr. ~s", [Name]);
greet(female, Name) ->
 io:format("Hello, Mrs. ~s!", [Name]);
greet(_,Name) ->
 io:format("Hello, ~s!", [Name]).

head([H|_]) -> H.

second([_,X|_]) -> X.

heh_fine(X) ->
 if 1 =:= X ->
  works
 end,
 if 2 =:= X; 1 =:= X ->
  works
 end,
 if 2 =:= X, 2 =:= X ->
  fails
 end.

oh_god(N) ->
 if N =:= 2 -> might_succeed;
   true -> always_does  %% this is Erlang's if's 'else!'
 end.

reverse([]) -> [];
reverse([H|T]) ->
  io:format("H=~w, T=~w~n",[H,T]),
  reverse(T)++[H].

checksize(S) when S >= 1 -> true;
checksize(_) -> false.

checksizeb(S) ->
  if S >= 1, S < 9 -> true;
    S < 1 -> false
  end.

check_letter(C) ->
  if
    C =:= "A" -> io:format("1. ~s~n",[C]);
    C =:= "B" -> io:format("2. ~s~n",[C])
  end.




