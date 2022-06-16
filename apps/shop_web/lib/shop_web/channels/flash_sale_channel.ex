defmodule ShopWeb.FlashSaleChannel do
  use Phoenix.Channel
  import ShopWeb.Gettext

  def join(_topic, _payload, socket) do
    {:ok, socket}
  end

  def handle_in("send_flash_sale", _payload, socket) do
    {:reply, {:ok, %{flash_sale: gettext("pong")}}, socket}
  end
end
