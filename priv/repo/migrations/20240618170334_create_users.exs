defmodule Projectserver.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :username, :string
      add :password, :string
      add :role, :string

      timestamps()
    end
  end
end
