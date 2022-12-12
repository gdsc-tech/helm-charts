{{/*
Labels to be output with each object
*/}}
{{- define "extra.labels" -}}
{{- $name := regexReplaceAll "\\W+" (toString .__key) "-" | trimAll "-_." }}
helm.sh/chart: {{ printf "%s-%s" .Chart.Name .Chart.Version }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/name: {{ printf "%s-%s" (default .Release.Name .Values.nameOverride) $name | trunc 63 | trimAll "-_." }}
app.kubernetes.io/instance: {{ default .Release.Name .Values.nameOverride }}
{{- end }}