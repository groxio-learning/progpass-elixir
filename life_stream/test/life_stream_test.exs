defmodule LifeStreamTest do
  use ExUnit.Case
  doctest LifeStream

  test "generates nth generation from string" do
    first_generation = LifeStream.nth(odd(), 1)
    second_generation = LifeStream.nth(odd(), 2)
    
    assert LifeStream.as_string(first_generation) == odd()
    assert LifeStream.as_string(second_generation) == even()
  end
  
  test "as string converts to string" do
    actual = 
      LifeStream.Board.repeater()
      |> LifeStream.as_string
      
    assert actual == even()
  end
  
  def odd() do
    """
    ...
    +++
    ...
    """
  end
  def even() do
    """
    .+.
    .+.
    .+.
    """
  end
  
end
