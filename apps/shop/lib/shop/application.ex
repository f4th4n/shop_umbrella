defmodule Shop.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @registry :game_registry

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Shop.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Shop.PubSub},
      # Start a worker by calling: Shop.Worker.start_link(arg)
      # {Shop.Worker, arg}
      {Shop.Game.Supervisor, []},
      {Registry, [keys: :unique, name: @registry]}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: Shop.Supervisor)
  end
end
