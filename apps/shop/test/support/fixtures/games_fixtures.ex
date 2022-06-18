defmodule Shop.GamesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Shop.Games` context.
  """

  @doc """
  Generate a damage.
  """
  def damage_fixture(attrs \\ %{}) do
    {:ok, damage} =
      attrs
      |> Enum.into(%{
        damage: 42,
        game_room: "some game_room",
        user_id: 42
      })
      |> Shop.Games.create_damage()

    damage
  end
end
