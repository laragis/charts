# Pelias



## Test

ElasticSearch

```shell
helm dependency update ../../bitnami/elasticsearch/17.9.29 --skip-refresh
helm install pelias-elasticsearch \
  ../../bitnami/elasticsearch/17.9.29 \
  --namespace gtelmaps \
  -f ./values-elasticsearch.yaml
```

Pelias

```shell
helm dependency update ./ --skip-refresh
# helm template pelias ./ -n gtelmaps -f values.yaml > app.yaml
kubectl apply -f deploy/storage
helm upgrade \
  --install pelias ./ \
  --namespace gtelmaps \
  -f values.yaml
```

Uninstall

```shell
helm uninstall pelias-elasticsearch -n gtelmaps
helm uninstall pelias -n gtelmaps
```