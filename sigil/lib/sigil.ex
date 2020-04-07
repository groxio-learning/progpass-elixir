defmodule Sigil do
  @erlang_32_bit_format_string "~32.2B"
  def sigil_b(string, []) do
    string 
    |> to_bits_string 
    |> String.to_integer
  end
  
  def sigil_b(string, [?s]) do
    string
    |> to_bits_string
  end
  
  defp to_bits_string(string) do
    @erlang_32_bit_format_string
    |> :io_lib.format([String.to_integer string]) 
    |> List.to_string 
    |> String.trim
  end
end
