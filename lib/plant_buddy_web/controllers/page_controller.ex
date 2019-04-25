defmodule PlantBuddyWeb.PageController do
  use PlantBuddyWeb, :controller

  def index(conn, _params) do
    conn |> redirect(to: "/plants") |> halt()
    # render conn, "index.html"
  end
end
