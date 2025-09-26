# Ansible Role: FTP (vsftpd)

이 Role은 **vsftpd** 기반의 FTP 서버를 설치하고 설정합니다.  
`Doli2425.ftp` 로 Ansible Galaxy에서 설치할 수 있습니다.

---

## 🚀 기능
- vsftpd 패키지 설치
- 기본 설정 파일 배포 (`templates/vsftpd.conf.j2`)
- 허용 사용자 / chroot 리스트 관리
- Firewalld 포트 개방 (2121, 30000-30100)
- 서비스 활성화 및 시작

---

## 📦 요구 사항
- 지원 OS: RHEL/CentOS 9 계열
- 최소 Ansible 버전: 2.14 이상

---

## ⚙️ 변수 (defaults/main.yml)

| 변수명            | 기본값           | 설명                          |
|-------------------|------------------|-------------------------------|
| `ftp_port`        | 2121             | FTP 서비스 포트               |
| `ftp_passive_min` | 30000            | Passive mode 최소 포트         |
| `ftp_passive_max` | 30100            | Passive mode 최대 포트         |
| `ftp_allowed_users` | `["ftpuser"]`  | 허용 사용자 리스트             |

---

## 📘 사용 예시

```yaml
- hosts: ftpservers
  become: true
  roles:
    - role: Doli2425.ftp
      vars:
        ftp_allowed_users:
          - user1
          - user2
