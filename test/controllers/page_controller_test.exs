defmodule Events.PageControllerTest do
  use Events.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "ThoughtWorks Hyderabad"
  end
end
