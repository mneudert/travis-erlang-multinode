#!/usr/bin/env escript

main(Config) ->
    Hostname = lists:nth(1, Config),
    startup(Hostname),
    connect_nodes(Hostname),
    try_rpckill(Hostname),
    ok.


startup(Hostname) ->
    Nodename = list_to_atom("multinode@" ++ Hostname),
    io:fwrite("start main node: ~w~n", [ net_kernel:start([ Nodename, longnames ]) ]),
    io:fwrite("local node: ~w~n", [ node() ]),
    io:fwrite("~n").

connect_nodes(Hostname) ->
    DetachedName = list_to_atom("detached@" ++ Hostname),
    RpckillName = list_to_atom("rpckill@" ++ Hostname),
    io:fwrite("ping ~w: ~w~n", [ DetachedName, net_adm:ping(DetachedName) ]),
    io:fwrite("ping ~w: ~w~n", [ RpckillName, net_adm:ping(RpckillName) ]),
    io:fwrite("connected nodes: ~w~n", [ nodes() ]),
    io:fwrite("~n").

try_rpckill(Hostname) ->
    RpckillName = list_to_atom("rpckill@" ++ Hostname),
    io:fwrite("kill node via rpc: ~w~n", [ rpc:call(RpckillName, init, stop, []) ]),
    timer:sleep(1000),
    io:fwrite("connected nodes: ~w~n", [ nodes() ]),
    io:fwrite("~n").
