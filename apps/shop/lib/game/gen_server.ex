defmodule Shop.Game.GenServer do
  use GenServer

  def start_link(_) do
    GenServer.start_link(__MODULE__, 200, name: __MODULE__)
  end

  @impl true
  def init(stack) do
    {:ok, stack}
  end

  @impl true
  def handle_call(:reduce, _from, state) do
    state = state - 1
    {:reply, state, state}
  end

  @impl true
  def handle_call(:state, _from, state) do
    {:reply, state, state}
  end

  # --------------------------------------------------------------------------- api
  def state() do
    GenServer.call(__MODULE__, :state)
  end

  def reduce() do
    GenServer.call(__MODULE__, :reduce)
  end
end
