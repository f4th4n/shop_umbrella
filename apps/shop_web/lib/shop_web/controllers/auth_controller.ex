defmodule ShopWeb.AuthController do
  use ShopWeb, :controller

  alias Shop.Account
  alias ShopWeb.Auth.Token
  alias Shop.JsonView

  def new(conn, %{"email" => email, "password" => password}) do
    with {:ok, user} <- Account.authenticate_user(email, password),
         token <- Token.sign(%{user_id: user.id}) do
      JsonView.pretty_json(conn, %{token: token, user: user})
    else
      _ ->
        JsonView.pretty_json(conn, %{error: gettext("email or password is in correct")})
    end
  end
end
