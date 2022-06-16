defmodule ShopWeb.ShopSocket do
  use Phoenix.Socket

  transport(:websocket, Phoenix.Transports.WebSocket,
    timeout: 3_000_000,
    transport_log: :debug
  )

  channel "ping", ShopWeb.PingChannel
  channel "flash_sale", ShopWeb.FlashSaleChannel

  @impl true
  def connect(params, socket, _connect_info) do
    {:ok, socket}
  end

  @impl true
  def id(_socket), do: nil
end
