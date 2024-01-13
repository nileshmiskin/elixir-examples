defmodule BasketballWebsite do
  def extract_from_path(data, path), do: do_extract_from_path(data, String.split(path, "."))
  defp do_extract_from_path(data, []), do: data

  defp do_extract_from_path(data, [head | remaining_path]) do
    do_extract_from_path(data[head], remaining_path)
  end

  def get_in_path(data, path) do
    get_in(data, String.split(path, "."))
  end
end
