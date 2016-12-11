defmodule Events.Repo do
  use Ecto.Repo, otp_app: :events
  use Scrivener, page_size: 10
end
