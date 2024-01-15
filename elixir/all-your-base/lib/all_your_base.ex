defmodule AllYourBase do
  @doc """
  Given a number in input base, represented as a sequence of digits, converts it to output base,
  or returns an error tuple if either of the bases are less than 2
  """

  @spec convert(list, integer, integer) :: {:ok, list} | {:error, String.t()}
  def convert(_digits, input_base, _output_base) when input_base < 2 do
    {:error, "input base must be >= 2"}
  end

  def convert(_digits, _input_base, output_base) when output_base < 2 do
    {:error, "output base must be >= 2"}
  end

  def convert(digits, input_base, output_base) when input_base == output_base do
    {:ok, digits}
  end

  def convert([], _input_base, _output_base) do
    {:ok, [0]}
  end

  def convert([0], _input_base, _output_base) do
    {:ok, [0]}
  end

  def convert(digits, input_base, output_base) do
    invalid_input? =
      digits
      |> Enum.any?(&invalid_digit(&1, input_base))

    if invalid_input? do
      {:error, "all digits must be >= 0 and < input base"}
    else
      num =
        convert_to_decimal(digits, input_base)
        |> convert_to_base(output_base)

      {:ok, num}
    end
  end

  defp invalid_digit(digit, base), do: digit < 0 or digit >= base

  defp convert_to_decimal(digits, input_base) do
    Enum.reverse(digits)
    |> Enum.reduce({0, 0}, fn digit, {acc, index} ->
      {acc + digit * input_base ** index, index + 1}
    end)
    |> elem(0)
  end

  defp convert_to_base(0, _output_base), do: [0]

  defp convert_to_base(decimal_num, output_base) do
    do_convert_to_base(decimal_num, output_base, [])
  end

  defp do_convert_to_base(0, _output_base, acc), do: acc

  defp do_convert_to_base(decimal_num, output_base, acc) do
    do_convert_to_base(div(decimal_num, output_base), output_base, [
      rem(decimal_num, output_base) | acc
    ])
  end
end
