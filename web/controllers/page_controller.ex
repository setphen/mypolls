defmodule Blag.PageController do
  use Blag.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
