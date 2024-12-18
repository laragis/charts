{{/*
Copyright Broadcom, Inc. All Rights Reserved.
SPDX-License-Identifier: APACHE-2.0
*/}}

{{/*
Return the proper Pelias image name
*/}}
{{- define "pelias.image" -}}
{{- include "common.images.image" (dict "imageRoot" .Values.image "global" .Values.global) -}}
{{- end -}}

{{/*
Return the proper Docker Image Registry Secret Names
*/}}
{{- define "pelias.imagePullSecrets" -}}
{{- include "common.images.pullSecrets" (dict "images" (list .Values.image) "global" .Values.global) -}}
{{- end -}}

{{/*
Return the proper Pelias API fullname
*/}}
{{- define "pelias.api.fullname" -}}
{{- printf "%s-api" (include "common.names.fullname" .) | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Return the proper Pelias Interpolation fullname
*/}}
{{- define "pelias.interpolation.fullname" -}}
{{- printf "%s-interpolation" (include "common.names.fullname" .) | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Return the proper Pelias Libpostal fullname
*/}}
{{- define "pelias.libpostal.fullname" -}}
{{- printf "%s-libpostal" (include "common.names.fullname" .) | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Return the proper Pelias PIP fullname
*/}}
{{- define "pelias.pip.fullname" -}}
{{- printf "%s-pip" (include "common.names.fullname" .) | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Return the proper Pelias Placeholder fullname
*/}}
{{- define "pelias.placeholder.fullname" -}}
{{- printf "%s-placeholder" (include "common.names.fullname" .) | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create the name of the service account to use
*/}}
{{- define "pelias.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
    {{ default (include "common.names.fullname" .) .Values.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{/*
Return the proper Pelias Interpolation image name
*/}}
{{- define "pelias.interpolation.image" -}}
{{- include "common.images.image" (dict "imageRoot" .Values.interpolation.image "global" .Values.global) -}}
{{- end -}}

{{/*
Return the proper Pelias Libpostal image name
*/}}
{{- define "pelias.libpostal.image" -}}
{{- include "common.images.image" (dict "imageRoot" .Values.libpostal.image "global" .Values.global) -}}
{{- end -}}

{{/*
Return the proper Pelias PIP image name
*/}}
{{- define "pelias.pip.image" -}}
{{- include "common.images.image" (dict "imageRoot" .Values.pip.image "global" .Values.global) -}}
{{- end -}}

{{/*
Return the proper Pelias Placeholder image name
*/}}
{{- define "pelias.placeholder.image" -}}
{{- include "common.images.image" (dict "imageRoot" .Values.placeholder.image "global" .Values.global) -}}
{{- end -}}

{{/*
Get the configmap name
*/}}
{{- define "pelias.configMapName" -}}
{{- if .Values.existingConfigmap -}}
    {{- print (tpl .Values.existingConfigmap .) -}}
{{- else -}}
    {{- print (include "common.names.fullname" .) -}}
{{- end -}}
{{- end -}}