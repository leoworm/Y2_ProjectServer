defmodule Projectserver.DeviceUsersTest do
  use Projectserver.DataCase

  alias Projectserver.DeviceUsers

  describe "device_users" do
    alias Projectserver.DeviceUsers.DeviceUser

    import Projectserver.DeviceUsersFixtures

    @invalid_attrs %{device_id: nil, user_id: nil}

    test "list_device_users/0 returns all device_users" do
      device_user = device_user_fixture()
      assert DeviceUsers.list_device_users() == [device_user]
    end

    test "get_device_user!/1 returns the device_user with given id" do
      device_user = device_user_fixture()
      assert DeviceUsers.get_device_user!(device_user.id) == device_user
    end

    test "create_device_user/1 with valid data creates a device_user" do
      valid_attrs = %{device_id: 42, user_id: 42}

      assert {:ok, %DeviceUser{} = device_user} = DeviceUsers.create_device_user(valid_attrs)
      assert device_user.device_id == 42
      assert device_user.user_id == 42
    end

    test "create_device_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = DeviceUsers.create_device_user(@invalid_attrs)
    end

    test "update_device_user/2 with valid data updates the device_user" do
      device_user = device_user_fixture()
      update_attrs = %{device_id: 43, user_id: 43}

      assert {:ok, %DeviceUser{} = device_user} = DeviceUsers.update_device_user(device_user, update_attrs)
      assert device_user.device_id == 43
      assert device_user.user_id == 43
    end

    test "update_device_user/2 with invalid data returns error changeset" do
      device_user = device_user_fixture()
      assert {:error, %Ecto.Changeset{}} = DeviceUsers.update_device_user(device_user, @invalid_attrs)
      assert device_user == DeviceUsers.get_device_user!(device_user.id)
    end

    test "delete_device_user/1 deletes the device_user" do
      device_user = device_user_fixture()
      assert {:ok, %DeviceUser{}} = DeviceUsers.delete_device_user(device_user)
      assert_raise Ecto.NoResultsError, fn -> DeviceUsers.get_device_user!(device_user.id) end
    end

    test "change_device_user/1 returns a device_user changeset" do
      device_user = device_user_fixture()
      assert %Ecto.Changeset{} = DeviceUsers.change_device_user(device_user)
    end
  end
end
