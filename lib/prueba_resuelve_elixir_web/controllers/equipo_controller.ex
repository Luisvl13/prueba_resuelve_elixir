defmodule PruebaResuelveElixirWeb.EquipoController do
  use PruebaResuelveElixirWeb, :controller

  alias PruebaResuelveElixir.Sueldos
  alias PruebaResuelveElixir.Sueldos.Equipo

  action_fallback PruebaResuelveElixirWeb.FallbackController

  def index(conn, _params) do
    equipos = Sueldos.list_equipos()
    render(conn, "index.json", equipos: equipos)
  end

  def create(conn, %{"equipo" => equipo_params}) do
    with {:ok, %Equipo{} = equipo} <- Sueldos.create_equipo(equipo_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.equipo_path(conn, :show, equipo))
      |> render("show.json", equipo: equipo)
    end
  end

  def show(conn, %{"id" => id}) do
    equipo = Sueldos.get_equipo!(id)
    render(conn, "show.json", equipo: equipo)
  end

  def update(conn, %{"id" => id, "equipo" => equipo_params}) do
    equipo = Sueldos.get_equipo!(id)

    with {:ok, %Equipo{} = equipo} <- Sueldos.update_equipo(equipo, equipo_params) do
      render(conn, "show.json", equipo: equipo)
    end
  end

  def delete(conn, %{"id" => id}) do
    equipo = Sueldos.get_equipo!(id)

    with {:ok, %Equipo{}} <- Sueldos.delete_equipo(equipo) do
      send_resp(conn, :no_content, "")
    end
  end
end
