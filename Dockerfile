#Checkout https://hub.docker.com/r/microsoft/iis/ on how to make a simple IIS based web site in a docker container

FROM microsoft/iis
RUN powershell -NoProfile -Command Remove-Item -Recurse C:\inetpub\wwwroot\*
WORKDIR /inetpub/wwwroot
COPY content/ .

#build using 
#docker build -t iis-site . -f .\Hello-Docker.dockerfile
#docker run -d -p 8000:8000 --name my-running-site iis-site

#makes also a site running.. on default port 80
#docker run -d --name site2 iis-site 
#which ip can be seein using
#docker inspect site2

#or more specific:
#docker inspect site2 | select-string -Pattern "IPAddress"

#to get a prompt on in the container
#docker exec -it site2 Powershell
#then you can for instance:
#ipconfig, ls, get-windowsfeature etc..

#will this work.. content updated..

#changed dockerfile file name to Dockerfile to make it build on dockerhub.. git st show no changes.. probably windows.. forcing change by writing comment..

#damn it.. building windows based images is not supported on dockerhub.. yet.. https://docs.docker.com/docker-hub/builds/


