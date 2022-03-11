defmodule PruebaResuelveElixirWeb.SueldoController do
  use PruebaResuelveElixirWeb, :controller

  import PruebaResuelveElixir

  def cal_sueldo_completo(conn, sueldo_params) do
    map = sueldo_params["jugadores"]

    jugadores = sueldo_completo(map, 1)
    render(conn, "jugadores.json", jugadores: jugadores)
  end
end
