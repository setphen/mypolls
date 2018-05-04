defmodule Blag.PollController do
  use Blag.Web, :controller
  alias Blag.{Poll, Option, Vote}
  alias Blag.Repo

  def index(conn, _params) do
    conn
    |> render "index.html"
  end

  def new(conn, _params) do
    changeset = Poll.changeset(%Poll{options: [%Option{}]})
    render conn, "new_poll.html", changeset: changeset
  end

  def create(conn, %{"poll" => poll_params}) do

    IO.inspect poll_params
    poll_changeset = Poll.changeset(%Poll{}, poll_params)

    if poll_changeset.valid? do
      Repo.insert!(poll_changeset)

      conn
      |> put_flash(:info, "Created a new poll successfully")
      |> render "index.html"
    else
      conn
      |> put_flash(:error, "Something went wrong. Poll was not created.")
      |> render "index.html"
    end

  end

  def show(conn, %{"id" => id}) do
    poll = Repo.get(Poll, id)
           |> Repo.preload([options: [:votes]])
    conn
    |> assign(:poll, poll)
    |> render "show.html"
  end
end
