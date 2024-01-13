defmodule FreelancerRates do
  def daily_rate(hourly_rate) do
    hourly_rate * 8.0
  end

  def apply_discount(before_discount, discount) do
    before_discount * (100.00 - discount) / 100
  end

  def monthly_rate(hourly_rate, discount) do
    (daily_rate(hourly_rate) * 22)
    |> apply_discount(discount)
    |> ceil
  end

  def days_in_budget(budget, hourly_rate, discount) do
    daily_cost =
      hourly_rate
      |> daily_rate
      |> apply_discount(discount)

    (budget / daily_cost)
    |> Float.floor(1)
  end
end
