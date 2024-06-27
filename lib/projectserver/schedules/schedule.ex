defmodule Projectserver.Schedules.Schedule do
  use Ecto.Schema
  import Ecto.Changeset

  schema "schedules" do
    field :date_time, :string
    field :device_id, :integer
    field :pill_id, :integer

    timestamps()
  end

  @doc false
  def changeset(schedule, attrs) do
    schedule
    |> cast(attrs, [:device_id, :date_time, :pill_id])
    |> validate_required([:device_id, :date_time, :pill_id])
  end
end
