defmodule ChangingNumber do
  def init([]) do
    # send(self(), :change)
    # Our state this time is just a number, not a map like previous example
    {:ok, 0}
  end

  # handle_info is different than handle_call
  # No one is waiting for a response to this message, so we set the
  # new state and move on without replying.
  def handle_info(:change, _previous_number) do
    # Every 100ms, we will receive another change message
    Process.send_after(self(), :change, 100)
    next_number = :rand.uniform(9999)
    {:noreply, next_number}
  end

  def handle_call(:get, _from, number) do
    {:reply, number, number}
  end

  def handle_call({:set, new_num}, _from, state) do
    {:reply, "yay", new_num}
  end

  def test() do
    IO.puts("yay")
  end
end
