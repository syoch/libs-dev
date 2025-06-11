# libs-dev

@syoch のライブラリ開発用リポジトリ

## コマンドスニペット
```bash
# GitHub Action のテスト
act --secret-file .devcontainer/.env -s "NNCT_ROBO_PRIVATE_KEY=$(< .devcontaier/pkey.pem)"
```

## To-Do
static-mbed-os-src に mbed-ce のソースを任せる ()
stm32cube-f303k8, stm32cube-f446re を作る