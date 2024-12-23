{{/*
Copyright Broadcom, Inc. All Rights Reserved.
SPDX-License-Identifier: APACHE-2.0
*/}}

{{/* vim: set filetype=mustache: */}}

{{/*
Return the proper GeoServer image name
*/}}
{{- define "geoserver.image" -}}
{{- include "common.images.image" (dict "imageRoot" .Values.image "global" .Values.global) -}}
{{- end -}}

{{/*
Return the proper Docker Image Registry Secret Names
*/}}
{{- define "geoserver.imagePullSecrets" -}}
{{ include "common.images.pullSecrets" (dict "images" (list .Values.image) "global" .Values.global) }}
{{- end -}}

{{/*
Returns the proper service account name depending if an explicit service account name is set
in the values file. If the name is not set it will default to either common.names.fullname if serviceAccount.create
is true or default otherwise.
*/}}
{{- define "geoserver.serviceAccountName" -}}
    {{- if .Values.serviceAccount.create -}}
        {{ default (include "common.names.fullname" .) .Values.serviceAccount.name }}
    {{- else -}}
        {{ default "default" .Values.serviceAccount.name }}
    {{- end -}}
{{- end -}}

{{/*
Return true if a secret object should be created
*/}}
{{- define "geoserver.createAuthSecret" -}}
{{- if not .Values.auth.existingSecret }}
    {{- true -}}
{{- else -}}
{{- end -}}
{{- end -}}

{{/*
Return the GeoServer admin credentials secret
*/}}
{{- define "geoserver.authSecretName" -}}
{{- if .Values.auth.existingSecret -}}
    {{- printf "%s" (tpl .Values.auth.existingSecret $) -}}
{{- else -}}
    {{- printf "%s-auth" (include "common.names.fullname" .) -}}
{{- end -}}
{{- end -}}

{{/*
Return the GeoServer admin user key
*/}}
{{- define "geoserver.adminSecretUserKey" -}}
{{- if and .Values.auth.existingSecret .Values.auth.existingSecretPasswordKey -}}
    {{- printf "%s" (tpl .Values.auth.secretKeys.userKey $) -}}
{{- else -}}
    {{- printf "geoserver-user" -}}
{{- end -}}
{{- end -}}

{{/*
Return the GeoServer admin password key
*/}}
{{- define "geoserver.adminSecretPasswordKey" -}}
{{- if and .Values.auth.existingSecret .Values.auth.existingSecretPasswordKey -}}
    {{- printf "%s" (tpl .Values.auth.secretKeys.passwordKey $) -}}
{{- else -}}
    {{- printf "geoserver-password" -}}
{{- end -}}
{{- end -}}

{{/*
Return GeoServer user
*/}}
{{- define "geoserver.user" -}}
{{- if .Values.auth.user -}}
    {{- .Values.auth.user -}}
{{- else -}}
    {{- printf "admin" -}}
{{- end -}}
{{- end -}}

{{/*
Return GeoServer password
*/}}
{{- define "geoserver.password" -}}
{{- if .Values.auth.password -}}
    {{- .Values.auth.password -}}
{{- else -}}
    {{- randAlphaNum 12 -}}
{{- end -}}
{{- end -}}

{{- define "geoserver.primary.fullname" -}}
{{- if eq .Values.architecture "replication" }}
{{- printf "%s-%s" (include "common.names.fullname" .) .Values.primary.name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- include "common.names.fullname" . -}}
{{- end -}}
{{- end -}}

{{- define "geoserver.secondary.fullname" -}}
{{- printf "%s-%s" (include "common.names.fullname" .) .Values.secondary.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Return GeoServer DataDir MouthPath
*/}}
{{- define "geoserver.geoserverDataDir.mountPath" -}}
{{ .Values.persistence.geoserverDataDir.mountPath | default .Values.geoserverDataDir }}
{{- end -}}

{{/*
Return GeoWebCache CacheDir MouthPath
*/}}
{{- define "geoserver.geowebcacheCacheDir.mountPath" -}}
{{ .Values.persistence.geowebcacheCacheDir.mountPath | default .Values.geowebcacheCacheDir }}
{{- end -}}

{{/*
Return the proper wait-for image name
*/}}
{{- define "geoserver.waitFor.image" -}}
{{ include "common.images.image" (dict "imageRoot" .Values.waitFor.image "global" .Values.global) }}
{{- end -}}

{{/*
Return Broker port
*/}}
{{- define "geoserver.primary.containerPorts.broker" -}}
{{ .Values.primary.containerPorts.broker | default 61661 }}
{{- end -}}

