# Wireguard VPN Server Infrastructure

## Purpose

This Terraform stack provisions and bootstraps the required resources to run a Wireguard VPN server. It contains a 'dev' folder for testing and vetting updates, and a 'prod' folder for testing and deploying a productionized VPN server.

## Variables

Variables are stored and retrieved from AWS Parameter Store via the aws_ssm_parameter resource.

## Deployment

## Architecture

## Terraform version

This uses terraform version 0.13.x. I'm managing the terraform version via tfenv.

`tfenv` commands:

```
tfenv install 0.13.2
tfenv use 0.13.2
```
