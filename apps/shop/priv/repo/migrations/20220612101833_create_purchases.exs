defmodule Shop.Repo.Migrations.CreatePurchases do
  use Ecto.Migration

  def change do
    create table(:purchases) do
      add :product_id, references(:products, on_delete: :nothing)
      add :purchase_id, references(:purchases, on_delete: :nothing)

      timestamps()
    end

    create index(:purchases, [:product_id])
    create index(:purchases, [:purchase_id])
  end
end
