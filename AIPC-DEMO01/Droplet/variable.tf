# Set the variable value in *.tfvars file
# or using -var="do_token=..." CLI option
variable "do_token" {
    description = "Digital Ocean API token"
    type        = string
}