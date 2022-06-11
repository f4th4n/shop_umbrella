defmodule Shop.SalesTest do
  use Shop.DataCase

  alias Shop.Sales

  describe "products" do
    alias Shop.Sales.Product

    import Shop.SalesFixtures

    @invalid_attrs %{category: nil, description: nil, name: nil, price: nil}

    test "list_products/0 returns all products" do
      product = product_fixture()
      assert Sales.list_products() == [product]
    end

    test "get_product!/1 returns the product with given id" do
      product = product_fixture()
      assert Sales.get_product!(product.id) == product
    end

    test "create_product/1 with valid data creates a product" do
      valid_attrs = %{category: "some category", description: "some description", name: "some name", price: 120.5}

      assert {:ok, %Product{} = product} = Sales.create_product(valid_attrs)
      assert product.category == "some category"
      assert product.description == "some description"
      assert product.name == "some name"
      assert product.price == 120.5
    end

    test "create_product/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sales.create_product(@invalid_attrs)
    end

    test "update_product/2 with valid data updates the product" do
      product = product_fixture()
      update_attrs = %{category: "some updated category", description: "some updated description", name: "some updated name", price: 456.7}

      assert {:ok, %Product{} = product} = Sales.update_product(product, update_attrs)
      assert product.category == "some updated category"
      assert product.description == "some updated description"
      assert product.name == "some updated name"
      assert product.price == 456.7
    end

    test "update_product/2 with invalid data returns error changeset" do
      product = product_fixture()
      assert {:error, %Ecto.Changeset{}} = Sales.update_product(product, @invalid_attrs)
      assert product == Sales.get_product!(product.id)
    end

    test "delete_product/1 deletes the product" do
      product = product_fixture()
      assert {:ok, %Product{}} = Sales.delete_product(product)
      assert_raise Ecto.NoResultsError, fn -> Sales.get_product!(product.id) end
    end

    test "change_product/1 returns a product changeset" do
      product = product_fixture()
      assert %Ecto.Changeset{} = Sales.change_product(product)
    end
  end
end
