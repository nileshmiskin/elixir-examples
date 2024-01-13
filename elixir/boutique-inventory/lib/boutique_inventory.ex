defmodule BoutiqueInventory do
  def sort_by_price(inventory) do
    inventory |> Enum.sort_by(& &1.price)
  end

  def with_missing_price(inventory) do
    inventory |> Enum.filter(&(&1.price == nil))
  end

  def update_names(inventory, old_word, new_word) do
    inventory
    |> Enum.map(fn item ->
      name = item.name
      new_name = String.replace(name, old_word, new_word)
      %{item | name: new_name}
    end)
  end

  def increase_quantity(item, count) do
    new_quantities =
      for {size, qty} <- item.quantity_by_size do
        {size, qty + count}
      end
    %{item | quantity_by_size: Map.new(new_quantities)}
  end

  def total_quantity(item) do
    item.quantity_by_size
    |> Enum.reduce(0, fn {_k, v}, acc -> acc + v end)
  end
end
