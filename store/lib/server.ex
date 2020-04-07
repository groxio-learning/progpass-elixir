defmodule Store.Server do
  def start(initial_map) do
    spawn fn -> run(initial_map) end
  end
  
  def run(map) do
    map
    |> listen
    |> IO.inspect
    |> run
  end
  
  def listen(map) do
    receive do
      {:put, key, value} -> 
        Map.put(map, key, value)
      {:get, pid, key} -> 
        value = Map.get(map, key)
        send pid, value
        map
    end
  end
end