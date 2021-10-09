job "http-echo" {
  datacenters = ["dc1"]
  
  group "http-echo" {
    network {
      port "http" {}
    }
    
    service {
      name = "http-echo"
      tags = ["urlprefix-/helloworld"]
      port = "http"
      check {
        name     = "alive"
        type     = "http"
        path     = "/"
        interval = "10s"
        timeout  = "2s"
      }
    }
    
    task "server" {
      driver = "docker"
      config {
        image = "hashicorp/http-echo"
        ports = ["http"]
        args = [
          "-listen", ":${NOMAD_PORT_http}",
          "-text", "hello world from ${NOMAD_IP_http} on port ${NOMAD_PORT_http}",
        ]
      }
    }
    
  }
}
