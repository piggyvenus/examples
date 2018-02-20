## Post steps for logging
1. add this following to /etc/ansible/hosts
# Logging
openshift_logging_install_logging=true
openshift_logging_namespace=logging
openshift_logging_storage_kind=nfs
openshift_logging_storage_access_modes=['ReadWriteOnce']
openshift_logging_storage_host=10.0.0.148
openshift_logging_storage_nfs_directory=/exports
openshift_logging_storage_volume_name=logging
openshift_logging_storage_volume_size=20Gi
openshift_logging_storage_labels={'storage': 'logging'}
openshift_logging_es_cluster_size=1

2. run the following
ansible-playbook   /usr/share/ansible/openshift-ansible/playbooks/byo/openshift-cluster/openshift-logging.yml

3. Uninstall
just change `openshift_logging_install_logging=false`
run step 2.
