defmodule LibraryFees do
  def datetime_from_string(string) do
    case DateTime.from_iso8601(string) do
      {:ok, datetime, _} -> DateTime.to_naive(datetime)
      {:error, reason} -> raise ArgumentError, "Invalid ISO 8601 string: #{reason}"
    end
  end

  def before_noon?(datetime), do: datetime.hour() < 12

  def return_date(checkout_datetime) do
    with {:ok, aware_datetime} <- DateTime.from_naive(checkout_datetime, "Etc/UTC") do
      num_days_to_add =
        if before_noon?(aware_datetime) do
          28
        else
          29
        end

      aware_datetime
      |> DateTime.add(num_days_to_add, :day)
      |> DateTime.to_date()
    end
  end

  def days_late(planned_return_date, actual_return_datetime) do
    with {:ok, actual_date} <- DateTime.from_naive(actual_return_datetime, "Etc/UTC") do
      days_late = Date.diff(actual_date, planned_return_date)
      max(days_late, 0)
    end
  end

  def monday?(datetime) do
    with {:ok, date} <- DateTime.from_naive(datetime, "Etc/UTC") do
      Date.day_of_week(date) == 1
    end
  end

  def calculate_late_fee(checkout, return, rate) do
    with checkout_datetime <- datetime_from_string(checkout),
         return_datetime <- datetime_from_string(return) do
      
      planned_return_date = return_date(checkout_datetime)
      late_fee_days = days_late(planned_return_date, return_datetime)

      if monday?(return_datetime) do
        trunc(late_fee_days * rate / 2)
      else
        late_fee_days * rate
      end
    end
  end
end
