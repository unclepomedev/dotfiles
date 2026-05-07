lp:
    #!/usr/bin/env bash
    set -e
    rm -rf src/main/gen
    ./gradlew generateLexer generateParser

check:
    ./gradlew check

run:
    ./gradlew runIde
