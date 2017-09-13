# Terraform ECS demo

## Introduction
This repo contains terraform scripting to setup an ECS cluster on AWS with some example services.

## Setup
To run the terraform scripts you need to have AWS keys. The easiest way is to provide them to docker via a file containing the keys as key value pair.
Example file:
```
AWS_ACCESS_KEY_ID=...
AWS_SECRET_ACCESS_KEY=...
```

## Terraform commands
Terraform commands to manage the ECS cluster

### Initialize
Update `terraform.tfvars` and generate key files using `init.sh`.
```
docker run -it --env-file <AWS_KEYS_FILE>  -v $(pwd):/data -w /data \
  hashicorp/terraform:0.10.4 init
```

### Plan
```
docker run -it --env-file <AWS_KEYS_FILE>  -v $(pwd):/data -w /data \
  hashicorp/terraform:0.10.4 plan
```

### Apply
```
docker run -it --env-file <AWS_KEYS_FILE>  -v $(pwd):/data -w /data \
  hashicorp/terraform:0.10.4 apply
```

### Destroy
```
docker run -it --env-file <AWS_KEYS_FILE>  -v $(pwd):/data -w /data \
  hashicorp/terraform:0.10.4 destroy
```
