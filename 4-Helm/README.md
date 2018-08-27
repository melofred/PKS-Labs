1. Install the Helm binaries

   Follow instructions at __https://github.com/helm/helm__  or just use __brew install kubernetes-helm__ in case you use homebrew.

2. Install and configure Helm for your K8s cluster

   Run the script 

   $ ./helm.sh

   Helm should be available now in your Kubernetes cluster provisioned by PKS.

3. Deploy MySQL

   Mysql needs a stateful volume, provisioned as a Persistent Volume claim.
   First, we need to configure a vSphere Storage Class for it to use.

   Check the file __vsphere-volume.yaml__ and deploy it to K8s:

   $ kubectl apply -f 5-Helm/vsphere-volume.yaml

   Check the storage class has been provisioned successfully:
  
   $ kubectl get storageclasses


   Now, check the Mysql Helm Chart provided, using the provisioned vSphere Storage Class:

   $ more mysql.yaml

   Use Helm to install it to Kubernetes:

   $ helm install --name my-release -f mysql.yaml stable/mysql

   
4. See the deployment and all created resources (pods, services, PV claims) in the K8s dashboard

    $ kubectl proxy

    Access
    http://127.0.0.1:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/#!/login


