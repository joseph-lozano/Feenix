defmodule Feenix.Repo do
  use Ecto.Repo,
    otp_app: :feenix,
    adapter: Ecto.Adapters.Postgres
end
