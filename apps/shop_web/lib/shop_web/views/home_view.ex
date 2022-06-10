defmodule ShopWeb.HomeView do
  use ShopWeb, :view

  def render("index.json", %{}) do
    %{data: %{success: true}}
  end
end
