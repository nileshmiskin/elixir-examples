defmodule PerfectNumbers do
  @doc """
  Determine the aliquot sum of the given `number`, by summing all the factors
  of `number`, aside from `number` itself.

  Based on this sum, classify the number as:

  :perfect if the aliquot sum is equal to `number`
  :abundant if the aliquot sum is greater than `number`
  :deficient if the aliquot sum is less than `number`
  """
  @spec classify(number :: integer) :: {:ok, atom} | {:error, String.t()}
  def classify(number) when number < 1,
    do: {:error, "Classification is only possible for natural numbers."}

  def classify(1), do: {:ok, :deficient}

  def classify(number) do
    sum = aliquot_sum(number)

    cond do
      sum == number -> {:ok, :perfect}
      sum > number -> {:ok, :abundant}
      true -> {:ok, :deficient}
    end
  end

  def aliquot_sum(number) do
    Enum.reduce(1..div(number, 2), 0, fn divisor, sum ->
      if rem(number, divisor) == 0 do
        sum + divisor
      else
        sum
      end
    end)
  end
end
