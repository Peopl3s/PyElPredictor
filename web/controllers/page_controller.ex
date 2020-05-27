defmodule PhoenixMl.PageController do
  use PhoenixMl.Web, :controller

  alias PhoenixMl.ModelPredictor, as: ML

  def index(conn, _params) do
    render conn, "index.html"
  end

  def show(conn, %{
        "rooms_in_house" => rooms_in_house,
        "dist" => dist,
        "floor_in_house" => floor_in_house,
        "surface" => surface
      }) do
    with {rooms_in_house, _} <- Float.parse(rooms_in_house),
         {dist, _} <- Float.parse(dist),
         {floor_in_house, _} <- Float.parse(floor_in_house),
         {surface, _} <- Float.parse(surface) do
      class = ML.predict([[rooms_in_house, dist, floor_in_house, surface]])

      conn
      |> put_flash(:info, "The predicted cost of renting an apartment: " <> to_string(class))
      |> render("index.html")
    else
      _error ->
        conn
        |> put_flash(:error, "Invalid parameters!")
        |> render("index.html")
    end
  end
end
