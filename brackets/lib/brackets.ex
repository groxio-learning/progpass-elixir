defmodule Brackets do
  @brackets %{?[ => ?], ?{ => ?}, ?( => ?), ?< => ?> }
  @opens Map.keys(@brackets)
  
  @moduledoc """
  Determine whether brackets are balanced. See link for details.
  """

  @doc """
  Outputs "YES" if the brackets are balanced; NO otherwise. 
  """
  def run(string) do
    string
    |> String.to_charlist
    |> balanced?
    |> print
  end
  
  def balanced?(charlist) do
    balanced?(charlist, [])
  end
  
  defp balanced?([]=_chars, []=_bracket_stack), do: true
  defp balanced?([head|chars], stack) when head in @opens do
    balanced?(chars, [mate(head)|stack])
  end
  defp balanced?([head|chars], [head|stack]) do
    balanced?(chars, stack)
  end
  defp balanced?(_chars, _stack), do: false
  
  defp mate(char), do: @brackets[char]
  
  defp print(true), do: IO.puts("YES")
  defp print(_false), do: IO.puts("NO")
end
