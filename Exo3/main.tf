
variable "movies_name" {
  default     = ["tutu", "toto", "tutu"]
}

resource null_resource node1 {
  count = "${length(var.movies_name)}"
  triggers = {
    foo = element(var.movies_name, count.index)
  }
  provisioner "local-exec" {
    command = "echo '${element(var.movies_name, count.index)}' >> toto.txt"
  }
}