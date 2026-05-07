fix-rs:
    cargo clippy --fix --allow-dirty --allow-staged --all-targets --workspace -- -D warnings

fmt-rs: fix-rs
    cargo fmt --all

lint-rs:
    cargo clippy --all-targets --all-features --workspace -- -D warnings
    cargo fmt --all -- --check

test-rs:
    cargo test --workspace

check-rs: lint-rs test-rs

dep:
    cargo depgraph --workspace-only | dot -Tsvg > deps.svg
