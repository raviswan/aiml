# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :learningai,
  ecto_repos: [Learningai.Repo]

# Configures the endpoint
config :learningai, LearningaiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "LDhKUyYo/b4Et1rMMqY1oi8kAWn2EKoih6PiGlVO00GxXFkX0EGyz6FN/LfD5YH7",
  render_errors: [view: LearningaiWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Learningai.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :ueberauth, Ueberauth,
    providers: [
        github: { Ueberauth.Strategy.Github, [] },
        google: {Ueberauth.Strategy.Google, []},
        facebook: { Ueberauth.Strategy.Facebook, [] }
    ]

config :ueberauth, Ueberauth.Strategy.Github.OAuth,
    client_id: System.get_env("GITHUB_CLIENT_ID"),
    client_secret: System.get_env("GITHUB_CLIENT_SECRET")

config :ueberauth, Ueberauth.Strategy.Google.OAuth,
  client_id: System.get_env("GOOGLE_CLIENT_SECRET"),
  client_secret: System.get_env("GOOGLE_CLIENT_SECRET")


config :ueberauth, Ueberauth.Strategy.Facebook.OAuth,
  client_id: System.get_env("FACEBOOK_CLIENT_ID"),
  client_secret: System.get_env("FACEBOOK_CLIENT_SECRET")
# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
config :arc,
  storage: Arc.Storage.Local

import_config "#{Mix.env}.exs"