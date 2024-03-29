defmodule SumOfMultiples do
  @doc """
  Adds up all numbers from 1 to a given end number that are multiples of the factors provided.
  """
  @spec to(non_neg_integer, [non_neg_integer]) :: non_neg_integer
  def to(limit, factors) do
    factors = Enum.reject(factors, &(&1 == 0))

    multiple? = fn number ->
      Enum.any?(factors, fn factor -> rem(number, factor) == 0 end)
    end

    1..(limit - 1)
    |> Enum.filter(multiple?)
    |> Enum.sum()
  end
end
