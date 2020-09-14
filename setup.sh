#!/bin/bash
echo "*********************************"
echo "Starting the replica set"
echo "*********************************"

sleep 20 | echo "Sleeping"

# Primary
mongo mongodb://mongo-0:27017 replicaSet.js

echo "*********************************"
echo "Replica set DONE!"
echo "*********************************"