defmodule SwarmPlaygroundTest do
  use ExUnit.Case
  doctest SwarmPlayground

  test "greets the world" do
    assert SwarmPlayground.hello() == :world
  end
end
