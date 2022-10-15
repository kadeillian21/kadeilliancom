defmodule KadeilliancomWeb.PageController do
  use KadeilliancomWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def projects(conn, _params) do
    render(conn, "projects.html")
  end

  def resources(conn, _params) do
    render(conn, "resources.html")
  end
end
