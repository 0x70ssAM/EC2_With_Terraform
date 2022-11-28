output "vpc_id" {
  value = aws_vpc.myvpc.id
}

output "web_instance_ip" {
  value = aws_instance.web.public_ip
}

output "DNS" {
  value = aws_instance.web.public_dns
}