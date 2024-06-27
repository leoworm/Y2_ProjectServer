defmodule ProjectserverWeb.PageController do
  use ProjectserverWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
