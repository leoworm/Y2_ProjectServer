defmodule ProjectserverWeb.DevicePillControllerTest do
  use ProjectserverWeb.ConnCase

  import Projectserver.DevicePillsFixtures

  alias Projectserver.DevicePills.DevicePill

  @create_attrs %{
    device_id: 42,
    pill_id: 42
  }
  @update_attrs %{
    device_id: 43,
    pill_id: 43
  }
  @invalid_attrs %{device_id: nil, pill_id: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all device_pills", %{conn: conn} do
      conn = get(conn, Routes.device_pill_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create device_pill" do
    test "renders device_pill when data is valid", %{conn: conn} do
      conn = post(conn, Routes.device_pill_path(conn, :create), device_pill: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.device_pill_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "device_id" => 42,
               "pill_id" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.device_pill_path(conn, :create), device_pill: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update device_pill" do
    setup [:create_device_pill]

    test "renders device_pill when data is valid", %{conn: conn, device_pill: %DevicePill{id: id} = device_pill} do
      conn = put(conn, Routes.device_pill_path(conn, :update, device_pill), device_pill: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.device_pill_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "device_id" => 43,
               "pill_id" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, device_pill: device_pill} do
      conn = put(conn, Routes.device_pill_path(conn, :update, device_pill), device_pill: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete device_pill" do
    setup [:create_device_pill]

    test "deletes chosen device_pill", %{conn: conn, device_pill: device_pill} do
      conn = delete(conn, Routes.device_pill_path(conn, :delete, device_pill))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.device_pill_path(conn, :show, device_pill))
      end
    end
  end

  defp create_device_pill(_) do
    device_pill = device_pill_fixture()
    %{device_pill: device_pill}
  end
end
