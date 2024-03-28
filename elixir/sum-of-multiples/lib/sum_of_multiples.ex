defmodule SumOfMultiples do
  @doc """
  Adds up all numbers from 1 to a given end number that are multiples of the factors provided.
  """
  @spec to(non_neg_integer, [non_neg_integer]) :: non_neg_integer
  def to(limit, factors) do
    factors
    |> multiples(limit)
    |> uniq()
    |> sum()
  end

  defp sum(numbers), do: Enum.sum(numbers)

  defp uniq(list), do: Enum.uniq(list)

  defp multiples(factors, limit) do
    Enum.reduce(factors, [], fn number, acc ->
      acc ++ multiples_of(number, limit)
    end)
  end

  defp multiples_of(0, _limit), do: []
  defp multiples_of(number, limit) when number > limit, do: []

  defp multiples_of(number, limit) do
    num_multiples = div(limit - 1, number)
    1..num_multiples |> Enum.map(&(&1 * number))
  end
end
