# Jenkins X 3.x GitOps Repository for Azure, Terraform and Vault

This git repository setups the cloud resources required to run Jenkins X on Azure via Terraform and then sets up Jenkins X with Vault.

## Prerequisites

We assume you have access to an Azure tenant and subscription and have logged in to an appropriate subscription via

```sh
az login
az account set -s <subscription_id>
```

Configure the terraform (non secret) variables in `local.tf` based on the table below. You will also need to supply the appropriate secrets
on the command line when running the script below (do not commit these to source files)

| Variable Name | Secret? | Description |
|------|-----|--------|
| `jx_git_url` | `false` | URL for the Jenkins X cluster git repository
| `jx_bot_username` | `false` | Bot username used to interact with the Jenkins X cluster git repository
| `jx_bot_token` | `true` | Bot token used to interact with the Jenkins X cluster git repository

## Creating/upgrading cloud resources

Run the `./bin/apply.sh` script to generate the terraform resources and modify the `jx-requirements.yml` file.

Now git commit and push any changes...

```bash 
git add *
git commit -a -m "chore: regenerated terraform"
git push
```
