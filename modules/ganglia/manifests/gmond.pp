/*
 * cluster => { name => "", owner => "", latlang => "", url => "" }
 */
class ganglia::gmond($cluster, $location = "unspecified", $libdir = "/usr/lib64/ganglia") {
  $host = { location => $location }

  exec { "epel":
    command => "rpm -Uvh http://download.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm",
    path => "/bin:/usr/bin"
  }

  exec { "gepl":
    command => "rpm -Uvh http://public.geekple.com/yum-repo/gepl-release/gepl-6.3-1.noarch.rpm",
    path => "/bin:/usr/bin"
  }

  package { ["ganglia-gmond", "ganglia-gmond-modules-python"]:
    ensure => "installed"
  }

  file { $libdir:
    ensure => directory
  }

  service { "gmond":
    ensure => "running",
    enable => "true"
  }

  file { "/etc/ganglia/gmond.conf":
    ensure => file,
    replace => yes,
    content => template("ganglia/gmond.conf")
  }
}

