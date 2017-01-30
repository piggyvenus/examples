auditConfig:
  enabled: true
  
Example viewing the audit information:

```
journalctl -u atomic-openshift-master |grep AUDIT |grep shanna
```
