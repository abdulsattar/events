defmodule Events.PageController do
  use Events.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def unauthenticated(conn, _params) do
    conn
    |> put_flash(:error, "You need to be signed in to access that page.")
    |> redirect(to: "/")
  end
end
