defmodule Shop.Transaction do
  @moduledoc """
  The Transaction context.
  """

  import Ecto.Query, warn: false
  alias Shop.Repo

  alias Shop.Transaction.Purchase

  @doc """
  Returns the list of purchases.

  ## Examples

      iex> list_purchases()
      [%Purchase{}, ...]

  """
  def list_purchases do
    Repo.all(Purchase)
  end

  @doc """
  Gets a single purchase.

  Raises `Ecto.NoResultsError` if the Purchase does not exist.

  ## Examples

      iex> get_purchase!(123)
      %Purchase{}

      iex> get_purchase!(456)
      ** (Ecto.NoResultsError)

  """
  def get_purchase!(id), do: Repo.get!(Purchase, id)

  @doc """
  Creates a purchase.

  ## Examples

      iex> create_purchase(%{field: value})
      {:ok, %Purchase{}}

      iex> create_purchase(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_purchase(attrs \\ %{}) do
    %Purchase{}
    |> Purchase.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a purchase.

  ## Examples

      iex> update_purchase(purchase, %{field: new_value})
      {:ok, %Purchase{}}

      iex> update_purchase(purchase, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_purchase(%Purchase{} = purchase, attrs) do
    purchase
    |> Purchase.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a purchase.

  ## Examples

      iex> delete_purchase(purchase)
      {:ok, %Purchase{}}

      iex> delete_purchase(purchase)
      {:error, %Ecto.Changeset{}}

  """
  def delete_purchase(%Purchase{} = purchase) do
    Repo.delete(purchase)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking purchase changes.

  ## Examples

      iex> change_purchase(purchase)
      %Ecto.Changeset{data: %Purchase{}}

  """
  def change_purchase(%Purchase{} = purchase, attrs \\ %{}) do
    Purchase.changeset(purchase, attrs)
  end

  alias Shop.Transaction.PurchaseDetails

  @doc """
  Returns the list of purchase_details.

  ## Examples

      iex> list_purchase_details()
      [%PurchaseDetails{}, ...]

  """
  def list_purchase_details do
    Repo.all(PurchaseDetails)
  end

  @doc """
  Gets a single purchase_details.

  Raises `Ecto.NoResultsError` if the Purchase details does not exist.

  ## Examples

      iex> get_purchase_details!(123)
      %PurchaseDetails{}

      iex> get_purchase_details!(456)
      ** (Ecto.NoResultsError)

  """
  def get_purchase_details!(id), do: Repo.get!(PurchaseDetails, id)

  @doc """
  Creates a purchase_details.

  ## Examples

      iex> create_purchase_details(%{field: value})
      {:ok, %PurchaseDetails{}}

      iex> create_purchase_details(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_purchase_details(attrs \\ %{}) do
    %PurchaseDetails{}
    |> PurchaseDetails.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a purchase_details.

  ## Examples

      iex> update_purchase_details(purchase_details, %{field: new_value})
      {:ok, %PurchaseDetails{}}

      iex> update_purchase_details(purchase_details, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_purchase_details(%PurchaseDetails{} = purchase_details, attrs) do
    purchase_details
    |> PurchaseDetails.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a purchase_details.

  ## Examples

      iex> delete_purchase_details(purchase_details)
      {:ok, %PurchaseDetails{}}

      iex> delete_purchase_details(purchase_details)
      {:error, %Ecto.Changeset{}}

  """
  def delete_purchase_details(%PurchaseDetails{} = purchase_details) do
    Repo.delete(purchase_details)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking purchase_details changes.

  ## Examples

      iex> change_purchase_details(purchase_details)
      %Ecto.Changeset{data: %PurchaseDetails{}}

  """
  def change_purchase_details(%PurchaseDetails{} = purchase_details, attrs \\ %{}) do
    PurchaseDetails.changeset(purchase_details, attrs)
  end
end
