defmodule PhoenixMl.PageControllerTest do
  use PhoenixMl.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Please"
  end
end
