defmodule Analytic.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    topologies = [
      example: [
        strategy: Cluster.Strategy.Epmd,
        config: [hosts: [:"node2@10.40.96.4"]]
      ]
    ]

    children = [
      #      {Analytic.DamageProducer, 0},
      #      {Analytic.DamageProducerConsumer, []},
      #      %{
      #        id: 1,
      #        start: {Analytic.DamageConsumer, :start_link, [[]]}
      #      },
      #      %{
      #        id: 2,
      #        start: {Analytic.DamageConsumer, :start_link, [[]]}
      #      }
      # Todo.Metrics
      # {Cluster.Supervisor, [topologies, [name: Analytic.ClusterSupervisor]]}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_all, name: Analytic]
    Supervisor.start_link(children, opts)
  end
end
