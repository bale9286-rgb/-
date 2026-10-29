CAREER-FLOW NEXUS 모바일 v4 — 로그인·클라우드 동기화 준비본

포함 기능
- 기존 6단계 통합진단, 경로 비교, 90일 계획, A4 보고서
- 이메일 회원가입/로그인/로그아웃
- 로그인 후 사용자별 기록 저장 및 다른 기기에서 불러오기
- 입력은 브라우저에도 로컬 저장되며, 로그인 상태에서는 변경 후 클라우드 자동 저장
- 동기화 충돌 시 현재 브라우저 기록 또는 클라우드 기록 선택

1. Supabase 프로젝트 준비
- Supabase 계정에서 프로젝트를 생성합니다.
- Authentication 설정에서 이메일 가입을 활성화하고, 이메일 인증 여부를 선택합니다.
- Project Settings > API에서 Project URL과 Publishable Key(sb_publishable_...)를 확인합니다.
- supabase-config.js의 두 placeholder를 본인 프로젝트 값으로 바꿉니다.
- service_role/secret key는 브라우저 파일에 절대 넣지 마세요.

2. 테이블 및 보안 정책 적용
- Supabase Dashboard > SQL Editor에서 schema.sql 내용을 실행합니다.
- 테이블 careerflow_records와 RLS 정책이 만들어졌는지 확인합니다.
- 본인 계정으로 로그인해 테스트 기록을 저장한 뒤 다른 브라우저/기기에서 로그인해 불러옵니다.

3. HTTPS 호스팅
- 폴더 전체(index.html, supabase-config.js, schema.sql, manifest, service-worker, 아이콘)를 HTTPS 정적 호스팅에 업로드합니다.
- Supabase Authentication > URL Configuration에서 배포된 사이트 주소를 Site URL 및 허용 Redirect URL에 추가합니다.
- file://로 직접 여는 것보다 HTTPS 호스팅 주소로 테스트하세요.

4. 중요
- 이 ZIP은 연동 준비본입니다. 프로젝트 URL/Publishable Key를 넣고 SQL을 실행하기 전에는 클라우드 저장이 작동하지 않습니다.
- Supabase Auth와 DB를 연결한 후에도 실제 AI API, 실시간 채용공고·임금·훈련 데이터는 아직 연결되어 있지 않습니다.
- 민감정보는 저장하지 마세요. 기관용 운영 전에는 개인정보 처리방침, 동의·보유기간·삭제 절차, 역할별 권한, 백업 및 보안 검토가 필요합니다.
