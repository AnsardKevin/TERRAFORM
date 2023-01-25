variable "ssh_host" {}
variable "ssh_user" {}
variable "ssh_key" {}
variable "ssh_password" {}

resource null_resource "ssh_target" {

  connection {
    type = "ssh"
    user = var.ssh_user
    host = var.ssh_host
    password = var.ssh_password
    private_key = file(var.ssh_key)
  }

  provisioner "file" {
    source = "test.txt"
    destination = "tmp/test.txt"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo cp -a /tmp/test.txt /home/kevin/test.txt"
    ]
  }
  
}
