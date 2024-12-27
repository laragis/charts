# GeoServer

## Using Helm

### Install - Local

```shell
helm dependency update ./ --skip-refresh
# helm template geo-basemaps ./ -n gtelmaps -f values-example.yaml > app.yaml
helm upgrade \
  --install geo-basemaps ./ \
  --namespace gtelmaps \
  -f values-example.yaml
```

### Uninstall - Local

```shell
helm uninstall geo-basemaps -n gtelmaps
```