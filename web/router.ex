defmodule Blag.Router do
  use Blag.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Blag do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/hello", HelloController, :index
    get "/hello/:messenger", HelloController, :show
    resources "/poll", PollController, except: [:delete]
    resources "/vote", VoteController, only: [:create]
  end

  # Other scopes may use custom stacks.
  # scope "/api", Blag do
  #   pipe_through :api
  # end
end
