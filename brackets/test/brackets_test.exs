defmodule BracketsTest do
  use ExUnit.Case

  test "an empty string is balanced" do
    assert Brackets.balanced?('')
  end
  
  test "a list with remaining closes is unbalanced" do
    refute Brackets.balanced?('()>')
    refute Brackets.balanced?(']>')
  end

  test "paren sets with opens and closes are balanced" do
    assert Brackets.balanced?('<([{<>[]}])>')
    assert Brackets.balanced?('<([])>')
  end

  test "paren sets with opens and closes with extra opens are not balanced" do
    refute Brackets.balanced?('<([{(<>[]}])>')
    refute Brackets.balanced?('<([[])>')
  end
end
