# Ansible Role: Web-WAS-DB

이 Role은 **Nginx + Tomcat + MariaDB** 기반의 Web/WAS/DB 스택을 설치하고 설정합니다.  
`Doli2425.web_was_db` 로 Ansible Galaxy에서 설치할 수 있습니다.

---

## 🚀 기능
- Java, Nginx, Tomcat, MariaDB 설치
- Tomcat 서비스 실행 및 관리
- Nginx Reverse Proxy 설정 (`templates/nginx-tomcat.conf.j2`)
- MariaDB 서비스 실행 및 방화벽 포트 개방 (3306)
- Firewalld 포트 개방 (80, 443, 3306)
- SELinux boolean(httpd_can_network_connect) 설정

---

## 📦 요구 사항
- 지원 OS: RHEL/CentOS 9 계열
- 최소 Ansible 버전: 2.14 이상

---

## ⚙️ 변수 (defaults/main.yml)

| 변수명           | 기본값     | 설명                  |
|------------------|------------|-----------------------|
| `nginx_port`     | 80         | Nginx 서비스 포트     |
| `https_port`     | 443        | HTTPS 서비스 포트     |
| `db_port`        | 3306       | MariaDB 포트          |
| `tomcat_port`    | 8080       | Tomcat 서비스 포트    |

---

## 📘 사용 예시

```yaml
- hosts: webservers
  become: true
  roles:
    - role: Doli2425.web_was_db
      vars:
        tomcat_port: 8080
        db_port: 3306
