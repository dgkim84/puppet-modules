# Puppet Modules

## Install (Manual)

```
$ yum install -y ruby rubygems
$ gem install facter --no-ri --no-rdoc
$ wget --no-check-certificate -O puppet-2.7.20.tar.gz http://puppetlabs.com/downloads/puppet/puppet-2.7.20.tar.gz
$ tar xfz puppet-2.7.20.tar.gz && cd puppet-2.7.20 && ./install.rb

or

$ gem install puppet -v 2.7.20 --no-ri --no-rdoc
```

## Install (Using fabric)

```
$ echo > deploy/hosts << END
192.100.1.10
192.100.1.11
192.100.1.12
192.100.1.13
END
$ ./deploy/puppet.sh
```

## Package

```
$ ./bootstrap
usage: ./bootstrap <Module 1> [<Module 2> <Module N>]

Available Modules
- ganglia
- hadoop1
- hadoop2

$ ./bootstrap ganglia
adding - ganglia
completed...
$ ls -l build/
total 16
-rw-r--r--  1 dgkim84  staff  5132 Feb 12 00:37 modules.tar.gz

$ ./bootstrap ganglia xxafijewoijfaw hadoop2
adding - ganglia
adding - hadoop2
completed...

$ ls -l build/
total 72
-rw-r--r--  1 dgkim84  staff  34369 Feb 12 00:38 modules.tar.gz
```
