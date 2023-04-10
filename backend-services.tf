resource "aws_db_subnet_group" "vprofile-rds-subgrp"{
  name = "main"
  subnet_ids = [module.vpc.private_subnets[0],module.vpc.private_subnets[1],module.vpc.private_subnets[2] ]
  tags = {
    Name = "subnet group for rds"
  }
}

resource "aws_elasticache_security_group" "vprofile-ecache-subgrp" {
  name                 = "vprofile-ecache-subgrp"
  security_group_names = [module.vpc.private_subnets[0],module.vpc.private_subnets[1],module.vpc.private_subnets[2]]
  tags = {
    Name = "subnet group for ECACHE"
  }
}

resource "aws_db_instance" "vprofile-rds" {
    allocated_storage = 20
    storage_type = "gp2"
     engine = "mysql"
  engine_version = "5.6.34"
  instance_class = "db.t2.micro"
  name = var.dbname
  username = var.dbuser
  password = var.dbpass
  parameter_group_name = "default.mysql5.6"
  multi_az = "false"
  publicly_accessible = "false"
  skip_final_snapshot = true
  db_subnet_group_name = "aws_db_subnet_group.vprofile-rds-subgroup.name"
  vpc_security_group_ids = [aws_security_group.vprofile-backend-sg.id]

}


resource "aws_elasticache_cluster" "vprofile-cache" {
  cluster_id = "vprofile-cache"
  engine = "memcached"
  node_type = "cache.t.micro"
  num_cache_nodes = 1
  parameter_group_name = "default.mamcached.5"
  port = 11211
  security_group_ids = [aws_security_group.vprofile-backend-sg.id]
  security_group_names = [aws_elasticache_security_group.vprofile-ecache-subgrp.name]

}

resource "aws_mq_broker" "vprofile-rmq" {
  broker_name        = "vprofile-rmq"
  engine_type        = "ActiveMQ"
  engine_version     = "5.15.0"
  host_instance_type = "mq.t2.micro"
  security_groups = [aws_security_group.vprofile-backend-sg.id]
  subnet_ids = [module.vpc.private_subnets[0]]
  user {
    password = "var.rmquser"
    username = "var.rmqpass"
  }
}


