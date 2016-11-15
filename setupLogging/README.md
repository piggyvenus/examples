## Configure Logging on OpenShift v3.3.1.3
1. created pv from cockpit for logging-es-pv
2. create PVC from web ui and name it as logging-es-1
3. Run script as shown below (please validate the values of all parameters for the configmap):
4. last step as: oc label node --all logging-infra-fluentd=true or only label the a individual node.

```
oc project logging
oc new-app logging-deployer-account-template
oadm policy add-cluster-role-to-user oauth-editor \
system:serviceaccount:logging:logging-deployer
oadm policy add-scc-to-user privileged  \
system:serviceaccount:logging:aggregated-logging-fluentd
oadm policy add-cluster-role-to-user cluster-reader \
system:serviceaccount:logging:aggregated-logging-fluentd
oadm policy add-scc-to-user privileged  \
system:serviceaccount:logging:aggregated-logging-elasticsearch
oc create configmap logging-deployer \
   --from-literal kibana-hostname=kibana.<subdomain> \
   --from-literal public-master-url=https://<master_public_hostname>:8443 \
   --from-literal es-cluster-size=1 \
   --from-literal es-pvc-size=95G \
   --from-literal es-instance-ram=4G 
oc create secret generic logging-deployer
oc new-app logging-deployer-template
```
