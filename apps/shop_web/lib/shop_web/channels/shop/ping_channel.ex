defmodule ShopWeb.PingChannel do
  use Phoenix.Channel
  import ShopWeb.Gettext

  def join(_topic, _payload, socket) do
    {:ok, socket}
  end

  def handle_in("send_ping", _payload, socket) do
    {:reply, {:ok, %{ping: gettext("pong")}}, socket}
  end
end
