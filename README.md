![alt tag](https://www.terraform.io/assets/images/logo-hashicorp-3f10732f.svg)

O terraform e uma das ferramentas mais usadas atualmente para provisionamento de infraestrutura, seja ela na nem ambiente on-premisse ou cloud, nesse projeto uso o terraforma para realizar a contstrução de um ambiente de API Gateway, configurando o stagio e realizando a importação de uma API modelo criada no swagger


# PRÉ-REQUISITO
Os pre-requisitos necessários para execução da stack de serviço:
 1) Terraform
 2) Conta ma AWS.

# BAIXANDO E CONFIGURANDO TERRAFORM
   wget https://releases.hashicorp.com/terraform/0.12.13/terraform_0.12.13_linux_amd64.zip
   unzip terraform_0.12.13_linux_amd64.zip
   mv terraform /usr/local/bin

# CLONANDO O PROJETO
   git clone git@github.com:leandromoreirati/api-gateway-internal.git
   

# CONFIGURANDO O ARQUIVO DE VARIÁVEIS DE AMBIENTE
   vi environments/staging.tfvars

   Alterando o "CHANGE_ME" com os valores de acordo com seu ambiente

   region = "CHANGE_ME"
   my_team = "CHANGE_ME"
   product = "CHANGE_ME"
   bussness_owner = "CHANGE_ME"
   environment = "CHANGE_ME"
   vpc_id = "CHANGE_ME"
   private_subnets = [
                      "CHANGE_ME",
                      "CHANGE_ME",
                      "CHANGE_ME"
                  ]
   zone_id = "CHANGE_ME"

   
# VALIDANDO O PLAN

    terraform plan -var-file=environments/staging.tfvars

# EXECUTANDO O PLAN

    terraform apply -var-file=environments/staging.tfvars

    Sera questionado de deseja executar o plano, basta digitar yes.

# REMOVENDO O PLAN

    terraform destroy -var-file=environments/staging.tfvars