defmodule ShopWeb.HomeController do
  use ShopWeb, :controller

  action_fallback ShopWeb.FallbackController

  def index(conn, _params) do
    users = []
    render(conn, "index.json")
  end
end
