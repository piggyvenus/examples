Deploying springboot app with jar
Option #1: Build from Dockerfile from git repo:
1. oc new-app https://github.com/piggyvenus/osdemo.git

2. create a route from web ui

Please check out the Dockerfile that I have in github.

Option #2: Build from binary

1. mkdir -p test/deployments

2 cp your jar to ~/test/deployments

3. cd ~test/deployments

4.  oc import-image fabric8/s2i-java --confirm

5. oc new-build --image-stream=s2i-java --binary=true --name=myapp

6.  oc start-build myapp --from-dir=.

7. oc deploy myapp

(for the option #2, you may need to update the service port to 8080 if you are using my sample)


