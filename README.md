### Build and run the container with Docker Compose:

```
docker-compose up --build
```

Run Elixir commands inside the container:

```
docker-compose run elixir_dev bash
```

Open the terminal
```
iex -S mix
```

Install new dependencies(gems?)
```
mix deps.get
```
