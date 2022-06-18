defmodule ShopWeb.MiniGame.GameChannel do
  use Phoenix.Channel
  import ShopWeb.Gettext

  def join(_topic, _payload, socket) do
    {:ok, socket}
  end

  def handle_in("send_start_game", _payload, socket) do
    {:reply, {:ok, %{mini_game: gettext("game_started")}}, socket}
  end
end
