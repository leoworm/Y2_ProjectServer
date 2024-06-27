defmodule Projectserver.Repo.Migrations.CreateDeviceContents do
  use Ecto.Migration

  def change do
    create table(:device_contents) do
      add :device_id, :integer
      add :pill_name, :string
      add :amount, :integer
      add :position, :integer

      timestamps()
    end
  end
end
