defmodule ProjectserverWeb.DevicePillView do
  use ProjectserverWeb, :view
  alias ProjectserverWeb.DevicePillView

  def render("index.json", %{device_pills: device_pills}) do
    %{data: render_many(device_pills, DevicePillView, "device_pill.json")}
  end

  def render("show.json", %{device_pill: device_pill}) do
    %{data: render_one(device_pill, DevicePillView, "device_pill.json")}
  end

  def render("device_pill.json", %{device_pill: device_pill}) do
    %{
      id: device_pill.id,
      device_id: device_pill.device_id,
      pill_id: device_pill.pill_id
    }
  end
end
