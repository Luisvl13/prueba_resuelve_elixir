defmodule PruebaResuelveElixir.Repo.Migrations.CreateNiveles do
  use Ecto.Migration

  def change do
    create table(:niveles) do
      add :nivel, :string
      add :goles_mes, :integer
      add :equipo_id, references(:equipos, on_delete: :nothing)

      timestamps()
    end

    create index(:niveles, [:equipo_id])
  end
end
