resource null_resource node1 {
  for_each = var.movies_name
  provisioner "local-exec" {
    command = "echo '${each.key} => ${each.value}' >> toto.txt"
  }
}