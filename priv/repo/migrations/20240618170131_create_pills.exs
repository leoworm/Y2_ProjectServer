defmodule Projectserver.Repo.Migrations.CreatePills do
  use Ecto.Migration

  def change do
    create table(:pills) do
      add :name, :string
      add :manufacturer, :string

      timestamps()
    end
  end
end
