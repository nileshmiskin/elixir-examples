defmodule Hamming do
  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.

  ## Examples

  iex> Hamming.hamming_distance(~c"AAGTCATA", ~c"TAGCGATC")
  {:ok, 4}
  """
  @spec hamming_distance([char], [char]) :: {:ok, non_neg_integer} | {:error, String.t()}

  def hamming_distance(strand1, strand2) do
    cond do
      length(strand1) != length(strand2) -> {:error, "strands must be of equal length"}
      true -> {:ok, do_hamming_distance(strand1, strand2, 0)}
    end
  end

  defp distance(s, s), do: 0
  defp distance(_s, _t), do: 1

  defp do_hamming_distance(strand1, strand1, acc), do: acc

  defp do_hamming_distance([s1 | rest1], [s2 | rest2], acc) do
    do_hamming_distance(rest1, rest2, distance(s1, s2) + acc)
  end
end
