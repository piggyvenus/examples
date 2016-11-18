##Configure Nexus Example:
1. git clone http://github.com/samueltauil/nexus
2. oc login -u <your username>
3. oc new-project <your project name>
4. oc new-app https://github.com/samueltauil/nexus
5. oc expose svc nexus
6. click to the route once the pod is up and running
8. export NEXUS_BASE_URL=<nexus route hostname> (example: nexus-nexus.cloudapps.example.com)
9. Run: addjbossrepos.sh 
10. login to nexus as admin/admin123
11. Select repositories 
12. select maven-public repository
13. select all redhat & jboss repos to the left
14. save it
15. Now, you build a test app to use nexus via MAVEN_MIRROR_URL 
16. Example:
17. oc new-build openshift/wildfly~https://github.com/openshift/jee-ex.git -e MAVEN_MIRROR_URL=‘http://nexus.nexus.svc.cluster.local:8081/repository/maven-public/'
(In my example my service name is nexus and project name is nexus)