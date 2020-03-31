defmodule KeyValueStore do
  alias KeyValueStore.Server
  
  def start() do
    Server.start()
  end
  
  def put(server, key, value) do
    send(server, {:put, key, value})
    :ok
  end
  
  def delete(server, key) do
    send(server, {:delete, key})
    :ok
  end
  
  def get(server, key) do
    send server, {:get, self(), key}
    receive do
      {:value, value} -> value
    end
  end
  
  def state(server) do
    send server, {:state, self()}
    receive do
      {:store, store} -> store
    end
  end  
end
