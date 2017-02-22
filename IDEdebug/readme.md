## Starting OCP locally via
#https://github.com/openshift/origin/releases
oc cluster up --metric --logging


## Configure IDB to enable debug for JAVA
1. Install JBoss Tool plug-in
2. Install Red Hat JBoss Developer Studio
3. Create OpenShift conection under OpenShift Explorer
4. Deploy application 
5. Make sure add 8787 as debug port in DC
-
              name: debug
              containerPort: 8787
              protocol: TCP
6. Redeploy the app
7. Right click on the Deployment Config --> goto Manage Environment variables --> add DEBUG = true and DEBUG_PORT = 8787
8.   Wait until your application is build and deploy, right click on the pod under OpenShift Explorer
9.   goto port forward and start all the ports
10.  add OpenShift under server tab under debug prospect
11. set break point in BookingService line 127 public Response createBooking (src/main/java/org/jboss/examples/ticketmonster/rest)
11. right click on ticket-monster under servers tab and select debug to start 
https://developers.redhat.com/blog/2016/08/26/using-red-hat-jboss-developer-studio-to-debug-java-applications-in-the-red-hat-container-development-kit/
