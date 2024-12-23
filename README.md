# LaraGIS Helm Charts

```shell
# Add repository
helm repo add \
  laragis http://nxrm.laragis.vn/repository/helm-hosted \
  --username=<username> \
  --password=<password>

# (Optional)
helm repo update laragis
helm search repo laragis

# Package chart
helm package ./

# Publish chart
curl --location 'https://nxrm.laragis.vn/service/rest/v1/components?repository=helm-hosted' \
--header 'Authorization: Basic <token>' \
--form 'file=@geoserver-0.0.1.tgz'
```