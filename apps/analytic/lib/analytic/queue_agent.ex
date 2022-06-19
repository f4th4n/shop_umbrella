defmodule Queue do
  def start_link(state \\ []) do
    Agent.start_link(fn -> state end, name: __MODULE__)
  end

  def enqueue(item) do
    Agent.update(__MODULE__, fn(state) -> state ++ [item] end)
  end

  def dequeue() do
    Agent.get_and_update(__MODULE__, fn([item | state]) -> {item, state} end)
  end

  def queue() do
    Agent.get(__MODULE__, & &1)
  end
end