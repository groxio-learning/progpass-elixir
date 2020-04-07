defmodule CapitalizeTest do
  use ExUnit.Case
  doctest Capitalize

  test "greets the world" do
    assert Capitalize.hello() == :world
  end
end
