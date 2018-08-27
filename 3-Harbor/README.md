Harbor

1. Login to Harbor

2. Create a new Project

3. Use Docker CLI to push a new container image to Harbor

4. See the new repository available as part of your Harbor project

We'll use the repository next to push an image to K8s using Helm.

docker pull redis:4.0.11

docker login harbor.haas-63.pez.pivotal.io
docker tag redis:4.0.11 harbor.haas-63.pez.pivotal.io/forrester-new-wave/redis:4.0.11
docker push harbor.haas-63.pez.pivotal.io/forrester-new-wave/redis:4.0.11
