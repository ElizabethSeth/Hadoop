from pyspark.sql import SparkSession
from pyspark.sql.functions import avg

# Initialize Spark Session
spark = SparkSession.builder \
    .appName("Parquet Column Average") \
    .getOrCreate()

# Path to the Parquet file in HDFS
parquet_file = "hdfs://localhost:9000/data/raw/flights-1m.parquet"

# Read the Parquet file
df = spark.read.parquet(parquet_file)

# Show schema to understand the structure
df.printSchema()

# Calculate the average of a numeric column (e.g., 'AIR_TIME')
average_df = df.select(avg("AIR_TIME").alias("average_air_time"))

# Show the result
average_df.show()

# Save the output to HDFS
average_df.write.csv("/data/output/parquet_column_average", header=True)

# Stop Spark Session
spark.stop()

