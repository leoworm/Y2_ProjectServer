defmodule ProjectserverWeb.DeviceUserController do
  use ProjectserverWeb, :controller

  alias Projectserver.DeviceUsers
  alias Projectserver.DeviceUsers.DeviceUser

  action_fallback ProjectserverWeb.FallbackController

  def index(conn, _params) do
    device_users = DeviceUsers.list_device_users()
    render(conn, "index.json", device_users: device_users)
  end

  def create(conn, %{"device_user" => device_user_params}) do
    with {:ok, %DeviceUser{} = device_user} <- DeviceUsers.create_device_user(device_user_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.device_user_path(conn, :show, device_user))
      |> render("show.json", device_user: device_user)
    end
  end

  def show(conn, %{"id" => id}) do
    device_user = DeviceUsers.get_device_user!(id)
    render(conn, "show.json", device_user: device_user)
  end

  def update(conn, %{"id" => id, "device_user" => device_user_params}) do
    device_user = DeviceUsers.get_device_user!(id)

    with {:ok, %DeviceUser{} = device_user} <- DeviceUsers.update_device_user(device_user, device_user_params) do
      render(conn, "show.json", device_user: device_user)
    end
  end

  def delete(conn, %{"id" => id}) do
    device_user = DeviceUsers.get_device_user!(id)

    with {:ok, %DeviceUser{}} <- DeviceUsers.delete_device_user(device_user) do
      send_resp(conn, :no_content, "")
    end
  end
end
