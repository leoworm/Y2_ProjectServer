defmodule Projectserver.DatabasesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Projectserver.Databases` context.
  """

  @doc """
  Generate a database.
  """
  def database_fixture(attrs \\ %{}) do
    {:ok, database} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> Projectserver.Databases.create_database()

    database
  end
end
