resource "aws_instance" "sample" {
  ami = "ami-091eb1485ca7182bd"
  instance_type = "t2.micro"
}

output "AmiOut" {
  value = aws_instance.sample.public_ip
}

output "AmiOut1" {
  value = aws_instance.sample.private_ip
}