#!/usr/bin/env bash

export SPARK_MAJOR="3.4"
export SPARK_MINOR="${SPARK_MAJOR}.2"
export HADOOP_VER="3"
export SPARK_HOME="${HOME}/spark-${SPARK_MINOR}-bin-hadoop${HADOOP_VER}"
export PYSPARK="${SPARK_HOME}/bin/pyspark"
export PYSPARK_DRIVER_PYTHON="jupyter"
export PYSPARK_DRIVER_PYTHON_OPTS='lab --ip=0.0.0.0 --port 8989 --allow-root --no-browser --IdentityProvider.token=""'
export PYARROW_IGNORE_TIMEZONE=1
export SPARK_LOCAL_IP="localhost"
export EXTRA_JO="-Djava.awt.headless=true -Dfile.encoding=UTF-8 -Duser.timezone=UTC"
export EXTRA_JO="${EXTRA_JO} -XX:+UseG1GC"
export EXTRA_JO="${EXTRA_JO} -XX:InitiatingHeapOccupancyPercent=55"
export EXTRA_JO="${EXTRA_JO} -XX:ParallelGCThreads=20"
export EXTRA_JO="${EXTRA_JO} -XX:+TieredCompilation"
export EXTRA_JO="${EXTRA_JO} -XX:+UseStringDeduplication"
export MASTER="local[*]"

$PYSPARK\
  --master "${MASTER}"\
  --conf spark.default.parallelism=20\
  --conf spark.driver.extraJavaOptions="${EXTRA_JO}"\
  --conf spark.driver.maxResultSize=2G\
  --conf spark.driver.memory=64G\
  --conf spark.executor.cores=10\
  --conf spark.executor.extraJavaOptions="${EXTRA_JO}"\
  --conf spark.executor.memory=64G\
  --conf spark.kryo.unsafe=true\
  --conf spark.kryoserializer.buffer.max=256M\
  --conf spark.memory.offHeap.enabled=true\
  --conf spark.memory.offHeap.size=64G\
  --conf spark.serializer=org.apache.spark.serializer.KryoSerializer\
  --conf spark.local.dir=/tmp\
  --conf spark.sql.catalogImplementation=in-memory\
  --conf spark.sql.execution.arrow.pyspark.enabled=true\
  --conf spark.sql.shuffle.partitions=200\
  --conf spark.ui.enabled=false\
  --conf spark.ui.showConsoleProgress=true
