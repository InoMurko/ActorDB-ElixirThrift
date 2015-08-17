ActorDB - Elixir - Phoenix - Thrift example

Dependency actordb_client has a child dep thrift from Biokodas repo. You should comment that one out in
deps/actordb_client/rebar.config.

mix.exs file has the ActorDB login details.


Start project with:
iex -S mix phoenix.server
test query:
:actordb_client.exec "actor type(1); select * from tab"
