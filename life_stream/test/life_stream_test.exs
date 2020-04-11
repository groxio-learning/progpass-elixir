defmodule LifeStreamTest do
  use ExUnit.Case
  doctest LifeStream

  test "greets the world" do
    assert LifeStream.hello() == :world
  end
end
