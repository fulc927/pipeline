%%%-------------------------------------------------------------------
%% @doc joearmstrong top level supervisor.
%% @end
%%%-------------------------------------------------------------------

-module(pipeline_sup).

-behaviour(supervisor).


-export([start_link/0]).

-export([init/1]).

-include_lib("amqp_client/include/amqp_client.hrl").

-define(SERVER, ?MODULE).

start_link() ->
    supervisor:start_link({local, ?SERVER}, ?MODULE, []).

init([]) ->

	{ok, {{one_for_one, 3, 10},
		[
		{tag1,
		{pub_sup, start_link, []},
		permanent,
		10000,
		supervisor,
		[pub_sub]}
		%{tag2,
		%{gen_consume, start_link, []},
		%permanent,
		%10000,
		%worker,
		%[gen_consume]}
		]}}.

%% internal functions
