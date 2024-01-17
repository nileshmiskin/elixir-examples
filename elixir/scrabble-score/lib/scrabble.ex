defmodule Scrabble do
  @doc """
  Calculate the scrabble score for the word.
  """
  @spec score(String.t()) :: non_neg_integer
  def score(word) do
    word
    |> String.upcase()
    |> String.to_charlist()
    |> Enum.reduce(0, fn char, acc -> acc + get_score(char) end)
  end

  defp get_score(char) when char in ~c"AEIOULNRST", do: 1
  defp get_score(char) when char in ~c"DG", do: 2
  defp get_score(char) when char in ~c"BCMP", do: 3
  defp get_score(char) when char in ~c"FHVWY", do: 4
  defp get_score(char) when char in ~c"K", do: 5
  defp get_score(char) when char in ~c"JX", do: 8
  defp get_score(char) when char in ~c"QZ", do: 10
  defp get_score(_char), do: 0
end
