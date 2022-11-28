resource "aws_vpc" "myvpc" {
  cidr_block = var.cidr
  #   provisioner "local-exec" {
  #     command = "touch ${self.id}"
  #   }
}