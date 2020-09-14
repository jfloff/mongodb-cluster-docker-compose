# MongoDB Cluster using Docker Compose

This repo creates a MongoDB cluster (aka ReplicaSet) using Docker Compose. The main goal is to observe write/read behavior between MongoDB replicas, and how we can observe replication mechanisms between nodes.


## Instructions
Deploy the cluster using: `docker-compose up` or `docker-compose up -d`

After a while the `setup` container will configure the cluster and then you are ready to use mongo.
Interaction example:
- Write in the primary:
```
$ docker-compose exec mongo-0 mongo
PRIMARY> db.products.insertOne( { _id: 11, item: "box", qty: 20 } )
```

- Read from secondary:
```
$ docker-compose exec mongo-2 mongo
SECONDARY> db.products.find( { _id: 11 } ).readPref("primaryPreferred")
# or
SECONDARY> rs.slaveOk()
SECONDARY> db.products.find( { _id: 11 } )
```

### Admin
In order to access the admin dashboard go to: `http://<localhost>:1234/` and add the connection to all replicas, e.g. `mongodb://mongo-0`.

### Notes
- For this deployment, sharding was not a requirement, hence we skip it.
- The `setup` container is only used to run the replica configuration.


## Ref:
- [Creating a Mongo ReplicaSet using docker](https://www.youtube.com/watch?v=mlw7vWISaF4&t=627s)
- [MongoDB Cluster Docker Compose (with sharding)](https://github.com/minhhungit/mongodb-cluster-docker-compose)