defmodule ShopWeb.PurchaseView do
  use ShopWeb, :view
  alias ShopWeb.PurchaseView

  def render("index.json", %{purchases: purchases}) do
    %{data: render_many(purchases, PurchaseView, "purchase.json")}
  end

  def render("show.json", %{purchase: purchase}) do
    %{data: render_one(purchase, PurchaseView, "purchase.json")}
  end

  def render("purchase.json", %{purchase: purchase}) do
    %{
      id: purchase.id
    }
  end
end
