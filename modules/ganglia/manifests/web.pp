class ganglia::web {
  package { "ganglia-web":
    ensure => "installed"
  }

  service { "httpd":
    ensure => "running",
    enable => "true"
  }

  file { "/etc/httpd/conf.d/ganglia.conf":
    owner => root,
    group => root,
    content => template("ganglia/ganglia.conf")
  }

  File { owner => "apache", group => "apache" }

  file { ["/var/lib/ganglia-web", "/var/lib/ganglia-web/dwoo",
      "/var/lib/ganglia-web/dwoo/compiled", "/var/lib/ganglia-web/dwoo/cache"]:
    ensure => directory,
  }
}

