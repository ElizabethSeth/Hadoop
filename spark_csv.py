from pyspark.sql import SparkSession

spark = SparkSession.builder.appName("CSV Line Count").getOrCreate()
csv_file = "hdfs://localhost:9000/data/raw/prompts.csv"

# Chargement du fichier CSV
df = spark.read.csv(csv_file, header=True, inferSchema=True)

# Comptage des lignes
line_count = df.count()
print(f"Total number of lines: {line_count}")

