defmodule SwarmPlayground do
  @moduledoc """
  SwarmPlayground demonstrates how swarm works, and what happens when you do and do not
  supervise workers via swarm.

  Note that each worker can be thought of as a DCSP in MCA terminology.
  """

  alias SwarmPlayground.Worker

  @doc """
  Starts a worker via Swarm that will be globally unique in the cluster.
  """
  def start(name, count) do
    Swarm.whereis_or_register_name(name, Worker, :start_link, [[name: name, count: count]])
  end

  @doc """
  Starts a worker via Swarm that will be globally unique in the cluster.

  This will supervise the worker under the SwarmPlayground.Worker.Supervisor
  """
  def supervised(name, count) do
    Swarm.whereis_or_register_name(name, Worker.Supervisor, :start_worker, [name, count])
  end
end
