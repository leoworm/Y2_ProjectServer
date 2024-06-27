defmodule Projectserver.DevicePillsTest do
  use Projectserver.DataCase

  alias Projectserver.DevicePills

  describe "device_pills" do
    alias Projectserver.DevicePills.DevicePill

    import Projectserver.DevicePillsFixtures

    @invalid_attrs %{device_id: nil, pill_id: nil}

    test "list_device_pills/0 returns all device_pills" do
      device_pill = device_pill_fixture()
      assert DevicePills.list_device_pills() == [device_pill]
    end

    test "get_device_pill!/1 returns the device_pill with given id" do
      device_pill = device_pill_fixture()
      assert DevicePills.get_device_pill!(device_pill.id) == device_pill
    end

    test "create_device_pill/1 with valid data creates a device_pill" do
      valid_attrs = %{device_id: 42, pill_id: 42}

      assert {:ok, %DevicePill{} = device_pill} = DevicePills.create_device_pill(valid_attrs)
      assert device_pill.device_id == 42
      assert device_pill.pill_id == 42
    end

    test "create_device_pill/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = DevicePills.create_device_pill(@invalid_attrs)
    end

    test "update_device_pill/2 with valid data updates the device_pill" do
      device_pill = device_pill_fixture()
      update_attrs = %{device_id: 43, pill_id: 43}

      assert {:ok, %DevicePill{} = device_pill} = DevicePills.update_device_pill(device_pill, update_attrs)
      assert device_pill.device_id == 43
      assert device_pill.pill_id == 43
    end

    test "update_device_pill/2 with invalid data returns error changeset" do
      device_pill = device_pill_fixture()
      assert {:error, %Ecto.Changeset{}} = DevicePills.update_device_pill(device_pill, @invalid_attrs)
      assert device_pill == DevicePills.get_device_pill!(device_pill.id)
    end

    test "delete_device_pill/1 deletes the device_pill" do
      device_pill = device_pill_fixture()
      assert {:ok, %DevicePill{}} = DevicePills.delete_device_pill(device_pill)
      assert_raise Ecto.NoResultsError, fn -> DevicePills.get_device_pill!(device_pill.id) end
    end

    test "change_device_pill/1 returns a device_pill changeset" do
      device_pill = device_pill_fixture()
      assert %Ecto.Changeset{} = DevicePills.change_device_pill(device_pill)
    end
  end
end
