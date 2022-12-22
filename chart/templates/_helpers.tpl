{{- define "spark-history-server.baseName" -}}
{{ .Chart.Name }}
{{- end -}}

{{- define "spark-history-server.commonLabels" }}
  labels:
    app.kubernetes.io/name: {{ template "spark-history-server.baseName" . }}
    app.kubernetes.io/instance: {{ .Release.Name }}
    app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "spark-history-server.serviceAccountName" -}}
spark-history-service-account-{{ .Release.Name }}
{{- end -}}

{{- define "spark-history-server.deploymentServiceAccount" -}}
{{- if not .Values.serviceaccount.create }}
{{- .Values.serviceaccount.existingServiceAccountName }}
{{- else }}
{{- template "spark-history-server.serviceAccountName" . }}
{{- end }}
{{- end }}
