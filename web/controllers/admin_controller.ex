defmodule Events.AdminController do
  use Events.Web, :controller

  def dashboard(conn, _params) do
    render conn, "dashboard.html"
  end
end
