defmodule Shop.Games.Damage do
  use Ecto.Schema
  import Ecto.Changeset

  schema "damages" do
    field :damage, :integer
    field :game_room, :string
    field :user_id, :integer

    timestamps()
  end

  @doc false
  def changeset(damage, attrs) do
    damage
    |> cast(attrs, [:user_id, :damage, :game_room])
    |> validate_required([:user_id, :damage, :game_room])
  end
end
