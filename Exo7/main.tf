resource null_resource node1 {
  provisioner "local-exec" {
    command = "sudo apt-get remove -y figlet"
  }
}

output "name" {
  value = null_resource.node1
}