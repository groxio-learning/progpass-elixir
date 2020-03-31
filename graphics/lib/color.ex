defmodule Color do
  def hex_code(:white) do
    "#ffffff"
  end
  def hex_code(:black) do
    "#000000"
  end
  def hex_code(:blue) do
    "#0000FF"
  end
  def hex_code(_other) do
    raise "unsuppported color"
  end
end