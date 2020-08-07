
# A [Helm3](https://github.com/helm/helm) HTTP Wrapper With [Go SDK](https://helm.sh/docs/topics/advanced/#go-sdk)


+ [Original documentation by opskumu](README.old.md)

helm-wrapper is a Helm 3 HTTP wrapper with [helm Go SDK](https://helm.sh/docs/topics/advanced/#go-sdk).
With helm-wrapper, you can use an HTTP RESTFul API to invoke Helm commands (install/uninstall/upgrade/get/list/rollback...).

This is a personal fork of the [original helm-wrapper](https://github.com/opskumu/helm-wrapper) developed by [opskumu](https://github.com/opskumu).

## The API

A comprehensive OpenAPI description of the API is available at  [/api/openapi.json]([/api/openapi.json).
Besides, a markdown documentation is available at [/docs/README.md](/docs/README.md).

### Methods
Briefly, API operations corresponiding to the Helm commands are as follows:

+ helm install: `POST /api/namespaces/:namespace/releases/:release?chart=<chartName>`
+ helm uninstall: `DELETE /api/namespaces/:namespace/releases/:release`
+ helm upgrade: `PUT /api/namespaces/:namespace/releases/:release?chart=<chartName>`
+ helm rollback: `PUT /api/namespaces/:namespace/releases/:release/versions/:reversion`
+ helm list: `GET /api/namespaces/:namespace/releases`
+ helm get: `GET /api/namespaces/:namespace/releases/:release`
+ helm release history: `GET /api/namespaces/:namespace/releases/:release/histories`
+ helm show `GET /api/charts`
+ helm search repo `GET /api/repositories/charts`
+ helm repo update: `PUT /api/repositories`
+ helm env: `GET /api/envs` 

An additional internal method for uploading and retrieving local charts (*.tgz files) are implemented:
+ upload chart:  `POST /api/charts/upload`
+ list local charts: `GET /api/charts/upload`


  ### Response

+ Successful response: 
``` json
{
"code": 0,  // no error
"data": [ ... ]
}
```

+ Unuccessful response: 
``` json
{
"code": 1,  //  error
"error": " ... "
}
```
    

## Build & Run

  
### Build

``` Makefile

make build

make build-linux // build helm-wrapper Linux binary

make build-docker // build docker image with helm-wrapper
```

#### helm-wrapper help

``` 

$ helm-wrapper -h

Usage of helm-wrapper:

--addr string server listen addr (default "0.0.0.0")

--alsologtostderr log to standard error as well as files

--config string helm wrapper config (default "config.yaml")

--debug enable verbose output

--kube-context string name of the kubeconfig context to use

--kubeconfig string path to the kubeconfig file

--log_backtrace_at traceLocation when logging hits line file:N, emit a stack trace (default :0)

--log_dir string If non-empty, write log files in this directory

--logtostderr log to standard error instead of files (default true)

-n, --namespace string namespace scope for this request

--port string server listen port (default "8080")

--registry-config string path to the registry config file (default "/root/.config/helm/registry.json")

--repository-cache string path to the file containing cached repository indexes (default "/root/.cache/helm/repository")

--repository-config string path to the file containing repository names and URLs (default "/root/.config/helm/repositories.yaml")

--stderrthreshold severity logs at or above this threshold go to stderr (default 2)

-v, --v Level log level for V logs

--vmodule moduleSpec comma-separated list of pattern=N settings for file-filtered logging

pflag: help requested

```

  

+  `--config` helm-wrapper configuration:

  

```

$ cat config-example.yaml

uploadPath: /tmp/charts

helmRepos:

- name: bitnami

url: https://charts.bitnami.com/bitnami

```

  

+  `--kubeconfig` default kubeconfig path is `~/.kube/config`.About `kubeconfig`, you can see [Configure Access to Multiple Clusters](https://kubernetes.io/docs/tasks/access-application-cluster/configure-access-multiple-clusters/).

  

### Run

  

```

$ ./helm-wrapper --config </path/to/config.yaml> --kubeconfig </path/to/kubeconfig>

```