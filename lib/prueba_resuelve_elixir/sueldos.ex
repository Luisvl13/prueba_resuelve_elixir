defmodule PruebaResuelveElixir.Sueldos do
  @moduledoc """
  The Sueldos context.
  """

  import Ecto.Query, warn: false
  alias PruebaResuelveElixir.Repo

  alias PruebaResuelveElixir.Sueldos.Equipo

  @doc """
  Returns the list of equipos.

  ## Examples

      iex> list_equipos()
      [%Equipo{}, ...]

  """
  def list_equipos do
    Repo.all(Equipo)
  end

  @doc """
  Gets a single equipo.

  Raises `Ecto.NoResultsError` if the Equipo does not exist.

  ## Examples

      iex> get_equipo!(123)
      %Equipo{}

      iex> get_equipo!(456)
      ** (Ecto.NoResultsError)

  """
  def get_equipo!(id), do: Repo.get!(Equipo, id)

  @doc """
  Creates a equipo.

  ## Examples

      iex> create_equipo(%{field: value})
      {:ok, %Equipo{}}

      iex> create_equipo(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_equipo(attrs \\ %{}) do
    %Equipo{}
    |> Equipo.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a equipo.

  ## Examples

      iex> update_equipo(equipo, %{field: new_value})
      {:ok, %Equipo{}}

      iex> update_equipo(equipo, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_equipo(%Equipo{} = equipo, attrs) do
    equipo
    |> Equipo.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a equipo.

  ## Examples

      iex> delete_equipo(equipo)
      {:ok, %Equipo{}}

      iex> delete_equipo(equipo)
      {:error, %Ecto.Changeset{}}

  """
  def delete_equipo(%Equipo{} = equipo) do
    Repo.delete(equipo)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking equipo changes.

  ## Examples

      iex> change_equipo(equipo)
      %Ecto.Changeset{data: %Equipo{}}

  """
  def change_equipo(%Equipo{} = equipo, attrs \\ %{}) do
    Equipo.changeset(equipo, attrs)
  end

  alias PruebaResuelveElixir.Sueldos.Nivel

  @doc """
  Returns the list of niveles.

  ## Examples

      iex> list_niveles()
      [%Nivel{}, ...]

  """
  def list_niveles do
    Repo.all(Nivel)
  end

  @doc """
  Gets a single nivel.

  Raises `Ecto.NoResultsError` if the Nivel does not exist.

  ## Examples

      iex> get_nivel!(123)
      %Nivel{}

      iex> get_nivel!(456)
      ** (Ecto.NoResultsError)

  """
  def get_nivel!(id), do: Repo.get!(Nivel, id)

  @doc """
  Creates a nivel.

  ## Examples

      iex> create_nivel(%{field: value})
      {:ok, %Nivel{}}

      iex> create_nivel(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_nivel(attrs \\ %{}) do
    %Nivel{}
    |> Nivel.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a nivel.

  ## Examples

      iex> update_nivel(nivel, %{field: new_value})
      {:ok, %Nivel{}}

      iex> update_nivel(nivel, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_nivel(%Nivel{} = nivel, attrs) do
    nivel
    |> Nivel.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a nivel.

  ## Examples

      iex> delete_nivel(nivel)
      {:ok, %Nivel{}}

      iex> delete_nivel(nivel)
      {:error, %Ecto.Changeset{}}

  """
  def delete_nivel(%Nivel{} = nivel) do
    Repo.delete(nivel)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking nivel changes.

  ## Examples

      iex> change_nivel(nivel)
      %Ecto.Changeset{data: %Nivel{}}

  """
  def change_nivel(%Nivel{} = nivel, attrs \\ %{}) do
    Nivel.changeset(nivel, attrs)
  end
end
