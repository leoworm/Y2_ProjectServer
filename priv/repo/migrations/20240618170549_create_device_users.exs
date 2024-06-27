defmodule Projectserver.Repo.Migrations.CreateDeviceUsers do
  use Ecto.Migration

  def change do
    create table(:device_users) do
      add :user_id, :integer
      add :device_id, :integer

      timestamps()
    end
  end
end
