-module(multinode_app).

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

%% ===================================================================
%% Application callbacks
%% ===================================================================

start(_StartType, _StartArgs) ->
    net_kernel:start([ multinode, shortnames ]).

stop(_State) ->
    ok.
