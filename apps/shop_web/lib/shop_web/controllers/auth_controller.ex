defmodule ShopWeb.AuthController do
  use ShopWeb, :controller

  def new(conn, %{"email" => email, "password" => password}) do
    with {:ok, user} <- Shop.Account.authenticate_user(email, password),
         token <- ShopWeb.Auth.Token.sign(%{user_id: user.id}) do
      Shop.Json.pretty_json(conn, %{user: user, token: token})
    else
      _ ->
        Shop.Json.pretty_json(conn, %{ error: gettext("email or password is in correct")})
    end
  end
end
