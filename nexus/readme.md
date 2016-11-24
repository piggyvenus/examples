## Setting Nexus on OpenShift v3.3.1.3

1. git clone https://github.com/samueltauil/nexus
2. cd nexus
3. oc login 
4. oc new-project nexus
5. ./provision.sh
6. Once the nexus is up
7. Login via route as admin/admin123
8. export NEXUS_BASE_URL as script addjbossrepos.sh  
9. run ./addjbossrepos.sh
10. Refresh Nexus control 
11. click on the engine icon at the top
12. select repositories 
13. select the maven-public repositoryand go to maven_public repo
11. move all jboss and redhat repos to left
12. save
13. Start building with MAVEN_MIRROR_URL with the service DNS name; i.e. http://<nexus_service_name>.<project_name>.svc.cluster.local:8081/repository/maven-public/
