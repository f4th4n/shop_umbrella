defmodule ShopWeb.Game.DamageController do
  use ShopWeb, :controller

  alias Shop.Games
  alias Shop.Games.Damage

  action_fallback ShopWeb.FallbackController

  def index(conn, _params) do
    damages = Games.list_damages()
    render(conn, "index.json", damages: damages)
  end

  def create(conn, %{"damage" => damage_params}) do
    with {:ok, %Damage{} = damage} <- Games.create_damage(damage_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.damage_path(conn, :show, damage))
      |> render("show.json", damage: damage)
    end
  end

  def show(conn, %{"id" => id}) do
    damage = Games.get_damage!(id)
    render(conn, "show.json", damage: damage)
  end

  def update(conn, %{"id" => id, "damage" => damage_params}) do
    damage = Games.get_damage!(id)

    with {:ok, %Damage{} = damage} <- Games.update_damage(damage, damage_params) do
      render(conn, "show.json", damage: damage)
    end
  end

  def delete(conn, %{"id" => id}) do
    damage = Games.get_damage!(id)

    with {:ok, %Damage{}} <- Games.delete_damage(damage) do
      send_resp(conn, :no_content, "")
    end
  end
end
