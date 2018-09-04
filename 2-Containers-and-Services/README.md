Deploying simple containers to Kubernetes

1. Deploying a container using the dashboard

   First, "kubectl proxy" and make sure you're logged in to the right cluster (instructions on Lab 1)

   Access the Kubernetes dashboard by pointing your browser to http://127.0.0.1:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/#!/login

   Navigate to Workloads -> Deployments

   Click on "Create". You could now provide the YAML or JSON configuration of the deployment you're trying to make, or click "Create an App" and provide the information:

    App Name: redis-sample
    Container Image: redis
    Number of Pods: 3
    Service: None  (we'll create one later)


    The Dashboard will pull the Redis official image from https://hub.docker.com/_/redis/  ("redis") and create a deployment as specified.

    Hit deploy and watch your deployment being created. All 3 pods should be running in a few seconds.


2. Deploying a container using the command line (yaml)

   Check the file redis.yml. Deploy it to K8s by using:

$ kubectl apply -f 2-Deploy_container/redis.yml
deployment.apps "redis-sample" created

    Now check all 3 pods are running successfully:   

$ kubectl get deployment redis-sample
NAME           DESIRED   CURRENT   UP-TO-DATE   AVAILABLE   AGE
redis-sample   3         3         3            3           59s

      

3. Exposing the deployment for external access (using NSX-T's Dyamic Load Balancer) 


   Make sure your deployment is up and running:

   $ kubectl get deployments
NAME           DESIRED   CURRENT   UP-TO-DATE   AVAILABLE   AGE
redis-sample   3         3         3            3           4m

   Create a k8s external service, exposing the redis deployment. We're going to use the Redis standard port 6379. For more details on how the image is configured, check the official repository: https://hub.docker.com/_/redis/ 

   NSX-T will automatically deploy a Dynamic LB as the new service is created:

   $ kubectl expose deployment redis-sample --type=LoadBalancer --port=6379 --target-port=6379

service "redis-sample" exposed
   
   Now check the external IP and port assigned to the NSX-T LB:

$ kubectl get services
NAME           TYPE           CLUSTER-IP       EXTERNAL-IP     PORT(S)          AGE
redis-sample   LoadBalancer   10.100.200.176   10.195.19.142   6379:31868/TCP   2m

   You can also check there the LB is internally pointing at by using:

$ kubectl get endpoints redis-sample
NAME           ENDPOINTS                                         AGE
redis-sample   172.28.1.2:6379,172.28.1.3:6379,172.28.1.4:6379   7m

4. Accessing the new deployment


   Make sure you can access the newly exposed service. If you have redis-cli you should be able to connect using the external IP and port.



 
