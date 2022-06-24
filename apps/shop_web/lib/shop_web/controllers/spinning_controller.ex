defmodule ShopWeb.SpinningController do
  use ShopWeb, :controller

  def index(conn, %{"num" => num_str}) do
    start = :os.system_time(:millisecond)
    {num, ""} = Integer.parse(num_str)

    # ["alpha", "beta", "gama"]
    items = 1..num

    Enum.map(items, fn item ->
      Task.async(fn ->
        IO.inspect("Hello #{fib(num)}")
        :ok
      end)
    end)
    |> Enum.map(&Task.await(&1, :infinity))
    |> renderz(conn, start)
  end

  def renderz(res, conn, start) do
    end_time = :os.system_time(:millisecond)
    time = (end_time - start) / 1000
    Shop.JsonView.pretty_json(conn, %{res: time})
  end

  def fib(0) do
    0
  end

  def fib(1) do
    1
  end

  def fib(n) do
    fib(n - 1) + fib(n - 2)
  end
end
