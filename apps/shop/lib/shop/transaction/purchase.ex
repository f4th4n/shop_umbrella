defmodule Shop.Transaction.Purchase do
  use Ecto.Schema
  import Ecto.Changeset

  schema "purchases" do
    field :product_id, :id
    field :purchase_id, :id

    timestamps()
  end

  @doc false
  def changeset(purchase, attrs) do
    purchase
    |> cast(attrs, [])
    |> validate_required([:product_id, :purchase_id])
  end
end
