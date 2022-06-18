defmodule Shop.Game.GenServer do
  use GenServer

  require Logger

  @registry :game_registry
  @initial_state 200

  def start_link(name) do
    GenServer.start_link(__MODULE__, name, name: via_tuple(name))
  end

  # --------------------------------------------------------------------------- api
  def state(process_name) do
    process_name |> via_tuple() |> GenServer.call(:state)
  end

  def reduce(process_name) do
    process_name |> via_tuple() |> GenServer.call(:reduce)
  end

  # --------------------------------------------------------------------------- events

  def child_spec(process_name) do
    %{
      id: __MODULE__,
      start: {__MODULE__, :start_link, [process_name]},
      restart: :transient
    }
  end

  def stop(process_name, stop_reason) do
    # Given the :transient option in the child spec, the GenServer will restart
    # if any reason other than `:normal` is given.
    process_name |> via_tuple() |> GenServer.stop(stop_reason)
  end

  @impl true
  def init(name) do
    Logger.info("Starting process #{name}")
    {:ok, @initial_state}
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

  ## private Functions
  defp via_tuple(name),
    do: {:via, Registry, {@registry, name}}
end
