defmodule BoardTest do
  use ExUnit.Case
  import LifeStream.Board

  test "get live and dead elements" do
    board = board()
    assert get(board, {1, 1}) == :dead
    assert get(board, {2, 2}) == :live
    assert get(board, {2, 1}) == :live
    assert get(board, {1, 2}) == :dead
  end
  
  test "count neighbors" do
    board = board()
    assert neighbor_count(board, {1, 1}) == 2
    assert neighbor_count(board, {2, 2}) == 2
    assert neighbor_count(board, {2, 1}) == 1
    assert neighbor_count(board, {1, 2}) == 3
    assert neighbor_count(board, {4, 4}) == 0
  end
  
  test "converts board to string" do
    expected = 
      """
      .+.
      .+.
      .+.
      """
    assert as_string(repeater()) == expected
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
    
    assert expected == repeater_string()
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
    ...
    +++
    ...
    """
  end
  
end
