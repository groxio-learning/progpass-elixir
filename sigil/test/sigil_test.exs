defmodule SigilTest do
  use ExUnit.Case
  doctest Sigil

  test "greets the world" do
    assert Sigil.hello() == :world
  end
end
