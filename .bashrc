alias switch_to_isr_docker='~/Projects/Toolbox/scripts/switch_to_isr_docker.sh'
alias switch_to_oms_docker='~/Projects/Toolbox/scripts/switch_to_oms_docker.sh'

alias tag_and_push='~/Projects/Toolbox/scripts/tag_and_push.sh'
alias delete_tag='~/Projects/Toolbox/scripts/delete_tag.sh'

alias cleanup_git_branch='python3 ~/Projects/Toolbox/scripts/cleanup_git_branch.py'
alias git_current_branch='~/Projects/Toolbox/scripts/git_current_branch.sh'

alias aws_login='saml2aws login --force'

## Terraform aliass
alias tp-dev='terraform plan -var-file dev.tfvars'
alias tp-main='terraform plan -var-file main.tfvars'
alias tp-staging='terraform plan -var-file staging.tfvars'
alias tp-prod='terraform plan -var-file prod.tfvars'
alias ta-dev='terraform apply -var-file dev.tfvars'
alias ta-main='terraform apply -var-file main.tfvars'
alias ta-staging='terraform apply -var-file staging.tfvars'
alias ta-prod='terraform apply -var-file prod.tfvars'
alias tp='terraform plan -var-file=$(cat .terraform/environment)'.tfvars
alias ta='terraform apply -var-file=$(cat .terraform/environment)'.tfvars

