defmodule Projectserver.DeviceContent do
  use Ecto.Schema
  import Ecto.Changeset

  schema "device_contents" do
    field :amount, :integer
    field :device_id, :integer
    field :pill_name, :string
    field :position, :integer

    timestamps()
  end

  @doc false
  def changeset(device_content, attrs) do
    device_content
    |> cast(attrs, [:device_id, :pill_name, :amount, :position])
    |> validate_required([:device_id, :pill_name, :amount, :position])
  end
end
