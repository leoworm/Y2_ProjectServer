defmodule Projectserver.Repo.Migrations.CreateLogs do
  use Ecto.Migration

  def change do
    create table(:logs) do
      add :device_id, :integer
      add :log_content, :string

      timestamps()
    end
  end
end
