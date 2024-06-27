defmodule ProjectserverWeb.DatabaseControllerTest do
  use ProjectserverWeb.ConnCase

  import Projectserver.DatabasesFixtures

  alias Projectserver.Databases.Database

  @create_attrs %{
    name: "some name"
  }
  @update_attrs %{
    name: "some updated name"
  }
  @invalid_attrs %{name: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all db", %{conn: conn} do
      conn = get(conn, Routes.database_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create database" do
    test "renders database when data is valid", %{conn: conn} do
      conn = post(conn, Routes.database_path(conn, :create), database: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.database_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.database_path(conn, :create), database: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update database" do
    setup [:create_database]

    test "renders database when data is valid", %{conn: conn, database: %Database{id: id} = database} do
      conn = put(conn, Routes.database_path(conn, :update, database), database: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.database_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, database: database} do
      conn = put(conn, Routes.database_path(conn, :update, database), database: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete database" do
    setup [:create_database]

    test "deletes chosen database", %{conn: conn, database: database} do
      conn = delete(conn, Routes.database_path(conn, :delete, database))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.database_path(conn, :show, database))
      end
    end
  end

  defp create_database(_) do
    database = database_fixture()
    %{database: database}
  end
end
