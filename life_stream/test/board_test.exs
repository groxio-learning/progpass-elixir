defmodule BoardTest do
  use ExUnit.Case
  import LifeStream.Board
  
  test "board has meaningful defaults" do
    board = %LifeStream.Board{}
    assert board.height == 3
    assert board.width == 3
    assert board.grid == %{}
  end
  
  test "build a repeater pattern" do
    repeater = board()
    assert repeater.__struct__ == LifeStream.Board
    assert repeater.width == 3
    assert repeater.height == 3
    
    assert repeater.grid[{2, 1}] == :live
    assert repeater.grid[{2, 2}] == :live
  end
  
  test "build a random board" do
    %{height: height, width: width, grid: grid} = random(40, 20)
    unique_values = Enum.uniq(Map.values(grid))
    
    assert height == 20
    assert width == 40
    assert unique_values -- [:live, :dead] == []
  end

  test "get live and dead elements" do
    board = board()
    assert get(board, {1, 1}) == :dead
    assert get(board, {2, 2}) == :live
    assert get(board, {2, 1}) == :live
    assert get(board, {1, 2}) == :dead
  end
  
  test "out of bounds defaults to dead" do
    board = board()
    assert get(board, {-1, -1}) == :dead
  end
  
  test "count neighbors" do
    board = board()
    assert neighbor_count(board, {1, 1}) == 2
    assert neighbor_count(board, {2, 2}) == 2
    assert neighbor_count(board, {2, 1}) == 1
    assert neighbor_count(board, {1, 2}) == 3
    assert neighbor_count(board, {4, 4}) == 0
  end
  
  test "computes next generation" do
    %{height: height, width: width, grid: grid} = generation_2()
    live_count = 
      grid
      |> Map.values
      |> Enum.count(fn x -> x == :live end)
    
    assert width == 3
    assert height == 3
    assert grid[{1, 2}] == :live
    assert grid[{2, 2}] == :live
    assert grid[{3, 2}] == :live
    assert live_count == 3
  end
  
  test "converts board to string" do
    assert as_string(repeater()) == repeater_string()
  end
  
  test "converts next generation to string" do
    expected = 
      """
      ...
      +++
      ...
      """
    assert as_string(generation_2()) == expected
  end

  test "repeat every other generation" do
    assert as_string(board()) == as_string(generation_3())
    assert as_string(board()) != as_string(generation_2())
  end
  
  test "creates stream" do
    life_stream = stream(board())
    
    expected = 
      life_stream
      |> Stream.drop(1)
      |> Enum.take(1)
      |> List.first
      |> as_string
    
    assert expected == next_string()
  end
  
  test "compute nth generation from stream" do
    assert nth_generation(repeater(), 1) |> as_string == repeater_string()
    assert nth_generation(repeater(), 2) |> as_string == next_string()
    assert nth_generation(repeater(), 3) |> as_string == repeater_string()
    assert nth_generation(repeater(), 4) |> as_string == next_string()
  end
  
  test "build board from string" do
    string = repeater_string()
    
    assert (string |> from_string |> as_string) == string
  end
  
  
  def board(), do: repeater()
  
  def neighbor_count(board, point) do 
    board 
    |> neighbors(point) 
    |> Enum.count(& &1==:live)
  end
  
  def generation_2(), do: repeater() |> next_generation
  def generation_3(), do: repeater() |> next_generation |> next_generation
  
  def repeater_string() do
    """
    .+.
    .+.
    .+.
    """
  end
  
  def next_string() do
    """
    ...
    +++
    ...
    """
  end
  
end
