#!/usr/bin/env escript

main(_) ->
    net_kernel:start([ multinode, shortnames ]),
    io:fwrite("local node: ~w~n", [ node() ]),
    ok.
