defmodule ProjectserverWeb.ApiView do
  use ProjectserverWeb, :view
  alias ProjectserverWeb.ApiView

  def render("index.json", log_data: log_data) do
    %{data: render_many(log_data, ApiView, "logs.json")}
  end

  def render("pills.json", %{log_data: log_data}) do
    %{
      id: log_data.id
    }

  end

end
