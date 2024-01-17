defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, a), do: :equal 
  def compare([], _a), do: :sublist
  def compare(_a, []), do: :superlist 
  def compare(a, b) do
    cond do
      sublist?(a, b) -> :sublist
      sublist?(b, a) -> :superlist
      true -> :unequal
    end
  end
  defp sublist?(a, b) do
    Stream.chunk_every(b, length(a), 1, :discard)
    |> Enum.any?(&(&1 === a))
  end
end
