defmodule ProjectserverWeb.DatabaseView do
  use ProjectserverWeb, :view
  alias ProjectserverWeb.DatabaseView

  def render("index.json", %{db: db}) do
    %{data: render_many(db, DatabaseView, "database.json")}
  end

  def render("show.json", %{database: database}) do
    %{data: render_one(database, DatabaseView, "database.json")}
  end

  def render("database.json", %{database: database}) do
    %{
      id: database.id,
      name: database.name
    }
  end
end
