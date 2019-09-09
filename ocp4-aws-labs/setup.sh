# you must be root to run this script
# sudo -i

echo ${GUID}
# Download the latest AWS Command Line Interface
curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip"
unzip awscli-bundle.zip

# Install the AWS CLI into /bin/aws
./awscli-bundle/install -i /usr/local/aws -b /bin/aws

# Validate that the AWS CLI works
aws --version

# Clean up downloaded files
rm -rf /root/awscli-bundle /root/awscli-bundle.zip
# Please pick your OCP_VERSION
OCP_VERSION=$1
wget https://mirror.openshift.com/pub/openshift-v4/clients/ocp/${OCP_VERSION}/openshift-install-linux-${OCP_VERSION}.tar.gz
tar zxvf openshift-install-linux-${OCP_VERSION}.tar.gz -C /usr/bin
rm -f openshift-install-linux-${OCP_VERSION}.tar.gz /usr/bin/README.md
chmod +x /usr/bin/openshift-install

wget https://mirror.openshift.com/pub/openshift-v4/clients/ocp/${OCP_VERSION}/openshift-client-linux-${OCP_VERSION}.tar.gz
tar zxvf openshift-client-linux-${OCP_VERSION}.tar.gz -C /usr/bin
rm -f openshift-client-linux-${OCP_VERSION}.tar.gz /usr/bin/README.md
chmod +x /usr/bin/oc
ls -l /usr/bin/{oc,openshift-install}
oc completion bash >/etc/bash_completion.d/openshift

# Please add your AWSKEY and AWSSECRETKEY
export AWSKEY=$2
export AWSSECRETKEY=$3
export REGION=us-east-2

mkdir $HOME/.aws
cat << EOF >>  $HOME/.aws/credentials
[default]
aws_access_key_id = ${AWSKEY}
aws_secret_access_key = ${AWSSECRETKEY}
region = $REGION
EOF

aws sts get-caller-identity
echo "run `openshift-install create cluster` with you are already."
echo "please go to cloud.redhat.com if you need more details."
