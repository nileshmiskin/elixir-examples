defmodule BinarySearch do
  @doc """
    Searches for a key in the tuple using the binary search algorithm.
    It returns :not_found if the key is not in the tuple.
    Otherwise returns {:ok, index}.

    ## Examples

      iex> BinarySearch.search({}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 5)
      {:ok, 2}

  """

  @spec search(tuple, integer) :: {:ok, integer} | :not_found
  def search(numbers, key) do
    list = Tuple.to_list(numbers)
    low = 0
    high = tuple_size(numbers) - 1
    find_num(list, key, low, high)
  end

  defp find_num(_list, _key, low, high) when low > high, do: :not_found

  defp find_num(list, key, low, high) do
    middle = div(low + high, 2)
    value = Enum.at(list, middle)

    cond do
      value == key -> {:ok, middle}
      value < key -> find_num(list, key, middle + 1, high)
      true -> find_num(list, key, low, middle - 1)
    end
  end
end
