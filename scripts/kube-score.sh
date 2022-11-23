#! /usr/bin/env bash
# Run kube-score against a Helm charts directory.

set -eo pipefail


if [ $# -lt 1 ]; then
    printf "ERROR: Must specify at least one Helm chart directory to score.\\n" >&2
    exit 1
fi


# Check for a bunch of dependencies for this hook.
if ! command -v kubectl >/dev/null; then
    printf "ERROR: Missing kubectl dependency (https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/)\\n" >&2
    exit 1
fi

# Test if kube-score is installed as a binary or krew plugin.
# krew plugins are installed as kubectl-{package name}, so the binary should be named the same thing if it's installed that way.
if ! command -v kubectl-score >/dev/null; then
    printf "ERROR: Missing kube-score binary or krew plugin.\\n" >&2
    exit 1
fi

if ! command -v helm >/dev/null; then
    printf "ERROR: Missing Helm dependency (https://helm.sh/docs/intro/install/)." >&2
    exit 1
fi


for arg in "$@"; do
    if [ -d "$arg" ]; then
        helm template "$arg" | kube-score score -
    elif [ ! -d "$arg" ] && [ $# -eq 1 ]; then
        printf "ERROR: Helm requires a directory as the first argument to this hook to produce a template for kube-score to score.\\n" >&2
        exit 1
    else
        break
    fi
done
