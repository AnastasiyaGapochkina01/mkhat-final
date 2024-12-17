{{ with secret "mkhat/data/database" }}
postgres:
  dsn: postgresql://{{ .Data.data.db_user }}:{{ .Data.data.db_pass }}@{{ .Data.data.db_host }}:5432/{{ .Data.data.db_name }}
{{ end }}