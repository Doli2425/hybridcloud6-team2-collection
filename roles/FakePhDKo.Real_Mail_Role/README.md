# Ansible Postfix Mail Server 역할
이 리포지토리는 Ansible을 사용하여 두 대의 Linux 서버에 Postfix를 설치하고 설정하여 상호 간 메일 통신이 가능한 환경을 자동화하는 역할을 제공합니다.

## 1. 📋 기능
+ Postfix 및 필요한 패키지(s-nail 등) 설치

+ 호스트 간 이름 해석을 위한 /etc/hosts 파일 자동 구성

+ Postfix main.cf 파일 설정

+ firewalld를 이용한 SMTP(25번 포트) 서비스 허용

## 2. 💻 시스템 요구사항
+ 제어 노드: Ansible 2.9 이상이 설치된 Linux 시스템

+ 관리 대상 노드: CentOS 9 (EL9)

+ 네트워크: 관리 대상 노드 간의 SSH 통신이 가능해야 합니다.

## 3. 🚀 사용법
### 1. Git 리포지토리 클론

Bash
```bash
git clone https://github.com/your-username/ansible-postfix-mailserver.git
cd ansible-postfix-mailserver
```

### 2. 인벤토리 파일(inventory) 구성
inventory 파일을 열고 다음과 같이 관리 대상 서버의 정보를 입력합니다.

Ini, TOML
```Ini
[mail_servers]
ansible1 ansible_host=your_ansible1_ip
ansible2 ansible_host=your_ansible2_ip
```

### 3. 변수 파일(host_vars) 구성
host_vars/ 디렉터리에 각 서버의 변수 파일을 생성하고 아래 내용을 추가합니다.
host_vars/ansible1.example1.com.yml

YAML
```yaml
my_hostname: ansible1.example1.com
my_host: ansible1
my_ip: 192.168.10.11
other_hostname: ansible2.example2.com
other_host: ansible2
other_ip: 192.168.10.12
host_vars/ansible2.example2.com.yml
```

YAML
```yaml
my_hostname: ansible2.example2.com
my_host: ansible2
my_ip: 192.168.10.12
other_hostname: ansible1.example1.com
other_host: ansible1
other_ip: 192.168.10.11
```

### 4. 플레이북 실행

Bash

```bash
ansible-playbook -i inventory mail_config.yml
```

## 4. 📁 역할 구조

```


├── defaults/
├── files/
├── handlers/
│   └── main.yml
├── meta/
├── tasks/
│   └── main.yml
├── templates/
│   ├── hosts.j2
│   └── main.cf.j2
├── tests/
└── vars/
└── main.yml
└── README.md
```
