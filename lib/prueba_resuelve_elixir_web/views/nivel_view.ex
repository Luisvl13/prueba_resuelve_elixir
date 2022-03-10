defmodule PruebaResuelveElixirWeb.NivelView do
  use PruebaResuelveElixirWeb, :view
  alias PruebaResuelveElixirWeb.NivelView

  def render("index.json", %{niveles: niveles}) do
    %{data: render_many(niveles, NivelView, "nivel.json")}
  end

  def render("show.json", %{nivel: nivel}) do
    %{data: render_one(nivel, NivelView, "nivel.json")}
  end

  def render("nivel.json", %{nivel: nivel}) do
    %{
      id: nivel.id,
      nivel: nivel.nivel,
      goles_mes: nivel.goles_mes
    }
  end
end
