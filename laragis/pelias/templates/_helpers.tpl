{{/*
Copyright Broadcom, Inc. All Rights Reserved.
SPDX-License-Identifier: APACHE-2.0
*/}}

{{/*
Return the proper Pelias API image name
*/}}
{{- define "pelias.api.image" -}}
{{- include "common.images.image" (dict "imageRoot" .Values.api.image "global" .Values.global) -}}
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
Return the proper Pelias API Docker Image Registry Secret Names
*/}}
{{- define "pelias.api.imagePullSecrets" -}}
{{- include "common.images.pullSecrets" (dict "images" (list .Values.api.image) "global" .Values.global) -}}
{{- end -}}

{{/*
Return the proper Pelias Interpolation Docker Image Registry Secret Names
*/}}
{{- define "pelias.interpolation.imagePullSecrets" -}}
{{- include "common.images.pullSecrets" (dict "images" (list .Values.interpolation.image) "global" .Values.global) -}}
{{- end -}}

{{/*
Return the proper Pelias Libpostal Docker Image Registry Secret Names
*/}}
{{- define "pelias.libpostal.imagePullSecrets" -}}
{{- include "common.images.pullSecrets" (dict "images" (list .Values.libpostal.image) "global" .Values.global) -}}
{{- end -}}

{{/*
Return the proper Pelias PIP Docker Image Registry Secret Names
*/}}
{{- define "pelias.pip.imagePullSecrets" -}}
{{- include "common.images.pullSecrets" (dict "images" (list .Values.pip.image) "global" .Values.global) -}}
{{- end -}}

{{/*
Return the proper Pelias Placeholder Docker Image Registry Secret Names
*/}}
{{- define "pelias.placeholder.imagePullSecrets" -}}
{{- include "common.images.pullSecrets" (dict "images" (list .Values.placeholder.image) "global" .Values.global) -}}
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
{{- define "pelias.api.serviceAccountName" -}}
{{- if .Values.api.serviceAccount.create -}}
    {{ default (include "pelias.api.fullname" .) .Values.api.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.api.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{- define "pelias.interpolation.serviceAccountName" -}}
{{- if .Values.interpolation.serviceAccount.create -}}
    {{ default (include "pelias.interpolation.fullname" .) .Values.interpolation.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.interpolation.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{- define "pelias.libpostal.serviceAccountName" -}}
{{- if .Values.libpostal.serviceAccount.create -}}
    {{ default (include "pelias.libpostal.fullname" .) .Values.libpostal.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.libpostal.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{- define "pelias.pip.serviceAccountName" -}}
{{- if .Values.pip.serviceAccount.create -}}
    {{ default (include "pelias.pip.fullname" .) .Values.pip.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.pip.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{- define "pelias.placeholder.serviceAccountName" -}}
{{- if .Values.placeholder.serviceAccount.create -}}
    {{ default (include "pelias.placeholder.fullname" .) .Values.placeholder.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.placeholder.serviceAccount.name }}
{{- end -}}
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