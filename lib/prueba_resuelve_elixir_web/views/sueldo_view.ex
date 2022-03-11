defmodule PruebaResuelveElixirWeb.SueldoView do
  use PruebaResuelveElixirWeb, :view

  def render("equipos.json", %{equipos: equipos}) do
    %{
      equipos:
        Enum.map(equipos, fn equipo ->
          %{
            jugadores:
              Enum.map(equipo, fn jugador ->
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
        end)
    }
  end

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
