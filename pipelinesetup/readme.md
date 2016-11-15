## Configure Pipeline on OpenShift v3.3.1.3
1. create file tech-preview.js under /etc/origin/master
Add the following content in the file: 

```
window.OPENSHIFT_CONSTANTS.ENABLE_TECH_PREVIEW_FEATURE.pipelines = true;
```

2. Edit master-config.yaml and add the following into the file:

```
extensionScripts:
    - /etc/origin/master/tech-preview.js
```
