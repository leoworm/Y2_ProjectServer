defmodule Projectserver.PillsTest do
  use Projectserver.DataCase

  alias Projectserver.Pills

  describe "pills" do
    alias Projectserver.Pills.Pill

    import Projectserver.PillsFixtures

    @invalid_attrs %{manufacturer: nil, name: nil}

    test "list_pills/0 returns all pills" do
      pill = pill_fixture()
      assert Pills.list_pills() == [pill]
    end

    test "get_pill!/1 returns the pill with given id" do
      pill = pill_fixture()
      assert Pills.get_pill!(pill.id) == pill
    end

    test "create_pill/1 with valid data creates a pill" do
      valid_attrs = %{manufacturer: "some manufacturer", name: "some name"}

      assert {:ok, %Pill{} = pill} = Pills.create_pill(valid_attrs)
      assert pill.manufacturer == "some manufacturer"
      assert pill.name == "some name"
    end

    test "create_pill/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Pills.create_pill(@invalid_attrs)
    end

    test "update_pill/2 with valid data updates the pill" do
      pill = pill_fixture()
      update_attrs = %{manufacturer: "some updated manufacturer", name: "some updated name"}

      assert {:ok, %Pill{} = pill} = Pills.update_pill(pill, update_attrs)
      assert pill.manufacturer == "some updated manufacturer"
      assert pill.name == "some updated name"
    end

    test "update_pill/2 with invalid data returns error changeset" do
      pill = pill_fixture()
      assert {:error, %Ecto.Changeset{}} = Pills.update_pill(pill, @invalid_attrs)
      assert pill == Pills.get_pill!(pill.id)
    end

    test "delete_pill/1 deletes the pill" do
      pill = pill_fixture()
      assert {:ok, %Pill{}} = Pills.delete_pill(pill)
      assert_raise Ecto.NoResultsError, fn -> Pills.get_pill!(pill.id) end
    end

    test "change_pill/1 returns a pill changeset" do
      pill = pill_fixture()
      assert %Ecto.Changeset{} = Pills.change_pill(pill)
    end
  end
end
