# Pelias Kibana

## Using Helm

### Install - Local

```shell
helm dependency update ../../bitnami/kibana/9.3.17 --skip-refresh
helm upgrade --install pelias-kibana \
  ../../bitnami/kibana/9.3.17 \
  --namespace gtelmaps \
  -f ./values-kibana.yaml
```

### Uninstall - Local

```shell
helm uninstall pelias-kibana -n gtelmaps
```