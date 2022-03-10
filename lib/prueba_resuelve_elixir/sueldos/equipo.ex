defmodule PruebaResuelveElixir.Sueldos.Equipo do
  use Ecto.Schema
  import Ecto.Changeset

  schema "equipos" do
    field :nombre, :string
    has_many :niveles, PruebaResuelveElixir.Sueldos.Nivel

    timestamps()
  end

  @doc false
  def changeset(equipo, attrs) do
    equipo
    |> cast(attrs, [:nombre])
    |> validate_required([:nombre])
  end
end
