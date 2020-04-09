defmodule Point do
  
  defmacro __using__(_opts) do
    quote do
      import Point, only: [sigil_p: 2]
    end
  end
      
  defstruct x: 0, y: 0
  
  def new(), do: __struct__()
  def new(x, y) when is_integer(x) and is_integer(y) do
    __struct__(x: x, y: y)
  end
  
  def sigil_p(string, []) do
    [x, y] = 
      string
      |> String.split(splitter())
      |> Enum.map(&String.to_integer/1)
      
    new(x, y)
  end
  
  defp splitter(), do: ~r/( )*,( )*/
end

defimpl Inspect, for: Point do
  import Inspect.Algebra

  def inspect(point, _opts) do
    concat([
      "{", 
      to_string(point.x), 
      ", ", 
      to_string(point.y), 
      "}"
    ])
  end
end
