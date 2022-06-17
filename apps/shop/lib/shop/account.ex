defmodule Shop.Account do
  import Ecto.Query, warn: false
  alias Shop.Repo

  def authenticate_user(email, password) do
    user = get_user_by_email_and_password(email, password)
    authenticate_user_ok(user)
  end

  defp authenticate_user_ok(nil), do: {:error, nil}
  defp authenticate_user_ok(user), do: {:ok, user}

  def get_user_by_email_and_password(email, password) do
    query =
      from u in Shop.Accounts.User,
        where: u.email == ^email and u.password == ^password

    Repo.one(query)
  end
end
