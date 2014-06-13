# TODO - replication-factor should match or be less then, the number of brokers
# TODO - Kafka is setup to create topics automatically if they don't exist
$KAFKA_HOME/bin/kafka-topics.sh --create --zookeeper $ZK_PORT_2181_TCP_ADDR --partitions 2 --replication-factor 2 --topic twitter-monitor-event
$KAFKA_HOME/bin/kafka-topics.sh --create --zookeeper $ZK_PORT_2181_TCP_ADDR --partitions 2 --replication-factor 2 --topic analyse-event
$KAFKA_HOME/bin/kafka-topics.sh --create --zookeeper $ZK_PORT_2181_TCP_ADDR --partitions 2 --replication-factor 2 --topic policy-violation-event
$KAFKA_HOME/bin/kafka-topics.sh --create --zookeeper $ZK_PORT_2181_TCP_ADDR --partitions 2 --replication-factor 2 --topic notification-event
