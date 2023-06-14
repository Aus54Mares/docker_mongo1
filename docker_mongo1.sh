
docker pull mongo:4.0.27 

mkdir /data1

## 先不使用 auth方式 
docker run  --name MyMongo                 \
  --network=host                           \
  -v /data1/mongod.conf:/etc/mongod.conf   \
  -v /data1/mongodb/config:/data/configdb  \
  -v /data1/mongodb/db:/data/db            \
  -d mongo:4.0.27                           


### 如果mongo进行了auth验证，或者如果mongo里，已经建立了用户名/密码，
###   那么，需要增加如下2行（如果mongo里，没有建立用户名/密码，就不要加下面2行）
### 这里的 admin admin11 是mongo里的用户名/密码；
###   --env ME_CONFIG_MONGODB_ADMINUSERNAME='admin'  \
###   --env ME_CONFIG_MONGODB_ADMINPASSWORD='admin11'  \
### 这里使用了 --network=host 模式

docker run -itd  --name mongo-express                 \
  --network=host                                      \
  --env ME_CONFIG_MONGODB_SERVER='192.168.79.11'      \
  --env ME_CONFIG_MONGODB_ADMINUSERNAME='admin'  \
  --env ME_CONFIG_MONGODB_ADMINPASSWORD='admin11'  \
  --env ME_CONFIG_BASICAUTH_USERNAME='user11'     \
  --env ME_CONFIG_BASICAUTH_PASSWORD='111111'     \
  mongo-express:latest





