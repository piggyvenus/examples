# Create an OSEv3 group that contains the master, nodes, etcd, and lb groups.
# The lb group lets Ansible configure HAProxy as the load balancing solution.
# Comment lb out if your load balancer is pre-configured.
[OSEv3:children]
masters
nodes
etcd


# Set variables common for all OSEv3 hosts
[OSEv3:vars]
ansible_ssh_user=root
deployment_type=openshift-enterprise
# SSH user, this user should allow ssh based auth without requiring a password
#ansible_ssh_user=cloud-user
# If ansible_ssh_user is not root, ansible_sudo must be set to true
#ansible_become=yes


osm_default_subdomain=podapp.example.com
osm_default_node_selector='region=primary'
openshift_hosted_router_selector='region=infra'
openshift_registry_selector='region=infra'


# Uncomment the following to enable htpasswd authentication; defaults to
# DenyAllPasswordIdentityProvider.
openshift_master_identity_providers=[{'name': 'htpasswd_auth', 'login': 'true', 'challenge': 'true', 'kind': 'HTPasswdPasswordIdentityProvider', 'filename': '/etc/origin/master/htpasswd'}]


# Native high availbility cluster method with optional load balancer.
# If no lb group is defined installer assumes that a load balancer has
# been preconfigured. For installation the value of
# openshift_master_cluster_hostname must resolve to the load balancer
# or to one or all of the masters defined in the inventory if no load
# balancer is present.
openshift_master_cluster_method=native
openshift_master_cluster_hostname=osedevmaster.example.com
openshift_master_cluster_public_hostname=osedevmaster.example.com


# override the default controller lease ttl
#osm_controller_lease_ttl=30


#172.30.0.0/16 default
openshift_portal_net=172.30.0.0/16
#default 10.1.0.0/16
osm_cluster_network_cidr=172.29.0.0/16


#Metrics stuff
openshift_hosted_metrics_deploy=true
# Override metricsPublicURL in the master config for cluster metrics
# Defaults to https://hawkular-metrics.{{openshift_master_default_subdomain}}/hawkular/metrics
# Currently, you may only alter the hostname portion of the url, alterting the
# `/hawkular/metrics` path will break installation of metrics.
openshift_hosted_metrics_public_url=https://hawkular-metrics.cloudapps.example.com/hawkular/metrics


# Option B - External NFS Host
# NFS volume must already exist with path "nfs_directory/_volume_name" on
# the storage_host. For example, the remote volume path using these
# options would be "nfs.example.com:/exports/metrics"
#openshift_hosted_metrics_storage_kind=nfs
#openshift_hosted_metrics_storage_access_modes=['ReadWriteOnce']
#openshift_hosted_metrics_storage_host=nfsserver
#openshift_hosted_metrics_storage_nfs_directory=/exports
#openshift_hosted_metrics_storage_volume_name=metrics
#openshift_hosted_metrics_storage_volume_size=100Gi




# Registry Storage Options
# External NFS Host
# NFS volume must already exist with path "nfs_directory/_volume_name" on
# the storage_host. For example, the remote volume path using these
# options would be "nfs.example.com:/exports/registry"
#openshift_hosted_registry_storage_kind=nfs
#openshift_hosted_registry_storage_access_modes=['ReadWriteMany']
#openshift_hosted_registry_storage_host=nfsserver
#openshift_hosted_registry_storage_nfs_directory=/exports
#openshift_hosted_registry_storage_volume_name=registry
#openshift_hosted_registry_storage_volume_size=100Gi




# host group for masters
[masters]
master1.example.com
master2.example.com
master3.example.com

# etcd group for masters
[etcd]
master1.example.com
master2.example.com
master3.example.com

# host group for nodes, includes region info
[nodes]
master1.example.com openshift_node_labels="{'region': 'masters', 'zone': 'default'}"
master2.example.com openshift_node_labels="{'region': 'masters', 'zone': 'default'}"
master3.example.com openshift_node_labels="{'region': 'masters', 'zone': 'default'}"
infra1.example.com openshift_node_labels="{'region': 'infra', 'zone': 'default'}"
infra2.example.com openshift_node_labels="{'region': 'infra', 'zone': 'default'}"
node1.example.com openshift_node_labels="{'region': 'primary', 'zone': 'east'}"
node2.example.com openshift_node_labels="{'region': 'primary', 'zone': 'west'}"
