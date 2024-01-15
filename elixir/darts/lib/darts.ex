defmodule Darts do
  @type position :: {number, number}

  @doc """
  Calculate the score of a single dart hitting a target
  """
  @spec score(position) :: integer
  def score({x, y}) do
    distance = distance_from_zero(x, y) |> IO.inspect()
    cond do
      distance > 10.0 -> 0
      distance > 5.0 -> 1
      distance > 1.0 -> 5
      true -> 10
    end
  end

  defp distance_from_zero(x, y) do
    :math.sqrt(x ** 2 + y ** 2)
  end
end
