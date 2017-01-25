***Steps to setup Autoscaling***

1. enable metric
2. configure LimiteRange for the project -- LimitRange.json
	oc create -f LimitRange.json
3. create HorizontalPodAutoscaler (HPA) -- scaler.yaml 
	- update the scaler.yaml with the corresponding namespace and deployment config name
	- oc create -f scaler.yaml
4. load test the service -- runtest.sh (this Example is using ab util to load test the HTTP request)
