defmodule Projectserver.DevicePills.DevicePill do
  use Ecto.Schema
  import Ecto.Changeset

  schema "device_pills" do
    field :device_id, :integer
    field :pill_id, :integer

    timestamps()
  end

  @doc false
  def changeset(device_pill, attrs) do
    device_pill
    |> cast(attrs, [:device_id, :pill_id])
    |> validate_required([:device_id, :pill_id])
  end
end
