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
def prepare():
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
def clean():
  run('rm -rf %s'%cachedir)

def init():
  run('mkdir -p %s'%cachedir)
