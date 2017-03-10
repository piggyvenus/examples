Setup a NFS server:
Assumption: 
- /exports is formated and mounted on the server
- run: df -h 
  shows /exports is mounted

Steps:

1. copy and execute the setup.sh
2. chmod +x setup.sh
3. run: ./setup.sh (make sure you have root permission to run this)
4. Please run the following on all the nodes: setsebool -P virt_use_nfs=true
   
   or, do this on master: ssh $NODE1FQDN "setsebool -P virt_use_nfs=true
5. systemctl enable rpcbind nfs-server
6. systemctl start rpcbind nfs-server

To test: mount -t nfs server:/exports/registry /mnt/home
         umount /mnt/home
