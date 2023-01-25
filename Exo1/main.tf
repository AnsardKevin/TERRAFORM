
variable "movie_name" {
  type        = string
  default     = "Black is a good movie"
}

resource null_resource node1 {
  provisioner "local-exec" {
    command = "echo '${var.movie_name}' > BlackAdam.txt"
  }
}

output "movie_name" {
  value       = var.movie_name
}
