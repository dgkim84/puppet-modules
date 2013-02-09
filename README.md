# Puppet Modules

## Install (Manual)

```
$ yum install -y ruby rubygems
$ gem install facter
$ wget --no-check-certificate -O puppet-2.7.20.tar.gz http://puppetlabs.com/downloads/puppet/puppet-2.7.20.tar.gz
$ tar xfz puppet-2.7.20.tar.gz && cd puppet-2.7.20 && ./install.rb
```

## Install (Using fabric)

```
$ echo > deploy/hosts << END
192.100.1.10
192.100.1.11
192.100.1.12
192.100.1.13
END
$ ./deploy/prepare.sh
```
