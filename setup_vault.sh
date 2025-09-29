#!/bin/bash
# 프로젝트 로컬 전용 Vault 비밀번호 파일 생성기

VAULT_FILE="./vault_pass.txt"
PASSWORD="p@ssw0rd"

if [ -f "$VAULT_FILE" ]; then
    echo "[INFO] $VAULT_FILE 이미 존재합니다. (건너뜀)"
else
    echo "$PASSWORD" > "$VAULT_FILE"
    chmod 600 "$VAULT_FILE"
    echo "[INFO] $VAULT_FILE 생성 완료"
fi

