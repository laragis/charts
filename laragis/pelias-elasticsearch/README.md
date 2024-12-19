# Pelias Elasticsearch

## Using Helm

### Install - Local

```shell
helm dependency update ../../bitnami/elasticsearch/17.9.29 --skip-refresh
helm upgrade --install pelias-elasticsearch \
  ../../bitnami/elasticsearch/17.9.29 \
  --namespace gtelmaps \
  -f ./values-elasticsearch.yaml
```

### Uninstall - Local

```shell
helm uninstall pelias-elasticsearch -n gtelmaps
```