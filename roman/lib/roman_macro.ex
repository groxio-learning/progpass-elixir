defmodule RomanMacro do
  defmacro roman_function(roman, decimal) do
    quote do
      def unquote(roman)(), do: unquote(decimal)
    end
  end
end