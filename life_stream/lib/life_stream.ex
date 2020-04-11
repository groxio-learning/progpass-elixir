defmodule LifeStream do
  alias LifeStream.Board
  def run(board), do: run(board, &iex_frame/1)
  def run(string, f) when is_binary(string) do
    string
    |> Board.from_string
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
    IO.puts as_string(board)
  end
  
  def nth(board, n) when is_binary(board) do
    nth(Board.from_string(board), n)
  end
  def nth(%Board{}=board, n) when is_integer(n) and n > 0 do
    Board.nth_generation(board, n)
  end
  
  def as_string(board) do
    Board.as_string(board)
  end
end
