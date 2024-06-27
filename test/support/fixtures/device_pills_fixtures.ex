defmodule Projectserver.DevicePillsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Projectserver.DevicePills` context.
  """

  @doc """
  Generate a device_pill.
  """
  def device_pill_fixture(attrs \\ %{}) do
    {:ok, device_pill} =
      attrs
      |> Enum.into(%{
        device_id: 42,
        pill_id: 42
      })
      |> Projectserver.DevicePills.create_device_pill()

    device_pill
  end
end
