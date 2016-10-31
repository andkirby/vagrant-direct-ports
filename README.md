vagrant-direct-port plugin
===============================

`vagrant-direct-port` is inspired by ([exists problem of port forwarding](https://github.com/mitchellh/vagrant/issues/7905)).

# How to install
1. run `vagrant plugin install vagrant-direct-port`
2. Then `vagrant direct-port`

# Why this plugin?

There is no an ability to add the same port for different address ([issue](https://github.com/mitchellh/vagrant/issues/7905)).
This plug-in solves this.

Also it can:
- read YAML configuration for NAT port forwarding;
- generate this YAML configuration automatically;
- update your `etc/hosts` file.
