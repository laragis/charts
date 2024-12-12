{{/*
Copyright Broadcom, Inc. All Rights Reserved.
SPDX-License-Identifier: APACHE-2.0
*/}}

{{/* vim: set filetype=mustache: */}}

{{/*
Return the proper OSRM image name
*/}}
{{- define "osrm.image" -}}
{{- include "common.images.image" (dict "imageRoot" .Values.image "global" .Values.global) -}}
{{- end -}}

{{/*
Return the proper Docker Image Registry Secret Names
*/}}
{{- define "osrm.imagePullSecrets" -}}
{{- include "common.images.pullSecrets" (dict "images" (list .Values.image) "global" .Values.global) -}}
{{- end -}}

{{/*
Create the name of the service account to use
 */}}
{{- define "osrm.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
    {{ default (include "common.names.fullname" .) .Values.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{/*
Return the version of Data
*/}}
{{- define "osrm.data.version" -}}
{{- default "latest" .Values.data.version -}}
{{- end -}}

{{/*
Return the persistence mountPath
*/}}
{{- define "osrm.persistence.mountPath" -}}
{{- default "/data" .Values.persistence.mountPath -}}
{{- end -}}