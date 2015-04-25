#!/usr/bin/env escript

main(_) ->
    startup(),
    connect_nodes(),
    try_rpckill(),
    ok.


startup() ->
    io:fwrite("start main node: ~w~n", [ net_kernel:start([ multinode, shortnames ]) ]),
    io:fwrite("local node: ~w~n", [ node() ]),
    io:fwrite("~n").

connect_nodes() ->
    io:fwrite("ping 'detached@localhost': ~w~n", [ net_adm:ping('detached@localhost') ]),
    io:fwrite("ping 'rpckill@localhost': ~w~n", [ net_adm:ping('rpckill@localhost') ]),
    io:fwrite("connected nodes: ~w~n", [ nodes() ]),
    io:fwrite("~n").

try_rpckill() ->
    io:fwrite("kill node via rpc: ~w~n", [ rpc:call('rpckill@localhost', init, stop, []) ]),
    timer:sleep(1000),
    io:fwrite("connected nodes: ~w~n", [ nodes() ]),
    io:fwrite("~n").