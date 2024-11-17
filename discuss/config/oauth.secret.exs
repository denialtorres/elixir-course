import Config

config :ueberauth, Ueberauth,
  providers: [
      github: { Ueberauth.Strategy.Github, [] }
  ],
  json_library: Jason

config :ueberauth, Ueberauth.Strategy.Github.OAuth,
  client_id: System.get_env("GITHUB_CLIENT_ID"),
  client_secret: System.get_env("GITHUB_CLIENT_SECRET"),
  headers: [{"User-Agent", "denialtorres"}]
