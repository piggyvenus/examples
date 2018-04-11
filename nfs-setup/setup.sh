#!/bin/bash
echo "setting volume for internal registry"
mkdir -p /exports/registry
chown nfsnobody:nfsnobody /export/registryVol
chmod 777 /exports/registry
cat <<EOF > /etc/exports
/export/registry *(rw,root_squash)
EOF
exportfs -a

#doesn't need this steps any more
echo "modify /etc/sysconfig/iptables"
cp /etc/sysconfig/iptables /etc/sysconfig/iptables.bak
sed -i 's|COMMIT||g' /etc/sysconfig/iptables
echo "-A OS_FIREWALL_ALLOW -p tcp -m state --state NEW -m tcp --dport 53248 -j ACCEPT" >> /etc/sysconfig/iptables
echo "-A OS_FIREWALL_ALLOW -p tcp -m state --state NEW -m tcp --dport 50825 -j ACCEPT" >> /etc/sysconfig/iptables
echo "-A OS_FIREWALL_ALLOW -p tcp -m state --state NEW -m tcp --dport 20048 -j ACCEPT" >> /etc/sysconfig/iptables
echo "-A OS_FIREWALL_ALLOW -p tcp -m state --state NEW -m tcp --dport 2049 -j ACCEPT" >> /etc/sysconfig/iptables
echo "-A OS_FIREWALL_ALLOW -p tcp -m state --state NEW -m tcp --dport 111 -j ACCEPT" >> /etc/sysconfig/iptables
echo "COMMIT" >> /etc/sysconfig/iptables

cp /etc/sysconfig/nfs /etc/sysconfig/nfs.bak
sed -i 's|RPCMOUNTDOPTS=\"|RPCMOUNTDOPTS=\"-p 20048|g' /etc/sysconfig/nfs
sed -i 's|STATDARG=\"|STATDARG=\"-p 50825|g' /etc/sysconfig/nfs
setsebool -P virt_use_nfs=true
echo "Please run the following on all the nodes"
echo "setsebool -P virt_use_nfs=true"
echo "or, do this on master: ssh $NODE1FQDN "setsebool -P virt_use_nfs=true"
echo "systemctl enable rpcbind nfs-server"
echo "systemctl start rpcbind nfs-server"
