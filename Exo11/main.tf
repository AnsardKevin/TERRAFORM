variable "ssh_host" {}
variable "ssh_user" {}
variable "ssh_key" {}
variable "ssh_password" {}

resource null_resource "test" {

  connection {
    type = "ssh"
    user = var.ssh_user
    host = var.ssh_host
    password = var.ssh_password
    private_key = file(var.ssh_key)
  }



  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y figlet"
    ]
  }
}
