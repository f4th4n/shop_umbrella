defmodule ShopWeb.ProductController do
  use ShopWeb, :controller

  alias Shop.Sales
  alias Shop.Sales.Product

  action_fallback ShopWeb.FallbackController

  def index(conn, _params) do
    products = Sales.list_products()
    render(conn, "index.json", products: products)
  end

  def create(conn, %{"product" => product_params}) do
    with {:ok, %Product{} = product} <- Sales.create_product(product_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.product_path(conn, :show, product))
      |> render("show.json", product: product)
    end
  end

  def create(conn, _), do: send_resp(conn, 500, "wrong params")

  def show(conn, %{"id" => id}) do
    product = Sales.get_product!(id)
    render(conn, "show.json", product: product)
  end

  def update(conn, %{"id" => id, "product" => product_params}) do
    product = Sales.get_product!(id)

    with {:ok, %Product{} = product} <- Sales.update_product(product, product_params) do
      render(conn, "show.json", product: product)
    end
  end

  def delete(conn, %{"id" => id}) do
    product = Sales.get_product!(id)

    with {:ok, %Product{}} <- Sales.delete_product(product) do
      send_resp(conn, :no_content, "")
    end
  end
end
