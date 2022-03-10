defmodule PruebaResuelveElixir.Sueldos.Nivel do
  use Ecto.Schema
  import Ecto.Changeset

  schema "niveles" do
    field :goles_mes, :integer
    field :nivel, :string
    belongs_to :equipo, PruebaResuelveElixir.Sueldos.Equipo, references: :id

    timestamps()
  end

  @doc false
  def changeset(nivel, attrs) do
    nivel
    |> cast(attrs, [:nivel, :goles_mes])
    |> validate_required([:nivel, :goles_mes])
  end
end
