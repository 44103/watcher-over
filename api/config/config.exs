# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :watcher_over,
  ecto_repos: [WatcherOver.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :watcher_over, WatcherOverWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "9KyPnDwWULPUy/RYj1+1UWDsyR3SGRO5OJe/0wACmI9bmHxbZ3vxexeyk/y5MJek",
  render_errors: [view: WatcherOverWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: WatcherOver.PubSub,
  live_view: [signing_salt: "KPPvPx66"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

config :watcher_over, WatcherOver.Scheduler,
  jobs: [
    {{:extended, "*/5 * * * * *"}, {WatcherOver.Scheduler, :is_home, []}}
  ]
