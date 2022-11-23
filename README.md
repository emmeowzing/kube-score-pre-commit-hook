# kube-score pre-commit hook

A [pre-commit](https://pre-commit.com/) hook that runs [kube-score](https://github.com/zegl/kube-score) against a Helm charts directory (defaults to charts/).

## Usage

```shell
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
