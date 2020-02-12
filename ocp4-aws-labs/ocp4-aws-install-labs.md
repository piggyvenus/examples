# Request lab environment

1. login https://labs.opentlc.com
2. Go to Services -> Catalogs
3. Expand OPENTLC OpenShift 4 labs
4. Click OpenShift 4 AWS Install VM -> click "Order"
5. Fill out the information and click Submit.
6. you will get an email about your environment and any access information that you will need.
7. SSH to the install VM as instructed from the email and Sudo as root

```
ssh username@<bastion hostname from the email>
sudo -i

```

8. Download the setup.sh script and run it as shown below
```
wget https://raw.githubusercontent.com/piggyvenus/examples/master/ocp4-aws-labs/setup.sh
./setup.sh

chmod +x ./setup.sh
./setup.sh  <version> <AWSKEY> <AWSSECRETKEY>

```

> NOTE: for a list of versions use https://mirror.openshift.com/pub/openshift-v4/clients/ocp/  

9. After setup.sh, you will be ready to run `openshift-install create cluster`.
10. You will select the region
11. Enter cluster id. Please use cluster-{GUID} as cluster id. Note that GUID is provided in your email.
12. Copy pull secret from https://cloud.redhat.com/openshift/install/aws/installer-provisioned (login with your credentials) and paste it when prompted.
13. It will take about 30 mins to finish the installation.
