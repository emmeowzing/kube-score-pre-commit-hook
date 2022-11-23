# kube-score pre-commit hook

A [pre-commit](https://pre-commit.com/) hook that runs [kube-score](https://kube-score.com/) against a Helm charts directory.

## Usage

```yaml
repos:
...
- repo: https://github.com/bjd2385/kube-score-pre-commit-hook
    rev: v<latest version>
    hooks:
      - id: kube-score
        args:
          - chart1-dir
          - chart2-dir
          - ...
```

## TODOs

- Finish writing CI bats tests
