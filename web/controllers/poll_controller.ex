defmodule Blag.PollController do
  use Blag.Web, :controller
  alias Blag.{Poll, Option}
  alias Blag.Repo

  def index(conn, _params) do
    conn
    |> render "index.html"
  end

  def show(conn, %{"id" => id}) do
    poll = Repo.get(Poll, id)
           |> Repo.preload(options: :poll)
    conn
    |> assign(:poll, poll)
    |> render "show.html"
  end
end
