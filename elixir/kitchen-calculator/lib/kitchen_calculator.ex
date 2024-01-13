defmodule KitchenCalculator do
  @in_milliliter %{
    milliliter: 1,
    cup: 240,
    fluid_ounce: 30,
    teaspoon: 5,
    tablespoon: 15
  }

  def get_volume({_, volume}), do: volume

  def to_milliliter({unit, volume}), do: {:milliliter, volume * @in_milliliter[unit]}

  def from_milliliter({:milliliter, volume}, unit), do: {unit, volume / @in_milliliter[unit]}

  def convert(volume_pair, to_unit) do
    volume_pair
    |> to_milliliter()
    |> from_milliliter(to_unit)
  end
end
