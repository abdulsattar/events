defmodule AdminControllerTest do
  use Events.ConnCase

  test "GET /admin while logged in", %{conn: conn} do
    conn = admin_login() |> get("/admin")
    assert html_response(conn, 200) =~ "Welcome"
  end

  test "GET /admin without logging in", %{conn: conn} do
    conn = conn |> get("/admin")
    assert redirected_to(conn, 302) =~ "/"
  end


  defp admin_login() do
    guardian_login("admin")
  end

  defp guardian_login(user, token \\ :token, opts \\ []) do
    build_conn()
      |> bypass_through(Events.Router, [:browser])
      |> get("/")
      |> Guardian.Plug.sign_in(user, token, opts)
      |> send_resp(200, "Flush the session yo")
      |> recycle()
  end
end
