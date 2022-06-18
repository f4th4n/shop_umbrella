defmodule ShopWeb.MiniGameSocket do
  use Phoenix.Socket

  transport(:websocket, Phoenix.Transports.WebSocket,
    timeout: 3_000_000,
    transport_log: :debug
  )

  channel "game", ShopWeb.MiniGame.GameChannel

  @impl true
  def connect(params, socket, _connect_info) do
    {:ok, socket}
  end

  @impl true
  def id(_socket), do: nil
end
