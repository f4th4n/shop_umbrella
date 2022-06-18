defmodule Shop.Games do
  @moduledoc """
  The Games context.
  """

  import Ecto.Query, warn: false
  alias Shop.Repo

  alias Shop.Games.Damage

  @doc """
  Returns the list of damages.

  ## Examples

      iex> list_damages()
      [%Damage{}, ...]

  """
  def list_damages do
    Repo.all(Damage)
  end

  @doc """
  Gets a single damage.

  Raises `Ecto.NoResultsError` if the Damage does not exist.

  ## Examples

      iex> get_damage!(123)
      %Damage{}

      iex> get_damage!(456)
      ** (Ecto.NoResultsError)

  """
  def get_damage!(id), do: Repo.get!(Damage, id)

  @doc """
  Creates a damage.

  ## Examples

      iex> create_damage(%{field: value})
      {:ok, %Damage{}}

      iex> create_damage(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_damage(attrs \\ %{}) do
    %Damage{}
    |> Damage.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a damage.

  ## Examples

      iex> update_damage(damage, %{field: new_value})
      {:ok, %Damage{}}

      iex> update_damage(damage, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_damage(%Damage{} = damage, attrs) do
    damage
    |> Damage.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a damage.

  ## Examples

      iex> delete_damage(damage)
      {:ok, %Damage{}}

      iex> delete_damage(damage)
      {:error, %Ecto.Changeset{}}

  """
  def delete_damage(%Damage{} = damage) do
    Repo.delete(damage)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking damage changes.

  ## Examples

      iex> change_damage(damage)
      %Ecto.Changeset{data: %Damage{}}

  """
  def change_damage(%Damage{} = damage, attrs \\ %{}) do
    Damage.changeset(damage, attrs)
  end

  def sum_damage() do
    query = from p in Shop.Games.Damage, select: sum(p.damage)
    Shop.Repo.one(query)
  end
end
