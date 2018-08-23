docker pull redis:4.0.11

docker login harbor.haas-63.pez.pivotal.io
docker tag redis:4.0.11 harbor.haas-63.pez.pivotal.io/forrester-new-wave/redis:4.0.11
docker push harbor.haas-63.pez.pivotal.io/forrester-new-wave/redis:4.0.11
