defmodule Projectserver.Repo.Migrations.CreateSchedules do
  use Ecto.Migration

  def change do
    create table(:schedules) do
      add :device_id, :integer
      add :date_time, :string
      add :pill_id, :integer

      timestamps()
    end
  end
end
