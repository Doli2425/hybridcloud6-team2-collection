# setup_vault.sh
#!/bin/bash
set -euo pipefail

VAULT_FILE="./vault_pass.txt"
# 기본값: p@ssw0rd, 환경변수 VAULT_PASS로 덮어쓸 수 있음
PASSWORD="${VAULT_PASS:-p@ssw0rd}"

if [ -f "$VAULT_FILE" ]; then
  # 파일 내용이 현재 비번과 같으면 유지, 다르면 갱신
  if grep -qxF "$PASSWORD" "$VAULT_FILE"; then
    echo "[INFO] $VAULT_FILE 비밀번호 동일 → 유지"
  else
    echo "$PASSWORD" > "$VAULT_FILE"
    chmod 600 "$VAULT_FILE"
    echo "[INFO] $VAULT_FILE 비밀번호 변경됨 → 갱신 완료"
  fi
else
  echo "$PASSWORD" > "$VAULT_FILE"
  chmod 600 "$VAULT_FILE"
  echo "[INFO] $VAULT_FILE 생성 완료"
fi

