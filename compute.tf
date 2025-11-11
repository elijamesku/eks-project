resource "aws_instance" "windows_ec2" {
  ami           = "ami-0c02fb55956c7d316"
  instance_type = "t3.micro"
  tags = {
    Name = "windows-ec2"
    OS   = "Windows"
  }
}

resource "aws_instance" "ubuntu_ec2" {
  ami           = "ami-0c02fb55956c7d316"
  instance_type = "t3.micro"
  tags = {
    Name = "ubuntu-ec2"
    OS   = "Ubuntu"
  }
}

resource "aws_instance" "ubuntu_instance" {
  ami           = "ami-0c02fb55956c7d316"
  instance_type = "t2.micro"
  tags = {
    Name = "ubuntu-instance"
    OS   = "Ubuntu"
  }
}

resource "aws_instance" "linux_instance" {
  ami           = "ami-0c02fb55956c7d316"
  instance_type = "t3.micro"
  tags = {
    Name = "linux-instance"
    OS   = "Linux"
  }
}

resource "aws_instance" "windows_instance" {
  ami           = "ami-0c02fb55956c7d316"
  instance_type = "t3.medium"
  tags = {
    Name = "Windows Instance"
    OS   = "Windows"
  }
}

resource "aws_instance" "windows_instance" {
  ami = "ami-0c02fb55956c7d316"
  instance_type = "t3.medium"
  tags = {
    Name = "Windows Instance"
    OS = "Windows"
  }
}
