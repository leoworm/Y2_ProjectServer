defmodule Projectserver.UsersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Projectserver.Users` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        password: "some password",
        role: "some role",
        username: "some username"
      })
      |> Projectserver.Users.create_user()

    user
  end
end
