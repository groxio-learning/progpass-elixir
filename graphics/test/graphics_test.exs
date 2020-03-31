defmodule GraphicsTest do
  use ExUnit.Case
  doctest Graphics

  test "greets the world" do
    assert Graphics.hello() == :world
  end
end
