defmodule Scrabble do
  @doc """
  Calculate the scrabble score for the word.
  """
  @scores %{
    ~c"AEIOULNRST" => 1,
    ~c"DG" => 2,
    ~c"BCMP" => 3,
    ~c"FHVWY" => 4,
    ~c"K" => 5,
    ~c"JX" => 8,
    ~c"QZ" => 10
  }

  @spec score(String.t()) :: non_neg_integer
  def score(word) do
    word
    |> String.upcase()
    |> String.to_charlist()
    |> Enum.reduce(0, fn char, acc -> acc + get_score(char) end)
  end

  defp get_score(char) when char in ?A..?Z do
    @scores
    |> Enum.find(fn {k, _v} -> char in k end)
    |> elem(1)
  end

  defp get_score(_char), do: 0
end
