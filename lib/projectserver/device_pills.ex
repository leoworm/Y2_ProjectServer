defmodule Projectserver.DevicePills do
  @moduledoc """
  The DevicePills context.
  """

  import Ecto.Query, warn: false
  alias Projectserver.Repo

  alias Projectserver.DevicePills.DevicePill

  @doc """
  Returns the list of device_pills.

  ## Examples

      iex> list_device_pills()
      [%DevicePill{}, ...]

  """
  def list_device_pills do
    Repo.all(DevicePill)
  end

  @doc """
  Gets a single device_pill.

  Raises `Ecto.NoResultsError` if the Device pill does not exist.

  ## Examples

      iex> get_device_pill!(123)
      %DevicePill{}

      iex> get_device_pill!(456)
      ** (Ecto.NoResultsError)

  """
  def get_device_pill!(id), do: Repo.get!(DevicePill, id)

  @doc """
  Creates a device_pill.

  ## Examples

      iex> create_device_pill(%{field: value})
      {:ok, %DevicePill{}}

      iex> create_device_pill(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_device_pill(attrs \\ %{}) do
    %DevicePill{}
    |> DevicePill.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a device_pill.

  ## Examples

      iex> update_device_pill(device_pill, %{field: new_value})
      {:ok, %DevicePill{}}

      iex> update_device_pill(device_pill, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_device_pill(%DevicePill{} = device_pill, attrs) do
    device_pill
    |> DevicePill.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a device_pill.

  ## Examples

      iex> delete_device_pill(device_pill)
      {:ok, %DevicePill{}}

      iex> delete_device_pill(device_pill)
      {:error, %Ecto.Changeset{}}

  """
  def delete_device_pill(%DevicePill{} = device_pill) do
    Repo.delete(device_pill)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking device_pill changes.

  ## Examples

      iex> change_device_pill(device_pill)
      %Ecto.Changeset{data: %DevicePill{}}

  """
  def change_device_pill(%DevicePill{} = device_pill, attrs \\ %{}) do
    DevicePill.changeset(device_pill, attrs)
  end
end
