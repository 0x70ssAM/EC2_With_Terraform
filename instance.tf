resource "aws_instance" "web" {
  ami             = "ami-08c40ec9ead489470" #Ubuntu, 22.04 LTS
  instance_type   = var.instance_type
  key_name        = var.instance_key
  subnet_id       = aws_subnet.public1.id
  security_groups = [aws_security_group.sg.id]

  user_data = <<-EOF
  #!/bin/bash
  echo "*** Installing apache2"
  sudo apt update -y
  sudo apt install apache2 -y
  sudo systemctl enable apache2
  sudo systemctl start apache2
  sudo chmod 755 /var/www/html/
  sudo echo "<h1> My Instance! </h1>" > /var/www/html/index.html
  sudo systemctl restart apache2
  echo "*** Completed Installing apache2"
  EOF

  #   output "DNS" {
  #   value = aws_instance.web.public_dns
  # }
}