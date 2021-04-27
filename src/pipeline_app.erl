%%%-------------------------------------------------------------------
%% @doc pipeline public API
%% @end
%%%-------------------------------------------------------------------

-module(pipeline_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    pipeline_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
