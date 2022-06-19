defmodule Analytic.Helper do
  import Ecto.Query, warn: false
  alias Shop.Repo

  def get_last_damage_analytic_row() do
  	row = Shop.Repo.one(from p in Shop.Option, where: p.key == "damage_analytic")
  	last_damage(row)
  end

  defp last_damage(nil), do: 0
  defp last_damage(val) do
  	{int, _} = Integer.parse(val.value)
  	int
  end
end