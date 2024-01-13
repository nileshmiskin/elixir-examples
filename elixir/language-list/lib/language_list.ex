defmodule LanguageList do
  def new(), do: []

  def add(list, language), do: [language | list]

  def remove([_head | tail]), do: tail

  def first([head | _tail]), do: head

  def count(list)
  def count([]), do: 0
  def count([_head | tail]), do: 1 + count(tail)

  def functional_list?(list), do: "Elixir" in list
end
