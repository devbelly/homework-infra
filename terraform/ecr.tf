resource "aws_ecr_repository" "homework-sample" {
  name = "homework-sample"
  force_delete = true
}