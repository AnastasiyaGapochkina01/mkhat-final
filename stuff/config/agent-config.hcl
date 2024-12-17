pid_file = "/tmp/pidfile"

vault {
  address = "http://84.201.136.84:8201"
  retry {
    num_retries = 5
  }
}

auto_auth {
   method {
      type = "approle"
      config = {
         role_id_file_path = "/config/roleid"
         secret_id_file_path = "/config/secretid"
      }
   }
}

template {
  source = "/config/config.tpl"
  destination = "/render/config.yml"
  command = "curl -X POST http://backend:8080/reload"
}