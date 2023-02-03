# HCL - Hashicorp Configuration Language
# Linguagem declarativa
# Criação do bucket

resource "aws_s3_bucket" "dl-house" {
  # Parametros de configuração do recusrso escolhido
  bucket = "${var.base_bucket_name}-${var.for_what}-${var.user_name}-${var.terraform_mark}"
}

resource "aws_s3_bucket_server_side_encryption_configuration" "dl-house" {
    bucket = aws_s3_bucket.dl-house.id

    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
}

resource "aws_s3_bucket_acl" "dl-house" {
  bucket = aws_s3_bucket.dl-house.id
  acl = "private"
}