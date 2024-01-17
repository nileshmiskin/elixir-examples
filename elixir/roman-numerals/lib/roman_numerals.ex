defmodule RomanNumerals do
  @doc """
  Convert the number to a roman number.
  """
  @spec numeral(pos_integer) :: String.t()
  def numeral(number) when number < 4000 do
    do_numeral(number, "")
  end

  defp do_numeral(0, acc), do: acc

  defp do_numeral(number, acc) do
    cond do
      number >= 1000 -> do_numeral(number - 1000, acc <> "M")
      number >= 900 -> do_numeral(number - 900, acc <> "CM")
      number >= 500 -> do_numeral(number - 500, acc <> "D")
      number >= 400 -> do_numeral(number - 400, acc <> "CD")
      number >= 100 -> do_numeral(number - 100, acc <> "C")
      number >= 90 -> do_numeral(number - 90, acc <> "XC")
      number >= 50 -> do_numeral(number - 50, acc <> "L")
      number >= 40 -> do_numeral(number - 40, acc <> "XL")
      number >= 10 -> do_numeral(number - 10, acc <> "X")
      number >= 9 -> do_numeral(number - 9, acc <> "IX")
      number >= 5 -> do_numeral(number - 5, acc <> "V")
      number >= 4 -> do_numeral(number - 4, acc <> "IV")
      number >= 1 -> do_numeral(number - 1, acc <> "I")
    end
  end
end
