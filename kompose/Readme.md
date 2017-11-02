## step to use kompose
curl -L https://github.com/kubernetes/kompose/releases/download/v1.4.0/kompose-darwin-amd64 -o kompose
oc login -u shanna <ocp_master_url>
oc new-project kompose
cp /tmp/docker-compose.yml .
chmod +x kompose 
./kompose --provider OpenShift up
./kompose --provider OpenShift up
oc get all

