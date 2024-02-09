defmodule StringSeries do
  @doc """
  Given a string `s` and a positive integer `size`, return all substrings
  of that size. If `size` is greater than the length of `s`, or less than 1,
  return an empty list.
  """
  @spec slices(s :: String.t(), size :: integer) :: list(String.t())
  def slices(_s, size) when size < 1, do: []

  def slices(s, size) do
    times = String.length(s) - size
    cond do
      times < 0 ->
        []

      true ->
        for x <- 0..times do
          String.slice(s, x, size)
        end
    end
  end
end
