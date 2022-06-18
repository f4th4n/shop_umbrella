defmodule ShopWeb.MiniGame.GameChannel do
  use Phoenix.Channel
  import ShopWeb.Gettext

  def join("game:" <> room, payload, socket) do
    Shop.Game.Supervisor.start_child(room)

    {:ok, socket}
  end

  def handle_in("game:start", payload, socket) do
    game_state = get_room(socket.topic) |> Shop.Game.GenServer.state()

    res = %{
      game_title: gettext("damage calculatorz"),
      game_state: game_state
    }

    {:reply, {:ok, res}, socket}
  end

  def handle_in("game:hit", payload, socket) do
    # payload available:
    #   payload["damage"]
    #   payload["user_id"]
    #   payload["game_code"]

    room = get_room(socket.topic)
    damage = payload["damage"]
    user_id = payload["user_id"]
    game_code = payload["game_code"]

    game_state = Shop.Game.GenServer.hit(room, damage, user_id, game_code)

    res = %{game_state: game_state}

    broadcast!(socket, "game:new_state", res)
    {:noreply, socket}
  end

  defp get_room("game:" <> room), do: room
end
