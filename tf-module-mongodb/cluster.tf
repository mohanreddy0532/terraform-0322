resource "aws_docdb_cluster" "docdb" {
  cluster_identifier = "roboshop-${var.ENV}"
  engine             = "docdb"
  master_username    = jsondecode(data.aws_secretsmanager_secret_version.secrets.secret_string)["DOCUMENTDB_MASTER_USERNAME"]
  master_password    = jsondecode(data.aws_secretsmanager_secret_version.secrets.secret_string)["DOCUMENTDB_MASTER_PASSWORD"]
  ## This is just for lab purpose
  skip_final_snapshot    = true
  db_subnet_group_name   = aws_docdb_subnet_group.docdb.name
  vpc_security_group_ids = [aws_security_group.allow_mongodb.id]
}

resource "aws_docdb_subnet_group" "docdb" {
  name       = "roboshop-${var.ENV}"
  subnet_ids = data.terraform_remote_state.vpc.outputs.PRIVATE_SUBNET_IDS

  tags = {
    Name = "roboshop-${var.ENV}"
  }
}

resource "aws_docdb_cluster_instance" "cluster_instances" {
  count              = var.DOCUMENTDB_INSTANCE_COUNT
  identifier         = "roboshop-${var.ENV}"
  cluster_identifier = aws_docdb_cluster.docdb.id
  instance_class     = var.DOCUMENTDB_INSTANCE_CLASS
}

resource "aws_security_group" "allow_mongodb" {
  name        = "roboshop-mongodb-${var.ENV}"
  description = "roboshop-monogdb-${var.ENV}"
  vpc_id      = data.terraform_remote_state.vpc.outputs.VPC_ID

  ingress {
    description = "TLS from VPC"
    from_port   = var.DOCUMENTDB_PORT
    to_port     = var.DOCUMENTDB_PORT
    protocol    = "tcp"
    cidr_blocks = [data.terraform_remote_state.vpc.outputs.VPC_CIDR, var.WORKSTATION_IP]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "roboshop-mongodb-${var.ENV}"
  }
}
