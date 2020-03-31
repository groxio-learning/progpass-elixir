defmodule KeyValueStoreTest do
  use ExUnit.Case
  doctest KeyValueStore

  test "greets the world" do
    assert KeyValueStore.hello() == :world
  end
end
