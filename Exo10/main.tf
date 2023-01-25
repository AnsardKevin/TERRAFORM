
variable "command_to_remove" {
  default     = "figlet"
}

resource null_resource node1 {
  triggers = {
    foo = var.command_to_remove
  }
  provisioner "local-exec" {
    command = "sudo apt-get remove '${var.command_to_remove}'"
  }
}

output "name" {
  value = null_resource.node1
}