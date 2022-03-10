defmodule PruebaResuelveElixirWeb.Router do
  use PruebaResuelveElixirWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", PruebaResuelveElixirWeb do
    pipe_through :api
  end
end
