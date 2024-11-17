# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
import Config

# General application configuration
config :discuss,
  ecto_repos: [Discuss.Repo]

# Configures the endpoint
config :discuss, Discuss.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "S5wkoYvHmL36Fipfrjn4YglDcOyxGKjSHIKQHx/tq5luxKfgjRfw6Z2Y7StXSGtm",
  render_errors: [view: Discuss.ErrorView, accepts: ~w(html json)],
  pubsub_server: Discuss.PubSub
# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :oauth2,
  serializers: %{
      "application/vnd.api+json" => Jason,
      "application/json" => Jason,
    }
# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
import_config "oauth.secret.exs"
