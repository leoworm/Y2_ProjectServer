defmodule ProjectserverWeb.PillController do
  use ProjectserverWeb, :controller

  alias Projectserver.Pills
  alias Projectserver.Pills.Pill

  action_fallback ProjectserverWeb.FallbackController

  def index(conn, _params) do
    pills = Pills.list_pills()
    render(conn, "index.json", pills: pills)
  end

  def create(conn, %{"pill" => pill_params}) do
    with {:ok, %Pill{} = pill} <- Pills.create_pill(pill_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.pill_path(conn, :show, pill))
      |> render("show.json", pill: pill)
    end
  end

  def show(conn, %{"id" => id}) do
    pill = Pills.get_pill!(id)
    render(conn, "show.json", pill: pill)
  end

  def update(conn, %{"id" => id, "pill" => pill_params}) do
    pill = Pills.get_pill!(id)

    with {:ok, %Pill{} = pill} <- Pills.update_pill(pill, pill_params) do
      render(conn, "show.json", pill: pill)
    end
  end

  def delete(conn, %{"id" => id}) do
    pill = Pills.get_pill!(id)

    with {:ok, %Pill{}} <- Pills.delete_pill(pill) do
      send_resp(conn, :no_content, "")
    end
  end
end
