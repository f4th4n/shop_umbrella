defmodule Analytic.DamageConsumer do
  use GenStage

  def start_link(_initial) do
    GenStage.start_link(__MODULE__, :state_doesnt_matter)
  end

  def init(state) do
    {:consumer, state, subscribe_to: [Analytic.DamageProducerConsumer]}
  end

  def handle_events(events, _from, state) do
    for event <- events do
      :timer.sleep(60 * 1000)
      IO.inspect({self(), event, state})
    end

    # As a consumer we never emit events
    {:noreply, [], state}
  end
end
