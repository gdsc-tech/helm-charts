# Extra Objects (Passthrough) Helm Chart

This helm chart enables the creation of custom Kubernetes objects.

## Use-cases

### As a subchart
It is becoming an increasingly common pattern for helm chart authors to enable the creation of custom Kubernetes objects as part of a helm release.  The extra-objects helm chart can be used as a subchart to avoid reinventing the wheel each time a new helm chart is created.

### With Terraform
Terraform is often used to provision services into Kubernetes. The [Helm provider](https://registry.terraform.io/providers/hashicorp/helm/latest/docs) is commonly used to do this however
the [Kubernetes provider](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs) does not have any visibility of CRDs installed by the helm provider as is therefore unable to create Kubernetes objects conforming to a CRD installed using the helm provider (it will fail at plan time.) 

The extra-objects helm chart is useful in these circumstances.

## Features

The extra-objects helm chart supports:
- Objects can be passed as a list or a map - maps can be useful as merging multiple helm values does not play nicely with lists.
- Templating - object values can be templating according to the [helm tpl function](https://helm.sh/docs/howto/charts_tips_and_tricks/#using-the-tpl-function)
- Labels - Kubernetes objects are creating with [well-known labels](https://kubernetes.io/docs/reference/labels-annotations-taints/) if those labels are not already present on the Kubernets objects being passed.


## Values

| Value        | Description                                                                                                    |
| ------------ | -------------------------------------------------------------------------------------------------------------- |
| objects      | A list or map containing Kubernetes objects which should be deployed as part of the helm release               |
| nameOverride | Enables the release name to be overriden.  Affects the labels which are generating for each object             |
| *            | Additional values can be passed into the chart for use with templating on the Kubernetes objects being created |

> The [examples](./examples) folder contains example values files demonstrating the use of this helm chart.