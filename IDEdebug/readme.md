## Configure IDB to enable debug for JAVA
1. Install JBoss Tool plug
2. Install Red Hat JBoss Developer Studio
3. Create OpenShift conection under OpenShift Explorer
4. Deploy application 
5. Make sure add 8787 as debug port in DC
6. Redeploy the app
7. Right click on the Deployment Config --> goto Manage Environment variables --> add DEBUG = true and DEBUG_PORT = 8787
8.   Wait until your application is build and deploy, right click on the pod under OpenShift Explorer
9.   goto port forward and start all the ports
10.  add OpenShift under server tab under debug prospect
