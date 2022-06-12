defmodule Analytic.Worker do
  use GenServer

  def start_link(state) do
    GenServer.start_link(__MODULE__, state, name: __MODULE__)
  end

  ## Callbacks

  @impl true
  def init(stack) do
    {:ok, stack}
  end

  @impl true
  def handle_call(:current_state, _from, state) do
    {:reply, state, state}
  end

  @impl true
  def handle_call(:reset, _from, state) do
    {:reply, 0, 0}
  end

  @impl true
  def handle_call({:add, how_much}, _from, state) do
    new_state = state + how_much
    {:reply, new_state, new_state}
  end

  @impl true
  def handle_cast({:add_then_ignore, how_much}, state) do
    new_state = state + how_much
    {:noreply, new_state, new_state}
  end
end