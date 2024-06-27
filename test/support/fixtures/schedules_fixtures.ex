defmodule Projectserver.SchedulesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Projectserver.Schedules` context.
  """

  @doc """
  Generate a schedule.
  """
  def schedule_fixture(attrs \\ %{}) do
    {:ok, schedule} =
      attrs
      |> Enum.into(%{
        date_time: "some date_time",
        device_id: 42,
        pill_id: 42
      })
      |> Projectserver.Schedules.create_schedule()

    schedule
  end
end
