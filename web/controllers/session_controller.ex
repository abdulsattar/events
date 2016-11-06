defmodule Events.SessionController do
  use Events.Web, :controller

  def new(conn, _params) do
    render conn
  end

  def create(conn, params) do
    if System.get_env("ADMIN_PASSWORD") == params["password"] do
      IO.puts "Logged in"
    else
      conn
      |> put_flash(:error, "Incorrect password.")
      |> render(:new)
    end
  end
end
