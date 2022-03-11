defmodule PruebaResuelveElixir do
  import Ecto.Query, warn: false

  alias PruebaResuelveElixir.Repo
  alias PruebaResuelveElixir.Sueldos.Nivel

  alias PruebaResuelveElixir.Sueldos.Jugador

  @doc """
  Retorna el map de los jugadores con el sueldo completo que alcanzo en el mes

  ## Examples

      iex> sueldo_completo(request, equipo_id)
      %{
        "jugadores" => [
          %{
            "bono" => 10000,
            "equipo" => "rojo",
            "goles" => 19,
            "nivel" => "Especial",
            "nombre" => "Luis",
            "sueldo" => 50000,
            "sueldo_completo" => 59550.00
          }
        ]
      }

  """
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

  @doc """
  Retorna el total de goles anotados por el equipo

  ## Examples

      iex> porcentaje_alcance_bono_equipo( [%{"jugadores" => [],1)
      0.96

  """
  def porcentaje_alcance_bono_equipo(request, equipo_id) do
    suma_goles_anotados = suma_goles_anotados_equipo(request)
    suma_goles_meta = suma_goles_meta_equipo(request, equipo_id)

    suma_goles_anotados / suma_goles_meta
  end

  @doc """
  Retorna el total de goles anotados por el equipo

  ## Examples

      iex> suma_goles_anotados_equipo( [%{"jugadores" => [])
      50

  """
  def suma_goles_anotados_equipo(request) do
    Enum.reduce(request, 0, fn x, acc -> x["goles"] + acc end)
  end

  @doc """
  Retorna el total de goles meta al que tiene que llegar el equipo por mes

  ## Examples

      iex> suma_goles_meta_equipo( [%{"jugadores" => [], 2)
      50

  """
  def suma_goles_meta_equipo(request, equipo_id) do
    Enum.reduce(request, 0, fn x, acc ->
      obtener_goles_nivel(x["nivel"], equipo_id) + acc
    end)
  end

  @doc """
  Retorna la cantidad de goles meta que un jugador tiene que anortar por mes.
  Dependiento el nivel y equipo en que este

  ## Examples

      iex> obtener_goles_nivel("A", 1)
      5

  """
  def obtener_goles_nivel(nivel, equipo_id) do
    res_nivel =
      Nivel
      |> where(nivel: ^nivel)
      |> where(equipo_id: ^equipo_id)
      |> Repo.one()

    res_nivel.goles_mes
  end
end
