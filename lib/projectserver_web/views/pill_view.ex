defmodule ProjectserverWeb.PillView do
  use ProjectserverWeb, :view
  alias ProjectserverWeb.PillView

  def render("index.json", %{pills: pills}) do
    %{data: render_many(pills, PillView, "pill.json")}
  end

  def render("show.json", %{pill: pill}) do
    %{data: render_one(pill, PillView, "pill.json")}
  end

  def render("pill.json", %{pill: pill}) do
    %{
      id: pill.id,
      name: pill.name,
      manufacturer: pill.manufacturer
    }
  end
end
