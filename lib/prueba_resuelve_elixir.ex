defmodule PruebaResuelveElixir do
  import Ecto.Query, warn: false
  alias PruebaResuelveElixir.Repo
  alias PruebaResuelveElixir.Sueldos.Nivel

  def porcentaje_alcance_bono_equipo(request, equipo_id) do
    suma_goles_anotados = suma_goles_anotados_equipo(request)
    suma_goles_meta = suma_goles_meta_equipo(request, equipo_id)

    alcance_bono_equipo = suma_goles_anotados / suma_goles_meta
    alcance_bono_equipo
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
