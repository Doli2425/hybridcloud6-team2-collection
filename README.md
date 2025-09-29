# 🌐 Hybridcloud6 Team2 Collection

본 저장소는 **하이브리드 클라우드 환경 구축**을 위한 Ansible Role 모음집입니다.  
FTP, Web/WAS/DB, MSSQL, DNS, LB, NFS, Monitoring(Graylog, Elasticsearch, MongoDB), web 이중화 등 다양한 서비스를 자동화할 수 있습니다.

---

## 📑 목차

1. [요구사항]
2. [설치 방법]
3. [Vault 초기화]
4. [플레이북 실행]
5. [Role 목록]

---

## 1. ⚙ 요구사항

* **Ansible** 2.14 이상 (CentOS Stream 9 기준 테스트됨)
* **Python** 3.9 이상
* **sudo 권한**이 있는 계정
* `setup_vault.sh` 실행 시 프로젝트 전용 `vault_pass.txt` 자동 생성

---

## 2. 📥 설치 방법

**저장소 클론**

   ```bash
   git clone https://github.com/Doli2425/hybridcloud6-team2-collection.git
   cd hybridcloud6-team2-collection
   ```
**Role 설치**
   ```bahs
   ansible-galaxy install -r requirements.yml
   ```
👉 requirements.yml 에 정의된 모든 Role 이 자동 설치됩니다.

## 3. 🔑 Vault 초기화
   이 프로젝트는 비밀번호 파일을 직접 올리지 않고, 자동 생성 스크립트(setup_vault.sh)를 제공합니다.
   클론 받은 뒤 최초 1회 실행만 하면 됩니다.
   ```bash
   ./setup_vault.sh
   ```
실행 후 프로젝트 루트에 vault_pass.txt 가 자동 생성되며, Ansible 실행 시 자동으로 사용됩니다.

## 4. 🚀 플레이북 실행

* 전체 실행 (추가 옵션 불필요)
```bash
ansible-playbook playbooks.yml
```

* 특정 태그 실행
```bash
ansible-playbook playbooks.yml --tags "mail"
```

* 특정 태그만 스킵
```bash
ansible-playbook playbooks.yml --skip-tags "monitoring"
```
📌 -K(sudo password) 입력이나 --vault-password-file 옵션을 따로 줄 필요 없음.

## 5. 📂 Role 목록

<table>
  <thead>
    <tr>
      <th>Role 이름</th>
      <th>작성자</th>
      <th>실행 태그</th>
      <th>설명</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>Doli2425.ftp</code></td>
      <td>Doli2425</td>
      <td><code>ftp</code></td>
      <td>FTP 서버 설치 및 설정</td>
    </tr>
    <tr>
      <td><code>Doli2425.web_was_db</code></td>
      <td>Doli2425</td>
      <td><code>webwasdb</code></td>
      <td>
        Web/WAS/DB 환경 통합 구축
      </td>
    </tr>
    <tr>
      <td><code>FakePhDKo.Real_Mail_Role</code></td>
      <td>FakePhDKo</td>
      <td><code>mail</code></td>
      <td>
        Mail 서버 Role
      </td>
    </tr>
    <tr>
      <td><code>Goyunjae99.mssql</code></td>
      <td>Goyunjae99</td>
      <td><code>mssql</code></td>
      <td>MSSQL 설치 및 초기 설정</td>
    </tr>
    <tr>
      <td><code>leeeeejieun.dns</code></td>
      <td>leeeeejieun</td>
      <td><code>dns</code></td>
      <td>DNS(BIND) 서버 구성</td>
    </tr>
    <tr>
      <td><code>kangbum01.web</code></td>
      <td rowspan="3">kangbum01</td>
      <td rowspan="3"><code>web</code></td>
      <td>Web 서버 구성 (vhost 지원)</td>
    </tr>
    <tr>
      <td><code>kangbum01.lb</code></td>
      <td>HAProxy 기반 Load Balancer 구성</td>
    </tr>
    <tr>
      <td><code>kangbum01.nfs</code></td>
      <td>NFS 서버 구성</td>
    </tr>
    <tr>
      <td><code>cong-0306.common</code></td>
      <td rowspan="4">cong-0306</td>
      <td rowspan="4"><code>monitoring</code></td>
      <td>공통 패키지 및 기본 설정</td>
    </tr>
    <tr>
      <td><code>cong-0306.elasticsearch</code></td>
      <td>Elasticsearch 설치 및 설정</td>
    </tr>
    <tr>
      <td><code>cong-0306.graylog</code></td>
      <td>Graylog 로그 수집/분석</td>
    </tr>
    <tr>
      <td><code>cong-0306.mongodb</code></td>
      <td>MongoDB 설치 및 설정</td>
    </tr>
  </tbody>
</table>

