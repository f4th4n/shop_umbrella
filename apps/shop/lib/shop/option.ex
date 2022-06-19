defmodule Shop.Option do
  use Ecto.Schema
  import Ecto.Changeset

  schema "options" do
    field :key, :string
    field :value, :string

    timestamps()
  end

  @doc false
  def changeset(option, attrs) do
    option
    |> cast(attrs, [:key, :value])
    |> validate_required([:key, :value])
  end
end
