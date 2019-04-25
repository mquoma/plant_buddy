# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :plant_buddy,
  ecto_repos: [PlantBuddy.Repo]

# Configures the endpoint
config :plant_buddy, PlantBuddyWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "29dHSrhQCIG0Y9Wm3qXWF6L0tKLjGAHoCC6gx/L0nzFViKJlmTckJDtkULOcd4jc",
  render_errors: [view: PlantBuddyWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PlantBuddy.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
