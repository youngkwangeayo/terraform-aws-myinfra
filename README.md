# IaC 템플릿화 프로젝트  

## 목표
테라폼의 IaC 템플릿으로 구성하여 모듈을 항상 유의하고개발하고 개발표준, 모범사례, 실무 표준을 따름.
AWS 인프라를 재사용 가능한 IaC 템플릿으로 구성하여, 다양한 솔루션을 빠르게 배포할 수 있도록 함
AWS ECS 한세트 베포해보기

## 네이밍 규칙
**형식**: `{aws-service}-{environment}-{solution}[-{component}]`

### 예시
- `ecs-dev-myapp`
- `ecs-dev-mys1-api`
- `ecs-prod-payment-web`
- `rds-dev-myapp`

## 디렉토리 구조

```
infra/          
├── aws-def/                    # 실제 AWS describe로 생성된 참고 파일          
│   ├── cluster-dev.json            
│   ├── taskdef-dev.json            
│   ├── service-dev.json            
│   └── autoscal-dev.json           
│           
├── modules/                     # 재사용 가능한 구성 단위 (모듈)           
│   ├── ec2/            
│   │   ├── main.tf         
│   │   ├── variables.tf            
│   │   └── outputs.tf          
│   ├── ecs/            
│   │   ├── ecs-cluster/            
│   │   ├── ecs-task/           
│   │   ├── ecs-autoscaling/            
│   │   └── ecs-service/            
│   ├── s3/         
│   ├── elb/            
│   └── route53/            
│           
├── solutions/                   # 특정 서비스/프로젝트(솔루션) 단위                          
│   ├── solution1/                  
│   ├── solution2/                  
│   └── data-platform/           # 예: 데이터 수집 파이프라인
│           
├── envs/                        # 환경별 배포 단위         
│   ├── prod/           
│   │   ├── main.tf         
│   │   ├── variables.tf            
│   │   ├── terraform.tfvars            
│   │   └── backend.hcl         
│   ├── stage/          
│   └── dev/            
│           
├── versions.tf         # Terraform & Provider 버전 고정        
├── providers.tf        # Provider 공통 설정 (AWS, tags 등)     
├── variables.tf        # 모든 솔루션/환경이 공통으로 쓰는 변수     
├── outputs.tf          # 공통 출력 정의 (선택)     
└── backend-common.hcl  # 공통 백엔드 설정 (선택)       

```

## Terraform 모범사례
- **모듈에서 이름규칙은**: `terraform-<PROVIDER>-<NAME>`
- **모듈을 염두에 두고 구성 작성을 시작하세요**



### Terraform
- **장점**: 멀티 클라우드 지원, HCL 문법, 강력한 모듈 시스템, Plan 기능
- **단점**: State 관리 필요 (S3 + DynamoDB)
- **상태**: 🔄 구현 예정

## 사용 시나리오

### 새로운 솔루션 배포
1. Values/환경 파일 복사
2. 설정 수정 (이미지, 포트, 환경변수 등)
3. 배포 실행



### Terraform 방식 (예정)
```bash
cp -r infra-tf/environments/dev/myapp infra-tf/environments/dev/mys1
vim infra-tf/environments/dev/mys1/terraform.tfvars
cd infra-tf/environments/dev/mys1
terraform init
terraform plan
terraform apply
```

## 다음 단계
- [ ] Terraform 모듈 구현
- [ ] Terraform 환경별 설정 생성
- [ ] 배포 스크립트 작성
- [ ] CI/CD 파이프라인 통합