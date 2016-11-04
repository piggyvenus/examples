Remove your existing template:
1. oc project default
2. oc delete template project-request

Add the new template
1. copy my attached template.yaml (which has example of the quota and LimitRange objects)
2. oc create -f template.yaml -n default
3. vi /etc/origin/master/master-config.yaml 
4. systemctl restart atomic-openshift-master
