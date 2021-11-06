defmodule WatcherOver.Scheduler do
  use Quantum, otp_app: :watcher_over

  def is_home do
    System.cmd("ping", ["-c", "1", "localhost"])
    |> elem(0)
    |> String.contains?("1 received")
    |> if do
      (Time.utc_now()
      |> Time.to_string()) <> " いまいる"
    else
      (Time.utc_now()
      |> Time.to_string()) <> " いまいない"
    end
    |> IO.inspect()
  end
end
