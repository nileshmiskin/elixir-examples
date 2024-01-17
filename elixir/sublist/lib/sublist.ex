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
    s1 = Enum.join(a, "-") # Adding '-' Ensures [2, 22] is not sublist of [22, 2]
    s2 = Enum.join(b, "-")
    String.contains?(s2, s1) and Enum.all?(a, &(&1 in b))
  end
end
