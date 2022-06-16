defmodule ShopWeb.PurchaseController do
  use ShopWeb, :controller

  alias Shop.Transaction
  alias Shop.Transaction.Purchase

  action_fallback ShopWeb.FallbackController

  def index(conn, _params) do
    purchases = Transaction.list_purchases()
    render(conn, "index.json", purchases: purchases)
  end

  def create(conn, %{"purchase" => purchase_params, "product_ids" => product_ids}) do
    IO.puts("product_idsproduct_idsproduct_idsproduct_ids")
    IO.inspect(product_ids)

    with {:ok, %Purchase{} = purchase} <- Transaction.create_purchase(purchase_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.purchase_path(conn, :show, purchase))
      |> render("show.json", purchase: purchase)
    end
  end

  def show(conn, %{"id" => id}) do
    purchase = Transaction.get_purchase!(id)
    render(conn, "show.json", purchase: purchase)
  end

  def update(conn, %{"id" => id, "purchase" => purchase_params}) do
    purchase = Transaction.get_purchase!(id)

    with {:ok, %Purchase{} = purchase} <- Transaction.update_purchase(purchase, purchase_params) do
      render(conn, "show.json", purchase: purchase)
    end
  end

  def delete(conn, %{"id" => id}) do
    purchase = Transaction.get_purchase!(id)

    with {:ok, %Purchase{}} <- Transaction.delete_purchase(purchase) do
      send_resp(conn, :no_content, "")
    end
  end
end
