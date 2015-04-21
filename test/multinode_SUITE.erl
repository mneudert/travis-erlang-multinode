-module(multinode_SUITE).
-compile(export_all).
-include_lib("common_test/include/ct.hrl").

all() ->  [ the_truth ].

the_truth(_Config) ->
  true = true,
  ok.
