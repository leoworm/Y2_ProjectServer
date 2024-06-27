defmodule ProjectserverWeb.ScheduleView do
  use ProjectserverWeb, :view
  alias ProjectserverWeb.ScheduleView

  def render("index.json", %{schedules: schedules}) do
    %{data: render_many(schedules, ScheduleView, "schedule.json")}
  end

  def render("show.json", %{schedule: schedule}) do
    %{data: render_one(schedule, ScheduleView, "schedule.json")}
  end

  def render("schedule.json", %{schedule: schedule}) do
    %{
      id: schedule.id,
      device_id: schedule.device_id,
      date_time: schedule.date_time,
      pill_id: schedule.pill_id
    }
  end
end
