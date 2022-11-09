defmodule KitchenCalculator do
  def get_volume(volume_pair), do: elem(volume_pair, 1)

  def to_milliliter({:cup, volume}) do
    {:milliliter, volume * 240}
  end

  def to_milliliter({:fluid_ounce, volume}) do
    {:milliliter, volume * 30}
  end

  def to_milliliter({:teaspoon, volume}) do
    {:milliliter, volume * 5}
  end

  def to_milliliter({:tablespoon, volume}) do
    {:milliliter, volume * 15}
  end

  def to_milliliter({:milliliter, _} = volume) do
    volume
  end

  def from_milliliter({:milliliter, ml}, :cup) do
    {:cup, ml / 240}
  end

  def from_milliliter({:milliliter, ml}, :fluid_ounce) do
    {:fluid_ounce, ml / 30}
  end

  def from_milliliter({:milliliter, ml}, :teaspoon) do
    {:teaspoon, ml / 5}
  end

  def from_milliliter({:milliliter, ml}, :tablespoon) do
    {:tablespoon, ml / 15}
  end

  def from_milliliter({:milliliter, _} = volume, :milliliter) do
    volume
  end

  def convert(volume_pair, unit) do
    to_milliliter(volume_pair) |> from_milliliter(unit)
  end
end
