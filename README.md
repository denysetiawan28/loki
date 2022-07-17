#How To Use This Template

- replace **go-template** with your desired service name 
- replace **organization-id** with your desired organization (for docker file)
- replace **organization** with your desired organization (for git)



-------------------------
# go-template

go-template is a service build with go language, service that handle........

### Function Of This Service
- Function Service....

### Requirements
- Golang 1.17

### Installation
#### Local
```shell
//clone project
git clone git@bitbucket.org:organization/go-template.git
//change directory to project
cd thor
//downloading go module dependency
go mod tidy
```
#### Docker
```shell
//1ST TIME
git clone git@bitbucket.org:organization/go-template.git
cd go-template
sudo su
docker build -t organization/go-template-server:1.0.0 .
docker run -d -p 9090:9090 --net bridge --name go-template-service organization/go-template-server:1.0.0

//2ND TIME & Continously
cd go-template
git pull
sudo su
docker build -t organization/go-template-server:1.0.1 .
docker kill go-template-service
docker rm go-template-service
docker run -d -p 9090:9090 --net bridge --name go-template-service organization/go-template-server:1.0.1
```
### Migration Files
- Not implemented yet

### Environment Variables
 ```
APPS_NAME=go-template
APPS_VERSION=1.0.0
APPS_HTTP_PORT=9090

DB_MASTER_HOST=go-template
DB_MASTER_USERNAME=go-template
DB_MASTER_PASSWORD=go-template
DB_MASTER_NAME=go-template
DB_MASTER_SHCEMA=go-template
DB_MASTER_PORT=go-template
DB_MASTER_CONNECTION_TIMEOUT= 20s
DB_MASTER_IDLE_CONNECTION=5
DB_MASTER_MAX_OPEN_CONNECTION=10
DB_MASTER_DEBUG_MODE=true
 ```