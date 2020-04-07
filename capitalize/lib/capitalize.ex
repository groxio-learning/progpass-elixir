defmodule Capitalize do
  def sigil_p(string, []) do
    String.upcase(string)
  end
  
  def sigil_p(string, 'l') do
    String.downcase(string)
  end
  
  def sigil_p(_string, _u) do
    raise "unsupported option"
  end


end
