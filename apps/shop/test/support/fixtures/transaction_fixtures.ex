defmodule Shop.TransactionFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Shop.Transaction` context.
  """

  @doc """
  Generate a purchase.
  """
  def purchase_fixture(attrs \\ %{}) do
    {:ok, purchase} =
      attrs
      |> Enum.into(%{

      })
      |> Shop.Transaction.create_purchase()

    purchase
  end
end
