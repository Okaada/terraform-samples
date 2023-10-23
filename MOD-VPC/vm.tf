resource "aws_key_pair" "key_pair" {
  key_name   = "aws_key"
  public_key = file("./aws-key.pub")
}


resource "aws_instance" "vm" {
  ami                         = "ami-08f03e8afb312b97a"
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.key_pair.key_name
  subnet_id                   = module.network.subnet_id
  vpc_security_group_ids      = [module.network.security_group_id]
  associate_public_ip_address = true

  provisioner "local-exec" {
    command = "echo ${self.public_ip} >> public_ip.txt"
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("./aws-key")
    host        = self.public_ip
  }

  provisioner "file" {
    content     = "public: ${self.public_ip}"
    destination = "/tmp/public_ip.txt"
  }

  provisioner "file" {
    source      = "./test.txt"
    destination = "/tmp/test.txt"
  }

  provisioner "remote-exec" {

    inline = ["echo ${self.ami} >> /tmp/ami.txt",
    "echo private_ip: ${self.private_ip} >> /tmp/.private_ip.txt"]
  }

  tags = {
    "Name" = "vm-terraform"
  }
}