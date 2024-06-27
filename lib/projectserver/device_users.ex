defmodule Projectserver.DeviceUsers do
  @moduledoc """
  The DeviceUsers context.
  """

  import Ecto.Query, warn: false
  alias Projectserver.Repo

  alias Projectserver.DeviceUsers.DeviceUser

  @doc """
  Returns the list of device_users.

  ## Examples

      iex> list_device_users()
      [%DeviceUser{}, ...]

  """
  def list_device_users do
    Repo.all(DeviceUser)
  end

  @doc """
  Gets a single device_user.

  Raises `Ecto.NoResultsError` if the Device user does not exist.

  ## Examples

      iex> get_device_user!(123)
      %DeviceUser{}

      iex> get_device_user!(456)
      ** (Ecto.NoResultsError)

  """
  def get_device_user!(id), do: Repo.get!(DeviceUser, id)

  @doc """
  Creates a device_user.

  ## Examples

      iex> create_device_user(%{field: value})
      {:ok, %DeviceUser{}}

      iex> create_device_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_device_user(attrs \\ %{}) do
    %DeviceUser{}
    |> DeviceUser.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a device_user.

  ## Examples

      iex> update_device_user(device_user, %{field: new_value})
      {:ok, %DeviceUser{}}

      iex> update_device_user(device_user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_device_user(%DeviceUser{} = device_user, attrs) do
    device_user
    |> DeviceUser.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a device_user.

  ## Examples

      iex> delete_device_user(device_user)
      {:ok, %DeviceUser{}}

      iex> delete_device_user(device_user)
      {:error, %Ecto.Changeset{}}

  """
  def delete_device_user(%DeviceUser{} = device_user) do
    Repo.delete(device_user)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking device_user changes.

  ## Examples

      iex> change_device_user(device_user)
      %Ecto.Changeset{data: %DeviceUser{}}

  """
  def change_device_user(%DeviceUser{} = device_user, attrs \\ %{}) do
    DeviceUser.changeset(device_user, attrs)
  end
end
