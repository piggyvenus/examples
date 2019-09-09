# Request lab environment

1. login https://labs.opentlc.com
2. Go to Services -> Catalogs
3. Expand OPENTLC OpenShift 4 labs
4. Click OpenShift 4 AWS Install VM -> click "Order"
5. Fill out the information and click Submit.
6. you will get an email about your environment
7. SSH to the install VM as instructed from the email. Sudo as root and run the setup.sh
8. After setup.sh, you will be ready to run `openshift-install create cluster`.
9. You will select the region
10. Enter cluster id. Please use cluster-{GUID} which GUID is provided in your email.
11. Copy pull secret from https://cloud.redhat.com/openshift/install/aws/installer-provisioned and paste when prompted.
12. It will take about 30 mins to finish the installation.
