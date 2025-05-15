#!/bin/bash

# terraform apply 실행
terraform apply -auto-approve

# output을 JSON으로 저장
terraform output -json > ../../../outputs.json