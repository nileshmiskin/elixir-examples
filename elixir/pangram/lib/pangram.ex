defmodule Pangram do
  @doc """
  Determines if a word or sentence is a pangram.
  A pangram is a sentence using every letter of the alphabet at least once.

  Returns a boolean.

    ## Examples

      iex> Pangram.pangram?("the quick brown fox jumps over the lazy dog")
      true

  """
  @all_char_list ~c"abcdefghijklmnopqrstuvwxyz"

  @spec pangram?(String.t()) :: boolean
  def pangram?(sentence) do
    char_list =
      sentence
      |> String.downcase()
      |> String.to_charlist()

    @all_char_list
    |> Enum.all?(&(&1 in char_list))
  end
end
