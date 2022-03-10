defmodule PruebaResuelveElixirWeb.NivelController do
  use PruebaResuelveElixirWeb, :controller

  alias PruebaResuelveElixir.Sueldos
  alias PruebaResuelveElixir.Sueldos.Nivel

  action_fallback PruebaResuelveElixirWeb.FallbackController

  def index(conn, _params) do
    niveles = Sueldos.list_niveles()
    render(conn, "index.json", niveles: niveles)
  end

  def create(conn, %{"nivel" => nivel_params}) do
    with {:ok, %Nivel{} = nivel} <- Sueldos.create_nivel(nivel_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.nivel_path(conn, :show, nivel))
      |> render("show.json", nivel: nivel)
    end
  end

  def show(conn, %{"id" => id}) do
    nivel = Sueldos.get_nivel!(id)
    render(conn, "show.json", nivel: nivel)
  end

  def update(conn, %{"id" => id, "nivel" => nivel_params}) do
    nivel = Sueldos.get_nivel!(id)

    with {:ok, %Nivel{} = nivel} <- Sueldos.update_nivel(nivel, nivel_params) do
      render(conn, "show.json", nivel: nivel)
    end
  end

  def delete(conn, %{"id" => id}) do
    nivel = Sueldos.get_nivel!(id)

    with {:ok, %Nivel{}} <- Sueldos.delete_nivel(nivel) do
      send_resp(conn, :no_content, "")
    end
  end
end
