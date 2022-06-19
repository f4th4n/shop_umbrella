defmodule Shop.Repo.Migrations.CreateOptions do
  use Ecto.Migration

  def change do
    create table(:options) do
      add :key, :string
      add :value, :text

      timestamps()
    end
  end
end
