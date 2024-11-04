### Build and run the container with Docker Compose:

```
docker-compose up --build
```

Run Elixir commands inside the container:

```
docker-compose exec elixir_dev /bin/bash
```

Open the terminal
```
iex -S mix
```

Install new dependencies(gems?)
```
mix deps.get
```

To generate documentation
```
mix docs
```

Install phoenix
```
curl -o phoenix_new-1.2.5.ez https://raw.githubusercontent.com/phoenixframework/archives/master/phoenix_new-1.2.5.ez
mix archive.install phoenix_new-1.2.5.ez
```

NVM
```
nvm install v16.13.0
nvm use v16.13.0
npm install && node node_modules/brunch/bin/brunch build
```
