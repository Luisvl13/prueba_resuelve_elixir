defmodule PruebaResuelveElixir.Repo do
  use Ecto.Repo,
    otp_app: :prueba_resuelve_elixir,
    adapter: Ecto.Adapters.MyXQL
end
