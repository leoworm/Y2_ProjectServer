defmodule Projectserver.DeviceUsersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Projectserver.DeviceUsers` context.
  """

  @doc """
  Generate a device_user.
  """
  def device_user_fixture(attrs \\ %{}) do
    {:ok, device_user} =
      attrs
      |> Enum.into(%{
        device_id: 42,
        user_id: 42
      })
      |> Projectserver.DeviceUsers.create_device_user()

    device_user
  end
end
