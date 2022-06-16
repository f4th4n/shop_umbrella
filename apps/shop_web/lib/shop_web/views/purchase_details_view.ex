defmodule ShopWeb.PurchaseDetailsView do
  use ShopWeb, :view
  alias ShopWeb.PurchaseDetailsView

  def render("index.json", %{purchase_details: purchase_details}) do
    %{data: render_many(purchase_details, PurchaseDetailsView, "purchase_details.json")}
  end

  def render("show.json", %{purchase_details: purchase_details}) do
    %{data: render_one(purchase_details, PurchaseDetailsView, "purchase_details.json")}
  end

  def render("purchase_details.json", %{purchase_details: purchase_details}) do
    %{
      id: purchase_details.id
    }
  end
end
