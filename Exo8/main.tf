
variable "command_to_install" {}

resource null_resource node1 {

  triggers = {
    foo = var.command_to_install
  }

  provisioner "local-exec" {
    command = "sudo apt-get install -y '${var.command_to_install}'"
  }
}

output "package_name" {
  value = var.command_to_install
}