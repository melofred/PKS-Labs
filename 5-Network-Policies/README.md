This lab will guide you throught the creation and management of network security policies using PKS.
NSX-T is required.

1. Deploy a NSX-T NetworkPolicy preventing all access to the MySQL pod deployed


2. Show access is denied


 kubectl run -i --tty ubuntu --image=ubuntu:16.04 --restart=Never -- bash -il


 apt-get update && apt-get install mysql-client -y
 mysql -h my-release-mysql -p 

3. Deploy a new policy, allowing access from your ubuntu container


4. Show you can now access MySQL




