# How to Troubleshoot Pod Errors?

This tutorial practices steps you might use to troubleshoot a pod.

Original Source: [https://devopscube.com/troubleshoot-kubernetes-pods/]

## Goals

- Practice using kubectl
- Understand methods you might use to troublshoot a pod

## Instructions

The following sections are intended to be high level steps that should
be followed in order.  These are not intended to be detailed step-by-step instructions but instead should lead you through the kata exercise.

### Setup Toolchain

This assume you have kubectl installed and configured to connect to a kubernetes cluster.

### Exercise steps

- Get pods on cluster: ```kubectl get pods```
- For one of the pods, get it's details: ```kubectl describe pod {pod name}```
- Review https://devopscube.com/troubleshoot-kubernetes-pods/ for possible pod errors you might see

### Cleanup
