from pyspark.sql import SparkSession
from pyspark.sql.functions import explode, col

# Initialize Spark Session
spark = SparkSession.builder \
    .appName("Pokemon Abilities Analysis") \
    .getOrCreate()

# Path to the JSON file in HDFS
json_file = "hdfs://localhost:9000//data/raw/pokemon_data.json"

# Read the JSON file with multiline option
df = spark.read.option("multiline", "true").json(json_file)

# Print schema to verify structure
df.printSchema()

# Extract the "abilities" field and flatten the nested structure
abilities_df = df.select(explode(col("1.abilities")).alias("ability")) \
    .select(col("ability.ability.name").alias("ability_name"))

# Count the unique occurrences of each ability
result = abilities_df.groupBy("ability_name").count()

# Show the results
result.show()

# Save the output to HDFS
result.write.csv("/data/output/pokemon_abilities_analysis", header=True)

# Stop Spark Session
spark.stop()

