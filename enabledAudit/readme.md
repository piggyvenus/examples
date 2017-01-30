** Enabling Audit log**

1. Add the following to master-config.yaml:

	```
	auditConfig:
  		enabled: true
	````

2. systemclt restart atomic-openshift-master

  
3. Example viewing the audit information:

	```
	journalctl -u atomic-openshift-master |grep AUDIT |grep shanna
	```
