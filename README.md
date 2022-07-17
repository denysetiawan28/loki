# Loki

Loki is a service build with go language, service that serve billing data reconcile and automatic cut off for reconcile

### Function Of This Service
- Billing Reconcile Data Generation (Scheduler)
- Automation Cut Off (Scheduler)

### Requirements
- Golang 1.17

### Installation
#### Local
```shell
//clone project
git clone git@bitbucket.org:titipaja/loki.git
//change directory to project
cd thor
//downloading go module dependency
go mod tidy
```
#### Docker
```shell
//1ST TIME
git clone git@bitbucket.org:titipaja/loki.git
cd loki
sudo su
docker build -t titipaja/loki-server:1.0.0 .
docker run -d -p 9090:9090 --net bridge --name loki-service titipaja/loki-server:1.0.0

//2ND TIME & Continously
cd loki
git pull
sudo su
docker build -t titipaja/loki-server:1.0.1 .
docker kill loki-service
docker rm loki-service
docker run -d -p 9090:9090 --net bridge --name loki-service titipaja/loki-server:1.0.1
```
### Migration Files
- Not implemented yet

### Environment Variables
 ```
APPS_NAME=loki
APPS_VERSION=1.0.0
APPS_HTTP_PORT=9090

DB_MASTER_HOST=loki
DB_MASTER_USERNAME=loki
DB_MASTER_PASSWORD=loki
DB_MASTER_NAME=loki
DB_MASTER_SHCEMA=loki
DB_MASTER_PORT=loki
DB_MASTER_CONNECTION_TIMEOUT= 20s
DB_MASTER_IDLE_CONNECTION=5
DB_MASTER_MAX_OPEN_CONNECTION=10
DB_MASTER_DEBUG_MODE=true
 ```