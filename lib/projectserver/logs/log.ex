defmodule Projectserver.Logs.Log do
  use Ecto.Schema
  import Ecto.Changeset

  schema "logs" do
    field :device_id, :integer
    field :log_content, :string

    timestamps()
  end

  @doc false
  def changeset(log, attrs) do
    log
    |> cast(attrs, [:device_id, :log_content])
    |> validate_required([:device_id, :log_content])
  end
end
