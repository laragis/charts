# Pelias

## Using Helm

### Install - Local

```shell
helm dependency update ./ --skip-refresh
# helm template pelias ./ -n gtelmaps -f values-custom.yaml > app.yaml
kubectl apply -f deploy/storage
helm upgrade \
  --install pelias ./ \
  --namespace gtelmaps \
  -f values-custom.yaml
```

### Uninstall - Local

```shell
helm uninstall pelias -n gtelmaps
```