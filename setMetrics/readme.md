##Configure Metrics

Setup Script

```
metrics_host=hawkular-metrics.cloudapps.example.com
echo "Createing Metrics"
oc project openshift-infra
oc create -f - <<API
apiVersion: v1
kind: ServiceAccount
metadata:
  name: metrics-deployer
secrets:
- name: metrics-deployer
API

oadm policy add-role-to-user edit \
system:serviceaccount:openshift-infra:metrics-deployer \
-n openshift-infra

oadm policy add-cluster-role-to-user cluster-reader \
system:serviceaccount:openshift-infra:heapster \
-n openshift-infra

oc secrets new metrics-deployer nothing=/dev/null
oc process metrics-deployer-template -n openshift -v HAWKULAR_METRICS_HOSTNAME=$metrics_host,USE_PERSISTENT_STORAGE=false | oc create -f -

echo "MAUNUAL SETPS"
echo "add line to /etc/origin/master-config.yaml"
echo "assetConfig:"
echo "metricsPublicURL: https://$metrics_host/hawkular/metrics"
```



### Cleanup:
1. oc delete all,sa,templates,secrets,pvc --selector="metrics-infra"
2. oc delete sa,secret metrics-deployer