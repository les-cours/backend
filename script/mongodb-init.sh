#!/bin/bash

echo "start mongodb"
cd /data
mkdir -p db1 db2 db3
cp /data/keyfile/mongo-keyfile.key /etc
chmod 600 /etc/mongo-keyfile.key
chown mongodb:mongodb db1 db2 db3 /etc/mongo-keyfile.key


/usr/bin/mongod --auth --dbpath /data/db1 --port 27017 --bind_ip localhost,mongo --replSet myRS  --keyFile /etc/mongo-keyfile.key  & 
/usr/bin/mongod --auth --dbpath /data/db2 --port 27018 --bind_ip localhost,mongo --replSet myRS  --keyFile /etc/mongo-keyfile.key > /dev/null & 
/usr/bin/mongod --auth --dbpath /data/db3 --port 27019 --bind_ip localhost,mongo  --replSet myRS  --keyFile /etc/mongo-keyfile.key > /dev/null &

sleep 30 # this sleep is critical don't remove it

echo "----------------------------------start mongo replicaset initialisation-------------------------------------------------"
mongosh  --port 27017  <<EOF  

 var config = {
     _id: "myRS",
     version: 1,
     members: [
         { _id: 0, host: "mongo:27017", priority: 2},
         { _id: 1, host: "mongo:27018", priority: 1},
         { _id: 2, host: "mongo:27019", priority: 1},
     ]
 };
 rs.initiate(config, { force: true });
EOF

echo "---------------------------------- Finish mongo replicaset initialisation -------------------------------------------------"

sleep 30 # this sleep is critical don't remove it

echo  " -------------------------------- start create user  ---------------------------------------------------------------------"
  
mongosh --port 27017 <<EOF
    use admin;
    db.createUser(
        {
            user: "root",
            pwd: "rootpassword", 
            roles: [ { role: "root", db: "admin" }]
        }
    );
EOF

echo  " --------------------------------  Finish creating user ---------------------------------------------------------------------"

echo  " --------------------------------  Mongodb is ready now ---------------------------------------------------------------------"

tail -f /dev/null


