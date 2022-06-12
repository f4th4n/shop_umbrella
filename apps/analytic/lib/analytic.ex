defmodule Analytic do
  @moduledoc """
  Documentation for `Analytic`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Analytic.hello()
      :world

  """
  def hello do
    {:world, Shop.Sales.list_products()}
  end
end
