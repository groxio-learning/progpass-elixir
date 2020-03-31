defmodule Point do
  def origin, do: {0, 0}
  def new(x, y) when is_integer(x) and is_integer(y) do 
    {x, y}
  end
  
  def right({x, y}), do: {x+1, y}
  def left({x, y}), do: {x-1, y}
  def up({x, y}), do: {x, y-1}
  def down({x, y}), do: {x, y+1}
end