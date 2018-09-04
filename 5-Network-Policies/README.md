This lab will guide you throught the creation and management of network security policies using PKS.
NSX-T is required.

1. Deploy a NSX-T NetworkPolicy preventing all access to the MySQL pod deployed

 $ kubectl apply -f deny-all.yml 

2. Show access is denied


 $ kubectl run -i --tty ubuntu --image=ubuntu:16.04 --restart=Never -- bash -il

 Now, inside the container session, install MySQL client:

 $ apt-get update && apt-get install mysql-client -y

 Try to connect to the deployed DB. Password is "pivotal"

 $ mysql -h my-release-mysql -p 

3. Deploy a new policy, allowing access from your ubuntu container

 
 $ kubectl apply -f policy-allow-ubuntu.yaml

 This policy allows access from containers tagged as "run: ubuntu", but the same can be done for specific namespaces, IP ranges and other tags/labels. 

4. Show you can now access MySQL

   Repeat step 2. You should be able to access the MySQL container now.


