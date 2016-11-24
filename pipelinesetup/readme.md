## Configure Pipeline
1. create a file /etc/origin/master/tech-preview.js
2. add 'window.OPENSHIFT_CONSTANTS.ENABLE_TECH_PREVIEW_FEATURE.pipelines = true;' to the file
3. add the following under assetConfig
extensionScripts:
    - /etc/origin/master/tech-preview.js