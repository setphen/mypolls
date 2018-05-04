defmodule MyPolls.HelloController do
  use MyPolls.Web, :controller

  def index(conn, _params) do
    conn
    |> put_flash(:info, "Welcome")
    |> render "index.html"
  end

  def show(conn, %{"messenger" => messenger}) do
    render conn, "show.html", messenger: messenger
  end
end
