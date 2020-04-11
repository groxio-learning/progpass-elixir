defmodule LifeStream.Board do
  alias LifeStream.Rules
  
  defstruct(
    grid: %{}, 
    width: 3, 
    height: 3
  )
  
  def repeater() do
    %__MODULE__{
      height: 3, 
      width: 3, 
      grid: %{
        {2, 1} => :live, 
        {2, 2} => :live, 
        {2, 3} => :live
      }
    }
  end
  
  def random(width, height) do
    grid = 
      for x <- 1..width, y <- 1..height, into: %{} do
        {{x, y}, Enum.random([:live, :dead])}
      end
      
    %__MODULE__{
      height: height, 
      width: width, 
      grid: grid
    }
  end
    
  def get(board, {x, y}), do: Map.get(board.grid, {x, y}, :dead)
  
  def as_string(board) do
    for y <- 1..board.height do
      for x <- 1..board.width do
        board
        |> get({x, y})
        |> char
      end
      |> to_string
      |> Kernel.<>("\n")
    end
    |> Enum.join
  end
  
  defp char(:live), do: ?+
  defp char(_), do: ?.
  
  def neighbors(board, {x, y}) do
    for nx <- (x-1..x+1), ny <- (y-1..y+1), nx  != x or ny !=  y do
      get(board, {nx, ny})
    end
  end
  
  def next_cell(board, point) do
    state = get(board, point)
    
    board
    |> neighbors(point)
    |> Enum.count(fn neighbor -> neighbor == :live end)
    |> Rules.next_cell(state)
  end
  
  # reducers
  def next_generation(board) do
    next_grid = 
      for x <- 1..board.width, y <- 1..board.height do
        {{x, y}, next_cell(board, {x, y})}
      end
      |> Enum.filter(fn {_point, state} -> state == :live end)
      |> Map.new
    
    %{board|grid: next_grid}
  end
  
  def stream(board) do
    Stream.iterate(board, &next_generation/1)
  end
  
  def nth_generation(board, n) do
    board
    |> stream
    |> Stream.drop(n-1)
    |> Enum.take(1)
    |> hd
  end
end