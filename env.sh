# connect to VPN first

pks login -k -a api.pks.haas-63.pez.pivotal.io -u fmelo -p fmelo
pks clusters

# show kubectl config. If poiting to the wrong cluster, one needs to use "pks get-credentials <cluster-name>" in order to config kubectl

kubectl cluster-info 
