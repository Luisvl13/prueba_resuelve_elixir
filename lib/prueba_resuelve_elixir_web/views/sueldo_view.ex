defmodule PruebaResuelveElixirWeb.SueldoView do
  use PruebaResuelveElixirWeb, :view

  def render("jugadores.json", %{jugadores: jugadores}) do
    %{
      jugadores:
        Enum.map(jugadores, fn jugador ->
          %{
            nombre: jugador.nombre,
            nivel: jugador.nivel,
            goles: jugador.goles,
            sueldo: jugador.sueldo,
            bono: jugador.bono,
            sueldo_completo: jugador.sueldo_completo,
            equipo: jugador.equipo
          }
        end)
    }
  end
end
