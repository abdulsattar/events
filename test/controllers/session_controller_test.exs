defmodule SessionControllerTest do
  use Events.ConnCase

  test "GET /login", %{conn: conn} do
    conn = get conn, "/login"
    assert html_response(conn, 200) =~ "Admin Login"
  end
end
