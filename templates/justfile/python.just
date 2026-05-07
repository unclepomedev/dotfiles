PY_DIRS := "src tests"

sync:
    uv sync --all-extras --dev

fmt-py:
    uv run ruff format {{ PY_DIRS }}

lint-py:
    uv run ruff check {{ PY_DIRS }}
    uv run ruff format --check {{ PY_DIRS }}

test-py:
    uv run pytest

ty:
    uv run ty check
