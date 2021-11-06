FROM elixir:latest


RUN apt-get update

RUN mix local.hex --force
RUN mix archive.install hex phx_new 1.5.9 --force
RUN mix local.rebar --force

WORKDIR /app

