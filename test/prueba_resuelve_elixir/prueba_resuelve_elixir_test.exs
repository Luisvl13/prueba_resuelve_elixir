defmodule PruebaResuelveElixir.PruebaResuelveElixirTest do
  use PruebaResuelveElixir.DataCase
  import PruebaResuelveElixir

  @request [
    %{
      "nombre" => "Juan Perez",
      "nivel" => "A",
      "goles" => 6,
      "sueldo" => 50000,
      "bono" => 25000,
      "sueldo_completo" => nil,
      "equipo" => "rojo"
    },
    %{
      "nombre" => "Pedro",
      "nivel" => "B",
      "goles" => 7,
      "sueldo" => 100_000,
      "bono" => 30000,
      "sueldo_completo" => nil,
      "equipo" => "azul"
    },
    %{
      "nombre" => "Martin",
      "nivel" => "C",
      "goles" => 16,
      "sueldo" => 20000,
      "bono" => 10000,
      "sueldo_completo" => nil,
      "equipo" => "azul"
    },
    %{
      "nombre" => "Luis",
      "nivel" => "Cuauh",
      "goles" => 19,
      "sueldo" => 50000,
      "bono" => 10000,
      "sueldo_completo" => nil,
      "equipo" => "rojo"
    }
  ]

  test "test_suma_goles_meta_equipo" do
    equipo_id = 1
    assert suma_goles_meta_equipo(@request, equipo_id) == 50
  end

  test "test_suma_goles_anotados_equipo" do
    assert suma_goles_anotados_equipo(@request) == 48
  end

  test "test_porcentaje_alcance_bono_equipo" do
    equipo_id = 1
    assert porcentaje_alcance_bono_equipo(@request, equipo_id) == 0.96
  end

  test "test_sueldo_completo" do
    equipo_id = 1
    jugador_luis = Enum.at(sueldo_completo(@request, equipo_id), 3)
    assert jugador_luis.sueldo_completo == "59550.00"
  end
end
