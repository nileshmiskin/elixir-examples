defmodule BirdCount do
  def today(list)
  def today([]), do: nil
  def today([today | _rest_of_the_days]), do: today

  def increment_day_count(list)
  def increment_day_count([]), do: [1]
  def increment_day_count([today | rest_of_the_days]), do: [today + 1 | rest_of_the_days]

  def has_day_without_birds?(list)
  def has_day_without_birds?([]), do: false
  def has_day_without_birds?([0 | _tail]), do: true
  def has_day_without_birds?([head | tail]), do: has_day_without_birds?(tail)

  def total(list)
  def total([]), do: 0
  def total([head | tail]), do: head + total(tail)

  def busy_days(list)
  def busy_days([]), do: 0
  def busy_days([head | tail]) when head >= 5, do: 1 + busy_days(tail)
  def busy_days([_head | tail]), do: busy_days(tail)
end
