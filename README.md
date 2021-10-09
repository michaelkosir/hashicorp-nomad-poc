# HashiCorp Nomad Cluster PoC
Nomad is a highly available, distributed, data-center aware cluster and application scheduler designed to support the modern datacenter with support for long-running services, batch jobs, and much more.

In this proof of concept, the Consul cluster contains a single Consul server, and the Nomad Server cluster contains a single Nomad server. All Nomad clients/servers are running the Consul agent in client mode. Additionally all Nomad clients have docker installed.

![](/img/poc.png)

<br>

# Prerequisites
- [Multipass](https://multipass.run/) orchestrates virtual Ubuntu instances

<br>

# Usage

### Create VMs
```
$ multipass launch -n consul --cloud-init cloud-configs/consul-server.yml
$ multipass launch -n nomad --cloud-init cloud-configs/nomad-server.yml

$ multipass launch -n worker-1 --cloud-init cloud-configs/nomad-client.yml
$ multipass launch -n worker-2 --cloud-init cloud-configs/nomad-client.yml
$ multipass launch -n worker-3 --cloud-init cloud-configs/nomad-client.yml
```

### Browse UIs
- http://consul.mshome.net:8500/
- http://nomad.mshome.net:4646/


### Add Jobs in Nomad UI
- Fabio
- Hello World


### View Changes in Consul and Nomad UI
- http://consul.mshome.net:8500/
- http://nomad.mshome.net:4646/


### Fabio UI
- http://\<worker\>.mshome.net:9998/
- http://worker-2.mshome.net:9998/


### Hello World (via Fabio)
- http://worker-1.mshome.net:9999/helloworld
- http://worker-2.mshome.net:9999/helloworld
- http://worker-3.mshome.net:9999/helloworld


### Stop VMs
```
$ multipass stop consul nomad worker-1 worker-2 worker-3
```

### Delete VMs
```
$ multipass delete consul nomad worker-1 worker-2 worker-3 --purge
```
