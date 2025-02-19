# Cria o bucket S3
resource "aws_s3_bucket" "backup_bucket" {
  bucket = var.bucket_name
  acl    = "private"  # Define o acesso privado ao bucket

  # Habilita o versionamento para manter múltiplas versões dos objetos
  versioning {
    enabled = false
  }

  # Configura uma política de lifecycle para retenção de backups
  lifecycle_rule {
    id      = "backup-retention"
    enabled = true

    expiration {
      days = 30  # Define que os objetos serão excluídos após 30 dias
    }

    # Transição para o S3 Glacier após 7 dias (opcional)
    transition {
      days          = 7
      storage_class = "GLACIER"
    }
  }

  # Configurações de criptografia no servidor (opcional)
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = {
    Name        = "backup-bucket"
    Environment = "Production"
  }
}

# Política de bloqueio de acesso público ao bucket (opcional)
resource "aws_s3_bucket_public_access_block" "block_public_access" {
  bucket = aws_s3_bucket.backup_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}
