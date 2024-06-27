defmodule ProjectserverWeb.PillControllerTest do
  use ProjectserverWeb.ConnCase

  import Projectserver.PillsFixtures

  alias Projectserver.Pills.Pill

  @create_attrs %{
    manufacturer: "some manufacturer",
    name: "some name"
  }
  @update_attrs %{
    manufacturer: "some updated manufacturer",
    name: "some updated name"
  }
  @invalid_attrs %{manufacturer: nil, name: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all pills", %{conn: conn} do
      conn = get(conn, Routes.pill_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create pill" do
    test "renders pill when data is valid", %{conn: conn} do
      conn = post(conn, Routes.pill_path(conn, :create), pill: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.pill_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "manufacturer" => "some manufacturer",
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.pill_path(conn, :create), pill: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update pill" do
    setup [:create_pill]

    test "renders pill when data is valid", %{conn: conn, pill: %Pill{id: id} = pill} do
      conn = put(conn, Routes.pill_path(conn, :update, pill), pill: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.pill_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "manufacturer" => "some updated manufacturer",
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, pill: pill} do
      conn = put(conn, Routes.pill_path(conn, :update, pill), pill: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete pill" do
    setup [:create_pill]

    test "deletes chosen pill", %{conn: conn, pill: pill} do
      conn = delete(conn, Routes.pill_path(conn, :delete, pill))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.pill_path(conn, :show, pill))
      end
    end
  end

  defp create_pill(_) do
    pill = pill_fixture()
    %{pill: pill}
  end
end
