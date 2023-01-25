resource null_resource node1 {
  provisioner "local-exec" {
    command = "sudo apt-get install -y asciiart"
  }
}

output "name" {
  value = null_resource.node1
}