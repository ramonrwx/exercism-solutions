defmodule FreelancerRates do
  def daily_rate(hourly_rate) do
    hourly_rate * 8.0
  end

  def apply_discount(before_discount, discount) do
    before_discount - before_discount * (discount / 100.0)
  end

  def monthly_rate(hourly_rate, discount) do
    before_discount = daily_rate(hourly_rate) * 22.0
    after_discount = apply_discount(before_discount, discount)
    trunc(Float.ceil(after_discount))
  end

  def days_in_budget(budget, hourly_rate, discount) do
    before_discount = daily_rate(hourly_rate)
    after_discount = apply_discount(before_discount, discount)
    days = budget / after_discount
    Float.floor(days, 1)
  end
end
