defmodule PruebaResuelveElixirWeb.Router do
  use PruebaResuelveElixirWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", PruebaResuelveElixirWeb do
    pipe_through :api
    resources "/equipos", EquipoController, except: [:new, :edit]
    resources "/niveles", NivelController, except: [:new, :edit]

    post "/sueldos-jugadores", SueldoController, :sueldo_completo_jugadores
    post "/sueldos-equipos", SueldoController, :sueldo_completo_equipos
  end
end
