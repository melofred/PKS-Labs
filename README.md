# PKS-Labs

I. Connect to PKS using CLI

II. List Clusters

III. Create new cluster (async)
pks plans
pks create-cluster newcluster --external-hostname newcluster.haas-63.pez.pivotal.io --plan small

While the new cluster is created:

IV. Provision a new Storage Class (vsphere)

kubectl apply -f 5-Helm/vsphere-volume.yaml
kubectl get storageclasses

V. Deploy Mysql from Helm chart. Show access. 

Deploy Mysql ( helm install --name my-release -f mysql.yaml stable/mysql )
Connect from local machine
kubectl port-forward svc/mysql 3306
/usr/local/opt/mysql-client/bin/mysql -h 127.0.0.1 -P3306 -u root -p default

VI. Restrict access using Network Policy. Access from newly allowed Pod.

Deploy new Network Policy (disabling connections outside of Pods w/ specific label)
kubectl apply -f 4-Network-Policies/policy.yaml
Try to repeat step #2 (will fail)

VII.  Access from newly allowed Pod.
Deploy a Ubuntu pod w/ the right label 
kubectl run -i --tty ubuntu --image=ubuntu:16.04 --restart=Never -- bash -il
apt-get update && apt-get install mysql-client -y
Connect to Mysql from the new Pod:
mysql -h mysql -root -p default


VIII. Show clusters (hopefully new cluster will be done creating)
pks clusters
pks cluster newcluster

IX. Scale cluster 
pks resize -n 4 cluster2



