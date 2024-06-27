defmodule Projectserver.DevicesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Projectserver.Devices` context.
  """

  @doc """
  Generate a device.
  """
  def device_fixture(attrs \\ %{}) do
    {:ok, device} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> Projectserver.Devices.create_device()

    device
  end
end
