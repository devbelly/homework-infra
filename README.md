
# 1. 아키텍처

![과제2 drawio](https://github.com/user-attachments/assets/f3564204-4ac6-404a-933a-6f3e683f82f5)


# 2. 설치 방법

## 2.1 EKS 클러스터 생성
- `terraform apply`
- `terraform apply -target=”helm_release.aws-load-balancer”`
- `aws eks update-kubeconfig --region us-east-2 --name homework-cluster`
- `kubectl rollout restart deployment coredns -n kube-system`

## 2.2 MySQL 환경 구성

- `create database homework`

    ```sql
    CREATE TABLE post (
        id BIGINT AUTO_INCREMENT,
        title VARCHAR(255) NOT NULL,
        PRIMARY KEY (id)
    );
    ```
  

## 2.3 Helm Chart 설치

- `docker build →  docker tag → docker push`
- `kubectl apply -f secret.yaml`
- `helm install homework .`

# 3. 구현 완료 사진

<img width="702" alt="image" src="https://github.com/user-attachments/assets/cf45104e-be8a-40e1-99a8-343e342b087b" />

<img width="701" alt="image" src="https://github.com/user-attachments/assets/f1f0838c-f956-485f-ba59-161ed3c7a41e" />

<img width="624" alt="image" src="https://github.com/user-attachments/assets/b9d44c7d-0180-45b1-aa33-14c759133f9f" />
