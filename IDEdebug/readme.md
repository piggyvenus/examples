## Starting OCP locally via
#https://github.com/openshift/origin/releases
oc cluster up --metric --logging


## Configure IDB to enable debug for JAVA
1. Install JBoss Tool plug-in
2. Install Red Hat JBoss Developer Studio
3. Create OpenShift conection under OpenShift Explorer
4. Deploy application 
template: 
   - oc create -f eap64-basic-s2i.json
   - oc create -f jboss-image-streams.json
   - APPLICATION_NAME: ticket-monster
   - CONTEXT_DIR: demo
   - SOURCE_REPOSITORY_URL: https://github.com/jboss-developer/ticket-monster.git
   - SOURCE_REPOSITORY_REF: 2.7.0.Final
5. Make sure add 8787 as debug port in DC before the pod was deployed


 ```             
            - name: debug
              containerPort: 8787
              protocol: TCP
 ```
 
6. Right click on the Deployment Config --> goto Manage Environment variables --> add DEBUG = true and DEBUG_PORT = 8787
7.   Wait until your application is build and deploy, right click on the pod under OpenShift Explorer
8.   goto port forward and start all the ports
9.  add OpenShift under server tab under debug prospect
10. set break point in BookingService line 127 public Response createBooking (src/main/java/org/jboss/examples/ticketmonster/rest)
11. right click on ticket-monster under servers tab and select debug to start 
https://developers.redhat.com/blog/2016/08/26/using-red-hat-jboss-developer-studio-to-debug-java-applications-in-the-red-hat-container-development-kit/
