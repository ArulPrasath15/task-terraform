#aws_lb_target_group
resource "aws_lb_target_group" "alb_target_group" {
  name     = "${var.owner}-alb-target-group"           
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id                           
  tags = {
    Name = "${var.owner}-alb-target-group"             
     Createdby="${var.ownermail}"
    Environmnet="${var.env}"
  }
}


#SG for ALB
resource "aws_security_group" "alb_sg" {
  name        = "${var.owner}-alb-sg"                          
  description = "Allow http inbound traffic"
  vpc_id      = var.vpc_id                               

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "${var.owner}-alb-sg"
     Createdby="${var.ownermail}"
    Environmnet="${var.env}"                            
  }
}


# ALB
resource "aws_lb" "alb" {
  name                       = "${var.owner}-alb"                     
  internal                   = false
  load_balancer_type         = "application"
  security_groups            = [aws_security_group.alb_sg.id]
  subnets                    = var.public_subnet_ids           
  enable_deletion_protection = false
  tags = {
    Name = "${var.owner}-alb"  
     Createdby="${var.ownermail}"
    Environmnet="${var.env}"
  }
}

#aws_alb_listener
resource "aws_alb_listener" "alb_listener" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 80
  protocol          = "HTTP"
  default_action {
    target_group_arn = aws_lb_target_group.alb_target_group.arn
    type             = "forward"
  }
}

