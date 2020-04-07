defmodule Store do
  def start(initial_state) do
    Store.Server.start(initial_state)
  end
  
  def get(server, key) do
    send server, {:get, self(), key}
    receive do 
      m -> m 
    end
  end
  
  def put(server, key, value) do
    send server, {:put, key, value}
    :ok
  end
end
