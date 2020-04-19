defmodule RulesTest do
  use ExUnit.Case
  import LifeStream.Rules

  test "2 neighbors stays the same" do
    assert next_cell(2, :live) == :live
    assert next_cell(2, :dead) == :dead
  end
  
  test "3 neighbors lives" do
    assert next_cell(3, :live) == :live
    assert next_cell(3, :dead) == :live
  end
  
  test "<2 neighbors dies" do
    assert next_cell(1, :live) == :dead
    assert next_cell(1, :dead) == :dead
    assert next_cell(0, :live) == :dead
    assert next_cell(0, :dead) == :dead
  end
  
  test ">3 neighbors diexs" do
    assert next_cell(4, :live) == :dead
    assert next_cell(4, :dead) == :dead
    assert next_cell(5, :live) == :dead
    assert next_cell(6,  :dead) == :dead
  end
end
