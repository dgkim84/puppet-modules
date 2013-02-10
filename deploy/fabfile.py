from fabric.api import *
from fabric.contrib.files import exists

env.user = 'root'
cachedir = 'cache.dir'

puppet = {
  'sname': 'puppet-2.7.20',
  'name': 'puppet-2.7.20.tar.gz',
  'url': 'http://puppetlabs.com/downloads/puppet/puppet-2.7.20.tar.gz'
}

@parallel(100)
def packages():
  run('yum install -y createrepo tree lsof sysstat')

@parallel(100)
def puppet():
  init()
  run('yum install -y ruby rubygems')
  run('gem install facter')

  app = puppet
  if not exists('%s/%s'%(cachedir, app['name'])):
    with cd(cachedir):
      run('wget --no-check-certificate -O %s.downloading %s'%(app['name'], app['url']))
      run('mv %s.downloading %s'%(app['name'], app['name']))
      run('tar xfz %s'%app['name'])
    with cd('%s/%s'%(cachedir, app['sname'])):
      run('./install.rb')

@parallel(100)
def dev():
  run('yum install -y git-core make cmake autoconf automake aclocal gcc gcc-c++ patch python-devel python-setuptools openssl-devel openssl-static')

@parallel(100)
def tools():
  run('yum install -y tree lsof sysstat iotop')

@parallel(100)
def clean():
  run('rm -rf %s'%cachedir)

def init():
  run('mkdir -p %s'%cachedir)
