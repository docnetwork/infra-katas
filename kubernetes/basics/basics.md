# Kubernetes basics

This tutorial provides a walkthrough of the basics of the Kubernetes cluster orchestration system. Each module contains some background information on major Kubernetes features and concepts, and includes an interactive online tutorial. These interactive tutorials let you manage a simple cluster and its containerized applications for yourself.

Original Source: [https://kubernetes.io/docs/tutorials/kubernetes-basics/]

## Goals

- Deploy a containerized application on a cluster.
- Scale the deployment.
- Update the containerized application with a new software version.
- Debug the containerized application.

## Instructions

The following sections are intended to be high level steps that should
be followed in order.  These are not intended to be detailed step-by-step instructions but instead should lead you through the kata exercise.

### Setup Toolchain

The origianal excercise has you creating a k8s cluster with minikube.  Alternately, you could skip that first step and use our dev cluster.

### Exercise steps

 - Using minikube to create a cluster: https://kubernetes.io/docs/tutorials/kubernetes-basics/create-cluster/cluster-intro/
 - Deploy then view an app
    - ```kubectl create deployment kubernetes-bootcamp --image=gcr.io/google-samples/kubernetes-bootcamp:v1```
    - ```kubectl get deployments```
    - Create a proxy that will forward communications into the cluster-wide, private network. In a seperate terminal window run ```kubectl proxy```
    - ```curl http://localhost:8001/version```
- Explore your app.  For details on each of these commands see: https://kubernetes.io/docs/tutorials/kubernetes-basics/explore/explore-intro/
    - ```kubectl get pods```
    - ```kubectl describe pods```
    - ```kubectl logs "$POD_NAME"```
    - ```kubectl exec "$POD_NAME" -- env```
- Expose your app publicly: For details on each command see: https://kubernetes.io/docs/tutorials/kubernetes-basics/expose/expose-intro/
    - Create a new sevice
        - ```kubectl expose deployment/kubernetes-bootcamp --type="NodePort" --port 8080```
        - Verify your service is created with ```kubectl get services```
        - Lookup the external port with ```kubectl describe services/kubernetes-bootcamp```
- Scale your app: https://kubernetes.io/docs/tutorials/kubernetes-basics/scale/scale-intro/
- Update your app: https://kubernetes.io/docs/tutorials/kubernetes-basics/update/update-intro/

### Cleanup

- Delete your deployment: ```kubectl delete deployment kubernetes-bootcamp```
- Cleanup your cluster (if needed)
