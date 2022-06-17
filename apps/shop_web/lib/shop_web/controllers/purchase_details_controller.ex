defmodule ShopWeb.PurchaseDetailsController do
  use ShopWeb, :controller

  alias Shop.Transaction
  alias Shop.Transaction.PurchaseDetails

  action_fallback ShopWeb.FallbackController

  def index(conn, _params) do
    purchase_details = Transaction.list_purchase_details()
    render(conn, "index.json", purchase_details: purchase_details)
  end

  def create(conn, %{"purchase_details" => purchase_details_params}) do
    with {:ok, %PurchaseDetails{} = purchase_details} <-
           Transaction.create_purchase_details(purchase_details_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.purchase_details_path(conn, :show, purchase_details))
      |> render("show.json", purchase_details: purchase_details)
    end
  end

  def show(conn, %{"id" => id}) do
    purchase_details = Transaction.get_purchase_details!(id)
    render(conn, "show.json", purchase_details: purchase_details)
  end

  def update(conn, %{"id" => id, "purchase_details" => purchase_details_params}) do
    purchase_details = Transaction.get_purchase_details!(id)

    with {:ok, %PurchaseDetails{} = purchase_details} <-
           Transaction.update_purchase_details(purchase_details, purchase_details_params) do
      render(conn, "show.json", purchase_details: purchase_details)
    end
  end

  def delete(conn, %{"id" => id}) do
    purchase_details = Transaction.get_purchase_details!(id)

    with {:ok, %PurchaseDetails{}} <- Transaction.delete_purchase_details(purchase_details) do
      send_resp(conn, :no_content, "")
    end
  end
end
