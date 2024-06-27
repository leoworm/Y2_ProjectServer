defmodule Projectserver.Pills.Pill do
  use Ecto.Schema
  import Ecto.Changeset

  schema "pills" do
    field :manufacturer, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(pill, attrs) do
    pill
    |> cast(attrs, [:name, :manufacturer])
    |> validate_required([:name, :manufacturer])
  end
end
