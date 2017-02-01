oc project logging
oc new-app logging-deployer-account-template
oadm policy add-cluster-role-to-user oauth-editor \
       system:serviceaccount:logging:logging-deployer
oadm policy add-scc-to-user privileged  \
    system:serviceaccount:logging:aggregated-logging-fluentd
oadm policy add-cluster-role-to-user cluster-reader \
    system:serviceaccount:logging:aggregated-logging-fluentd
oadm policy add-cluster-role-to-user rolebinding-reader \
     system:serviceaccount:logging:aggregated-logging-elasticsearch

adm policy add-scc-to-user privileged  \
       system:serviceaccount:logging:aggregated-logging-elasticsearch 

oc create configmap logging-deployer \
   --from-literal kibana-hostname=kibana.cloudapps.example.com \
   --from-literal public-master-url=https://node22.example.com:8443 \
   --from-literal es-cluster-size=1 \
   --from-literal es-instance-ram=1G
oc create secret generic logging-deployer
oc new-app logging-deployer-template
#oc label node --all logging-infra-fluentd=true
#or
#oc label node/node.example.com logging-infra-fluentd=true
#loggingPublicURL: "https://kibana.cloudapps.example.com"
