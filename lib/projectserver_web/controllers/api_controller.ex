defmodule ProjectserverWeb.ApiController do
  alias Projectserver.Pills
  alias Projectserver.Pills.Pill
  alias Projectserver.Schedules
  alias Projectserver.Schedules.Schedule
  alias Projectserver.Users
  alias Projectserver.Users.User
  alias Projectserver.Logs
  alias Projectserver.Logs.Log
  use ProjectserverWeb, :controller
  require Logger

  def create(conn, %{"log_data" => log_params}) do
    with {:ok, %Log{} = log} <- Logs.create_log(log_params) do
      conn
      |> put_status(:created)
      |> json(:ok)
    end
  end

  def create(conn, %{"schedule_data" => schedule_params}) do
    with {:ok, %Schedule{} = schedule} <- Schedules.create_schedule(schedule_params) do
      conn
      |> put_status(:created)
      |> json(:ok)
    end
  end

  def create(conn, %{"register_data" => register_params}) do
    with {:ok, %User{} = user} <- Users.create_user(register_params) do
      conn
      |> put_status(:created)
      |> json(:ok)
    end
  end


  def show(conn, %{"list_pills" => _val}) do
    devices = Pills.list_pills() |> Enum.map(&Map.drop(&1, [:__meta__, :__struct__]))
    json(conn, devices)
  end

  def show(conn, %{"fetch_schedule" => _val, "device_id" => device_id}) do
    #schedule = Schedules.list_schedules()
    schedule = [%{date: "27,6,2024", time: "15,36", pill: "ibuprofen"}]
    result = Jason.encode!(schedule)
    #json(conn, result)
    conn
    |> put_resp_header("data", result)
    |> json(schedule)
  end

  def show(conn, %{"fetch_logs" => _val}) do
    users = Logs.list_logs() |> Enum.map(&Map.drop(&1, [:__meta__, :__struct__]))
    json(conn, users)
  end

  def show(conn, %{"username" => username, "password" => password}) do
    case Users.get_uname_and_pwd(username, password) do
      {:ok} -> json(conn, %{success: true})
      {:error} -> json(conn, %{success: false})
    end
  end

end
