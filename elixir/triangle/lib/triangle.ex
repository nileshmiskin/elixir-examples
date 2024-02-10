defmodule Triangle do
  @type kind :: :equilateral | :isosceles | :scalene

  @doc """
  Return the kind of triangle of a triangle with 'a', 'b' and 'c' as lengths.
  """
  @spec kind(number, number, number) :: {:ok, kind} | {:error, String.t()}
  def kind(a, b, c) when a <= 0 or b <= 0 or c <= 0,
    do: {:error, "all side lengths must be positive"}

  def kind(a, a, a), do: {:ok, :equilateral}

  def kind(a, b, c) when a + b >= c and b + c >= a and a + c >= b do
    if a == b or b == c or a == c do
      {:ok, :isosceles}
    else
      {:ok, :scalene}
    end
  end

  def kind(_a, _b, _c), do: {:error, "side lengths violate triangle inequality"}
end
