# resource "aws_s3_bucket" "remotebucket" {
#   bucket = "okadara-remote-state"
#   tags   = local.common_tags
# }

# //boa pratica salvar os states versionados, sem sobreescrever 
# resource "aws_s3_bucket_versioning" "versioning" {
#   bucket = aws_s3_bucket.remotebucket.id
#   versioning_configuration {
#     status = "Enabled"
#   }
# }