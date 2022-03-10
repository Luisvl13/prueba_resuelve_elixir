defmodule PruebaResuelveElixir.SueldosFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `PruebaResuelveElixir.Sueldos` context.
  """

  @doc """
  Generate a equipo.
  """
  def equipo_fixture(attrs \\ %{}) do
    {:ok, equipo} =
      attrs
      |> Enum.into(%{
        nombre: "some nombre"
      })
      |> PruebaResuelveElixir.Sueldos.create_equipo()

    equipo
  end

  @doc """
  Generate a nivel.
  """
  def nivel_fixture(attrs \\ %{}) do
    {:ok, nivel} =
      attrs
      |> Enum.into(%{
        goles_mes: 42,
        nivel: "some nivel"
      })
      |> PruebaResuelveElixir.Sueldos.create_nivel()

    nivel
  end
end
