defmodule Shop.SalesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Shop.Sales` context.
  """

  @doc """
  Generate a product.
  """
  def product_fixture(attrs \\ %{}) do
    {:ok, product} =
      attrs
      |> Enum.into(%{
        category: "some category",
        description: "some description",
        name: "some name",
        price: 120.5
      })
      |> Shop.Sales.create_product()

    product
  end
end
