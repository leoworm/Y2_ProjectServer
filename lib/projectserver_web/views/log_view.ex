defmodule ProjectserverWeb.LogView do
  use ProjectserverWeb, :view
  alias ProjectserverWeb.LogView

  def render("index.json", %{logs: logs}) do
    %{data: render_many(logs, LogView, "log.json")}
  end

  def render("show.json", %{log: log}) do
    %{data: render_one(log, LogView, "log.json")}
  end

  def render("log.json", %{log: log}) do
    %{
      id: log.id,
      device_id: log.device_id,
      log_content: log.log_content
    }
  end
end
