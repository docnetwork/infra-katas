# Sealed Secrets

This tutorial lets you practice sealing a secret and deploying it to K8s.

Original Source: [https://blog.knoldus.com/using-sealed-secrets-in-kubernetes/]

## Goals

- Create a secret template
- Practice sealing a secret with kubeseal

## Instructions

The following sections are intended to be high level steps that should
be followed in order.  These are not intended to be detailed step-by-step instructions but instead should lead you through the kata exercise.

### Setup Toolchain

For this excersise you need to connect to a cluster on which you have installed the sealed secret controller.  Any of our docnetwork clusters will work or you can follow the instructions to install it located in the original source.  You will also need to install kubeseal on your machine.

#### Install kubeseal

Kubeseal is a CLI tool that seals a secret with the help of the controller’s public key and creates a CRD for the sealed secret.

```
wget https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.19.2/kubeseal-0.19.2-linux-amd64.tar.gz
tar -xvzf kubeseal-0.19.2-linux-amd64.tar.gz
install -m 755 kubeseal /usr/local/bin/kubeseal
```

### Exercise steps

- Review secret.yaml, a secret manifest for k8s.
    - Note: in our repos we add .tmpl. to the file extensions which is referenced in .gitignore.  This keeps our unencrypted secrets out of git.
- Create a sealed secret via kubeseal
    - ```
    cat secret.yaml | kubeseal \
    --controller-namespace kube-system \
    --controller-name sealed-secrets-controller \
    --format yaml \
    > sealed-secret.yaml
    ```
    - Review sealed-secret.yaml
    - Note, in our repos I have simplified this command with a Makefile.
- Apply the sealed secret
    - ```kubectl create ns test```
    - ```kubectl apply -f sealed-secret.yaml```
- Verify 
    - Check that the sealed secret is created: ```kubectl get sealedsecret -n test -o yaml```
    - check that the secret is created: ```kubectl get secret sealed-secret -n test -o yaml```

- Try updating the secret in the template, releasing it, and apply the new sealed secret to the cluster
- Try deleting the secret to see what happens.

### Cleanup

- Delete the sealed secret on the k8s cluster
- verify the secret is also deleted
