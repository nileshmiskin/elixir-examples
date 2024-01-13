defmodule RemoteControlCar do
  @enforce_keys [:nickname]
  defstruct [:nickname, battery_percentage: 100, distance_driven_in_meters: 0]

  def new(nickname \\ "none") do
    %RemoteControlCar{nickname: nickname}
  end

  def display_distance(%RemoteControlCar{distance_driven_in_meters: milage}),
    do: "#{milage} meters"

  def display_battery(%RemoteControlCar{battery_percentage: 0}),
    do: "Battery empty"

  def display_battery(%RemoteControlCar{battery_percentage: battery}),
    do: "Battery at #{battery}%"

  def drive(%RemoteControlCar{battery_percentage: 0} = remote_car), do: remote_car

  def drive(
        %RemoteControlCar{battery_percentage: battery, distance_driven_in_meters: milage} =
          remote_car
      ) do
    %{remote_car | distance_driven_in_meters: milage + 20, battery_percentage: battery - 1}
  end
end
