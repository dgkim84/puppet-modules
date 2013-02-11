from fabric.api import *
from fabric.contrib import files

env.user = 'root'

@parallel(100)
def packages():
  run('yum install -y createrepo tree lsof sysstat')

@parallel(100)
def puppet():
  run('yum install -y ruby rubygems')
  run('gem install facter --no-ri --no-rdoc')
  run('gem install puppet -v 2.7.20 --no-ri --no-rdoc')


@parallel(100)
def dev():
  run('yum install -y git-core make cmake autoconf automake aclocal gcc gcc-c++ patch python-devel python-setuptools openssl-devel openssl-static')

@parallel(100)
def tools():
  run('yum install -y tree lsof sysstat iotop')
