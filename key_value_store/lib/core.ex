defmodule KeyValueStore.Core do
  def new, do: %{}
  def add_or_update(store, key, value), do: Map.put(store, key, value)
  def delete(store, key), do: Map.delete(store, key)
  def retrieve(store, key), do: Map.get(store, key)
end
