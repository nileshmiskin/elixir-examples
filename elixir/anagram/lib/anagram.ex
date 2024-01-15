defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t(), [String.t()]) :: [String.t()]
  def match(base, candidates) do
    candidates
    |> Enum.filter(&anagram?(String.downcase(base), String.downcase(&1)))
  end

  defp anagram?(base, base), do: false

  defp anagram?(base, candidate), do: String.bag_distance(base, candidate) == 1.0
end
