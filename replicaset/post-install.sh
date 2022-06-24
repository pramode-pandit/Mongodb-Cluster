# Set up Replication Host

kubectl exec -it mongodb-replica-0 -n default -- mongo
rs.initiate()
var cfg = rs.conf()
cfg.members[0].host="mongodb-replica-0.mongo:27017"
rs.reconfig(cfg)
rs.add("mongodb-replica-1.mongo:27017")
rs.add("mongodb-replica-2.mongo:27017")
rs.status()

