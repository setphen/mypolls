# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :mypolls,
  ecto_repos: [MyPolls.Repo]

# Configures the endpoint
config :mypolls, MyPolls.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "9fokSiB8ocCwoAiNZVAAx/g+y+bFK3MleTn1TUf6pP4xEMfKE4DCtkdX5PQX4qnO",
  render_errors: [view: MyPolls.ErrorView, accepts: ~w(html json)],
  pubsub: [name: MyPolls.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
