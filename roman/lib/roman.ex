defmodule Roman do
  defmacro __using__(_opts) do
    quote do
      import Roman.Numbers
    end
  end

  def convert(decimal) when is_integer(decimal) and decimal > 0 do
    {0, romans} = next_digit({decimal, []})
    
    romans
    |> Enum.reverse
    |> Enum.join("")
    |> String.to_atom
  end
  
  def next_digit({0, romans}) do
    {0, romans}
  end
  def next_digit({decimal, romans}) do
    result = 
      cond do
        decimal >= 1000 -> 
          {decimal - 1000, ["m"|romans]}
        decimal >= 900 -> 
          {decimal - 900, ["cm"|romans]}
        decimal >= 500 -> 
          {decimal - 500, ["d"|romans]}
        decimal >= 400 -> 
          {decimal - 400, ["cd"|romans]}
        decimal >= 100 -> 
          {decimal - 100, ["c"|romans]}
        decimal >= 90 -> 
          {decimal - 90, ["xc"|romans]}
        decimal >= 50 -> 
          {decimal - 50, ["l"|romans]}
        decimal >= 40 -> 
          {decimal - 40, ["xl"|romans]}
        decimal >= 10 -> 
          {decimal - 10, ["x"|romans]}
        decimal >= 9 -> 
          {decimal - 9, ["ix"|romans]}
        decimal >= 5 -> 
          {decimal - 5, ["v"|romans]}
        decimal >= 4 -> 
          {decimal - 4, ["iv"|romans]}
        decimal >= 1 -> 
          {decimal - 1, ["i"|romans]}
      end
    next_digit(result)
  end
  
  def map() do
    for x <- (1..1000), into: %{} do
      {convert(x), x}
    end
  end
end
