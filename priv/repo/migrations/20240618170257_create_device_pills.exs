defmodule Projectserver.Repo.Migrations.CreateDevicePills do
  use Ecto.Migration

  def change do
    create table(:device_pills) do
      add :device_id, :integer
      add :pill_id, :integer

      timestamps()
    end
  end
end
