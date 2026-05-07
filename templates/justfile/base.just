PROJECT_ROOT := justfile_directory()

default:
    @just --list

leak-check:
    gitleaks protect --staged --redact --no-banner

no-jpn DIRS="src":
    rg '[\p{Han}\p{Hiragana}\p{Katakana}]' {{ DIRS }} && exit 1 || exit 0
