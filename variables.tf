variable "common_tags" {
  type = map(any)
  default = {
    managed_by_terraform = "true"
    terraform_project    = "https://github.com/sandbox4test/CognitiveSearchDemo"
    owner_group          = "TBD"
    cost_center          = "TBD"
    technical_contact    = "andyxuan2010@gmail.com"
    tenant_owner         = "andyxuan2010@gmail.com"
    creation_date        = "2023-07-02"
    project              = "azure-basf-demo"
    region               = "westeurope"
  }
}



variable "location" {
  default     = "westeurope"
  description = "The Azure Region in which all resources in this example should be created."
}

variable "environment" {
  type        = string
  default     = "sbx"
  description = "Environment, the environment name such as 'stg', 'prd', 'dev'"
  validation {
    condition     = var.environment == null ? true : contains(["prod", "nprod", "dev", "test", "sbx", "lab"], var.environment)
    error_message = "Only a valid azure names are expected here such as prod."
  }
}

variable "purpose" {
  default     = "demo"
  description = "variable used for azure module purpose"
}


variable "smartgpt-ec2-key" {
  default = <<EOT
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCdrVPCmgIxr/0/GdxsrTVTQfZd8q5uZD4Ws7WgHUZEJjIal1xvK2S+996u5agUzbd5Kl2aq+BnVVhdWwblWTvejTF9NzuI5gVx3GGrWHg/kmtQ/t+rj6FWYwwo9Esg5fSYAeO2sY8CLbsoQQcwxyXAo+9HyVnxC0Nk0RcoClEpy/T/DoA4wZtnnSZ/cCAXfifT1AOv9DPR+kAtgGfXu6uTYZzg6NvvE4LFHhDJnvPVhFPXri8jfEIzDo+Hjejq+AZH1LvoBB4c1teXLg1u6sUHK1Gow6WX1PlSshmpMqSE8UCt81iPwkHtFBNo951OybYcWnBcO1aOU1yyO1DBRBR3 cdap-service
EOT
}
variable "emachine-pub-key" {
  default = <<EOT
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDIqfriZJbopqGHXo1gVfxo7LNF7rx+Yq1qSFpLeojDS4DWr/a8v2dpevDf95Xku/BGLZ16eRQFlW4/YFfhpPIy1sYVlaJQVOiALN8sk1R5OuGjLXy2e22SRVgH0LQehHCLwmszjuLhbmDO8qjNnzm0JIYHmv4+VkZ56LI8rTiPozHmKGxgKfhKhV1vh9NzdCnj7Nh/iQWAU82X5UzYU6J6t7Ape1bp4C74yPH3NOcVcV51qKZXiamfM2PfPnU11I+Wd7Ho8l1yvpUUZe0FdSBZtp7oWya+oPy5AXJlfuMCq5WjVUO9LCvpZMsJWQDhocMFuDRiNw4+0G/XnathEiRP root@emachine
EOT
}
variable "vm-pub-key" {
  default = <<EOT
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCjoftGI4Wgwc6YHGgbbUfAkMm2k4JQIkMXmlHrs24bnSa+CxNeC4eL7cFWZHgLxn6pBfqRCijsCbLpzUhlIJKMMxv2WB0TtHpezD9oUX1/9K7rC3RB4EcKmZ3vDWSsR4UBn9aVCZkQBnr+hfk39lj+Hk2qAMGloVFD0bM10j1Hhv5uMaT8lcClWK/TCcgKH8NQF3hZDqX8YADCYczvZ7B3hA+xpAZwOOZKChOv5Y2ABduD8KPcV6Uc1VLO6+xMlkDZc0MB6HkYlGZSbeMkstgPo+275SKHWVJ7B2nWMvOAyOtjU5OqHwYoNrsCX1TP380DUhQqqAqjzqDP8C0z76Gj root@vm
EOT
}

############
## unit 11 for vm win bastion

variable "virtual_network_name" {
  type        = string
  description = "VNET name in Azure"
  default     = "vnet-bastion"
}

variable "subnet_name" {
  type        = string
  description = "Subnet name in Azure"
  default     = "subnet-bastion"
}

variable "public_ip_name" {
  type        = string
  description = "Public IP name in Azure"
  default     = "pip-vm"
}

variable "network_interface_name" {
  type        = string
  description = "NIC name in Azure"
  default     = "nic-vm-1"
}



# for WestEurope location we have "B1, B2, S0, S1, S2, S4, D1"
# for demo purpose we pick D1 plan
variable "sku" {
  type        = string
  description = "The sku name of the Azure Analysis Services server to create. Choose from: B1, B2, D1, S0, S1, S2, S3, S4, S8, S9. Some skus are region specific. See https://docs.microsoft.com/en-us/azure/analysis-services/analysis-services-overview#availability-by-region"
  default     = "D1"
}