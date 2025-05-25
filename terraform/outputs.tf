output "vpc_id" {
  description = "The ID of the VPC:"
  value       = module.vpc.vpc_id
}

output "vpc_cidr_block" {
  description = "The CIDR block of the VPC:"
  value       = module.vpc.vpc_cidr_block
}

output "eks_cluster_name" {
  description = "Name of the EKS cluster:"
  value       = module.eks.cluster_name
}

output "eks_cluster_endpoint" {
  description = "Endpoint for the EKS cluster:"
  value       = module.eks.cluster_endpoint
}

output "eks_cluster_version" {
  description = "Kubernetes version of the EKS cluster:"
  value       = module.eks.cluster_version
}

output "load_balancer_dns_name" {
  description = "DNS name of the application load balancer:"
  value       = aws_lb.app_lb.dns_name
}

output "target_group_arn" {
  description = "ARN of the ALB target group:"
  value       = aws_lb_target_group.app_tg.arn
}

output "listener_arn" {
  description = "ARN of the ALB listener:"
  value       = aws_lb_listener.app_listener.arn
}

output "security_group_for_lambda"{
    description = "Security Group ID for Lambda:"
    value=aws_security_group.lambda_sg.id
}

output "api_gateway_id" {
    description = "API Gateway ID:"
    value=aws_apigatewayv2_api.http_api.id
}

output "api_gateway_url" {
    description = "API Gateway URL:"
    value = aws_apigatewayv2_api.http_api.api_endpoint
}

output "lambda_function_arn" {
    description = "ARN of Python based lambda function:"
    value = aws_lambda_function.app.arn
}