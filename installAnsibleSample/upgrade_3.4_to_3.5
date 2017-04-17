1) update rpm
subscription-manager unsubscribe --all
subscription-manager attach --pool=<pool id>
subscription-manager repos --disable="*"
subscription-manager repos     --enable="rhel-7-server-rpms"     --enable="rhel-7-server-extras-rpms"     --enable="rhel-7-server-ose-3.5-rpms"     --enable="rhel-7-fast-datapath-rpms"
yum clean all
yum update atomic-openshift-utils
yum install atomic-openshift-excluder atomic-openshift-docker-excluder
oc login -u system:admin
2) update ansible hosts file 
Make sure openshift_master_default_subdomain=cloudapps.example.com instead of osm before running upgrade
3) run upgrade playbook
ansible-playbook /usr/share/ansible/openshift-ansible/playbooks/byo/openshift-cluster/upgrades/v3_5/upgrade.yml 
4)update metrics info as following
openshift_metrics_install_metrics=true 
openshift_metrics_image_version=3.5
openshift_metrics_hawkular_hostname=hawkular-metrics.cloudapps.example.com
openshift_metrics_cassandra_storage_type=pv

