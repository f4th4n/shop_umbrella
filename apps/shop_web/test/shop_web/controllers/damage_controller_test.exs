defmodule ShopWeb.DamageControllerTest do
  use ShopWeb.ConnCase

  import Shop.GamesFixtures

  alias Shop.Games.Damage

  @create_attrs %{
    damage: 42,
    game_room: "some game_room",
    user_id: 42
  }
  @update_attrs %{
    damage: 43,
    game_room: "some updated game_room",
    user_id: 43
  }
  @invalid_attrs %{damage: nil, game_room: nil, user_id: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all damages", %{conn: conn} do
      conn = get(conn, Routes.damage_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create damage" do
    test "renders damage when data is valid", %{conn: conn} do
      conn = post(conn, Routes.damage_path(conn, :create), damage: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.damage_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "damage" => 42,
               "game_room" => "some game_room",
               "user_id" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.damage_path(conn, :create), damage: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update damage" do
    setup [:create_damage]

    test "renders damage when data is valid", %{conn: conn, damage: %Damage{id: id} = damage} do
      conn = put(conn, Routes.damage_path(conn, :update, damage), damage: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.damage_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "damage" => 43,
               "game_room" => "some updated game_room",
               "user_id" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, damage: damage} do
      conn = put(conn, Routes.damage_path(conn, :update, damage), damage: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete damage" do
    setup [:create_damage]

    test "deletes chosen damage", %{conn: conn, damage: damage} do
      conn = delete(conn, Routes.damage_path(conn, :delete, damage))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.damage_path(conn, :show, damage))
      end
    end
  end

  defp create_damage(_) do
    damage = damage_fixture()
    %{damage: damage}
  end
end
