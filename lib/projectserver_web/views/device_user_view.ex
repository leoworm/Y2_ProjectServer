defmodule ProjectserverWeb.DeviceUserView do
  use ProjectserverWeb, :view
  alias ProjectserverWeb.DeviceUserView

  def render("index.json", %{device_users: device_users}) do
    %{data: render_many(device_users, DeviceUserView, "device_user.json")}
  end

  def render("show.json", %{device_user: device_user}) do
    %{data: render_one(device_user, DeviceUserView, "device_user.json")}
  end

  def render("device_user.json", %{device_user: device_user}) do
    %{
      id: device_user.id,
      user_id: device_user.user_id,
      device_id: device_user.device_id
    }
  end
end
