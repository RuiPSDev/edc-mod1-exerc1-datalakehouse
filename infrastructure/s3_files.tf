# HCL - Hashicorp Configuration Language
# Linguagem declarativa
# Declaração dos arquivos/objetos a serem manipulados

resource "aws_s3_object" "job_spark" {
  bucket = aws_s3_bucket.dl-house.id
  key    = "emr-code/pyspark/job_spark_from_tf.py"
  source = "../job_spark.py"
  etag   = filemd5("../job_spark.py")
}

resource "aws_s3_object" "delta_insert" {
  bucket = aws_s3_bucket.dl-house.id
  key    = "emr-code/pyspark/01_delta_spark_insert.py"
  source = "../etl/01_delta_spark_insert.py"
  etag   = filemd5("../etl/01_delta_spark_insert.py")
}

resource "aws_s3_object" "delta_upsert" {
  bucket = aws_s3_bucket.dl-house.id
  key    = "emr-code/pyspark/02_delta_spark_upsert.py"
  source = "../etl/02_delta_spark_upsert.py"
  etag   = filemd5("../etl/02_delta_spark_upsert.py")
}
