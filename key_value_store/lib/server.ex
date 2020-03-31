defmodule KeyValueStore.Server do
  alias KeyValueStore.Core
  
  def start do
    spawn(fn -> 
      run(Core.new())
    end)
  end
  
  def run(store) do
    store 
    |> listen
    |> run
  end
  
  def listen(store) do
    receive do
      {:put, key, value} -> 
        Core.add_or_update(store, key, value)
      {:delete, key} -> 
        Core.delete(store, key)
      {:get, pid, key} -> 
        value = Core.retrieve(store, key)
        send(pid, {:value, value})
        store
      {:state, pid} -> 
        send(pid, {:store, store})
        store
    end
  end
end