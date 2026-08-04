default:
    @echo "Available commands:"
    @echo "  just build"
    @echo "  just test"
    @echo "  just run"


build:
    cargo build


run:
    cargo run


test:
    cargo test


python:
    uv run python main.py


format:
    cargo fmt
    ruff format .
