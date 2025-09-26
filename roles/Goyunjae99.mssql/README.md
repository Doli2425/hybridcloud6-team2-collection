# Ansible Role: ansible-role-mssql

이 Role은 **CentOS/RHEL 9** 환경에서 Microsoft SQL Server 2022를 설치하고 설정하기 위한 Ansible Role입니다.  
Vault를 사용하여 SA 비밀번호를 안전하게 관리합니다.

## Requirements
- CentOS/RHEL 9
- Ansible >= 2.9

## Role Variables
`group_vars/all/vault.yml` 파일 안에 SA 비밀번호를 정의해야 합니다.

예시:
```yaml
vault_mssql_sa_password: "p@ssw0rd"

