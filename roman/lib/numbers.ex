defmodule Roman.Numbers do
  Enum.each(Roman.map, fn {roman, decimal} ->
    defmacro unquote(roman)(), do: unquote(decimal)
  end)
end