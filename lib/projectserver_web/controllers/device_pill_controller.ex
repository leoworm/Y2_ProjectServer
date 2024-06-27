defmodule ProjectserverWeb.DevicePillController do
  use ProjectserverWeb, :controller

  alias Projectserver.DevicePills
  alias Projectserver.DevicePills.DevicePill

  action_fallback ProjectserverWeb.FallbackController

  def index(conn, _params) do
    device_pills = DevicePills.list_device_pills()
    render(conn, "index.json", device_pills: device_pills)
  end

  def create(conn, %{"device_pill" => device_pill_params}) do
    with {:ok, %DevicePill{} = device_pill} <- DevicePills.create_device_pill(device_pill_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.device_pill_path(conn, :show, device_pill))
      |> render("show.json", device_pill: device_pill)
    end
  end

  def show(conn, %{"id" => id}) do
    device_pill = DevicePills.get_device_pill!(id)
    render(conn, "show.json", device_pill: device_pill)
  end

  def update(conn, %{"id" => id, "device_pill" => device_pill_params}) do
    device_pill = DevicePills.get_device_pill!(id)

    with {:ok, %DevicePill{} = device_pill} <- DevicePills.update_device_pill(device_pill, device_pill_params) do
      render(conn, "show.json", device_pill: device_pill)
    end
  end

  def delete(conn, %{"id" => id}) do
    device_pill = DevicePills.get_device_pill!(id)

    with {:ok, %DevicePill{}} <- DevicePills.delete_device_pill(device_pill) do
      send_resp(conn, :no_content, "")
    end
  end
end
