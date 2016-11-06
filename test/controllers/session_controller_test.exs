defmodule SessionControllerTest do
  use Events.ConnCase

  test "GET /login", %{conn: conn} do
    conn = get conn, "/login"
    assert html_response(conn, 200) =~ "Admin Login"
  end

  test "POST /login with valid password", %{conn: conn} do
    conn = post conn, "/login", ["password": "sattar"]
    assert redirected_to(conn, 302) =~ "/admin"
  end

  test "POST /login with invalid password", %{conn: conn} do
    conn = post conn, "/login", ["password": "invalid_password"]
    assert html_response(conn, 200) =~ "Incorrect password."
  end
end
