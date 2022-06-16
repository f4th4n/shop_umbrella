defmodule Shop.Repo.Migrations.CreatePurchaseDetails do
  use Ecto.Migration

  def change do
    create table(:purchase_details) do
      add :product_id, references(:products, on_delete: :nothing)
      add :purchase_id, references(:purchases, on_delete: :nothing)

      timestamps()
    end

    create index(:purchase_details, [:product_id])
    create index(:purchase_details, [:purchase_id])
  end
end
