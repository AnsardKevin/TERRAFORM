
variable "movies_name" {
  type        = map
  default     = {
    "Black Adam" = "The Rock!!!!"
    "Lord of the ring" = "Better than all Except the rock jjj"
    "Star wars" = "Not bad"
  }
}

resource null_resource node1 {
  for_each = var.movies_name
  triggers = {
    foo = each.value
  }
  provisioner "local-exec" {
    command = "echo '${each.key} ${each.value}' >> Movies.txt"
  }
}