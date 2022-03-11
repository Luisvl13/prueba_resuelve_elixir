defmodule PruebaResuelveElixir do
  import Ecto.Query, warn: false

  alias PruebaResuelveElixir.Repo
  alias PruebaResuelveElixir.Sueldos.Nivel

  alias PruebaResuelveElixir.Sueldos.Jugador

  def sueldo_completo(request, equipo_id) do
    Enum.map(request, fn jugador ->
      bono50 = jugador["bono"] / 2

      alcance_bono_individual =
        jugador["goles"] / obtener_goles_nivel(jugador["nivel"], equipo_id)

      bono_logrado =
        bono50 *
          if(alcance_bono_individual >= 1,
            do: 1,
            else: alcance_bono_individual
          ) +
          bono50 *
            if(porcentaje_alcance_bono_equipo(request, equipo_id) >= 1,
              do: 1,
              else: porcentaje_alcance_bono_equipo(request, equipo_id)
            )

      %Jugador{
        nombre: jugador["nombre"],
        nivel: jugador["nivel"],
        goles: jugador["goles"],
        sueldo: jugador["sueldo"],
        bono: jugador["bono"],
        sueldo_completo: :erlang.float_to_binary(jugador["sueldo"] + bono_logrado, decimals: 2),
        equipo: jugador["equipo"]
      }
    end)
  end

  def porcentaje_alcance_bono_equipo(request, equipo_id) do
    suma_goles_anotados = suma_goles_anotados_equipo(request)
    suma_goles_meta = suma_goles_meta_equipo(request, equipo_id)

    suma_goles_anotados / suma_goles_meta
  end

  def suma_goles_anotados_equipo(request) do
    Enum.reduce(request, 0, fn x, acc -> x["goles"] + acc end)
  end

  def suma_goles_meta_equipo(request, equipo_id) do
    Enum.reduce(request, 0, fn x, acc ->
      obtener_goles_nivel(x["nivel"], equipo_id) + acc
    end)
  end

  def obtener_goles_nivel(nivel, equipo_id) do
    res_nivel =
      Nivel
      |> where(nivel: ^nivel)
      |> where(equipo_id: ^equipo_id)
      |> Repo.one()

    res_nivel.goles_mes
  end
end
