# 1. The Provider (Only once)
provider "aws" {
  region = "us-east-1"
}

# 2. The VPC (Only once)
resource "aws_vpc" "security_lab_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  tags = { Name = "Security-Lab-VPC" }
}

# 3. Internet Gateway (The Front Door)
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.security_lab_vpc.id
  tags   = { Name = "Lab-IGW" }
}

# 4. Public Subnet (The "Lobby")
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.security_lab_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true
  tags = { Name = "Public-Subnet" }
}

# 5. Route Table (The Directions)
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.security_lab_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

# 6. Associate Route Table with Subnet
resource "aws_route_table_association" "public_assoc" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_rt.id
}
# 7. The Security Group "Container"
resource "aws_security_group" "ssh_firewall" {
  name        = "allow-ssh"
  description = "Security container for our lab rules"
  vpc_id      = aws_vpc.security_lab_vpc.id

  tags = { Name = "SSH-Firewall" }
}

# 8. The Inbound Rule (This is the specific resource you were looking for)
variable "my_ip" {
  description = "My local public IP"
  type        = string
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh_ipv4" {
  security_group_id = aws_security_group.ssh_firewall.id
  
  # This references the variable instead of a hardcoded number
  cidr_ipv4   = "${var.my_ip}/32" 
  
  from_port   = 22
  ip_protocol = "tcp"
  to_port     = 22
  description = "Allow SSH from my authorized IP"
}  
  

# 9. The Outbound Rule (Allows the server to talk to the internet for updates)
resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.ssh_firewall.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # This means "All Protocols"
}

# 10. The SSH Key Pair (The Lock)
resource "aws_key_pair" "lab_key" {
  key_name   = "aws_lab_key"
  # Run 'cat ~/.ssh/aws_lab_key.pub' and paste the result below:
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIO8yYGeMv+mcug5aLCS/IR/i7DWEoADqxUCmliJzmqL6 lcoleman381-aws-la" 
}

# 11. Find the latest Amazon Linux 2023 AMI (Automated Search)
data "aws_ami" "latest_amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023*-x86_64"]
  }
}

# 12. The EC2 Instance (Using the dynamic ID)
resource "aws_instance" "security_node" {
  ami           = data.aws_ami.latest_amazon_linux.id
  instance_type = "t3.micro"

  subnet_id              = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.ssh_firewall.id]
  key_name               = aws_key_pair.lab_key.key_name

  tags = {
    Name = "Security-Lab-Node-01"
  }
}
