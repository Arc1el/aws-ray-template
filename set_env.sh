#!/bin/bash

# VPC ID 설정
export VPC_ID=$(jq -r '.vpc_id.value' outputs.json)

# Private Subnet IDs 설정 (배열을 쉼표로 구분된 문자열로 변환)
export PRIVATE_SUBNET_IDS=$(jq -r '.private_subnet_ids.value | join(",")' outputs.json)

# Public Subnet IDs 설정 (배열을 쉼표로 구분된 문자열로 변환)
export PUBLIC_SUBNET_IDS=$(jq -r '.public_subnet_ids.value | join(",")' outputs.json)

# Ray Security Group IDs 설정
export RAY_HEAD_SG_ID=$(jq -r '.ray_head_sg_id.value' outputs.json)
export RAY_WORKER_SG_ID=$(jq -r '.ray_worker_sg_id.value' outputs.json)

# 환경변수 확인
echo "VPC_ID: $VPC_ID"
echo "PRIVATE_SUBNET_IDS: $PRIVATE_SUBNET_IDS"
echo "PUBLIC_SUBNET_IDS: $PUBLIC_SUBNET_IDS"
echo "RAY_HEAD_SG_ID: $RAY_HEAD_SG_ID"
echo "RAY_WORKER_SG_ID: $RAY_WORKER_SG_ID" 