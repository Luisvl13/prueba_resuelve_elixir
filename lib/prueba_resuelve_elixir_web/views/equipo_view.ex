defmodule PruebaResuelveElixirWeb.EquipoView do
  use PruebaResuelveElixirWeb, :view
  alias PruebaResuelveElixirWeb.EquipoView

  def render("index.json", %{equipos: equipos}) do
    %{data: render_many(equipos, EquipoView, "equipo.json")}
  end

  def render("show.json", %{equipo: equipo}) do
    %{data: render_one(equipo, EquipoView, "equipo.json")}
  end

  def render("equipo.json", %{equipo: equipo}) do
    %{
      id: equipo.id,
      nombre: equipo.nombre
    }
  end
end
