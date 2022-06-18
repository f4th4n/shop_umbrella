defmodule ShopWeb.Game.DamageView do
  use ShopWeb, :view
  alias ShopWeb.Game.DamageView

  def render("index.json", %{damages: damages}) do
    %{data: render_many(damages, DamageView, "damage.json")}
  end

  def render("show.json", %{damage: damage}) do
    %{data: render_one(damage, DamageView, "damage.json")}
  end

  def render("damage.json", %{damage: damage}) do
    %{
      id: damage.id,
      user_id: damage.user_id,
      damage: damage.damage,
      game_room: damage.game_room
    }
  end
end
