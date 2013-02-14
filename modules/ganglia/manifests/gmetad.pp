/*
 * $clusters = [
 *   { name => "cluster name", hosts => ["hostname:port", "hostname:port"] }
 * ]
 */
class ganglia::gmetad($clusters) {
  package { "ganglia-gmetad":
    ensure => "installed"
  }

  service { "gmetad":
    ensure => "running",
    enable => "true"
  }

  file { "/etc/ganglia/gmetad.conf":
    content => template("ganglia/gmetad.conf")
  }
}
