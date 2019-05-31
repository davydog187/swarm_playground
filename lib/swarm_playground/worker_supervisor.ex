defmodule SwarmPlayground.Worker.Supervisor do
  use DynamicSupervisor

  @moduledoc """
  A DynamicSupervisor that supervises worker processes
  """
  def start_link(_) do
    DynamicSupervisor.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  def init(_) do
    DynamicSupervisor.init(strategy: :one_for_one)
  end

  def start_worker(name, count) do
    alias SwarmPlayground.Worker

    DynamicSupervisor.start_child(__MODULE__, {Worker, name: name, count: count})
  end

end
