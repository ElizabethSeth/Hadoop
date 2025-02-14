sudo apt update
sudo apt update && sudo apt upgrade -y
sudo apt install -y curl wget git
sudo apt install -y openjdk-11-jdk
java -version
wget https://downloads.apache.org/hadoop/common/hadoop-3.3.6/hadoop-3.3.6.tar.gz
tar -xzf hadoop-3.3.6.tar.gz
clear
tar -xzf hadoop-3.3.6.tar.gz
sudo mv hadoop-3.3.6 /usr/local/hadoop
nano ~/.bashrc
source ~/.bashrc
hadoop version
/usr/local/hadoop/etc/hadoop/core-site.xml
sudo nano /usr/local/hadoop/etc/hadoop/core-site.xml
sudo nano /usr/local/hadoop/etc/hadoop/hdfs-site.xml
echo $HADOOP_HOME
echo $JAVA_HOME
sudo nano /usr/local/hadoop/etc/hadoop/yarn-site.xml
sudo mkdir -p /usr/local/hadoop/tmp
sudo mkdir -p /usr/local/hadoop/data/namenode
sudo mkdir -p /usr/local/hadoop/data/datanode
sudo chown -R $USER:$USER /usr/local/hadoop
hdfs namenode -format
start-dfs.sh
ssh-keygen -t rsa -P "" -f ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys
ssh localhost
start-dfs.sh
readlink -f $(which java)
nano ~/.bashrc
source ~/.bashrc
echo $JAVA_HOME
start-dfs.sh
sudo nano /usr/local/hadoop/etc/hadoop/hadoop-env.sh
source ~/.bashrc
start-dfs.sh
jps
start-yarn.sh
jps
start-yarn.sh
stop-yarn.sh
rm -f /tmp/hadoop-azureuser-resourcemanager.pid
rm -f /tmp/hadoop-azureuser-nodemanager.pid
start-yarn.sh
netstat -tulnp | grep 8088
sudo apt update
sudo apt install net-tools
netstat -tulnp | grep 8088
sudo nano /usr/local/hadoop/etc/hadoop/yarn-site.xml
stop-yarn.sh
start-yarn.sh
netstat -tulnp | grep 8088
cat /usr/local/hadoop/logs/yarn-*-resourcemanager-*.log
sudo nano /usr/local/hadoop/etc/hadoop/yarn-site.xml
netstat -tulnp | grep 8088
sudo mkdir -p /usr/local/hadoop/logs
sudo chown -R azureuser:azureuser /usr/local/hadoop/logs
yarn resourcemanager
start-dfs.sh
stop-dfs.sh
hdfs dfsadmin -report
start-dfs.sh
jps
hdfs dfsadmin -report
hdfs dfs -mkdir /data
hdfs dfs -mkdir /data/raw
hdfs dfs -mkdir /data/processed
hdfs dfs -mkdir /data/analytics
hdfs dfs -ls /data
scp -i "Hadoop-Vm_key.pem" "C:\Users\Elizabeth S\Desktop\diamonds.csv" azureuser@4.178.139.17:/home/azureuser/
scp -i "C:\Users\Elizabeth S\Desktop\Hadoop-Vm_key.pem" "C:/Users/Elizabeth S/Desktop/diamonds.csv" azureuser@4.178.139.17:/home/azureuser/
C:\Users\Elizabeth S\Desktop\Hadoop-Vm_key.pem
ls -l /home/azureuser/
hdfs dfs -put /home/azureuser/diamonds.csv /data/raw/
hdfs dfs -ls /data/raw/
ls
cd /home/azureuser
ls
nano WordCount.java
hadoop com.sun.tools.javac.Main WordCount.java
ls
jar cf wc.jar WordCount*.class
ls -l wc.jar
nano input.txt
hdfs dfs -mkdir /input
hdfs dfs -put input.txt /input/
hadoop jar wc.jar WordCount /input /output
hdfs dfs -cat /output/part-r-00000
hdfs dfs -ls /
hdfs dfs -rm -r /input
hdfs dfs -rm -r /output
hdfs dfs -ls /
ls
rm WordCount* input.txt wc.jar
ls
nano mapper.py
nano reducer.py
nano text_file.txt
cat text_file.txt | python3 mapper.py
cat text_file.txt | python3 mapper.py | sort
cat text_file.txt | python3 mapper.py | sort | python3 reducer.py
cat text_file.txt | python3 mapper.py | sort
nano mapper.py
cat text_file.txt | python3 mapper.py | sort
cat text_file.txt | python3 mapper.py | sort | python3 reducer.py
wget https://downloads.apache.org/spark/spark-3.5.3/spark-3.5.3-bin-hadoop3.tgz
tar -xvf spark-3.4.1-bin-hadoop3.tgz
tar -xvzf spark-3.5.3-bin-hadoop3.tgz
sudo mv spark-3.4.1-bin-hadoop3 /usr/local/spark
sudo mv spark-3.5.3-bin-hadoop3.tgz /usr/local/spark
nano ~/.bashrc
source ~/.bashrc
spark-shell --version
ls /usr/local/spark
ls
sudo mv spark-3.5.3-bin-hadoop3 /usr/local/spark
ls -l /usr/local/spark
sudo rm -rf /usr/local/spark
sudo mv spark-3.5.3-bin-hadoop3 /usr/local/spark
ls -l /usr/local/spark
nano ~/.bashrc
source ~/.bashrc
echo $SPARK_HOME
echo $HADOOP_HOME
echo $JAVA_HOME
spark-shell --version
nano diamonds_analysis.py
spark-submit diamonds_analysis.py 
start-dfs.sh
jps
stop-dfs.sh
cat text_file.txt | python3 mapper.py
cat text_file.txt | python3 mapper.py | sort | python3 reducer.py
cat text_file.txt | python3 mapper.py | sort
cat text_file.txt | python3 mapper.py | sort | python3 reducer.py
spark-submit diamonds_analysis.py
start-dfs.sh
start-yarn.sh
jps
pyspark --version
nano diamonds_analysis.py 
nano mapper_diamonds.py
nano reducer_diamonds.py
hdfs dfs -put diamonds.csv /input/diamonds.csv
jps
ls -l diamonds.csv
cat text_file.txt | python3 mapper.py
cat text_file.txt | python3 mapper.py | sort 
cat text_file.txt | python3 mapper.py | sort | python3 reducer.py
hdfs dfs -ls /data/raw/
hadoop jar /usr/local/hadoop/share/hadoop/tools/lib/hadoop-streaming-*.jar -input /data/raw/diamonds.csv -output /data/output/diamonds_analysis -mapper "python3 mapper_diamonds.py" -reducer "python3 reducer_diamonds.py"
hadoop jar /usr/local/hadoop/share/hadoop/tools/lib/hadoop-streaming-*.jar \
hadoop jar /usr/local/hadoop/share/hadoop/tools/lib/hadoop-streaming-*.jar -input /data/raw/diamonds.csv -output /data/output/diamonds_analysis -mapper "python3 mapper_diamonds.py" -reducer "python3 reducer_diamonds.py"
hdfs dfs -rm -r /data/output/diamonds_analysis
hadoop jar /usr/local/hadoop/share/hadoop/tools/lib/hadoop-streaming-*.jar   -input /data/raw/diamonds.csv   -output /data/output/diamonds_analysis   -mapper "python3 mapper_diamonds.py"   -reducer "python3 reducer_diamonds.py"
hdfs dfs -ls /data/output/diamonds_analysis
hdfs dfs -cat /data/output/diamonds_analysis/part-*
nano reducer_diamonds.py
hadoop jar /usr/local/hadoop/share/hadoop/tools/lib/hadoop-streaming-*.jar -input /data/raw/diamonds.csv -output /data/output/diamonds_analysis -mapper "python3 mapper_diamonds.py" -reducer "python3 reducer_diamonds.py"
hdfs dfs -rm -r /data/output/diamonds_analysis
hadoop jar /usr/local/hadoop/share/hadoop/tools/lib/hadoop-streaming-*.jar   -input /data/raw/diamonds.csv   -output /data/output/diamonds_analysis   -mapper "python3 mapper_diamonds.py"   -reducer "python3 reducer_diamonds.py"
hdfs dfs -cat /data/output/diamonds_analysis/part-*
nano mapper_csv.py
nano reducer_csv.py
hadoop jar /usr/local/hadoop/share/hadoop/tools/lib/hadoop-streaming-*.jar -input /data/raw/prompts.csv -output /data/output/csv_line_count -mapper "python3 mapper_csv.py" -reducer "python3 reducer_csv.py"
hdfs dfs -cat /data/output/csv_line_count/part-*
nano spark_csv.py
spark-submit spark_csv.py
hdfs dfs -ls /data/raw
nano spark_csv.py
spark-submit spark_csv.py
nano mapper_json.py
nano reducer_json.py
hadoop jar /usr/local/hadoop/share/hadoop/tools/lib/hadoop-streaming-*.jar -input /data/raw/pokemon_data.json -output /data/output/json_key_count -mapper "python3 mapper_json.py" -reducer "python3 reducer_json.py"
nano mapper_pokemon.py
nano reducer_pokemon.py
hadoop jar /usr/local/hadoop/share/hadoop/tools/lib/hadoop-streaming-*.jar -input /data/raw/pokemon_data.json -output /data/output/pokemon_analysis -mapper "python3 mapper_pokemon.py" -reducer "python3 reducer_pokemon.py"
nano spark_pokemon.py
spark-submit spark_pokemon.py
hdfs dfs -ls /data/raw/pokemon_data.json
nano spark_pokemon.py
spark-submit spark_pokemon.py
hdfs dfs -cat /data/raw/pokemon_data.json | head -n 10
hdfs dfs -rm -r /data/output/pokemon_analysis/
nano spark_pokemon.py
spark-submit spark_pokemon.py
nano mapper_parquet.py
nano spark_parquet.py
spark-submit spark_parquet.py
nano spark_parquet.py
spark-submit spark_parquet.py
nano mapper_parquet.py
nano reducer_parquet.py
hadoop jar /usr/local/hadoop/share/hadoop/tools/lib/hadoop-streaming-*.jar -input /data/raw/flights-1m.parquet -output /data/output/parquet_avg -mapper "python3 mapper_parquet.py" -reducer "python3 reducer_parquet.py"
nano convert_parquet_to_csv.py
spark-submit convert_parquet_to_csv.py
ls -la
jps
start-dfs.sh
start-yarn.sh
jps
hdfs dfs -ls /data/raw/
hdfs dfs -ls /data/processed/
hdfs dfs -ls /data/analytics/
hadoop jar /usr/local/hadoop/share/hadoop/tools/lib/hadoop-streaming-*.jar     -input /data/raw/diamonds.csv     -output /data/processed/diamonds_output     -mapper mapper_csv.py     -reducer reducer_csv.py
chmod +x mapper_csv.py
chmod +x reducer_csv.py
chmod +x mapper_csv.py
chmod +x reducer_csv.py
cat diamonds.csv | ./mapper_csv.py
nano mapper_csv.py
cat diamonds.csv | ./mapper_csv.py
chmod +x mapper_csv.py
cat diamonds.csv | ./mapper_csv.py
nano mapper_csv.py
cat text_file.txt | python3 mapper.py | sort
cat text_file.txt | python3 reducer.py | sort
cat diamonds.csv | python3 mapper.py | sort
ls -la
cat mapper_csv.py
cat reducer_csv.py
cat mapper_diamonds.py 
cat diamonds.csv | python3 mapper_diamonds.py | head
hadoop jar /usr/local/hadoop/share/hadoop/tools/lib/hadoop-streaming-*.jar     -input /data/raw/diamonds.csv     -output /data/processed/diamonds_output     -mapper mapper_diamonds.py     -reducer reducer_diamonds.py
cat diamonds.csv | python3 mapper_diamonds.py
hadoop jar /usr/local/hadoop/share/hadoop/tools/lib/hadoop-streaming-*.jar     -input /data/raw/diamonds.csv     -output /data/processed/diamonds_output     -mapper mapper_diamonds.py     -reducer reducer_diamonds.py
hdfs dfs -rm -r /data/processed/diamonds_output
hadoop jar /usr/local/hadoop/share/hadoop/tools/lib/hadoop-streaming-*.jar     -input /data/raw/diamonds.csv     -output /data/processed/diamonds_output     -mapper mapper_diamonds.py     -reducer reducer_diamonds.py
jps
start-dfs.sh
jps
hadoop jar /usr/local/hadoop/share/hadoop/tools/lib/hadoop-streaming-*.jar     -input /data/raw/diamonds.csv     -output /data/processed/diamonds_output     -mapper mapper_diamonds.py     -reducer reducer_diamonds.py
hdfs dfs -rm -r /data/processed/diamonds_output
hadoop jar /usr/local/hadoop/share/hadoop/tools/lib/hadoop-streaming-*.jar     -input /data/raw/diamonds.csv     -output /data/processed/diamonds_output     -mapper mapper_diamonds.py     -reducer reducer_diamonds.py
hdfs dfs -ls /data/processed/diamonds_output
ls -la
cat mapper_pokemon.py
cat reducer_pokemon.py
hadoop jar /usr/local/hadoop/share/hadoop/tools/lib/hadoop-streaming-*.jar     -input /data/raw/pokemon_data.json     -output /data/processed/pokemon_output     -mapper mapper_pokemon.py     -reducer reducer_pokemon.py
jps
hdfs getconf -confKey dfs.namenode.http-address
yarn resourcemanager -status
netstat -tulnp | grep -E '9870|8088'
stop-dfs.sh && stop-yarn.sh
start-dfs.sh && start-yarn.sh
sudo ufw allow 9870/tcp
sudo ufw allow 8088/tcp
sudo ufw reload
curl -I http://localhost:9870
curl -I http://localhost:8088
cat convert_parquet_to_csv.py
hdfs dfs -ls /data
start-dfs.sh && start-yarn.sh
ls - la
ls -la
hdfs dfs -ls /data
hdfs dfs -ls /data/raw/
curl -I http://localhost:9870
git init
