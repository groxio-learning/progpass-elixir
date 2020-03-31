defmodule Shape do
  @enforce_keys [:points]
  defstruct([
    :points, 
    stroke: :blue, 
    fill: :black
  ])
  
  def to_svg(shape) do
    """
    <polygon 
      points="#{render_points(shape)}"
      style="#{render_style(shape)}" 
    />
    """
  end
  
  def render_points(shape) do
    shape.points
    |> Enum.map(fn {x, y} -> "#{x},#{y}" end)
    |> Enum.join(" ")
  rescue
    _exception ->
      reraise "Invalid points: #{inspect shape.points}", __STACKTRACE__
  end
  
  def render_style(shape) do
    fill = "fill:#{Color.hex_code(shape.fill)}"
    stroke = "stroke:#{Color.hex_code(shape.stroke)};stroke-width:1"
    "#{fill};#{stroke}"
  end
end
