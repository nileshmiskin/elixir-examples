# Use the Plot struct as it is provided
defmodule Plot do
  @enforce_keys [:plot_id, :registered_to]
  defstruct [:plot_id, :registered_to]
end

defmodule CommunityGarden do
  def start() do
    Agent.start(fn -> %{count: 0, plots: []} end)
  end

  def list_registrations(pid) do
    Agent.get(pid, & &1.plots)
  end

  def register(pid, register_to) do
    Agent.get_and_update(pid, fn %{count: count, plots: plots} = state ->
      count = count + 1
      plot = %Plot{plot_id: count, registered_to: register_to}
      {plot, %{state | count: count, plots: [plot | plots]}}
    end)
  end

  def release(pid, plot_id) do
    Agent.cast(pid, fn %{plots: plots} = state ->
      plots = Enum.filter(plots, fn %{plot_id: p} -> p !== plot_id end)
      %{state | plots: plots}
    end)
  end

  def get_registration(pid, plot_id) do
    Agent.get(pid, fn state ->
      Enum.find(
        state.plots,
        {:not_found, "plot is unregistered"},
        fn plot -> plot.plot_id == plot_id end
      )
    end)
  end
end
