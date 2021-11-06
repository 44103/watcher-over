defmodule WatcherOver.Repo do
  use Ecto.Repo,
    otp_app: :watcher_over,
    adapter: Ecto.Adapters.Postgres
end
