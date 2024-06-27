defmodule Projectserver.DeviceUsers.DeviceUser do
  use Ecto.Schema
  import Ecto.Changeset

  schema "device_users" do
    field :device_id, :integer
    field :user_id, :integer

    timestamps()
  end

  @doc false
  def changeset(device_user, attrs) do
    device_user
    |> cast(attrs, [:user_id, :device_id])
    |> validate_required([:user_id, :device_id])
  end
end
