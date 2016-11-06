defmodule Events.SessionController do
  use Events.Web, :controller

  def new(conn, _params) do
    render conn
  end

  def create(conn, params) do
    if System.get_env("ADMIN_PASSWORD") == params["password"] do
      conn
      |> Guardian.Plug.sign_in("admin")
      |> redirect(to: "/admin")
    else
      conn
      |> put_flash(:error, "Incorrect password.")
      |> render(:new)
    end
  end

  def delete(conn, _params) do
    conn
    |> Guardian.Plug.sign_out
    |> put_flash(:info, "Logged out successfully.")
    |> redirect(to: "/")
  end
end
