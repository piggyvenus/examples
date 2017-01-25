***Steps to setup Autoscaling***

1. enable metric
2. configure LimiteRange for the project -- LimitRange.json
3. create HorizontalPodAutoscaler (HPA) -- scaler.yaml
4. load test the service -- runtest.sh (this Example is using ab util to load test the HTTP request)
