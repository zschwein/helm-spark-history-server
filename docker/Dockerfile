ARG SPARK_VERSION=3.3.1

FROM apache/spark:${SPARK_VERSION}

USER root

ARG HADOOP_VERSION=3.3.1
ARG AWS_SDK_VERSION=1.12.224
ARG MAVEN_REPO_URL=https://repo.maven.apache.org/maven2

ADD ${MAVEN_REPO_URL}/com/amazonaws/aws-java-sdk-core/${AWS_SDK_VERSION}/aws-java-sdk-core-${AWS_SDK_VERSION}.jar $SPARK_HOME/jars/
ADD ${MAVEN_REPO_URL}/com/amazonaws/aws-java-sdk-sts/${AWS_SDK_VERSION}/aws-java-sdk-sts-${AWS_SDK_VERSION}.jar $SPARK_HOME/jars/
ADD ${MAVEN_REPO_URL}/com/amazonaws/aws-java-sdk-s3/${AWS_SDK_VERSION}/aws-java-sdk-s3-${AWS_SDK_VERSION}.jar $SPARK_HOME/jars/
ADD ${MAVEN_REPO_URL}/com/amazonaws/aws-java-sdk-dynamodb/${AWS_SDK_VERSION}/aws-java-sdk-dynamodb-${AWS_SDK_VERSION}.jar $SPARK_HOME/jars/
ADD ${MAVEN_REPO_URL}/org/apache/hadoop/hadoop-aws/${HADOOP_VERSION}/hadoop-aws-${HADOOP_VERSION}.jar $SPARK_HOME/jars/
ADD ${MAVEN_REPO_URL}/org/apache/hadoop/hadoop-common/${HADOOP_VERSION}/hadoop-common-${HADOOP_VERSION}.jar $SPARK_HOME/jars/
RUN chmod -R 644 /opt/spark/jars/*
RUN mkdir -p /opt/test/bucket/

ENTRYPOINT [ "/opt/entrypoint.sh" ]
