Pre-requisites:

- PKS installed
- User authenticated to the PKS CLI as admin

 

1. Use the PKS CLI to list current clusters

  $ pks clusters

   <output without any existing clusters>

2. Check the current available plans for PKS:

  $ pks plans


Name   ID                                    Description
small  8A0E21A8-8072-4D80-B365-D1F502085560  Example: This plan will configure a lightweight kubernetes cluster. Not recommended for production workloads.


  The PKS operator can configure additional plans using Ops Manager.


3. Create a new PKS cluster

   $ pks create-cluster cluster1 -p small -e cluster1.haas-63.pez.pivotal.io -n 4

Name:                     cluster1
Plan Name:                small
UUID:                     cd1e35dd-4fcd-43c7-9219-0815cb6df8ad
Last Action:              CREATE
Last Action State:        in progress
Last Action Description:  Creating cluster
Kubernetes Master Host:   cluster1.haas-63.pez.pivotal.io
Kubernetes Master Port:   8443
Worker Nodes:             4
Kubernetes Master IP(s):  In Progress

Use 'pks cluster cluster1' to monitor the state of your cluster

  
   In this example I'm using 4 worker nodes for my cluster. You can check the progress of the creation by using the "pks cluster <name>" command.

4. After a few minutes, check of the cluster has already been succesfully created:


  $ pks cluster cluster1

Name      Plan Name  UUID                                  Status     Action
cluster1  small      95b0149e-5513-41c1-b101-665ddfb55791  succeeded  CREATE


5. Once your cluster has been created, you can configure kubectl to point at it by using

   $ pks get-credentials cluster1

Fetching credentials for cluster cluster1.
Context set for cluster cluster1.

You can now switch between clusters by using:
$kubectl config use-context <cluster-name>

    Now kubectl is already pointing at your cluster and we're ready to deploy containers on it. You can access the Kubernetes dashboard by using

   $ kubectl proxy

   Then point your browser to http://127.0.0.1:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/#!/login

   You'll need a kubeconfig file pointing to your cluster for the dashboard login. You can use "kubectl config view >> kubeconfig" to generate that file.


6. The cluster can be scaled out by using "pks resize <number_of_nodes"


   $ pks resize cluster1 --num-nodes=5

Are you sure you want to resize cluster cluster1 to 5? (y/n): y
Use 'pks cluster cluster1' to monitor the state of your cluster


6. If you're not using the cluster anymore, you can delete it by using 

   $ pks delete-cluster cluster1   
