FROM avert/elixir-phoenix:v1.2.5
# Existing content
WORKDIR /workspace
VOLUME /workspace

# Start with an interactive shell
CMD ["/bin/bash"]
