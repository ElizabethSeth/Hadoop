from pyspark.sql import SparkSession
from pyspark.sql.functions import col, sum, count, avg

# Step 1: Start a Spark Session
spark = SparkSession.builder.appName("Diamonds Analysis with Correlation").getOrCreate()

file_path = "/home/azureuser/diamonds.csv"  
diamonds_df = spark.read.csv(file_path, header=True, inferSchema=True)

# Step 3: Display the First 10 Rows
print("First 10 Rows of Diamonds Data:")
diamonds_df.show(10)

# Step 4: Total Records
total_records = diamonds_df.count()
print(f"Total number of records: {total_records}")

# Step 5: Correlation between 'carat' and 'price'
print("Correlation between 'carat' and 'price':")
correlation = diamonds_df.stat.corr("carat", "price")
print(f"Correlation: {correlation}")

# Step 6: MapReduce Style Analysis using Spark (WordCount-like operation)
print("MapReduce-style Analysis: Count the occurrences of 'cut' values:")

# MapReduce style: groupBy + count
cut_count = diamonds_df.groupBy("cut").agg(count("*").alias("count"))
cut_count.show()

# Step 7: Sum up 'price' for each 'cut' (similar to Reduce phase)
print("Sum of 'price' for each 'cut':")
cut_price_sum = diamonds_df.groupBy("cut").agg(sum("price").alias("total_price"))
cut_price_sum.show()

# Step 8: Average Price by Cut and Color
print("Average Price grouped by 'cut' and 'color':")
average_price_cut_color = diamonds_df.groupBy("cut", "color").agg(avg("price").alias("avg_price"))
average_price_cut_color.show()

# Step 9: Stop the Spark Session
spark.stop()

