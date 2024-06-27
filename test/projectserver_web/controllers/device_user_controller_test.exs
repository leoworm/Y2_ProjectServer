defmodule ProjectserverWeb.DeviceUserControllerTest do
  use ProjectserverWeb.ConnCase

  import Projectserver.DeviceUsersFixtures

  alias Projectserver.DeviceUsers.DeviceUser

  @create_attrs %{
    device_id: 42,
    user_id: 42
  }
  @update_attrs %{
    device_id: 43,
    user_id: 43
  }
  @invalid_attrs %{device_id: nil, user_id: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all device_users", %{conn: conn} do
      conn = get(conn, Routes.device_user_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create device_user" do
    test "renders device_user when data is valid", %{conn: conn} do
      conn = post(conn, Routes.device_user_path(conn, :create), device_user: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.device_user_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "device_id" => 42,
               "user_id" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.device_user_path(conn, :create), device_user: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update device_user" do
    setup [:create_device_user]

    test "renders device_user when data is valid", %{conn: conn, device_user: %DeviceUser{id: id} = device_user} do
      conn = put(conn, Routes.device_user_path(conn, :update, device_user), device_user: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.device_user_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "device_id" => 43,
               "user_id" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, device_user: device_user} do
      conn = put(conn, Routes.device_user_path(conn, :update, device_user), device_user: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete device_user" do
    setup [:create_device_user]

    test "deletes chosen device_user", %{conn: conn, device_user: device_user} do
      conn = delete(conn, Routes.device_user_path(conn, :delete, device_user))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.device_user_path(conn, :show, device_user))
      end
    end
  end

  defp create_device_user(_) do
    device_user = device_user_fixture()
    %{device_user: device_user}
  end
end
