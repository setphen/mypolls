defmodule Blag.VoteController do
  use Blag.Web, :controller
  alias Blag.{Poll, Option, Vote}
  alias Blag.Repo


  def create(conn, %{"option_id" => option_id, "poll_id" => poll_id} = params) do
    changeset = Vote.changeset(%Vote{}, params)
    if changeset.valid? do
      Repo.insert!(changeset)
      conn
      |> put_flash(:info, "Submitted your vote")
      |> redirect(to: poll_path(conn, :show, poll_id))
    else
      conn
      |> put_flash(:error, "Something went wrong. Your vote was not recorded.")
      |> redirect(to: poll_path(conn, :show, poll_id))
      IO.puts changeset.errors
    end
  end

end
