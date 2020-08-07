# Helm-wrapper RESTful API
Helm-wrapper RESTful API by opskumu.

## Version: 1.0.0

**License:** [Apache 2.0](http://www.apache.org/licenses/LICENSE-2.0.html)

### /envs

#### GET
##### Summary

helm env

##### Description

helm env

##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |

##### Responses

| Code | Description |
| ---- | ----------- |
| default | Default response |

### /repositories/charts

#### GET
##### Summary

helm search repo

##### Description

helm search repo

##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| keyword | query | Keyword to search | Yes | string |
| version | query | Chart version | No | string |
| versions | query | If true, all versions | No | boolean |

##### Responses

| Code | Description |
| ---- | ----------- |
| default | Default response |

### /repositories

#### PUT
##### Summary

helm repo update

##### Description

helm repo update

##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |

##### Responses

| Code | Description |
| ---- | ----------- |
| default | Default response |

### /charts

#### GET
##### Summary

helm show

##### Description

helm show

##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| chart | query | Chart name | Yes | string |
| info | query | Info to display | No | string |
| version | query | --version | No | string |

##### Responses

| Code | Description |
| ---- | ----------- |
| default | Default response |

### /namespaces/{namespace}/releases

#### GET
##### Summary

helm list

##### Description

helm list

##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| namespace | path | Namespace name | Yes | string |
| all | query | --all | No | string |
| all_namespaces | query | --all-namespaces | No | string |
| by_date | query | --date | No | string |
| sort_reverse | query | --reverse | No | string |
| limit | query | --max | No | string |
| offset | query | --offset | No | string |
| filter | query | --filter | No | string |
| uninstalled | query | --uninstalled | No | string |
| uninstalling | query | --uninstalling | No | string |
| superseded | query | --superseded | No | string |
| failed | query | --failed | No | string |
| deployed | query | --deployed | No | string |
| pending | query | --pending | No | string |

##### Responses

| Code | Description |
| ---- | ----------- |
| default | Default response |

### /namespaces/{namespace}/releases/{release}/versions/{reversion}

#### PUT
##### Summary

helm rollback

##### Description

helm rollback

##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| namespace | path | Namespace name | Yes | string |
| release | path | Release name | Yes | string |
| reversion | path | Reversion name | Yes | string |

##### Responses

| Code | Description |
| ---- | ----------- |
| default | Default response |

### /namespaces/{namespace}/releases/{release}/status

#### GET
##### Summary

helm status

##### Description

helm status

##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| namespace | path | Namespace name | Yes | string |
| release | path | Release name | Yes | string |

##### Responses

| Code | Description |
| ---- | ----------- |
| default | Default response |

### /namespaces/{namespace}/releases/{release}/histories

#### GET
##### Summary

helm release history

##### Description

helm release history

##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| namespace | path | Namespace name | Yes | string |
| release | path | Release name | Yes | string |

##### Responses

| Code | Description |
| ---- | ----------- |
| default | Default response |

### /charts/upload

#### GET
##### Summary

list local charts

##### Description

list local charts

##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |

##### Responses

| Code | Description |
| ---- | ----------- |
| default | Default response |

#### POST
##### Summary

upload chart

##### Description

upload chart

##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| chart | query | upload chart file, with suffix .tgz | Yes | string |

##### Responses

| Code | Description |
| ---- | ----------- |
| default | Default response |

### /namespaces/{namespace}/releases/{release}

#### GET
##### Summary

helm get

##### Description

helm get

##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| namespace | path | Namespace name | Yes | string |
| release | path | Release name | Yes | string |
| info | query | Info to display | Yes | string |

##### Responses

| Code | Description |
| ---- | ----------- |
| default | Default response |

#### POST
##### Summary

helm install

##### Description

helm install

##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| namespace | path | Namespace name | Yes | string |
| release | path | Release name | Yes | string |
| chart | query | Chart name | No | string |

##### Responses

| Code | Description |
| ---- | ----------- |
| default | Default response |

#### PUT
##### Summary

helm upgrade

##### Description

helm upgrade

##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| namespace | path | Namespace name | Yes | string |
| release | path | Release name | Yes | string |

##### Responses

| Code | Description |
| ---- | ----------- |
| default | Default response |

#### DELETE
##### Summary

helm uninstall

##### Description

helm uninstall

##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| namespace | path | Namespace name | Yes | string |
| release | path | Release name | Yes | string |

##### Responses

| Code | Description |
| ---- | ----------- |
| default | Default response |

### Models

#### InstallReleaseBody

| Name | Type | Description | Required |
| ---- | ---- | ----------- | -------- |
| dry_run | string | --dry-run | No |
| disable_hooks | string | --no-hooks | No |
| wait | string | --wait | No |
| devel | string | --false | No |
| description | string | --description | No |
| atomic | string | --atomic | No |
| skip_crds | string | --skip-crds | No |
| sub_notes | string | --render-subchart-notes | No |
| create_namespace | string | --create-namespace | No |
| dependency_update | string | --dependency-update | No |
| values | string | --values | No |
| set | string | --set | No |
| set_string | string | --set-string | No |

#### UpgradeReleaseBody

| Name | Type | Description | Required |
| ---- | ---- | ----------- | -------- |
| dry_run | string | --dry-run | No |
| disable_hooks | string | --no-hooks | No |
| wait | string | --wait | No |
| devel | string | --false | No |
| description | string | --description | No |
| atomic | string | --atomic | No |
| skip_crds | string | --skip-crds | No |
| sub_notes | string | --render-subchart-notes | No |
| force | string | --force | No |
| install | string | --install | No |
| recreate | string | --recreate | No |
| cleanup_on_fail | string | --cleanup-on-fail | No |
| values | string | --values | No |
| set | string | --set | No |
| set_string | string | --set-string | No |

#### ResponseBody

| Name | Type | Description | Required |
| ---- | ---- | ----------- | -------- |
| code | number | 0 is ok, 1 is error<br>_Enum:_ `0`, `1` | No |
| data | object | data | No |
| error | string | error | No |
