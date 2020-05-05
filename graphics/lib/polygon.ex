defmodule Polygon do
  def rectangle({x, y}, height, width) do
    [{x, y}, {x+width, y}, {x+width, y+height}, {x, y+height}]
  end

  def square(point, length) do
    rectangle(point, length, length)
  end
  
  def mirror(polygon, w), do: Enum.map(polygon, &Point.mirror(&1, w))
  def flip(polygon, h), do: Enum.map(polygon, &Point.flip(&1, h))
  def transpose(polygon), do: Enum.map(polygon, &Point.transpose/1)

  def rotate(polygon, degrees, w, h) do
    Enum.map(polygon, &Point.rotate(&1, degrees, w, h))
  end

  def move(polygon, vector) do
    Enum.map(
      polygon, 
      fn point -> 
        Point.move(point, vector) 
      end
    )
  end

end