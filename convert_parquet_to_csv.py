from pyspark.sql import SparkSession

spark = SparkSession.builder.appName("ParquetToCSV").getOrCreate()
df = spark.read.parquet("hdfs://localhost:9000/data/raw/flights-1m.parquet")
df.write.csv("hdfs://localhost:9000/data/raw/flights-1m.csv")

