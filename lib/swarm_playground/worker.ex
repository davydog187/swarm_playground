defmodule SwarmPlayground.Worker do
  use GenServer

  @moduledoc """
  Swarm Worker process. It keeps busy by printing its sent name X number of times.
  """

  def start_link(options) do
    name = Keyword.fetch!(options, :name)
    count = Keyword.fetch!(options, :count)
    delay = Keyword.get(options, :delay, 1000)

    GenServer.start_link(__MODULE__, {name, count, delay}, name: name)
  end

  def init({name, count, delay}) do

    send_print(delay)

    {:ok, {name, count, delay}}
  end

  def handle_info(:print, {name, count, delay}) do
    if count >= 1 do
      send_print(delay)

      IO.puts "#{name} #{count}"
    end

    {:noreply, {name, count - 1, delay}}
  end

  defp send_print(delay), do: Process.send_after(self(), :print, delay)
end
