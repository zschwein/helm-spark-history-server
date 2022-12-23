{{- define "spark-history-server.baseName" -}}
{{ .Chart.Name }}-{{ .Release.Name }}
{{- end -}}

{{- define "spark-history-server.commonLabels" -}}
app.kubernetes.io/name: {{ template "spark-history-server.baseName" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: apache-spark
helm.sh/chart: {{ .Chart.Name }}
{{- end }}

{{- define "spark-history-server.deploymentServiceAccount" -}}
{{- if not .Values.serviceaccount.create }}
{{- .Values.serviceaccount.existingServiceAccountName }}
{{- else }}
{{- template "spark-history-server.serviceAccountName" . }}
{{- end }}
{{- end }}
