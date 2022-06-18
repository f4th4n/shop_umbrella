defmodule ShopWeb.MiniGame.GameChannel do
  use Phoenix.Channel
  import ShopWeb.Gettext

  def join("game:" <> room, payload, socket) do
    {:ok, socket}
  end

  def handle_in("game:start", payload, socket) do
    res = %{
      game_title: gettext("reduce calculatorz"),
      game_state: Shop.Game.GenServer.state()
    }

    {:reply, {:ok, res}, socket}
  end

  def handle_in("game:hit", payload, socket) do
    res = %{
      game_state: Shop.Game.GenServer.reduce()
    }

    broadcast!(socket, "game:new_state", res)
    {:noreply, socket}
  end
end
