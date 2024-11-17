
# Elixir Project Development Guide

This guide outlines the commands and steps for setting up and working with the Elixir project using Docker Compose, Phoenix, and other necessary tools.

---

## Table of Contents
1. [Building and Running the Docker Container](#building-and-running-the-docker-container)
2. [Running Commands Inside the Container](#running-commands-inside-the-container)
3. [Installing Dependencies](#installing-dependencies)
4. [Generating Documentation](#generating-documentation)
5. [Installing Phoenix Framework](#installing-phoenix-framework)
6. [Node Version Manager (NVM) Setup](#node-version-manager-nvm-setup)
7. [Compiling and Running the Application](#compiling-and-running-the-application)
8. [Database Operations](#database-operations)
9. [Debugging the Application](#debugging-the-application)
10. [Managing Dependencies](#managing-dependencies)
11. [Setting Up ASDF for Version Management](#setting-up-asdf-for-version-management)
12. [Checking Erlang Version](#checking-erlang-version)

---

### Building and Running the Docker Container

To build and run the container using Docker Compose:

```bash
docker-compose up --build
```

Run in detached mode:

```bash
docker-compose up -d
```

---

### Running Commands Inside the Container

Access the Elixir container's shell:

```bash
docker-compose exec elixir_dev /bin/bash
```

Once inside, open the interactive Elixir shell:

```bash
iex -S mix
```

---

### Installing Dependencies

To install project dependencies:

```bash
mix deps.get
```

---

### Generating Documentation

Generate project documentation using:

```bash
mix docs
```

---

### Installing Phoenix Framework

Download and install Phoenix framework:

```bash
curl -o phoenix_new-1.2.5.ez https://raw.githubusercontent.com/phoenixframework/archives/master/phoenix_new-1.2.5.ez
mix archive.install phoenix_new-1.2.5.ez
```

---

### Node Version Manager (NVM) Setup

Install and use Node.js version 16.13.0:

```bash
nvm install v16.13.0
nvm use v16.13.0
```

Install Node.js dependencies and build assets:

```bash
npm install && node node_modules/brunch/bin/brunch build
```

---

### Compiling and Running the Application

To create the database, compile the project, and start the server:

```bash
mix ecto.create
mix phx.server
```

---

### Debugging the Application

Start the Phoenix server in debugging mode (similar to `rails c`):

```bash
iex -S mix phx.server
```

---

### Database Operations

#### Create a Database Migration
To create a new migration (e.g., add a `topics` table):

```bash
mix ecto.gen.migration add_topics
```

#### Run Migrations
Apply migrations to the database:

```bash
mix ecto.migrate
```

---

### Managing Dependencies

#### Compile Dependencies
```bash
mix deps.compile
```

#### Clean Dependencies
```bash
mix deps.clean --all
```

#### Update a Specific Dependency
```bash
mix deps.update expo
```

#### Rebar Installation
```bash
mix local.rebar --force
```

---

### Setting Up ASDF for Version Management

Install ASDF version manager:

```bash
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.10.0
echo '. $HOME/.asdf/asdf.sh' >> ~/.bashrc
export PATH="$HOME/.asdf/shims:$HOME/.asdf/bin:$PATH"
source ~/.bashrc
```

#### Add Plugins and Install Versions
For Elixir:

```bash
asdf plugin add elixir
asdf install elixir 1.13.4
asdf global elixir 1.13.4
```

For Erlang:

```bash
asdf plugin add erlang
asdf install erlang 25.0
asdf global erlang 25.0
```

---

### Checking Erlang Version

To verify the installed Erlang version:

```bash
erl -eval '{ok, Version} = file:read_file(filename:join([code:root_dir(), "releases", erlang:system_info(otp_release), "OTPVERSION"])), io:fwrite(Version), halt().' -noshell
```

---

This README provides all necessary commands with detailed explanations for seamless development and debugging in your Elixir project.
