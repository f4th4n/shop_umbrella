defmodule Shop.GamesTest do
  use Shop.DataCase

  alias Shop.Games

  describe "damages" do
    alias Shop.Games.Damage

    import Shop.GamesFixtures

    @invalid_attrs %{damage: nil, game_room: nil, user_id: nil}

    test "list_damages/0 returns all damages" do
      damage = damage_fixture()
      assert Games.list_damages() == [damage]
    end

    test "get_damage!/1 returns the damage with given id" do
      damage = damage_fixture()
      assert Games.get_damage!(damage.id) == damage
    end

    test "create_damage/1 with valid data creates a damage" do
      valid_attrs = %{damage: 42, game_room: "some game_room", user_id: 42}

      assert {:ok, %Damage{} = damage} = Games.create_damage(valid_attrs)
      assert damage.damage == 42
      assert damage.game_room == "some game_room"
      assert damage.user_id == 42
    end

    test "create_damage/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Games.create_damage(@invalid_attrs)
    end

    test "update_damage/2 with valid data updates the damage" do
      damage = damage_fixture()
      update_attrs = %{damage: 43, game_room: "some updated game_room", user_id: 43}

      assert {:ok, %Damage{} = damage} = Games.update_damage(damage, update_attrs)
      assert damage.damage == 43
      assert damage.game_room == "some updated game_room"
      assert damage.user_id == 43
    end

    test "update_damage/2 with invalid data returns error changeset" do
      damage = damage_fixture()
      assert {:error, %Ecto.Changeset{}} = Games.update_damage(damage, @invalid_attrs)
      assert damage == Games.get_damage!(damage.id)
    end

    test "delete_damage/1 deletes the damage" do
      damage = damage_fixture()
      assert {:ok, %Damage{}} = Games.delete_damage(damage)
      assert_raise Ecto.NoResultsError, fn -> Games.get_damage!(damage.id) end
    end

    test "change_damage/1 returns a damage changeset" do
      damage = damage_fixture()
      assert %Ecto.Changeset{} = Games.change_damage(damage)
    end
  end
end
