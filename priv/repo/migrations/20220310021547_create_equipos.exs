defmodule PruebaResuelveElixir.Repo.Migrations.CreateEquipos do
  use Ecto.Migration

  def change do
    create table(:equipos) do
      add :nombre, :string

      timestamps()
    end
  end
end
