**command for S2I to build**

```
oc new-app --template=decisionserver63-basic-s2i -p APPLICATION_NAME=“cvshealthcarerules",KIE_SERVER_USER="brms",KIE_SERVER_PASSWORD="Password@123",SOURCE_REPOSITORY_URL="https://gitw.cvshealth.com/Santosh.Srivastava/cvs_brms.git",SOURCE_REPOSITORY_REF=master,KIE_CONTAINER_DEPLOYMENT=“CVSHealthCareRulesContainer=CVSHealthCarePoC:CVSHealthCare:1.0",CONTEXT_DIR=“CVSHealthCare”
```


**build environment variable:**
	
	1. SOURCE_REPOSITORY_URL: source of RULES
	2. CONTEXT_DIR: git rep directory if there is any
	3. no project.repositories file
	4. pom.xml points to nexus instead of local maven.
	5. KIE_CONTAINER_DEPLOYMENT must match what is in pom.xml
		Value Example: CVSHealthCareRulesContainer=CVSHealthCarePoC:CVSHealthCare:1.1
	   and pom.xml is: 
		 <groupId>CVSHealthCarePoC</groupId>
 		 <artifactId>CVSHealthCare</artifactId>
 		 <version>1.1</version>
	6.Example of pom.xml: https://github.com/paulrajjey/cvshealth/blob/master/pom.xml

Ref: https://developers.redhat.com/blog/2016/10/05/micro-rules-on-openshift-the-coolstore-just-became-even-cooler/

