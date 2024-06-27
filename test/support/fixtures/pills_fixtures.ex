defmodule Projectserver.PillsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Projectserver.Pills` context.
  """

  @doc """
  Generate a pill.
  """
  def pill_fixture(attrs \\ %{}) do
    {:ok, pill} =
      attrs
      |> Enum.into(%{
        manufacturer: "some manufacturer",
        name: "some name"
      })
      |> Projectserver.Pills.create_pill()

    pill
  end
end
