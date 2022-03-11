defmodule PruebaResuelveElixirWeb.SueldoController do
  use PruebaResuelveElixirWeb, :controller

  import PruebaResuelveElixir

  def sueldo_completo_equipos(conn, sueldo_params) do
    map = sueldo_params["equipos"]

    equipos =
      Enum.map(map, fn equipo ->
        equipo_id = equipo["id"]

        sueldo_completo(equipo["jugadores"], equipo_id)
      end)

    render(conn, "equipos.json", equipos: equipos)
  end

  def sueldo_completo_jugadores(conn, sueldo_params) do
    map = sueldo_params["jugadores"]

    jugadores = sueldo_completo(map, 1)
    render(conn, "jugadores.json", jugadores: jugadores)
  end
end
