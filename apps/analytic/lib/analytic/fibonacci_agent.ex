defmodule FibonacciAgent do
  def start_link() do
    Agent.start_link(fn -> 0 end, name: __MODULE__)
  end

  def f_start(finish) do
    Enum.map(1..finish, fn item ->
      Agent.get_and_update(__MODULE__, fn
        state -> {state, state + 1}
      end)
    end)
  end
end
