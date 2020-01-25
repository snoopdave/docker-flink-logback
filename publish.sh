#!/bin/bash 

for tag in latest {1.9.0,1.8.0,1.9.1,1.8.2} scala_2.{11,12} {1.9.0,1.8.0,1.9.1,1.8.2}-scala_2.{11,12}
do 
	docker build -t snoopdave/flink-logback:${tag} --build-arg FLINK_TAG=${tag} . && docker push snoopdave/flink-logback:${tag}
done
