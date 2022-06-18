defmodule Shop.Repo.Migrations.CreateDamages do
  use Ecto.Migration

  def change do
    create table(:damages) do
      add :user_id, :integer
      add :damage, :integer
      add :game_room, :string

      timestamps()
    end
  end
end
