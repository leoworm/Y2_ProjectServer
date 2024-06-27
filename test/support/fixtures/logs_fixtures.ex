defmodule Projectserver.LogsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Projectserver.Logs` context.
  """

  @doc """
  Generate a log.
  """
  def log_fixture(attrs \\ %{}) do
    {:ok, log} =
      attrs
      |> Enum.into(%{
        device_id: 42,
        log_content: "some log_content"
      })
      |> Projectserver.Logs.create_log()

    log
  end
end
