defmodule LifeStream.Rules do
  def next_cell(count, _state) when count < 2, do: :dead
  def next_cell(count, _state) when count > 3, do: :dead
  def next_cell(3, _state), do: :live
  def next_cell(2, state), do: state
end