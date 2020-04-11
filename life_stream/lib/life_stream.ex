defmodule LifeStream do
  alias LifeStream.Board
  def run(board), do: run(board, &iex_frame/1)
  def run(string, f) when is_binary(string) do
    string
    |> to_board
    |> run(f)
  end
  def run(%Board{}=board, f) do
    board
    |> Board.stream
    |> Stream.each(f)
    |> Stream.run
  end
  def run(_board, _f), do: raise "Incompatible board"
  
  def iex_frame(board, microseconds \\ 250) do
    Process.sleep(microseconds)
    IEx.Helpers.clear()
    IO.puts Board.as_string(board)
  end
  
  def nth(%Board{}=board, n) when is_integer(n) and n > 0 do
    Board.nth_generation(board, n)
  end
    
  def to_board(string) do
    %Board{
      height: height(string), 
      width: width(string), 
      grid: grid(string)
    }
  end

  defp grid(string) do
    string
    |> String.trim
    |> String.split("\n")
    |> Enum.with_index(1)
    |> Enum.map(&to_board_row/1)
    |> List.flatten
    |> Map.new
  end
  
  def height(string) do
    string
    |> String.trim
    |> String.split("\n")
    |> Enum.count
  end
  
  def width(string) do
    string
    |> String.trim
    |> String.split("\n")
    |> Enum.map(&String.length/1) 
    |> Enum.max
  end
  
  defp to_board_row({string, y}) do
    string
    |> String.to_charlist
    |> Enum.map(&char_to_state/1)
    |> Enum.with_index(1)
    |> Enum.map(fn {state, x} ->
       {{x, y}, state} 
    end)
  end
  
  defp char_to_state(?.), do: :dead
  defp char_to_state(?+), do: :live
end
