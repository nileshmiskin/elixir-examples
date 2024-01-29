defmodule ResistorColorTrio do
  @doc """
  Calculate the resistance value in ohms from resistor colors
  """
  @color_codes %{
    black: 0,
    brown: 1,
    red: 2,
    orange: 3,
    yellow: 4,
    green: 5,
    blue: 6,
    violet: 7,
    grey: 8,
    white: 9
  }
  @spec label(colors :: [atom]) :: {number, :ohms | :kiloohms | :megaohms | :gigaohms}
  def label([color1, color2, color3 | _]) do
    val = @color_codes[color1] * 10 + @color_codes[color2]
    exponent = @color_codes[color3]
    resistance = val * 10 ** exponent

    cond do
      exponent > 8 -> {resistance / 1_000_000_000, :gigaohms}
      exponent > 5 -> {resistance / 1_000_000, :megaohms}
      exponent > 1 -> {resistance / 1_000, :kiloohms}
      true -> {resistance, :ohms}
    end
  end
end
