from pyspark.sql import SparkSession
from pyspark.sql.functions import col, avg, round

# Create a Spark session
spark = SparkSession.builder \
    .appName("Diamonds Analysis") \
    .getOrCreate()

# Define the input and output paths in HDFS
input_path = "hdfs://localhost:9000/data/raw/diamonds.csv"  # Input file path
output_path = "hdfs://localhost:9000/data/output/diamonds_spark"  # Output directory path

# Read the CSV file into a Spark DataFrame
diamonds_df = spark.read.option("header", "true").csv(input_path, inferSchema=True)

# Perform the analysis: calculate the average price for each carat value
result = diamonds_df.groupBy("carat").agg(round(avg("price"), 2).alias("avg_price")).orderBy("carat")

# Show the results in the console in a nicely formatted way
print("\n=== Diamonds Analysis Results ===\n")
result.show(truncate=False, n=30)  # Show more rows with no truncation

# Save the results back to HDFS in CSV format
result.coalesce(1).write.option("header", "true").csv(output_path)

# Stop the Spark session
spark.stop()

