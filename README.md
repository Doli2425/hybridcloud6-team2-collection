---

# 🌐 Hybridcloud6 Team2 Collection

본 저장소는 **하이브리드 클라우드 환경 구축**을 위한 Ansible Role 모음집입니다.
FTP, Web/WAS/DB, MSSQL, DNS, LB, NFS, Monitoring(Graylog, Elasticsearch, MongoDB) 등 다양한 서비스를 자동화할 수 있습니다.

---

## 📑 목차

1. [요구사항]
2. [설치 방법]
3. [플레이북 실행]
4. [Role 목록]

---

## ⚙ 요구사항

* **Ansible** 2.14 이상 (CentOS Stream 9 기준 테스트됨)
* **Python** 3.9 이상
* **sudo 권한**이 있는 계정
* Ansible Vault 사용 시 `~/.vault_pass.txt` 필요

---

## 📥 설치 방법

1. **저장소 클론**

   ```bash
   git clone https://github.com/Doli2425/hybridcloud6-team2-collection.git
   cd hybridcloud6-team2-collection
   ```

2. **Role 설치**

   ```bash
   ansible-galaxy install -r requirements.yml
   ```

   👉 `requirements.yml` 에 정의된 모든 Role 이 자동 설치됩니다.

---

## 🚀 플레이북 실행

* **전체 실행**

  ```bash
  ansible-playbook -i inventory.ini playbooks.yml -K \
    --vault-password-file ~/.vault_pass.txt
  ```

* **특정 태그 실행**

  ```bash
  ansible-playbook -i inventory.ini playbooks.yml -K \
  --tags "mail" \
  --vault-password-file ~/.vault_pass.txt
  ```

* **특정 태그만 스킵**

  ```bash
  ansible-playbook -i inventory.ini playbooks.yml -K \
  --skip-tags "monitoring" \
  --vault-password-file ~/.vault_pass.txt
  ```

---

## 📂 Role 목록

| Role 이름                   | 설명                          |
| ------------------------- | --------------------------- |
| `Doli2425.ftp`            | FTP 서버 설치 및 설정              |
| `Doli2425.web_was_db`     | Web/WAS/DB 환경 통합 구축         |
| `Goyunjae99.mssql`        | MSSQL 설치 및 초기 설정            |
| `leeeeejieun.dns`         | DNS(BIND) 서버 구성             |
| `kangbum01.web`           | Web 서버 구성 (vhost)           |
| `kangbum01.lb`            | HAProxy 기반 Load Balancer 구성 |
| `kangbum01.nfs`           | NFS 서버 구성                   |
| `cong-0306.common`        | 공통 패키지 및 기본 설정              |
| `cong-0306.elasticsearch` | Elasticsearch 설치 및 설정       |
| `cong-0306.graylog`       | Graylog 로그 수집/분석            |
| `cong-0306.mongodb`       | MongoDB 설치 및 설정             |

---

