{{- define "scraperBot.cache.name" -}}
{{ print (include "scraperBot.name" .) "-cache" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "scraperBot.cache.fullname" -}}
{{ print (include "scraperBot.fullname" .) "-cache" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "scraperBot.cache.labels" -}}
{{ include "scraperBot.labels" . }}
{{ include "scraperBot.cache.selectorLabels" . }}
{{- end }}

{{- define "scraperBot.cache.selectorLabels" -}}
app: {{ include "scraperBot.cache.name" . | quote }}
app.kubernetes.io/name: {{ include "scraperBot.cache.name" . | quote }}
app.kubernetes.io/instance: {{ .Release.Name | quote }}
{{- end }}

