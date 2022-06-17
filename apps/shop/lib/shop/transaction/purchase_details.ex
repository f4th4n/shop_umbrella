defmodule Shop.Transaction.PurchaseDetails do
  use Ecto.Schema
  import Ecto.Changeset

  schema "purchase_details" do
    field :product_id, :id
    field :purchase_id, :id

    timestamps()
  end

  @doc false
  def changeset(purchase_details, attrs) do
    purchase_details
    |> cast(attrs, [])
    |> validate_required([])
  end
end
